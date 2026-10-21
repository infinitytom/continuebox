.class public final Lcom/github/tvbox/osc/cache/AccountScopedCache;
.super Ljava/lang/Object;
.source "AccountScopedCache.java"


# static fields
.field private static final LOCK:Ljava/lang/Object;

.field private static final OWNER:Ljava/lang/String; = "progress_cache_scope_owner_v1"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/cache/AccountScopedCache;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static activeScope()Ljava/lang/String;
    .locals 4

    .line 45
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "scope":Ljava/lang/String;
    sget-object v1, Lcom/github/tvbox/osc/cache/AccountScopedCache;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 47
    :try_start_0
    const-string v2, "progress_cache_scope_owner_v1"

    const-string v3, ""

    invoke-static {v2, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 48
    .local v2, "owner":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "local"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "local"

    .line 49
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 50
    :cond_0
    const-string v3, "progress_cache_scope_owner_v1"

    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 52
    .end local v2    # "owner":Ljava/lang/String;
    :cond_1
    monitor-exit v1

    .line 53
    return-object v0

    .line 52
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static delete(Ljava/lang/String;)V
    .locals 3
    .param p0, "rawKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rawKey"
        }
    .end annotation

    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 41
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->activeScope()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->scopedKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/cache/CacheManager;->delete(Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    invoke-static {p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pendingPosition(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    if-eqz v0, :read_persisted
    return-object v0
    :read_persisted
    .param p0, "rawKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rawKey"
        }
    .end annotation

    .line 17
    invoke-static {}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->activeScope()Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, "scope":Ljava/lang/String;
    invoke-static {v0, p0}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 19
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_2

    invoke-static {v0}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->ownsLegacy(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p0}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/cache/CacheManager;->getCache(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 21
    .local v2, "legacy":Ljava/lang/Object;
    if-eqz v2, :cond_1

    invoke-static {v0, p0, v2}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    :cond_1
    return-object v2

    .line 19
    .end local v2    # "legacy":Ljava/lang/Object;
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "scope"    # Ljava/lang/String;
    .param p1, "rawKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "scope",
            "rawKey"
        }
    .end annotation

    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 27
    :cond_0
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->scopedKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/cache/CacheManager;->getCache(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static ownsLegacy(Ljava/lang/String;)Z
    .locals 2
    .param p0, "scope"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "scope"
        }
    .end annotation

    .line 57
    const-string v0, "progress_cache_scope_owner_v1"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static save(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "rawKey"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rawKey",
            "value"
        }
    .end annotation

    .line 31
    invoke-static {}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->activeScope()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    return-void
.end method

.method public static save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "scope"    # Ljava/lang/String;
    .param p1, "rawKey"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "scope",
            "rawKey",
            "value"
        }
    .end annotation

    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->scopedKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/github/tvbox/osc/cache/CacheManager;->save(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    return-void
.end method

.method private static scopedKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "scope"    # Ljava/lang/String;
    .param p1, "rawKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "scope",
            "rawKey"
        }
    .end annotation

    .line 61
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "local"

    goto :goto_0

    :cond_0
    move-object v0, p0

    .line 62
    .local v0, "safeScope":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\u0000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
