package com.github.tvbox.osc.util

import android.os.Process
import android.util.Log
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.ExecutorService

/** Ordered progress persistence shares the existing preparation queue.
 * UI callbacks only capture a snapshot; no SQLite or preferences writes.
 */
object PlaybackProgressDispatcher {
    private data class Snapshot(val key: String, val position: Long, val account: String, val sampledAt: Long)
    private val pending = ConcurrentHashMap<String, Snapshot>()
    private val scheduled = ConcurrentHashMap<String, Boolean>()
    private val sync = Class.forName("com.github.tvbox.osc.sync.TvboxSyncClient")
    private val scope = Class.forName("com.github.tvbox.osc.sync.AccountScope").getMethod("current")
    private val allowed = sync.getDeclaredMethod("canReportPlayback").apply { isAccessible = true }
    private val persist = sync.getMethod("persistProgressSnapshot", String::class.java,
        Long::class.javaPrimitiveType, String::class.java, Long::class.javaPrimitiveType)
    private val executor: ExecutorService = sync.getDeclaredField("PROGRESS_EXECUTOR")
        .apply { isAccessible = true }.get(null) as ExecutorService

    private fun account(): String = scope.invoke(null) as String
    private fun id(account: String, key: String) = "$account\u0000$key"

    @JvmStatic
    fun enqueue(key: String?, position: Long) {
        if (key.isNullOrEmpty() || position < 0 || allowed.invoke(null) != true) return
        val account = account()
        val id = id(account, key)
        if (pending[id]?.position == position) {
            schedule(id)
            return
        }
        pending[id] = Snapshot(key, position, account, System.currentTimeMillis())
        schedule(id)
    }

    private fun schedule(id: String) {
        if (scheduled.putIfAbsent(id, true) != null) return
        executor.execute {
            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND)
            var succeeded = true
            try {
                while (true) {
                    val snapshot = pending[id] ?: break
                    if (account() == snapshot.account) {
                        persist.invoke(null, snapshot.key, snapshot.position, snapshot.account, snapshot.sampledAt)
                    }
                    if (pending.remove(id, snapshot)) break
                }
            } catch (error: Throwable) {
                succeeded = false
                // Retain pending progress; a later sample retries persistence.
                Log.e("ContinueBox", "Background progress persistence failed", error)
            } finally {
                scheduled.remove(id)
                if (succeeded && pending.containsKey(id)) schedule(id)
            }
        }
    }

    @JvmStatic
    fun pendingPosition(key: String?): Any? {
        if (key.isNullOrEmpty()) return null
        return pending[id(account(), key)]?.position
    }

    @JvmStatic
    fun dispatch(action: String) {
        val account = account()
        executor.execute {
            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND)
            if (account() == account) {
                try { sync.getMethod(action + "Worker").invoke(null) }
                catch (error: Throwable) { Log.e("ContinueBox", "Background sync action failed: $action", error) }
            }
        }
    }

    @JvmStatic
    fun enqueueRecord(record: Any?) {
        if (record == null) return
        val account = account()
        val cls = record.javaClass
        val snapshot = cls.getConstructor().newInstance()
        cls.fields.filter { !java.lang.reflect.Modifier.isStatic(it.modifiers) }.forEach {
            it.set(snapshot, it.get(record))
        }
        executor.execute {
            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND)
            if (account() == account) {
                try { sync.getMethod("pushRecordWorker", cls).invoke(null, snapshot) }
                catch (error: Throwable) { Log.e("ContinueBox", "Background history upload preparation failed", error) }
            }
        }
    }
}
