.class public final Lcom/github/tvbox/osc/sync/AccountSettingsSync;
.super Ljava/lang/Object;
.source "AccountSettingsSync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;,
        Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;,
        Lcom/github/tvbox/osc/sync/AccountSettingsSync$Conflict;,
        Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;
    }
.end annotation


# static fields
.field private static final EXECUTOR:Ljava/util/concurrent/ExecutorService;

.field private static final HTTP:Lokhttp3/OkHttpClient;

.field private static final INTERVAL_MS:J = 0xea60L

.field private static final JSON:Lokhttp3/MediaType;

.field private static final MAIN:Landroid/os/Handler;

.field private static final RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static volatile lastAttempt:J

.field private static volatile lastError:Ljava/lang/String;

.field private static volatile lastSuccess:J

.field private static volatile remoteUpdatePending:Z


# direct methods
.method public static synthetic $r8$lambda$VvZFxU8bn_-cIkzDahZWqrMMDrM()V
    .locals 0

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->restartWhenIdle()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 36
    const-string v0, "application/json; charset=utf-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->JSON:Lokhttp3/MediaType;

    .line 37
    const/4 v0, 0x5

    const/16 v1, 0x14

    invoke-static {v0, v1, v1}, Lcom/github/tvbox/osc/sync/SyncHttp;->with(III)Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->HTTP:Lokhttp3/OkHttpClient;

    .line 38
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->EXECUTOR:Ljava/util/concurrent/ExecutorService;

    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->MAIN:Landroid/os/Handler;

    .line 44
    const-string v0, ""

    sput-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static afterLogin()V
    .locals 2

    .line 92
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastAttempt:J

    .line 93
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->syncNow(Z)V

    .line 94
    return-void
.end method

.method private static allowRemoteApply(Z)Z
    .locals 1
    .param p0, "userInitiated"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "userInitiated"
        }
    .end annotation

    .line 342
    if-eqz p0, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static applyRemote(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;)V
    .locals 12
    .param p0, "remote"    # Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "remote"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 287
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v0

    if-nez v0, :cond_b

    .line 291
    iget-object v0, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->snapshot:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->snapshot:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->hash:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 293
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iget-object v1, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->snapshot:Ljava/lang/String;

    const-class v2, Lcom/google/gson/JsonObject;

    invoke-virtual {v0, v1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonObject;

    .line 294
    .local v0, "root":Lcom/google/gson/JsonObject;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    const-string v2, "hawk"

    invoke-virtual {v0, v2}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v2

    .line 295
    .local v2, "hawk":Lcom/google/gson/JsonObject;
    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v1, "crypto"

    invoke-virtual {v0, v1}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v1

    .line 296
    .local v1, "crypto":Lcom/google/gson/JsonObject;
    :goto_1
    if-eqz v2, :cond_9

    if-eqz v1, :cond_9

    const-string v3, "cipher_key"

    invoke-virtual {v1, v3}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 298
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v3

    .line 299
    .local v3, "context":Landroid/content/Context;
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->identity()Ljava/lang/String;

    move-result-object v4

    .line 300
    .local v4, "accountIdentity":Ljava/lang/String;
    const-string v5, "Hawk2"

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 303
    .local v5, "hawkPreferences":Landroid/content/SharedPreferences;
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->endpoint()Ljava/lang/String;

    move-result-object v8

    const-string v9, "pending_endpoint"

    invoke-interface {v7, v9, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 304
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->token()Ljava/lang/String;

    move-result-object v8

    const-string v9, "pending_token"

    invoke-interface {v7, v9, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 305
    const-string v8, "sync_account_name"

    invoke-static {v8}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "pending_name"

    invoke-interface {v7, v9, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 310
    invoke-static {v5}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->stashLocalOnlyKeys(Landroid/content/SharedPreferences;)V

    .line 311
    const-string v7, "crypto.KEY_256"

    invoke-virtual {v3, v7, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 312
    .local v6, "cryptoEditor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {v1}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    .line 313
    .local v8, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/gson/JsonElement;

    invoke-virtual {v10}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    .line 314
    .end local v8    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    :cond_2
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 315
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 316
    .local v7, "hawkEditor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {v2}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 318
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->shouldSync(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 319
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/gson/JsonElement;

    invoke-virtual {v11}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 320
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    :cond_3
    goto :goto_3

    .line 321
    :cond_4
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 323
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteContent(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;)Ljava/lang/String;

    move-result-object v8

    .line 324
    .local v8, "appliedContent":Ljava/lang/String;
    iget v9, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->revision:I

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->hash:Ljava/lang/String;

    goto :goto_4

    :cond_5
    move-object v10, v8

    :goto_4
    invoke-static {v4, v9, v10}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->saveState(Ljava/lang/String;ILjava/lang/String;)V

    .line 325
    sget-object v9, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->MAIN:Landroid/os/Handler;

    new-instance v10, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda0;

    invoke-direct {v10, v3}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 329
    return-void

    .line 321
    .end local v8    # "appliedContent":Ljava/lang/String;
    :cond_6
    new-instance v8, Ljava/lang/Exception;

    const-string v9, "\u65e0\u6cd5\u5199\u5165\u8d26\u53f7\u914d\u7f6e"

    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v8

    .line 314
    .end local v7    # "hawkEditor":Landroid/content/SharedPreferences$Editor;
    :cond_7
    new-instance v7, Ljava/lang/Exception;

    const-string v8, "\u65e0\u6cd5\u5199\u5165\u52a0\u5bc6\u5bc6\u94a5"

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7

    .line 306
    .end local v6    # "cryptoEditor":Landroid/content/SharedPreferences$Editor;
    :cond_8
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "\u65e0\u6cd5\u6682\u5b58\u5f53\u524d\u767b\u5f55\u72b6\u6001"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6

    .line 297
    .end local v3    # "context":Landroid/content/Context;
    .end local v4    # "accountIdentity":Ljava/lang/String;
    .end local v5    # "hawkPreferences":Landroid/content/SharedPreferences;
    :cond_9
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "\u4e91\u7aef\u914d\u7f6e\u683c\u5f0f\u65e0\u6548"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3

    .line 292
    .end local v0    # "root":Lcom/google/gson/JsonObject;
    .end local v1    # "crypto":Lcom/google/gson/JsonObject;
    .end local v2    # "hawk":Lcom/google/gson/JsonObject;
    :cond_a
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "\u4e91\u7aef\u914d\u7f6e\u6821\u9a8c\u5931\u8d25"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_b
    const/4 v0, 0x1

    sput-boolean v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteUpdatePending:Z

    .line 289
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "\u6b63\u5728\u64ad\u653e\uff0c\u8d26\u53f7\u914d\u7f6e\u5df2\u5ef6\u540e\u5e94\u7528"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static authenticated(Ljava/lang/String;)Lokhttp3/Request$Builder;
    .locals 3
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 361
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->token()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Authorization"

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static contentHash(Ljava/util/Set;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "keys"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 218
    .local p0, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v0, ""

    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 219
    .local v1, "plain":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 221
    .local v3, "key":Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_0
    invoke-static {v3, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 222
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_0

    move-object v5, v0

    goto :goto_1

    :cond_0
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v1, v3, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 225
    nop

    .end local v4    # "value":Ljava/lang/Object;
    goto :goto_2

    .line 223
    :catchall_0
    move-exception v4

    .line 224
    .local v4, "ignored":Ljava/lang/Throwable;
    invoke-virtual {v1, v3, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "ignored":Ljava/lang/Throwable;
    :goto_2
    goto :goto_0

    .line 227
    :cond_1
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static deviceId()Ljava/lang/String;
    .locals 3

    .line 379
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "device_id"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 380
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 381
    :cond_0
    return-object v0
.end method

.method private static endpoint()Ljava/lang/String;
    .locals 3

    .line 364
    const-string v0, "sync_endpoint"

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "/+$"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static exportSnapshot()Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 196
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v0

    .line 197
    .local v0, "context":Landroid/content/Context;
    const-string v1, "Hawk2"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->strings(Landroid/content/SharedPreferences;Z)Ljava/util/TreeMap;

    move-result-object v1

    .line 198
    .local v1, "hawk":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "crypto.KEY_256"

    invoke-virtual {v0, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->strings(Landroid/content/SharedPreferences;Z)Ljava/util/TreeMap;

    move-result-object v2

    .line 199
    .local v2, "crypto":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "cipher_key"

    invoke-virtual {v2, v4}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v2, v4}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 201
    invoke-virtual {v1}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-static {v4}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->contentHash(Ljava/util/Set;)Ljava/lang/String;

    move-result-object v4

    .line 202
    .local v4, "content":Ljava/lang/String;
    new-instance v5, Ljava/util/TreeMap;

    invoke-direct {v5}, Ljava/util/TreeMap;-><init>()V

    .line 203
    .local v5, "root":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v6, "schema"

    invoke-virtual {v5, v6, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v3, "content"

    invoke-virtual {v5, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v3, "hawk"

    invoke-virtual {v5, v3, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v3, "crypto"

    invoke-virtual {v5, v3, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    new-instance v3, Lcom/google/gson/Gson;

    invoke-direct {v3}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v3, v5}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 208
    .local v3, "json":Ljava/lang/String;
    new-instance v6, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;

    invoke-static {v3}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v3, v7, v4}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v6

    .line 200
    .end local v3    # "json":Ljava/lang/String;
    .end local v4    # "content":Ljava/lang/String;
    .end local v5    # "root":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "\u672c\u673a\u52a0\u5bc6\u8d44\u6599\u5c1a\u672a\u5c31\u7eea"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static getRemote()Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->endpoint()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v1/account/settings"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->authenticated(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 168
    .local v0, "request":Lokhttp3/Request;
    sget-object v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    .line 169
    .local v1, "response":Lokhttp3/Response;
    :try_start_0
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, ""

    if-nez v2, :cond_0

    move-object v2, v3

    goto :goto_0

    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v2

    .line 170
    .local v2, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 171
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 172
    .local v4, "json":Lorg/json/JSONObject;
    new-instance v5, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;-><init>(Lcom/github/tvbox/osc/sync/AccountSettingsSync$1;)V

    .line 173
    .local v5, "result":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    const-string v6, "exists"

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, v5, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->exists:Z

    .line 174
    const-string v6, "revision"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, v5, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->revision:I

    .line 175
    const-string v6, "snapshot_hash"

    invoke-virtual {v4, v6, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->hash:Ljava/lang/String;

    .line 176
    const-string v6, "snapshot"

    invoke-virtual {v4, v6, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v5, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->snapshot:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    nop

    .line 178
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    .line 177
    :cond_1
    return-object v5

    .line 170
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v5    # "result":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    :cond_2
    :try_start_2
    new-instance v3, Ljava/lang/Exception;

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v4

    invoke-static {v4, v2}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->serverError(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v0    # "request":Lokhttp3/Request;
    .end local v1    # "response":Lokhttp3/Response;
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 168
    .end local v2    # "text":Ljava/lang/String;
    .restart local v0    # "request":Lokhttp3/Request;
    .restart local v1    # "response":Lokhttp3/Response;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_3

    :try_start_3
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_1
    throw v2
.end method

.method private static identity()Ljava/lang/String;
    .locals 2

    .line 370
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->endpoint()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\u0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "sync_account_name"

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$applyRemote$1(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 326
    const-string v0, "\u8d26\u53f7\u914d\u7f6e\u5df2\u540c\u6b65\uff0c\u6b63\u5728\u91cd\u65b0\u8f7d\u5165"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 327
    sget-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->MAIN:Landroid/os/Handler;

    sget-object v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda3;->INSTANCE:Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda3;

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 328
    return-void
.end method

.method static synthetic lambda$syncNow$0(Z)V
    .locals 12
    .param p0, "showErrors"    # Z

    .line 105
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->getRemote()Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;

    move-result-object v1

    .line 106
    .local v1, "remote":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->exportSnapshot()Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;

    move-result-object v2

    .line 107
    .local v2, "local":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->state()Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;

    move-result-object v3

    .line 110
    .local v3, "state":Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteContent(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;)Ljava/lang/String;

    move-result-object v4

    .line 111
    .local v4, "remoteContent":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 112
    iget-object v5, v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->hash:Ljava/lang/String;

    iget-object v6, v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->hash:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    goto :goto_0

    .line 113
    :cond_0
    iget-object v5, v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->contentHash:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    :goto_0
    nop

    .line 114
    .local v5, "sameContent":Z
    iget-boolean v6, v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->exists:Z

    const/4 v7, 0x1

    if-nez v6, :cond_1

    .line 115
    invoke-static {v2, v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->putRemote(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;I)I

    .line 116
    iget-object v6, v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->contentHash:Ljava/lang/String;

    invoke-static {v7, v6}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->saveState(ILjava/lang/String;)V

    goto :goto_3

    .line 117
    :cond_1
    iget v6, v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->revision:I

    iget v8, v3, Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;->revision:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v9, "\u53d1\u73b0\u4e91\u7aef\u914d\u7f6e\uff0c\u8bf7\u5728\u540c\u6b65\u9875\u9762\u624b\u52a8\u5e94\u7528"

    if-gt v6, v8, :cond_6

    :try_start_1
    iget v6, v3, Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;->revision:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v6, :cond_2

    if-nez v5, :cond_2

    goto :goto_2

    .line 135
    :cond_2
    if-nez v5, :cond_5

    .line 137
    :try_start_2
    iget v6, v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->revision:I

    invoke-static {v2, v6}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->putRemote(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;I)I

    move-result v6

    .line 138
    .local v6, "revision":I
    iget-object v8, v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->contentHash:Ljava/lang/String;

    invoke-static {v6, v8}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->saveState(ILjava/lang/String;)V
    :try_end_2
    .catch Lcom/github/tvbox/osc/sync/AccountSettingsSync$Conflict; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 150
    .end local v6    # "revision":I
    :cond_3
    :goto_1
    goto :goto_3

    .line 139
    :catch_0
    move-exception v6

    .line 140
    .local v6, "ignored":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Conflict;
    :try_start_3
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->getRemote()Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;

    move-result-object v8

    .line 141
    .local v8, "latest":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    iget-boolean v10, v8, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->exists:Z

    if-eqz v10, :cond_3

    .line 142
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->allowRemoteApply(Z)Z

    move-result v10

    if-nez v10, :cond_4

    .line 143
    sput-boolean v7, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteUpdatePending:Z

    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sput-wide v10, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastSuccess:J

    .line 145
    sput-object v9, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 161
    sget-object v7, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 146
    return-void

    .line 148
    :cond_4
    :try_start_4
    invoke-static {v8}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->applyRemote(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;)V

    goto :goto_1

    .line 152
    .end local v6    # "ignored":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Conflict;
    .end local v8    # "latest":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    :cond_5
    iget v6, v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->revision:I

    iget-object v7, v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->contentHash:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->saveState(ILjava/lang/String;)V

    goto :goto_3

    .line 119
    :cond_6
    :goto_2
    if-eqz v5, :cond_7

    .line 122
    iget v6, v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->revision:I

    iget-object v7, v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->contentHash:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->saveState(ILjava/lang/String;)V

    .line 154
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sput-wide v6, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastSuccess:J

    .line 155
    const-string v6, ""

    sput-object v6, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;

    .line 156
    sput-boolean v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteUpdatePending:Z

    .end local v1    # "remote":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    .end local v2    # "local":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .end local v3    # "state":Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;
    .end local v4    # "remoteContent":Ljava/lang/String;
    .end local v5    # "sameContent":Z
    goto :goto_5

    .line 124
    .restart local v1    # "remote":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    .restart local v2    # "local":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .restart local v3    # "state":Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;
    .restart local v4    # "remoteContent":Ljava/lang/String;
    .restart local v5    # "sameContent":Z
    :cond_7
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->allowRemoteApply(Z)Z

    move-result v6

    if-nez v6, :cond_9

    .line 125
    sput-boolean v7, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteUpdatePending:Z

    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sput-wide v6, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastSuccess:J

    .line 127
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 128
    const-string v9, "\u53d1\u73b0\u4e91\u7aef\u914d\u7f6e\uff0c\u5df2\u5ef6\u540e\u5230\u9000\u51fa\u64ad\u653e\u540e\u624b\u52a8\u540c\u6b65"

    goto :goto_4

    .line 129
    :cond_8
    nop

    :goto_4
    sput-object v9, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 161
    sget-object v6, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 130
    return-void

    .line 132
    :cond_9
    :try_start_5
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->applyRemote(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 161
    sget-object v6, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 133
    return-void

    .line 161
    .end local v1    # "remote":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    .end local v2    # "local":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .end local v3    # "state":Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;
    .end local v4    # "remoteContent":Ljava/lang/String;
    .end local v5    # "sameContent":Z
    :catchall_0
    move-exception v1

    goto :goto_6

    .line 157
    :catch_1
    move-exception v1

    .line 158
    .local v1, "error":Ljava/lang/Exception;
    :try_start_6
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->safeMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;

    .line 159
    if-eqz p0, :cond_a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u8d26\u53f7\u914d\u7f6e\u540c\u6b65\u5931\u8d25\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->safeMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->toast(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 161
    .end local v1    # "error":Ljava/lang/Exception;
    :cond_a
    :goto_5
    sget-object v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 162
    nop

    .line 163
    return-void

    .line 161
    :goto_6
    sget-object v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 162
    throw v1
.end method

.method static synthetic lambda$toast$2(Ljava/lang/String;)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .line 398
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private static meta()Landroid/content/SharedPreferences;
    .locals 3

    .line 371
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v0

    const-string v1, "ContinueBoxAccountSync"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/github/tvbox/osc/base/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static periodic()V
    .locals 5

    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastAttempt:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0xea60

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->syncNow(Z)V

    .line 98
    :cond_0
    return-void
.end method

.method private static putRemote(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;I)I
    .locals 6
    .param p0, "snapshot"    # Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .param p1, "baseRevision"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "snapshot",
            "baseRevision"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 182
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 183
    .local v0, "body":Lorg/json/JSONObject;
    iget-object v1, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->json:Ljava/lang/String;

    const-string v2, "snapshot"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;->hash:Ljava/lang/String;

    const-string v3, "snapshot_hash"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 184
    const-string v2, "base_revision"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->deviceId()Ljava/lang/String;

    move-result-object v2

    const-string v3, "device_id"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api/v1/account/settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->authenticated(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    sget-object v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->JSON:Lokhttp3/MediaType;

    .line 186
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v2

    invoke-virtual {v1, v2}, Lokhttp3/Request$Builder;->put(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    .line 187
    .local v1, "request":Lokhttp3/Request;
    sget-object v2, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v2, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    .line 188
    .local v2, "response":Lokhttp3/Response;
    :try_start_0
    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v3

    if-nez v3, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v3

    .line 189
    .local v3, "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {v2}, Lokhttp3/Response;->code()I

    move-result v4

    const/16 v5, 0x199

    if-eq v4, v5, :cond_3

    .line 190
    invoke-virtual {v2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 191
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v5, "revision"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lokhttp3/Response;->close()V

    .line 191
    :cond_1
    return v4

    .line 190
    :cond_2
    :try_start_1
    new-instance v4, Ljava/lang/Exception;

    invoke-virtual {v2}, Lokhttp3/Response;->code()I

    move-result v5

    invoke-static {v5, v3}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->serverError(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v0    # "body":Lorg/json/JSONObject;
    .end local v1    # "request":Lokhttp3/Request;
    .end local v2    # "response":Lokhttp3/Response;
    .end local p0    # "snapshot":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .end local p1    # "baseRevision":I
    throw v4

    .line 189
    .restart local v0    # "body":Lorg/json/JSONObject;
    .restart local v1    # "request":Lokhttp3/Request;
    .restart local v2    # "response":Lokhttp3/Response;
    .restart local p0    # "snapshot":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .restart local p1    # "baseRevision":I
    :cond_3
    new-instance v4, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Conflict;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Conflict;-><init>(Lcom/github/tvbox/osc/sync/AccountSettingsSync$1;)V

    .end local v0    # "body":Lorg/json/JSONObject;
    .end local v1    # "request":Lokhttp3/Request;
    .end local v2    # "response":Lokhttp3/Response;
    .end local p0    # "snapshot":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .end local p1    # "baseRevision":I
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 187
    .end local v3    # "text":Ljava/lang/String;
    .restart local v0    # "body":Lorg/json/JSONObject;
    .restart local v1    # "request":Lokhttp3/Request;
    .restart local v2    # "response":Lokhttp3/Response;
    .restart local p0    # "snapshot":Lcom/github/tvbox/osc/sync/AccountSettingsSync$Snapshot;
    .restart local p1    # "baseRevision":I
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_4

    :try_start_2
    invoke-virtual {v2}, Lokhttp3/Response;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v4

    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_1
    throw v3
.end method

.method private static remoteContent(Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;)Ljava/lang/String;
    .locals 4
    .param p0, "remote"    # Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "remote"
        }
    .end annotation

    .line 233
    const-string v0, "content"

    :try_start_0
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    iget-object v2, p0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$Remote;->snapshot:Ljava/lang/String;

    const-class v3, Lcom/google/gson/JsonObject;

    invoke-virtual {v1, v2, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/JsonObject;

    .line 234
    .local v1, "root":Lcom/google/gson/JsonObject;
    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 235
    .end local v1    # "root":Lcom/google/gson/JsonObject;
    :catchall_0
    move-exception v0

    :cond_0
    nop

    .line 236
    const-string v0, ""

    return-object v0
.end method

.method private static restart()V
    .locals 4

    .line 400
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v0

    .line 401
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 402
    .local v1, "intent":Landroid/content/Intent;
    if-eqz v1, :cond_0

    .line 403
    const v2, 0x10008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 404
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 405
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exit(I)V

    .line 407
    :cond_0
    return-void
.end method

.method private static restartWhenIdle()V
    .locals 4

    .line 334
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 335
    sget-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->MAIN:Landroid/os/Handler;

    sget-object v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda3;->INSTANCE:Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda3;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 336
    return-void

    .line 338
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->restart()V

    .line 339
    return-void
.end method

.method private static restoreLocalOnlyKeys(Landroid/content/SharedPreferences;)V
    .locals 6
    .param p0, "preferences"    # Landroid/content/SharedPreferences;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "preferences"
        }
    .end annotation

    .line 77
    const-string v0, "pending_local_keys"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, "stashed":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    .line 80
    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 81
    .local v2, "json":Lorg/json/JSONObject;
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 82
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 84
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->shouldSync(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_0

    .line 85
    :cond_1
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    nop

    .end local v4    # "key":Ljava/lang/String;
    goto :goto_0

    .line 81
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    goto :goto_1

    .line 87
    :catchall_0
    move-exception v2

    :goto_1
    nop

    .line 88
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 89
    return-void
.end method

.method public static restorePendingLogin()V
    .locals 8

    .line 63
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 64
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string v1, "pending_endpoint"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 65
    .local v3, "endpoint":Ljava/lang/String;
    const-string v4, "pending_token"

    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 66
    .local v5, "token":Ljava/lang/String;
    const-string v6, "pending_name"

    invoke-interface {v0, v6, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 68
    new-instance v7, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    invoke-direct {v7, v2, v3, v5}, Lcom/github/tvbox/osc/sync/SyncServerProfile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->activate(Lcom/github/tvbox/osc/sync/SyncServerProfile;)V

    .line 69
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 70
    invoke-interface {v1, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 72
    :cond_0
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->restoreLocalOnlyKeys(Landroid/content/SharedPreferences;)V

    .line 73
    return-void
.end method

.method private static safeMessage(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 1
    .param p0, "error"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "error"
        }
    .end annotation

    .line 396
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, "\u7f51\u7edc\u9519\u8bef"

    :goto_1
    return-object v0
.end method

.method private static saveState(ILjava/lang/String;)V
    .locals 1
    .param p0, "revision"    # I
    .param p1, "hash"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "revision",
            "hash"
        }
    .end annotation

    .line 373
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->identity()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->saveState(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static saveState(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3
    .param p0, "accountIdentity"    # Ljava/lang/String;
    .param p1, "revision"    # I
    .param p2, "hash"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "accountIdentity",
            "revision",
            "hash"
        }
    .end annotation

    .line 375
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".revision"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".hash"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 376
    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 377
    return-void
.end method

.method private static serverError(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "code"    # I
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "code",
            "text"
        }
    .end annotation

    .line 392
    const-string v0, "\u670d\u52a1\u5668\u8fd4\u56de HTTP "

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "detail"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 393
    :catch_0
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static sha256(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 385
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 386
    .local v0, "digest":[B
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 387
    .local v1, "result":Ljava/lang/StringBuilder;
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_0

    aget-byte v5, v0, v4

    .local v5, "b":B
    const-string v6, "%02x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    and-int/lit16 v8, v5, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 388
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 389
    .end local v0    # "digest":[B
    .end local v1    # "result":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v0

    .local v0, "impossible":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static shouldSync(Ljava/lang/String;)Z
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 249
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 251
    :cond_0
    const-string v1, "sync_observed_"
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :not_observation
    return v0
    :not_observation
    const-string v1, "api_url"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    const-string v1, "live_api_url"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    const-string v1, "home_api"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_3

    .line 256
    :cond_1
    const-string v1, "jar_runtime_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    .line 258
    :cond_2
    const-string v1, "now_date"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    const-string v1, "last_live_channel_name"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 259
    const-string v1, "live_group_index"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto/16 :goto_2

    .line 261
    :cond_3
    const-string v1, "debug_open"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    return v0

    .line 264
    :cond_4
    const-string v1, "playback_recovery_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    return v0

    .line 265
    :cond_5
    const-string v1, "local_media_scope_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_a

    const-string v1, "search_history_scope_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 266
    const-string v1, "progress_cache_scope_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto/16 :goto_1

    .line 270
    :cond_6
    const-string v1, "sync_server_profiles"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    return v0

    .line 273
    :cond_7
    const-string v1, "emby_direct_device"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    return v0

    .line 276
    :cond_8
    const-string v1, "sync_device"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "player_is_live"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 277
    const-string v1, "search_history"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "search_history_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 278
    const-string v1, "sync_push_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "sync_outbox_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 279
    const-string v1, "sync_cursor_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "sync_retry_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 280
    const-string v1, "sync_last_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "sync_local_history_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 281
    const-string v1, "sync_cross_source_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 282
    const-string v1, "shist_outbox_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "shist_cursor_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 283
    const-string v1, "fav_outbox_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "fav_cursor_"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const/4 v0, 0x1

    goto :goto_0

    :cond_9
    nop

    .line 276
    :goto_0
    return v0

    .line 266
    :cond_a
    :goto_1
    return v0

    .line 259
    :cond_b
    :goto_2
    return v0

    .line 251
    :cond_c
    :goto_3
    return v0
.end method

.method private static stashLocalOnlyKeys(Landroid/content/SharedPreferences;)V
    .locals 5
    .param p0, "hawkPreferences"    # Landroid/content/SharedPreferences;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hawkPreferences"
        }
    .end annotation

    .line 347
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 348
    .local v0, "stash":Lorg/json/JSONObject;
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 349
    .local v2, "key":Ljava/lang/String;
    invoke-static {v2}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->shouldSync(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 351
    :cond_0
    const/4 v3, 0x0

    :try_start_0
    invoke-static {v2, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 354
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_1

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 355
    .end local v3    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception v3

    :cond_1
    :goto_1
    nop

    .line 356
    .end local v2    # "key":Ljava/lang/String;
    goto :goto_0

    .line 357
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "pending_local_keys"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 358
    return-void
.end method

.method private static state()Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;
    .locals 5

    .line 372
    new-instance v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->identity()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".revision"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->meta()Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->identity()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".hash"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$State;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static statusLine()Ljava/lang/String;
    .locals 6

    .line 49
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\u672a\u767b\u5f55"

    return-object v0

    .line 50
    :cond_0
    sget-boolean v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->remoteUpdatePending:Z

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 51
    const-string v0, "\u6709\u4e91\u7aef\u914d\u7f6e\u5f85\u5e94\u7528\uff08\u64ad\u653e\u4e2d\u5df2\u6682\u505c\uff09"

    goto :goto_0

    .line 52
    :cond_1
    const-string v0, "\u6709\u4e91\u7aef\u914d\u7f6e\u5f85\u624b\u52a8\u5e94\u7528"

    .line 50
    :goto_0
    return-object v0

    .line 53
    :cond_2
    sget-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5931\u8d25\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastError:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 54
    :cond_3
    sget-wide v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastSuccess:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_4

    const-string v0, "\u7b49\u5f85\u9996\u6b21\u540c\u6b65"

    return-object v0

    .line 55
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v4, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastSuccess:J

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 56
    .local v0, "age":J
    const-string v2, "\u6b63\u5e38\uff08"

    const-wide/16 v3, 0x3c

    cmp-long v5, v0, v3

    if-gez v5, :cond_5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " \u79d2\u524d\uff09"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    div-long v2, v0, v3

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " \u5206\u949f\u524d\uff09"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    return-object v2
.end method

.method private static strings(Landroid/content/SharedPreferences;Z)Ljava/util/TreeMap;
    .locals 5
    .param p0, "preferences"    # Landroid/content/SharedPreferences;
    .param p1, "filter"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "preferences",
            "filter"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Z)",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 240
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 241
    .local v0, "result":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 242
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/lang/String;

    if-eqz v3, :cond_1

    if-eqz p1, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->shouldSync(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 243
    :cond_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    :cond_1
    goto :goto_0

    .line 245
    :cond_2
    return-object v0
.end method

.method public static syncNow(Z)V
    .locals 3
    .param p0, "showErrors"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "showErrors"
        }
    .end annotation

    .line 101
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->RUNNING:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->lastAttempt:J

    .line 103
    sget-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->EXECUTOR:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda2;-><init>(Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 164
    return-void

    .line 101
    :cond_1
    :goto_0
    return-void
.end method

.method private static toast(Ljava/lang/String;)V
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 398
    sget-object v0, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private static token()Ljava/lang/String;
    .locals 1

    .line 365
    const-string v0, "sync_token"

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static value(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 367
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 368
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
