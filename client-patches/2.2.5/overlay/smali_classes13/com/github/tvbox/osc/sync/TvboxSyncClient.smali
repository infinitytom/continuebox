.class public final Lcom/github/tvbox/osc/sync/TvboxSyncClient;
.super Ljava/lang/Object;
.source "TvboxSyncClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    }
.end annotation


# static fields
.field private static volatile preparedPlaybackRecord:Lcom/github/tvbox/osc/cache/VodRecord;
.field private static final PROGRESS_EXECUTOR:Ljava/util/concurrent/ExecutorService;
.field private static final UPLOAD_EXECUTOR:Ljava/util/concurrent/ExecutorService;
.field private static final DOWNLOAD_EXECUTOR:Ljava/util/concurrent/ExecutorService;
.field private static volatile playbackAccount:Ljava/lang/String;
.field private static final ACCOUNT_SWITCH_LOCK:Ljava/lang/Object;

.field private static final CROSS_SOURCE:Ljava/lang/String; = "sync_cross_source_v1"

.field private static final CURSOR:Ljava/lang/String; = "sync_cursor_v2"

.field private static final DIRTY:Ljava/lang/String; = "sync_push_pending"

.field private static final HTTP:Lokhttp3/OkHttpClient;

.field private static final JSON:Lokhttp3/MediaType;

.field private static final LAST_ATTEMPT:Ljava/lang/String; = "sync_last_attempt"

.field private static final LAST_ERROR:Ljava/lang/String; = "sync_last_error"

.field private static final LAST_QUEUED_STATE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final LAST_RTT:Ljava/lang/String; = "sync_last_rtt"

.field private static final LAST_SUCCESS:Ljava/lang/String; = "sync_last_success"

.field private static final LOCAL_HISTORY_ACCOUNT:Ljava/lang/String; = "sync_local_history_account"

.field private static final NETWORK_PROGRESS_INTERVAL_MS:J = 0x1388L

.field private static final OUTBOX:Ljava/lang/String; = "sync_outbox_v2"

.field private static final OUTBOX_LOCK:Ljava/lang/Object;

.field private static final PLAYBACK_ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static final PULLING:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static final PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static final RETRY_AT:Ljava/lang/String; = "sync_retry_at"

.field private static final RETRY_COUNT:Ljava/lang/String; = "sync_retry_count"

.field private static volatile lastProgressReport:J

.field private static volatile lastReportedPosition:J

.field private static volatile lastReportedProgressKey:Ljava/lang/String;

.field private static volatile pullAfterPush:Z

.field private static volatile pullAgain:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 45
    const-string v0, "application/json; charset=utf-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->JSON:Lokhttp3/MediaType;

    .line 57
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->OUTBOX_LOCK:Ljava/lang/Object;

    .line 58
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->ACCOUNT_SWITCH_LOCK:Ljava/lang/Object;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->LAST_QUEUED_STATE:Ljava/util/Map;

    .line 62
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PULLING:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PLAYBACK_ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    const-string v0, ""

    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastReportedProgressKey:Ljava/lang/String;

    .line 71
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastReportedPosition:J

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;
    move-result-object v0
    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->UPLOAD_EXECUTOR:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;
    move-result-object v0
    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->DOWNLOAD_EXECUTOR:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->priorityHttp()Lokhttp3/OkHttpClient;
    move-result-object v0
    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->HTTP:Lokhttp3/OkHttpClient;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;
    move-result-object v0
    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PROGRESS_EXECUTOR:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static accountId()Ljava/lang/String;
    .locals 1

    .line 571
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "base"    # Ljava/lang/String;
    .param p1, "account"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "base",
            "account"
        }
    .end annotation

    .line 572
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static applyCrossSourceProgress(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)Z
    .locals 20
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodId"    # Ljava/lang/String;
    .param p2, "info"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodId",
            "info"
        }
    .end annotation

    .line 388
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    const/4 v4, 0x0

    if-eqz v0, :cond_14

    if-eqz v3, :cond_14

    iget-object v0, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_14

    iget-object v0, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    goto/16 :goto_b

    .line 389
    :cond_0
    iget-object v0, v3, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->contentKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 390
    .local v5, "contentKey":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return v4

    .line 391
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->crossSourceSnapshots(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v6

    .line 392
    .local v6, "snapshots":Lcom/google/gson/JsonObject;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v0

    .line 393
    .local v7, "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/gson/JsonObject;>;"
    invoke-virtual {v6}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Ljava/util/Map$Entry;

    .line 395
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    :try_start_0
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonElement;

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 396
    .local v0, "candidate":Lcom/google/gson/JsonObject;
    const-string v10, "content_key"

    invoke-static {v0, v10}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    goto :goto_0

    .line 397
    :cond_2
    const-string v10, "content_year"

    invoke-static {v0, v10}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v10

    .line 398
    .local v10, "remoteYear":I
    iget v11, v3, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    if-lez v11, :cond_3

    if-lez v10, :cond_3

    iget v11, v3, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    if-eq v11, v10, :cond_3

    goto :goto_0

    .line 399
    :cond_3
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    nop

    .end local v0    # "candidate":Lcom/google/gson/JsonObject;
    .end local v10    # "remoteYear":I
    goto :goto_1

    :catch_0
    move-exception v0

    .line 401
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    :goto_1
    goto :goto_0

    .line 402
    :cond_4
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda3;->INSTANCE:Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda3;

    invoke-static {v7, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 404
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    return v4

    .line 405
    :cond_5
    const-wide/16 v8, 0x0

    .line 407
    .local v8, "localTime":J
    :try_start_1
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->accountScope()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0, v10, v1, v2}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getVodRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;

    move-result-object v0

    .line 408
    .local v0, "local":Lcom/github/tvbox/osc/cache/VodRecord;
    if-eqz v0, :cond_6

    iget-wide v10, v0, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-wide v8, v10

    goto :goto_2

    .line 409
    .end local v0    # "local":Lcom/github/tvbox/osc/cache/VodRecord;
    :catch_1
    move-exception v0

    :cond_6
    :goto_2
    nop

    .line 413
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/gson/JsonObject;

    .line 414
    .local v10, "candidate":Lcom/google/gson/JsonObject;
    const-string v11, "updated_at"

    invoke-static {v10, v11}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v11

    cmp-long v13, v8, v11

    if-ltz v13, :cond_7

    goto :goto_3

    .line 415
    :cond_7
    const-string v11, "episode_key"

    invoke-static {v10, v11}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 416
    .local v11, "episodeKey":Ljava/lang/String;
    const/4 v12, 0x0

    .line 417
    .local v12, "selectedFlag":Ljava/lang/String;
    const/4 v13, -0x1

    .line 418
    .local v13, "selectedIndex":I
    iget-object v14, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v14}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Map$Entry;

    .line 419
    .local v15, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;>;"
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v4, v16

    check-cast v4, Ljava/util/List;

    .line 420
    .local v4, "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-nez v4, :cond_8

    const/4 v4, 0x0

    goto :goto_4

    .line 421
    :cond_8
    const/16 v16, 0x0

    move-object/from16 v18, v0

    move/from16 v0, v16

    .local v0, "i":I
    :goto_5
    move-object/from16 v16, v5

    .end local v5    # "contentKey":Ljava/lang/String;
    .local v16, "contentKey":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_a

    .line 422
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->episodeKey(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 423
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .end local v12    # "selectedFlag":Ljava/lang/String;
    .local v5, "selectedFlag":Ljava/lang/String;
    move v12, v0

    move v13, v12

    move-object v12, v5

    .end local v13    # "selectedIndex":I
    .local v12, "selectedIndex":I
    goto :goto_6

    .line 421
    .end local v5    # "selectedFlag":Ljava/lang/String;
    .local v12, "selectedFlag":Ljava/lang/String;
    .restart local v13    # "selectedIndex":I
    :cond_9
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v5, v16

    goto :goto_5

    .line 426
    .end local v0    # "i":I
    :cond_a
    :goto_6
    if-ltz v13, :cond_b

    goto :goto_7

    .line 427
    .end local v4    # "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .end local v15    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;>;"
    :cond_b
    move-object/from16 v5, v16

    move-object/from16 v0, v18

    const/4 v4, 0x0

    goto :goto_4

    .line 418
    .end local v16    # "contentKey":Ljava/lang/String;
    .local v5, "contentKey":Ljava/lang/String;
    :cond_c
    move-object/from16 v18, v0

    move-object/from16 v16, v5

    .line 428
    .end local v5    # "contentKey":Ljava/lang/String;
    .restart local v16    # "contentKey":Ljava/lang/String;
    :goto_7
    if-gez v13, :cond_f

    .line 429
    iget-object v0, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 430
    .local v0, "firstFlag":Ljava/lang/String;
    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 431
    .restart local v4    # "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    const/4 v5, -0x1

    invoke-static {v11, v5}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->indexFromEpisodeKey(Ljava/lang/String;I)I

    move-result v5

    .line 432
    .local v5, "fallback":I
    if-eqz v4, :cond_e

    if-ltz v5, :cond_e

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v14

    if-lt v5, v14, :cond_d

    goto :goto_8

    .line 433
    :cond_d
    move-object v12, v0

    move v13, v5

    goto :goto_9

    .line 432
    :cond_e
    :goto_8
    move-object/from16 v5, v16

    move-object/from16 v0, v18

    const/4 v4, 0x0

    goto/16 :goto_3

    .line 435
    .end local v0    # "firstFlag":Ljava/lang/String;
    .end local v4    # "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .end local v5    # "fallback":I
    :cond_f
    :goto_9
    iget-object v0, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v12}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 436
    .local v0, "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v0, :cond_12

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-lt v13, v4, :cond_10

    move-object/from16 v5, v16

    move-object/from16 v0, v18

    const/4 v4, 0x0

    goto/16 :goto_3

    .line 437
    :cond_10
    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    .line 438
    .local v4, "localEpisodeName":Ljava/lang/String;
    iput-object v12, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 439
    iput v13, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 440
    iput-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    .line 441
    const-string v5, "position_ms"

    invoke-static {v10, v5}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v14

    .line 442
    .local v14, "position":J
    const-wide/16 v17, 0x0

    cmp-long v5, v14, v17

    if-lez v5, :cond_11

    .line 443
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 444
    .local v5, "localProgressKey":Ljava/lang/String;
    move-object/from16 v19, v0

    .end local v0    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .local v19, "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v5, v1}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_a

    .line 442
    .end local v5    # "localProgressKey":Ljava/lang/String;
    .end local v19    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .restart local v0    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_11
    move-object/from16 v19, v0

    .line 446
    .end local v0    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .restart local v19    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :goto_a
    const/4 v0, 0x1

    return v0

    .line 436
    .end local v4    # "localEpisodeName":Ljava/lang/String;
    .end local v14    # "position":J
    .end local v19    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .restart local v0    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_12
    move-object/from16 v19, v0

    .end local v0    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .restart local v19    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    move-object/from16 v1, p0

    move-object/from16 v5, v16

    move-object/from16 v0, v18

    const/4 v4, 0x0

    goto/16 :goto_3

    .line 448
    .end local v10    # "candidate":Lcom/google/gson/JsonObject;
    .end local v11    # "episodeKey":Ljava/lang/String;
    .end local v12    # "selectedFlag":Ljava/lang/String;
    .end local v13    # "selectedIndex":I
    .end local v16    # "contentKey":Ljava/lang/String;
    .end local v19    # "selectedEpisodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .local v5, "contentKey":Ljava/lang/String;
    :cond_13
    const/4 v1, 0x0

    return v1

    .line 388
    .end local v5    # "contentKey":Ljava/lang/String;
    .end local v6    # "snapshots":Lcom/google/gson/JsonObject;
    .end local v7    # "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/gson/JsonObject;>;"
    .end local v8    # "localTime":J
    :cond_14
    const/4 v1, 0x0

    :goto_b
    return v1
.end method

.method private static cachedProgress(Ljava/lang/String;Ljava/lang/String;)J
    .locals 5
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "progressKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "account",
            "progressKey"
        }
    .end annotation

    .line 587
    const-wide/16 v0, 0x0

    :try_start_0
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 588
    .local v2, "cached":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Number;

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0

    .line 589
    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .end local v2    # "cached":Ljava/lang/Object;
    :cond_1
    goto :goto_0

    .line 590
    :catch_0
    move-exception v2

    :goto_0
    nop

    .line 591
    return-wide v0
.end method

.method private static crossSourceSnapshots(Ljava/lang/String;)Lcom/google/gson/JsonObject;
    .locals 3
    .param p0, "account"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "account"
        }
    .end annotation

    .line 499
    :try_start_0
    new-instance v0, Lcom/google/gson/JsonParser;

    invoke-direct {v0}, Lcom/google/gson/JsonParser;-><init>()V

    const-string v1, "sync_cross_source_v1"

    invoke-static {v1, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "{}"

    invoke-static {v1, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 500
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    new-instance v1, Lcom/google/gson/JsonObject;

    invoke-direct {v1}, Lcom/google/gson/JsonObject;-><init>()V

    return-object v1
.end method

.method private static deviceId()Ljava/lang/String;
    .locals 3

    .line 593
    const-string v0, "sync_device"

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "id":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    :cond_0
    return-object v1
.end method

.method private static done(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;Z)V
    .locals 0
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    .param p1, "success"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "callback",
            "success"
        }
    .end annotation

    .line 594
    if-eqz p0, :cond_0

    invoke-interface {p0, p1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;->complete(Z)V

    :cond_0
    return-void
.end method

.method private static drainOutbox(Z)V
    .locals 12
    .param p0, "force"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "force"
        }
    .end annotation

    .line 302
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 303
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    .line 304
    .local v0, "account":Ljava/lang/String;
    const-string v1, "sync_retry_at"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 305
    .local v7, "retryAtKey":Ljava/lang/String;
    const-string v1, "sync_retry_count"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 306
    .local v8, "retryCountKey":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->endpoint()Ljava/lang/String;

    move-result-object v9

    .line 307
    .local v9, "pushEndpoint":Ljava/lang/String;
    const-string v1, "sync_token"

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 308
    .local v10, "pushToken":Ljava/lang/String;
    if-nez p0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v7, v3, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    return-void

    .line 309
    :cond_1
    sget-object v1, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 310
    :cond_2
    new-instance v11, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda1;

    move-object v1, v11

    move-object v2, v0

    move-object v3, v9

    move-object v4, v10

    move-object v5, v8

    move-object v6, v7

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v11}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->executeUpload(Ljava/lang/Runnable;)V

    .line 360
    return-void
.end method

.method public static enabled()Z
    .locals 1

    .line 77
    const-string v0, "sync_endpoint"

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "sync_token"

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static endpoint()Ljava/lang/String;
    .locals 3

    .line 570
    const-string v0, "sync_endpoint"

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/$"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static enqueue(Lcom/github/tvbox/osc/cache/VodRecord;)V
    .locals 13
    .param p0, "record"    # Lcom/github/tvbox/osc/cache/VodRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "record"
        }
    .end annotation

    .line 281
    :try_start_0
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->recordItem(Lcom/github/tvbox/osc/cache/VodRecord;)Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 282
    .local v0, "item":Lcom/google/gson/JsonObject;
    if-nez v0, :cond_0

    return-void

    .line 283
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "account":Ljava/lang/String;
    iget-object v8, p0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;
    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :repair_account_ok
    return-void
    :repair_account_ok

    sget-object v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->OUTBOX_LOCK:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    :try_start_1
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v3

    .line 286
    .local v3, "pending":Lcom/google/gson/JsonObject;
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->recordKey(Lcom/google/gson/JsonObject;)Ljava/lang/String;

    move-result-object v4

    .line 287
    .local v4, "key":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "episode_id"

    invoke-static {v0, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "position_ms"

    invoke-static {v0, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 291
    .local v5, "state":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\u0000"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 292
    .local v6, "stateKey":Ljava/lang/String;
    sget-object v7, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->LAST_QUEUED_STATE:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {v3, v4}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    monitor-exit v2

    return-void

    .line 293
    :cond_1
    .line 294
    invoke-interface {v7, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    invoke-virtual {v3, v4, v0}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 296
    invoke-static {v1, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->saveOutbox(Ljava/lang/String;Lcom/google/gson/JsonObject;)V

    .line 297
    .end local v3    # "pending":Lcom/google/gson/JsonObject;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "state":Ljava/lang/String;
    .end local v6    # "stateKey":Ljava/lang/String;
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p0    # "record":Lcom/github/tvbox/osc/cache/VodRecord;
    :try_start_2
    throw v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 298
    .end local v0    # "item":Lcom/google/gson/JsonObject;
    .end local v1    # "account":Ljava/lang/String;
    .restart local p0    # "record":Lcom/github/tvbox/osc/cache/VodRecord;
    :catch_0
    move-exception v0

    :goto_0
    nop

    .line 299
    return-void
.end method

.method private static ensureFingerprint(Lcom/google/gson/JsonObject;)V
    .locals 9
    .param p0, "item"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .line 452
    const-string v0, "content_key"

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "episode_key"

    if-nez v1, :cond_0

    invoke-static {p0, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 453
    :cond_0
    const-string v1, "video_name"

    invoke-static {p0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 454
    .local v1, "title":Ljava/lang/String;
    const-string v3, "content_year"

    invoke-static {p0, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v4

    .line 455
    .local v4, "year":I
    invoke-static {p0, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->indexFromEpisodeKey(Ljava/lang/String;I)I

    move-result v5

    .line 457
    .local v5, "playIndex":I
    :try_start_0
    const-string v6, "data_json"

    invoke-static {p0, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 458
    .local v6, "data":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_3

    .line 459
    new-instance v7, Lcom/google/gson/JsonParser;

    invoke-direct {v7}, Lcom/google/gson/JsonParser;-><init>()V

    invoke-virtual {v7, v6}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v7

    .line 460
    .local v7, "vod":Lcom/google/gson/JsonObject;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    const-string v8, "name"

    invoke-static {v7, v8}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v1, v8

    .line 461
    :cond_1
    if-gtz v4, :cond_2

    const-string v8, "year"

    invoke-static {v7, v8}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v8

    move v4, v8

    .line 462
    :cond_2
    const-string v8, "playIndex"

    invoke-static {v7, v8}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v5, v8

    goto :goto_0

    .line 464
    .end local v6    # "data":Ljava/lang/String;
    .end local v7    # "vod":Lcom/google/gson/JsonObject;
    :catch_0
    move-exception v6

    :cond_3
    :goto_0
    nop

    .line 465
    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->contentKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v0, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    :cond_4
    invoke-virtual {p0, v3}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 467
    :cond_5
    invoke-static {p0, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "episode_name"

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->episodeKey(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    :cond_6
    return-void
.end method

.method public static getSyncStatusDetails()Ljava/lang/String;
    .locals 13

    .line 536
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\u5c1a\u672a\u767b\u5f55\u540c\u6b65\u670d\u52a1\u5668\u3002"

    return-object v0

    .line 537
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    .line 538
    .local v0, "account":Ljava/lang/String;
    const-string v1, "sync_last_success"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v4

    .line 539
    .local v4, "success":J
    const-string v1, "sync_last_rtt"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v6

    .line 540
    .local v6, "rtt":J
    const-string v1, "sync_last_error"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 541
    .local v1, "error":Ljava/lang/String;
    cmp-long v8, v4, v2

    if-gtz v8, :cond_1

    const-string v8, "\u5c1a\u672a\u6210\u529f"

    goto :goto_0

    :cond_1
    new-instance v8, Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v9

    const-string v10, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v8, v10, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v8, v9}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    .line 542
    .local v8, "time":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/FavoritesSync;->lastError()Ljava/lang/String;

    move-result-object v9

    .line 543
    .local v9, "favoritesError":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->lastError()Ljava/lang/String;

    move-result-object v10

    .line 544
    .local v10, "searchError":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\u6700\u8fd1\u6210\u529f\uff1a"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "\n\u6700\u8fd1\u5f80\u8fd4\uff1a"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    cmp-long v12, v6, v2

    if-gtz v12, :cond_2

    const-string v2, "\u672a\u77e5"

    goto :goto_1

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->historyBelongsToOtherAccount()Z

    move-result v2

    const-string v3, ""

    if-eqz v2, :cond_3

    .line 547
    const-string v2, "\n\u8d26\u53f7\u5207\u6362\uff1a\u672c\u5730\u5386\u53f2\u4ecd\u5c5e\u4e8e\u4e0a\u4e00\u4e2a\u8d26\u53f7\uff0c\u62c9\u53d6\u6210\u529f\u540e\u4f1a\u6574\u4f53\u66ff\u6362"

    goto :goto_2

    :cond_3
    move-object v2, v3

    :goto_2
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n\u5f85\u4e0a\u4f20\uff1a"

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pendingCount()I

    move-result v2

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n\u6536\u85cf\u5f85\u4e0a\u4f20\uff1a"

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    invoke-static {}, Lcom/github/tvbox/osc/sync/FavoritesSync;->pendingCount()I

    move-result v2

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n\u641c\u7d22\u8bb0\u5f55\u5f85\u4e0a\u4f20\uff1a"

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    invoke-static {}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->pendingCount()I

    move-result v2

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\n\u8d26\u53f7\u914d\u7f6e\uff1a"

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->statusLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n\u64ad\u653e\u8fdb\u5ea6\uff1a\u672c\u5730\u7ea6 2 \u79d2\u4fdd\u5b58 \u00b7 \u7f51\u7edc\u7ea6 5 \u79d2\u5408\u5e76\u4e0a\u4f20\n\u5931\u8d25\u91cd\u8bd5\uff1a2\u201364 \u79d2\u6307\u6570\u9000\u907f"

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    move-object v2, v3

    goto :goto_3

    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\n\u6700\u8fd1\u9519\u8bef\uff1a"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_3
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5

    move-object v2, v3

    goto :goto_4

    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\n\u6536\u85cf\u540c\u6b65\u9519\u8bef\uff1a"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_4
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 556
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_5

    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\n\u641c\u7d22\u8bb0\u5f55\u540c\u6b65\u9519\u8bef\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 544
    return-object v2
.end method

.method public static getSyncStatusShortText()Ljava/lang/String;
    .locals 13

    .line 519
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\u64ad\u653e\u540c\u6b65  \u00b7  \u672a\u767b\u5f55"

    return-object v0

    .line 520
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    .line 521
    .local v0, "account":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pendingCount()I

    move-result v1

    .line 522
    .local v1, "pending":I
    const-string v2, "sync_last_success"

    invoke-static {v2, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x0

    invoke-static {v2, v3, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v5

    .line 523
    .local v5, "success":J
    const-string v2, "sync_last_attempt"

    invoke-static {v2, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v3, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v7

    .line 524
    .local v7, "attempt":J
    const-string v2, "sync_last_error"

    invoke-static {v2, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 527
    .local v2, "error":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->historyBelongsToOtherAccount()Z

    move-result v9

    if-eqz v9, :cond_1

    const-string v3, "\u64ad\u653e\u540c\u6b65  \u00b7  \u6b63\u5728\u5207\u6362\u8d26\u53f7  \u00b7  \u5217\u8868\u4ecd\u4e3a\u4e0a\u4e00\u8d26\u53f7"

    return-object v3

    .line 528
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    cmp-long v9, v7, v5

    if-lez v9, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u64ad\u653e\u540c\u6b65  \u00b7  \u81ea\u52a8\u91cd\u8bd5\u4e2d  \u00b7  \u5f85\u4e0a\u4f20 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 529
    :cond_2
    cmp-long v9, v5, v3

    if-gtz v9, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u64ad\u653e\u540c\u6b65  \u00b7  \u7b49\u5f85\u9996\u6b21\u8fde\u63a5  \u00b7  \u5f85\u4e0a\u4f20 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 530
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v5

    const-wide/16 v11, 0x3e8

    div-long/2addr v9, v11

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .line 531
    .local v3, "age":J
    const-wide/16 v9, 0x2

    cmp-long v11, v3, v9

    if-gez v11, :cond_4

    const-string v9, "\u521a\u521a"

    goto :goto_0

    :cond_4
    const-wide/16 v9, 0x3c

    cmp-long v11, v3, v9

    if-gez v11, :cond_5

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, " \u79d2\u524d"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    :cond_5
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    div-long v9, v3, v9

    invoke-virtual {v11, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v9, " \u5206\u949f\u524d"

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 532
    .local v9, "ageText":Ljava/lang/String;
    :goto_0
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u64ad\u653e\u540c\u6b65  \u00b7  \u5df2\u8fde\u63a5  \u00b7  "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "  \u00b7  \u5f85\u4e0a\u4f20 "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method private static hasPending()Z
    .locals 3

    .line 515
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    .local v0, "account":Ljava/lang/String;
    sget-object v1, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->OUTBOX_LOCK:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    monitor-exit v1

    return v2

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static historyBelongsToOtherAccount()Z
    .locals 3

    .line 575
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->ACCOUNT_SWITCH_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 576
    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sync_local_history_account"

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 577
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I
    .locals 2
    .param p0, "object"    # Lcom/google/gson/JsonObject;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "object",
            "key"
        }
    .end annotation

    .line 583
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->getAsInt()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return v0

    :catch_0
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    return v0
.end method

.method static synthetic lambda$applyCrossSourceProgress$3(Lcom/google/gson/JsonObject;Lcom/google/gson/JsonObject;)I
    .locals 5
    .param p0, "left"    # Lcom/google/gson/JsonObject;
    .param p1, "right"    # Lcom/google/gson/JsonObject;

    .line 402
    nop

    .line 403
    const-string v0, "updated_at"

    invoke-static {p1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v3

    .line 402
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$drainOutbox$2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 20
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "pushEndpoint"    # Ljava/lang/String;
    .param p2, "pushToken"    # Ljava/lang/String;
    .param p3, "retryCountKey"    # Ljava/lang/String;
    .param p4, "retryAtKey"    # Ljava/lang/String;

    .line 311
    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    const/4 v4, 0x0

    .line 312
    .local v4, "sent":Z
    const-string v5, "\u7f51\u7edc\u9519\u8bef"

    .line 313
    .local v5, "failure":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 314
    .local v6, "startedAt":J
    const-string v0, "sync_last_attempt"

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v0, v8}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 318
    :goto_0
    :try_start_0
    new-instance v0, Lcom/google/gson/JsonArray;

    invoke-direct {v0}, Lcom/google/gson/JsonArray;-><init>()V

    move-object v8, v0

    .line 319
    .local v8, "batch":Lcom/google/gson/JsonArray;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v9, v0

    .line 320
    .local v9, "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v10, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->OUTBOX_LOCK:Ljava/lang/Object;

    monitor-enter v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 321
    :try_start_1
    invoke-static/range {p0 .. p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v0

    move-object v11, v0

    .line 322
    .local v11, "pending":Lcom/google/gson/JsonObject;
    invoke-virtual {v11}, Lcom/google/gson/JsonObject;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    if-eqz v12, :cond_1

    :try_start_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 323
    .local v12, "key":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v13

    const/16 v14, 0x64

    if-ne v13, v14, :cond_0

    goto :goto_2

    .line 324
    :cond_0
    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11, v12}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v13

    invoke-virtual {v8, v13}, Lcom/google/gson/JsonArray;->add(Lcom/google/gson/JsonElement;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 325
    .end local v12    # "key":Ljava/lang/String;
    goto :goto_1

    .line 326
    .end local v11    # "pending":Lcom/google/gson/JsonObject;
    :catchall_0
    move-exception v0

    move-object/from16 v13, p1

    move-object/from16 v15, p2

    move/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    goto/16 :goto_9

    .restart local v11    # "pending":Lcom/google/gson/JsonObject;
    :cond_1
    :goto_2
    :try_start_3
    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_8

    .line 327
    :try_start_4
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v4, 0x1

    .line 347
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v11    # "pending":Lcom/google/gson/JsonObject;
    move-object/from16 v13, p1

    move-object/from16 v15, p2

    goto/16 :goto_d

    .line 328
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v11    # "pending":Lcom/google/gson/JsonObject;
    :cond_2
    new-instance v0, Lcom/google/gson/JsonObject;

    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    move-object v10, v0

    .line 329
    .local v10, "body":Lcom/google/gson/JsonObject;
    const-string v0, "device_id"

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->deviceId()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v0, v12}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "records"

    invoke-virtual {v10, v0, v8}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 330
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    move-object/from16 v13, p1

    :try_start_5
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "/api/v1/sync/push"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v12, "Authorization"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Bearer "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-object/from16 v15, p2

    :try_start_6
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 331
    invoke-virtual {v0, v12, v14}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    sget-object v12, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->JSON:Lokhttp3/MediaType;

    .line 332
    invoke-virtual {v10}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v14}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v12

    invoke-virtual {v0, v12}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    move-object v12, v0

    .line 333
    .local v12, "request":Lokhttp3/Request;
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v0, v12}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    move-object v14, v0

    .line 334
    .local v14, "response":Lokhttp3/Response;
    :try_start_7
    invoke-virtual {v14}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    if-eqz v0, :cond_7

    .line 335
    if-eqz v14, :cond_3

    :try_start_8
    invoke-virtual {v14}, Lokhttp3/Response;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    goto :goto_3

    .line 345
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "body":Lcom/google/gson/JsonObject;
    .end local v11    # "pending":Lcom/google/gson/JsonObject;
    .end local v12    # "request":Lokhttp3/Request;
    .end local v14    # "response":Lokhttp3/Response;
    :catch_0
    move-exception v0

    move/from16 v17, v4

    move-object/from16 v18, v5

    goto/16 :goto_c

    .line 336
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "body":Lcom/google/gson/JsonObject;
    .restart local v11    # "pending":Lcom/google/gson/JsonObject;
    .restart local v12    # "request":Lokhttp3/Request;
    :cond_3
    :goto_3
    :try_start_9
    sget-object v14, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->OUTBOX_LOCK:Ljava/lang/Object;

    monitor-enter v14
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 337
    :try_start_a
    invoke-static/range {p0 .. p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 338
    .local v0, "latest":Lcom/google/gson/JsonObject;
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_4
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    move-object/from16 v18, v17

    .line 340
    .local v18, "key":Ljava/lang/String;
    move/from16 v17, v4

    move-object/from16 v4, v18

    .end local v18    # "key":Ljava/lang/String;
    .local v4, "key":Ljava/lang/String;
    .local v17, "sent":Z
    :try_start_b
    invoke-virtual {v0, v4}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-virtual {v11, v4}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v18
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    if-eqz v18, :cond_4

    move-object/from16 v18, v5

    .end local v5    # "failure":Ljava/lang/String;
    .local v18, "failure":Ljava/lang/String;
    :try_start_c
    invoke-virtual {v0, v4}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    move-object/from16 v19, v8

    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .local v19, "batch":Lcom/google/gson/JsonArray;
    :try_start_d
    invoke-virtual {v11, v4}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {v0, v4}, Lcom/google/gson/JsonObject;->remove(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    goto :goto_5

    .line 343
    .end local v0    # "latest":Lcom/google/gson/JsonObject;
    .end local v4    # "key":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    :catchall_1
    move-exception v0

    move-object/from16 v19, v8

    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    goto :goto_6

    .line 340
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v0    # "latest":Lcom/google/gson/JsonObject;
    .restart local v4    # "key":Ljava/lang/String;
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    :cond_4
    move-object/from16 v18, v5

    move-object/from16 v19, v8

    .line 341
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    :cond_5
    :goto_5
    move/from16 v4, v17

    move-object/from16 v5, v18

    move-object/from16 v8, v19

    goto :goto_4

    .line 343
    .end local v0    # "latest":Lcom/google/gson/JsonObject;
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    :catchall_2
    move-exception v0

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    goto :goto_6

    .line 342
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v0    # "latest":Lcom/google/gson/JsonObject;
    .local v4, "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    :cond_6
    move/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    .end local v4    # "sent":Z
    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->saveOutbox(Ljava/lang/String;Lcom/google/gson/JsonObject;)V

    .line 343
    .end local v0    # "latest":Lcom/google/gson/JsonObject;
    monitor-exit v14

    .line 344
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "body":Lcom/google/gson/JsonObject;
    .end local v11    # "pending":Lcom/google/gson/JsonObject;
    .end local v12    # "request":Lokhttp3/Request;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    move/from16 v4, v17

    move-object/from16 v5, v18

    goto/16 :goto_0

    .line 343
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .restart local v4    # "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "body":Lcom/google/gson/JsonObject;
    .restart local v11    # "pending":Lcom/google/gson/JsonObject;
    .restart local v12    # "request":Lokhttp3/Request;
    :catchall_3
    move-exception v0

    move/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    .end local v4    # "sent":Z
    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    :goto_6
    monitor-exit v14
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .end local v6    # "startedAt":J
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local p0    # "account":Ljava/lang/String;
    .end local p1    # "pushEndpoint":Ljava/lang/String;
    .end local p2    # "pushToken":Ljava/lang/String;
    .end local p3    # "retryCountKey":Ljava/lang/String;
    .end local p4    # "retryAtKey":Ljava/lang/String;
    :try_start_e
    throw v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3

    .restart local v6    # "startedAt":J
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local p0    # "account":Ljava/lang/String;
    .restart local p1    # "pushEndpoint":Ljava/lang/String;
    .restart local p2    # "pushToken":Ljava/lang/String;
    .restart local p3    # "retryCountKey":Ljava/lang/String;
    .restart local p4    # "retryAtKey":Ljava/lang/String;
    :catchall_4
    move-exception v0

    goto :goto_6

    .line 334
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v4    # "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v14    # "response":Lokhttp3/Response;
    :cond_7
    move/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    .end local v4    # "sent":Z
    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    :try_start_f
    new-instance v0, Ljava/lang/Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u670d\u52a1\u5668\u8fd4\u56de HTTP "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Lokhttp3/Response;->code()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v6    # "startedAt":J
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "body":Lcom/google/gson/JsonObject;
    .end local v11    # "pending":Lcom/google/gson/JsonObject;
    .end local v12    # "request":Lokhttp3/Request;
    .end local v14    # "response":Lokhttp3/Response;
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .end local p0    # "account":Ljava/lang/String;
    .end local p1    # "pushEndpoint":Ljava/lang/String;
    .end local p2    # "pushToken":Ljava/lang/String;
    .end local p3    # "retryCountKey":Ljava/lang/String;
    .end local p4    # "retryAtKey":Ljava/lang/String;
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 333
    .restart local v6    # "startedAt":J
    .restart local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "body":Lcom/google/gson/JsonObject;
    .restart local v11    # "pending":Lcom/google/gson/JsonObject;
    .restart local v12    # "request":Lokhttp3/Request;
    .restart local v14    # "response":Lokhttp3/Response;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local p0    # "account":Ljava/lang/String;
    .restart local p1    # "pushEndpoint":Ljava/lang/String;
    .restart local p2    # "pushToken":Ljava/lang/String;
    .restart local p3    # "retryCountKey":Ljava/lang/String;
    .restart local p4    # "retryAtKey":Ljava/lang/String;
    :catchall_5
    move-exception v0

    move-object v4, v0

    goto :goto_7

    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v4    # "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    :catchall_6
    move-exception v0

    move/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    move-object v4, v0

    .end local v4    # "sent":Z
    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    :goto_7
    if-eqz v14, :cond_8

    :try_start_10
    invoke-virtual {v14}, Lokhttp3/Response;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    goto :goto_8

    :catchall_7
    move-exception v0

    move-object v5, v0

    :try_start_11
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v6    # "startedAt":J
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local p0    # "account":Ljava/lang/String;
    .end local p1    # "pushEndpoint":Ljava/lang/String;
    .end local p2    # "pushToken":Ljava/lang/String;
    .end local p3    # "retryCountKey":Ljava/lang/String;
    .end local p4    # "retryAtKey":Ljava/lang/String;
    :cond_8
    :goto_8
    throw v4
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_3

    .line 345
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "body":Lcom/google/gson/JsonObject;
    .end local v11    # "pending":Lcom/google/gson/JsonObject;
    .end local v12    # "request":Lokhttp3/Request;
    .end local v14    # "response":Lokhttp3/Response;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v4    # "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    .restart local v6    # "startedAt":J
    .restart local p0    # "account":Ljava/lang/String;
    .restart local p1    # "pushEndpoint":Ljava/lang/String;
    .restart local p2    # "pushToken":Ljava/lang/String;
    .restart local p3    # "retryCountKey":Ljava/lang/String;
    .restart local p4    # "retryAtKey":Ljava/lang/String;
    :catch_1
    move-exception v0

    goto :goto_b

    :catch_2
    move-exception v0

    goto :goto_a

    .line 326
    .restart local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_8
    move-exception v0

    move-object/from16 v13, p1

    move-object/from16 v15, p2

    move/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v8

    .end local v4    # "sent":Z
    .end local v5    # "failure":Ljava/lang/String;
    .end local v8    # "batch":Lcom/google/gson/JsonArray;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    :goto_9
    :try_start_12
    monitor-exit v10
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .end local v6    # "startedAt":J
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local p0    # "account":Ljava/lang/String;
    .end local p1    # "pushEndpoint":Ljava/lang/String;
    .end local p2    # "pushToken":Ljava/lang/String;
    .end local p3    # "retryCountKey":Ljava/lang/String;
    .end local p4    # "retryAtKey":Ljava/lang/String;
    :try_start_13
    throw v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_3

    .line 345
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v6    # "startedAt":J
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    .restart local p0    # "account":Ljava/lang/String;
    .restart local p1    # "pushEndpoint":Ljava/lang/String;
    .restart local p2    # "pushToken":Ljava/lang/String;
    .restart local p3    # "retryCountKey":Ljava/lang/String;
    .restart local p4    # "retryAtKey":Ljava/lang/String;
    :catch_3
    move-exception v0

    goto :goto_c

    .line 326
    .restart local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v19    # "batch":Lcom/google/gson/JsonArray;
    :catchall_9
    move-exception v0

    goto :goto_9

    .line 345
    .end local v9    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .end local v19    # "batch":Lcom/google/gson/JsonArray;
    .restart local v4    # "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    :catch_4
    move-exception v0

    move-object/from16 v13, p1

    :goto_a
    move-object/from16 v15, p2

    :goto_b
    move/from16 v17, v4

    move-object/from16 v18, v5

    .line 346
    .end local v4    # "sent":Z
    .end local v5    # "failure":Ljava/lang/String;
    .local v0, "error":Ljava/lang/Exception;
    .restart local v17    # "sent":Z
    .restart local v18    # "failure":Ljava/lang/String;
    :goto_c
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_9

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_9

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    move/from16 v4, v17

    .end local v18    # "failure":Ljava/lang/String;
    .restart local v5    # "failure":Ljava/lang/String;
    goto :goto_d

    .line 348
    .end local v0    # "error":Ljava/lang/Exception;
    .end local v5    # "failure":Ljava/lang/String;
    .restart local v18    # "failure":Ljava/lang/String;
    :cond_9
    move/from16 v4, v17

    move-object/from16 v5, v18

    .end local v17    # "sent":Z
    .end local v18    # "failure":Ljava/lang/String;
    .restart local v4    # "sent":Z
    .restart local v5    # "failure":Ljava/lang/String;
    :goto_d
    const-wide/16 v8, 0x0

    const/4 v0, 0x0

    if-eqz v4, :cond_a

    .line 349
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v2, v10}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v3, v8}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 350
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v6

    invoke-static {v1, v8, v9}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->markSyncSuccess(Ljava/lang/String;J)V

    goto :goto_e

    .line 352
    :cond_a
    const/4 v10, 0x6

    invoke-static {v2, v8, v9}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v8

    long-to-int v9, v8

    add-int/lit8 v9, v9, 0x1

    invoke-static {v10, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 353
    .local v8, "attempt":I
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v2, v9}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 354
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-wide/16 v11, 0x3e8

    shl-long/2addr v11, v8

    add-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 355
    const-string v9, "sync_last_error"

    invoke-static {v9, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u4e0a\u4f20\u5931\u8d25\uff08"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\uff09\uff0c\u81ea\u52a8\u91cd\u8bd5\u4e2d"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 357
    .end local v8    # "attempt":I
    :goto_e
    sget-object v8, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v8, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 358
    sget-boolean v8, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAfterPush:Z

    if-eqz v8, :cond_b

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->hasPending()Z

    move-result v8

    if-nez v8, :cond_b

    sput-boolean v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAfterPush:Z

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->startPull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    .line 359
    :cond_b
    return-void
.end method

.method static synthetic lambda$startPull$0(Ljava/util/LinkedHashMap;[ILcom/google/gson/JsonObject;[ZLjava/lang/String;)V
    .locals 17
    .param p0, "newest"    # Ljava/util/LinkedHashMap;
    .param p1, "appliedCount"    # [I
    .param p2, "snapshots"    # Lcom/google/gson/JsonObject;
    .param p3, "snapshotsChanged"    # [Z
    .param p4, "account"    # Ljava/lang/String;

    .line 226
    const-string v1, "deleted"

    invoke-virtual/range {p0 .. p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/google/gson/JsonObject;

    .line 228
    .local v3, "item":Lcom/google/gson/JsonObject;
    :try_start_0
    invoke-virtual {v3, v1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v3, v1}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsBoolean()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 229
    :cond_0
    const/4 v0, 0x0

    aget v4, p1, v0

    const/4 v5, 0x1

    add-int/2addr v4, v5

    aput v4, p1, v0

    .line 230
    invoke-static {v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->ensureFingerprint(Lcom/google/gson/JsonObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 231
    move-object/from16 v4, p2

    :try_start_1
    invoke-static {v4, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->rememberCrossSource(Lcom/google/gson/JsonObject;Lcom/google/gson/JsonObject;)Z

    move-result v6

    if-eqz v6, :cond_1

    aput-boolean v5, p3, v0

    .line 232
    :cond_1
    const-string v0, "source_key"

    .line 234
    invoke-virtual {v3, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v6

    const-string v0, "video_id"

    invoke-virtual {v3, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v7

    const-string v0, "video_name"

    .line 235
    invoke-static {v3, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "episode_id"

    invoke-static {v3, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "episode_name"

    .line 236
    invoke-static {v3, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "updated_at"

    invoke-virtual {v3, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsLong()J

    move-result-wide v11

    const-string v0, "data_json"

    .line 237
    invoke-static {v3, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v0, "position_ms"

    invoke-static {v3, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v14

    const-string v0, "progress_key"

    .line 238
    invoke-static {v3, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 232
    move-object/from16 v5, p4

    invoke-static/range {v5 .. v16}, Lcom/github/tvbox/osc/cache/RoomDataManger;->upsertSyncedRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 239
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    move-object/from16 v4, p2

    :goto_1
    nop

    .line 240
    .end local v3    # "item":Lcom/google/gson/JsonObject;
    goto/16 :goto_0

    .line 241
    :cond_2
    move-object/from16 v4, p2

    return-void
.end method

.method static synthetic lambda$startPull$1(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V
    .locals 24
    .param p0, "cursor"    # J
    .param p2, "account"    # Ljava/lang/String;
    .param p3, "endpoint"    # Ljava/lang/String;
    .param p4, "token"    # Ljava/lang/String;
    .param p5, "cursorKey"    # Ljava/lang/String;
    .param p6, "switching"    # Z
    .param p7, "callback"    # Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;

    .line 185
    move-object/from16 v7, p2

    const/4 v8, 0x0

    .line 186
    .local v8, "success":Z
    const/4 v0, 0x0

    .line 187
    .local v0, "applied":I
    move-wide/from16 v1, p0

    .line 188
    .local v1, "nextCursor":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 189
    .local v9, "startedAt":J
    const-string v3, "sync_last_attempt"

    invoke-static {v3, v7}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 190
    const-string v11, "\u7f51\u7edc\u9519\u8bef"

    move v12, v0

    move-wide v13, v1

    .line 194
    .end local v0    # "applied":I
    .end local v1    # "nextCursor":J
    .local v11, "failure":Ljava/lang/String;
    .local v12, "applied":I
    .local v13, "nextCursor":J
    :goto_0
    move-wide v5, v13

    .line 196
    .local v5, "requestedCursor":J
    :try_start_0
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v3, p3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api/v1/sync/pull-v2?after="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v1, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bearer "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, p4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 198
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    move-object v2, v0

    .line 200
    .local v2, "request":Lokhttp3/Request;
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    move-object v1, v0

    .line 201
    .local v1, "response":Lokhttp3/Response;
    :try_start_1
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 203
    new-instance v0, Lcom/google/gson/JsonParser;

    invoke-direct {v0}, Lcom/google/gson/JsonParser;-><init>()V

    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v15}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-object v15, v0

    .line 204
    .local v15, "result":Lcom/google/gson/JsonObject;
    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 257
    .end local v1    # "response":Lokhttp3/Response;
    .end local v2    # "request":Lokhttp3/Request;
    .end local v5    # "requestedCursor":J
    .end local v15    # "result":Lcom/google/gson/JsonObject;
    :catch_0
    move-exception v0

    move-object/from16 v4, p5

    move/from16 v21, v8

    const/4 v8, 0x0

    goto/16 :goto_a

    .line 205
    .restart local v2    # "request":Lokhttp3/Request;
    .restart local v5    # "requestedCursor":J
    .restart local v15    # "result":Lcom/google/gson/JsonObject;
    :cond_0
    :goto_1
    :try_start_3
    const-string v0, "records"

    invoke-virtual {v15, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 210
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v1, v0

    .line 211
    .local v1, "newest":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/google/gson/JsonObject;>;"
    const-string v0, "records"

    invoke-virtual {v15, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    if-eqz v0, :cond_3

    :try_start_4
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonElement;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    move-object/from16 v18, v0

    .line 213
    .local v18, "element":Lcom/google/gson/JsonElement;
    :try_start_5
    invoke-virtual/range {v18 .. v18}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 214
    .local v0, "item":Lcom/google/gson/JsonObject;
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->recordKey(Lcom/google/gson/JsonObject;)Ljava/lang/String;

    move-result-object v19
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-object/from16 v20, v19

    .line 215
    .local v20, "key":Ljava/lang/String;
    move-object/from16 v19, v2

    move-object/from16 v2, v20

    .end local v20    # "key":Ljava/lang/String;
    .local v2, "key":Ljava/lang/String;
    .local v19, "request":Lokhttp3/Request;
    :try_start_6
    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/google/gson/JsonObject;

    move-object/from16 v21, v20

    .line 216
    .local v21, "old":Lcom/google/gson/JsonObject;
    move-object/from16 v3, v21

    .end local v21    # "old":Lcom/google/gson/JsonObject;
    .local v3, "old":Lcom/google/gson/JsonObject;
    if-eqz v3, :cond_1

    const-string v4, "updated_at"

    invoke-static {v0, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v20

    const-string v4, "updated_at"

    invoke-static {v3, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v22

    cmp-long v4, v20, v22

    if-ltz v4, :cond_2

    .line 217
    :cond_1
    invoke-virtual {v1, v2, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_3

    .line 219
    .end local v0    # "item":Lcom/google/gson/JsonObject;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "old":Lcom/google/gson/JsonObject;
    :catch_1
    move-exception v0

    goto :goto_3

    .end local v19    # "request":Lokhttp3/Request;
    .local v2, "request":Lokhttp3/Request;
    :catch_2
    move-exception v0

    move-object/from16 v19, v2

    .end local v2    # "request":Lokhttp3/Request;
    .restart local v19    # "request":Lokhttp3/Request;
    :cond_2
    :goto_3
    nop

    .line 220
    .end local v18    # "element":Lcom/google/gson/JsonElement;
    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v2, v19

    goto :goto_2

    .line 222
    .end local v19    # "request":Lokhttp3/Request;
    .restart local v2    # "request":Lokhttp3/Request;
    :cond_3
    move-object/from16 v19, v2

    .end local v2    # "request":Lokhttp3/Request;
    .restart local v19    # "request":Lokhttp3/Request;
    const/4 v2, 0x1

    :try_start_7
    new-array v0, v2, [I

    const/4 v2, 0x0

    aput v2, v0, v2

    .line 223
    .local v0, "appliedCount":[I
    invoke-static/range {p2 .. p2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->crossSourceSnapshots(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v2

    move-object v4, v2

    .line 224
    .local v4, "snapshots":Lcom/google/gson/JsonObject;
    const/4 v2, 0x1

    new-array v3, v2, [Z

    const/16 v16, 0x0

    aput-boolean v16, v3, v16

    move-object/from16 v17, v3

    .line 225
    .local v17, "snapshotsChanged":[Z
    new-instance v18, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda2;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    move-object/from16 v20, v1

    .end local v1    # "newest":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/google/gson/JsonObject;>;"
    .local v20, "newest":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/google/gson/JsonObject;>;"
    move-object/from16 v1, v18

    move-object/from16 v2, v20

    move-object v3, v0

    move-object/from16 v16, v4

    move/from16 v21, v8

    const/4 v8, 0x0

    .end local v4    # "snapshots":Lcom/google/gson/JsonObject;
    .end local v8    # "success":Z
    .local v16, "snapshots":Lcom/google/gson/JsonObject;
    .local v21, "success":Z
    move-wide/from16 v22, v5

    .end local v5    # "requestedCursor":J
    .local v22, "requestedCursor":J
    move-object/from16 v5, v17

    move-object/from16 v6, p2

    :try_start_8
    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda2;-><init>(Ljava/util/LinkedHashMap;[ILcom/google/gson/JsonObject;[ZLjava/lang/String;)V

    invoke-static/range {v18 .. v18}, Lcom/github/tvbox/osc/cache/RoomDataManger;->runBatch(Ljava/lang/Runnable;)V

    .line 242
    aget-boolean v1, v17, v8

    if-eqz v1, :cond_4

    move-object/from16 v1, v16

    .end local v16    # "snapshots":Lcom/google/gson/JsonObject;
    .local v1, "snapshots":Lcom/google/gson/JsonObject;
    invoke-static {v7, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->saveCrossSource(Ljava/lang/String;Lcom/google/gson/JsonObject;)V

    goto :goto_4

    .end local v1    # "snapshots":Lcom/google/gson/JsonObject;
    .restart local v16    # "snapshots":Lcom/google/gson/JsonObject;
    :cond_4
    move-object/from16 v1, v16

    .line 243
    .end local v16    # "snapshots":Lcom/google/gson/JsonObject;
    .restart local v1    # "snapshots":Lcom/google/gson/JsonObject;
    :goto_4
    aget v2, v0, v8

    add-int/2addr v12, v2

    .line 244
    const-string v2, "cursor"

    invoke-virtual {v15, v2}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "cursor"

    invoke-virtual {v15, v2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsLong()J

    move-result-wide v2

    move-wide v13, v2

    .line 245
    :cond_5
    cmp-long v2, v13, v22

    if-ltz v2, :cond_b

    .line 246
    const-string v2, "has_more"

    invoke-virtual {v15, v2}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "has_more"

    invoke-virtual {v15, v2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsBoolean()Z

    move-result v2

    if-eqz v2, :cond_6

    const/4 v4, 0x1

    goto :goto_5

    :cond_6
    const/4 v4, 0x0

    :goto_5
    move v2, v4

    .line 247
    .local v2, "hasMore":Z
    if-eqz v2, :cond_8

    cmp-long v3, v13, v22

    if-eqz v3, :cond_7

    goto :goto_6

    :cond_7
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "\u670d\u52a1\u5668\u5206\u9875\u6e38\u6807\u672a\u524d\u8fdb"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v9    # "startedAt":J
    .end local v11    # "failure":Ljava/lang/String;
    .end local v12    # "applied":I
    .end local v13    # "nextCursor":J
    .end local v21    # "success":Z
    .end local p0    # "cursor":J
    .end local p2    # "account":Ljava/lang/String;
    .end local p3    # "endpoint":Ljava/lang/String;
    .end local p4    # "token":Ljava/lang/String;
    .end local p5    # "cursorKey":Ljava/lang/String;
    .end local p6    # "switching":Z
    .end local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    throw v3

    .line 249
    .restart local v9    # "startedAt":J
    .restart local v11    # "failure":Ljava/lang/String;
    .restart local v12    # "applied":I
    .restart local v13    # "nextCursor":J
    .restart local v21    # "success":Z
    .restart local p0    # "cursor":J
    .restart local p2    # "account":Ljava/lang/String;
    .restart local p3    # "endpoint":Ljava/lang/String;
    .restart local p4    # "token":Ljava/lang/String;
    .restart local p5    # "cursorKey":Ljava/lang/String;
    .restart local p6    # "switching":Z
    .restart local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :cond_8
    :goto_6
    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    move-object/from16 v4, p5

    :try_start_9
    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 250
    nop

    .end local v0    # "appliedCount":[I
    .end local v1    # "snapshots":Lcom/google/gson/JsonObject;
    .end local v15    # "result":Lcom/google/gson/JsonObject;
    .end local v17    # "snapshotsChanged":[Z
    .end local v19    # "request":Lokhttp3/Request;
    .end local v20    # "newest":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/google/gson/JsonObject;>;"
    .end local v22    # "requestedCursor":J
    if-nez v2, :cond_a

    .line 251
    if-eqz p6, :cond_9

    .line 252
    sget-object v1, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->ACCOUNT_SWITCH_LOCK:Ljava/lang/Object;

    monitor-enter v1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    .line 253
    :try_start_a
    const-string v0, "sync_local_history_account"

    invoke-static {v0, v7}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 254
    monitor-exit v1

    goto :goto_7

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .end local v9    # "startedAt":J
    .end local v11    # "failure":Ljava/lang/String;
    .end local v12    # "applied":I
    .end local v13    # "nextCursor":J
    .end local v21    # "success":Z
    .end local p0    # "cursor":J
    .end local p2    # "account":Ljava/lang/String;
    .end local p3    # "endpoint":Ljava/lang/String;
    .end local p4    # "token":Ljava/lang/String;
    .end local p5    # "cursorKey":Ljava/lang/String;
    .end local p6    # "switching":Z
    .end local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :try_start_b
    throw v0

    .line 256
    .restart local v9    # "startedAt":J
    .restart local v11    # "failure":Ljava/lang/String;
    .restart local v12    # "applied":I
    .restart local v13    # "nextCursor":J
    .restart local v21    # "success":Z
    .restart local p0    # "cursor":J
    .restart local p2    # "account":Ljava/lang/String;
    .restart local p3    # "endpoint":Ljava/lang/String;
    .restart local p4    # "token":Ljava/lang/String;
    .restart local p5    # "cursorKey":Ljava/lang/String;
    .restart local p6    # "switching":Z
    .restart local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :cond_9
    :goto_7
    const/4 v0, 0x1

    .line 259
    .end local v2    # "hasMore":Z
    .end local v21    # "success":Z
    .local v0, "success":Z
    goto/16 :goto_b

    .line 250
    .end local v0    # "success":Z
    .restart local v2    # "hasMore":Z
    .restart local v21    # "success":Z
    :cond_a
    move/from16 v8, v21

    goto/16 :goto_0

    .line 245
    .end local v2    # "hasMore":Z
    .local v0, "appliedCount":[I
    .restart local v1    # "snapshots":Lcom/google/gson/JsonObject;
    .restart local v15    # "result":Lcom/google/gson/JsonObject;
    .restart local v17    # "snapshotsChanged":[Z
    .restart local v19    # "request":Lokhttp3/Request;
    .restart local v20    # "newest":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/google/gson/JsonObject;>;"
    .restart local v22    # "requestedCursor":J
    :cond_b
    move-object/from16 v4, p5

    new-instance v2, Ljava/lang/Exception;

    const-string v3, "\u670d\u52a1\u5668\u6e38\u6807\u5012\u9000"

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v9    # "startedAt":J
    .end local v11    # "failure":Ljava/lang/String;
    .end local v12    # "applied":I
    .end local v13    # "nextCursor":J
    .end local v21    # "success":Z
    .end local p0    # "cursor":J
    .end local p2    # "account":Ljava/lang/String;
    .end local p3    # "endpoint":Ljava/lang/String;
    .end local p4    # "token":Ljava/lang/String;
    .end local p5    # "cursorKey":Ljava/lang/String;
    .end local p6    # "switching":Z
    .end local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    throw v2

    .line 257
    .end local v0    # "appliedCount":[I
    .end local v1    # "snapshots":Lcom/google/gson/JsonObject;
    .end local v15    # "result":Lcom/google/gson/JsonObject;
    .end local v17    # "snapshotsChanged":[Z
    .end local v19    # "request":Lokhttp3/Request;
    .end local v20    # "newest":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/google/gson/JsonObject;>;"
    .end local v22    # "requestedCursor":J
    .restart local v9    # "startedAt":J
    .restart local v11    # "failure":Ljava/lang/String;
    .restart local v12    # "applied":I
    .restart local v13    # "nextCursor":J
    .restart local v21    # "success":Z
    .restart local p0    # "cursor":J
    .restart local p2    # "account":Ljava/lang/String;
    .restart local p3    # "endpoint":Ljava/lang/String;
    .restart local p4    # "token":Ljava/lang/String;
    .restart local p5    # "cursorKey":Ljava/lang/String;
    .restart local p6    # "switching":Z
    .restart local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :catch_3
    move-exception v0

    move-object/from16 v4, p5

    goto :goto_a

    .line 205
    .end local v21    # "success":Z
    .local v2, "request":Lokhttp3/Request;
    .restart local v5    # "requestedCursor":J
    .restart local v8    # "success":Z
    .restart local v15    # "result":Lcom/google/gson/JsonObject;
    :cond_c
    move-object/from16 v4, p5

    move-object/from16 v19, v2

    move-wide/from16 v22, v5

    move/from16 v21, v8

    const/4 v8, 0x0

    .end local v2    # "request":Lokhttp3/Request;
    .end local v5    # "requestedCursor":J
    .end local v8    # "success":Z
    .restart local v19    # "request":Lokhttp3/Request;
    .restart local v21    # "success":Z
    .restart local v22    # "requestedCursor":J
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "invalid response"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v9    # "startedAt":J
    .end local v11    # "failure":Ljava/lang/String;
    .end local v12    # "applied":I
    .end local v13    # "nextCursor":J
    .end local v21    # "success":Z
    .end local p0    # "cursor":J
    .end local p2    # "account":Ljava/lang/String;
    .end local p3    # "endpoint":Ljava/lang/String;
    .end local p4    # "token":Ljava/lang/String;
    .end local p5    # "cursorKey":Ljava/lang/String;
    .end local p6    # "switching":Z
    .end local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    throw v0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    .line 201
    .end local v15    # "result":Lcom/google/gson/JsonObject;
    .end local v19    # "request":Lokhttp3/Request;
    .end local v22    # "requestedCursor":J
    .local v1, "response":Lokhttp3/Response;
    .restart local v2    # "request":Lokhttp3/Request;
    .restart local v5    # "requestedCursor":J
    .restart local v8    # "success":Z
    .restart local v9    # "startedAt":J
    .restart local v11    # "failure":Ljava/lang/String;
    .restart local v12    # "applied":I
    .restart local v13    # "nextCursor":J
    .restart local p0    # "cursor":J
    .restart local p2    # "account":Ljava/lang/String;
    .restart local p3    # "endpoint":Ljava/lang/String;
    .restart local p4    # "token":Ljava/lang/String;
    .restart local p5    # "cursorKey":Ljava/lang/String;
    .restart local p6    # "switching":Z
    .restart local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :cond_d
    move-object/from16 v4, p5

    move-object/from16 v19, v2

    move-wide/from16 v22, v5

    move/from16 v21, v8

    const/4 v8, 0x0

    .line 202
    .end local v2    # "request":Lokhttp3/Request;
    .end local v5    # "requestedCursor":J
    .end local v8    # "success":Z
    .restart local v19    # "request":Lokhttp3/Request;
    .restart local v21    # "success":Z
    .restart local v22    # "requestedCursor":J
    :try_start_c
    new-instance v0, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u670d\u52a1\u5668\u8fd4\u56de HTTP "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v1    # "response":Lokhttp3/Response;
    .end local v9    # "startedAt":J
    .end local v11    # "failure":Ljava/lang/String;
    .end local v12    # "applied":I
    .end local v13    # "nextCursor":J
    .end local v19    # "request":Lokhttp3/Request;
    .end local v21    # "success":Z
    .end local v22    # "requestedCursor":J
    .end local p0    # "cursor":J
    .end local p2    # "account":Ljava/lang/String;
    .end local p3    # "endpoint":Ljava/lang/String;
    .end local p4    # "token":Ljava/lang/String;
    .end local p5    # "cursorKey":Ljava/lang/String;
    .end local p6    # "switching":Z
    .end local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 200
    .restart local v1    # "response":Lokhttp3/Response;
    .restart local v9    # "startedAt":J
    .restart local v11    # "failure":Ljava/lang/String;
    .restart local v12    # "applied":I
    .restart local v13    # "nextCursor":J
    .restart local v19    # "request":Lokhttp3/Request;
    .restart local v21    # "success":Z
    .restart local v22    # "requestedCursor":J
    .restart local p0    # "cursor":J
    .restart local p2    # "account":Ljava/lang/String;
    .restart local p3    # "endpoint":Ljava/lang/String;
    .restart local p4    # "token":Ljava/lang/String;
    .restart local p5    # "cursorKey":Ljava/lang/String;
    .restart local p6    # "switching":Z
    .restart local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :catchall_1
    move-exception v0

    move-object v2, v0

    goto :goto_8

    .end local v19    # "request":Lokhttp3/Request;
    .end local v21    # "success":Z
    .end local v22    # "requestedCursor":J
    .restart local v2    # "request":Lokhttp3/Request;
    .restart local v5    # "requestedCursor":J
    .restart local v8    # "success":Z
    :catchall_2
    move-exception v0

    move-object/from16 v4, p5

    move-object/from16 v19, v2

    move-wide/from16 v22, v5

    move/from16 v21, v8

    const/4 v8, 0x0

    move-object v2, v0

    .end local v2    # "request":Lokhttp3/Request;
    .end local v5    # "requestedCursor":J
    .end local v8    # "success":Z
    .restart local v19    # "request":Lokhttp3/Request;
    .restart local v21    # "success":Z
    .restart local v22    # "requestedCursor":J
    :goto_8
    if-eqz v1, :cond_e

    :try_start_d
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_9

    :catchall_3
    move-exception v0

    move-object v3, v0

    :try_start_e
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v9    # "startedAt":J
    .end local v11    # "failure":Ljava/lang/String;
    .end local v12    # "applied":I
    .end local v13    # "nextCursor":J
    .end local v21    # "success":Z
    .end local p0    # "cursor":J
    .end local p2    # "account":Ljava/lang/String;
    .end local p3    # "endpoint":Ljava/lang/String;
    .end local p4    # "token":Ljava/lang/String;
    .end local p5    # "cursorKey":Ljava/lang/String;
    .end local p6    # "switching":Z
    .end local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :cond_e
    :goto_9
    throw v2
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4

    .line 257
    .end local v1    # "response":Lokhttp3/Response;
    .end local v19    # "request":Lokhttp3/Request;
    .end local v22    # "requestedCursor":J
    .restart local v9    # "startedAt":J
    .restart local v11    # "failure":Ljava/lang/String;
    .restart local v12    # "applied":I
    .restart local v13    # "nextCursor":J
    .restart local v21    # "success":Z
    .restart local p0    # "cursor":J
    .restart local p2    # "account":Ljava/lang/String;
    .restart local p3    # "endpoint":Ljava/lang/String;
    .restart local p4    # "token":Ljava/lang/String;
    .restart local p5    # "cursorKey":Ljava/lang/String;
    .restart local p6    # "switching":Z
    .restart local p7    # "callback":Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    :catch_4
    move-exception v0

    goto :goto_a

    .end local v21    # "success":Z
    .restart local v8    # "success":Z
    :catch_5
    move-exception v0

    move-object/from16 v4, p5

    move/from16 v21, v8

    const/4 v8, 0x0

    .line 258
    .end local v8    # "success":Z
    .local v0, "error":Ljava/lang/Exception;
    .restart local v21    # "success":Z
    :goto_a
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_f

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_f

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    move/from16 v0, v21

    goto :goto_b

    .line 260
    .end local v0    # "error":Ljava/lang/Exception;
    :cond_f
    move/from16 v0, v21

    .end local v21    # "success":Z
    .local v0, "success":Z
    :goto_b
    if-eqz v0, :cond_11

    .line 261
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sub-long/2addr v1, v9

    invoke-static {v7, v1, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->markSyncSuccess(Ljava/lang/String;J)V

    .line 265
    if-gtz v12, :cond_10

    if-eqz p6, :cond_12

    .line 266
    :cond_10
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/event/RefreshEvent;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(I)V

    invoke-virtual {v1, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_c

    .line 269
    :cond_11
    const-string v1, "sync_last_error"

    invoke-static {v1, v7}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u62c9\u53d6\u5931\u8d25\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 271
    if-lez v12, :cond_12

    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/event/RefreshEvent;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(I)V

    invoke-virtual {v1, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 273
    :cond_12
    :goto_c
    sget-object v1, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PULLING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 274
    move-object/from16 v1, p7

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->done(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;Z)V

    .line 275
    sget-boolean v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAgain:Z

    if-eqz v2, :cond_13

    sput-boolean v8, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAgain:Z

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->startPull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    .line 276
    :cond_13
    return-void
.end method

.method private static longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J
    .locals 3
    .param p0, "object"    # Lcom/google/gson/JsonObject;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "object",
            "key"
        }
    .end annotation

    .line 582
    const-wide/16 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsLong()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-wide v0

    :catch_0
    move-exception v2

    .local v2, "ignored":Ljava/lang/Exception;
    return-wide v0
.end method

.method private static longValue(Ljava/lang/String;J)J
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "fallback"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "fallback"
        }
    .end annotation

    .line 581
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    return-wide p1
.end method

.method private static markSyncSuccess(Ljava/lang/String;J)V
    .locals 3
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "rtt"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "account",
            "rtt"
        }
    .end annotation

    .line 560
    const-string v0, "sync_last_success"

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 561
    const-string v0, "sync_last_rtt"

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 562
    const-string v0, "sync_last_error"

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 563
    return-void
.end method

.method private static outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;
    .locals 3
    .param p0, "account"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "account"
        }
    .end annotation

    .line 565
    :try_start_0
    new-instance v0, Lcom/google/gson/JsonParser;

    invoke-direct {v0}, Lcom/google/gson/JsonParser;-><init>()V

    const-string v1, "sync_outbox_v2"

    invoke-static {v1, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "{}"

    invoke-static {v1, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 566
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    new-instance v1, Lcom/google/gson/JsonObject;

    invoke-direct {v1}, Lcom/google/gson/JsonObject;-><init>()V

    return-object v1
.end method

.method public static pendingCount()I
    .locals 2

    .line 516
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->OUTBOX_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/JsonObject;->size()I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static playbackActive()Z
    .locals 1

    .line 89
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PLAYBACK_ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public static pull()V
    .locals 1

    .line 152
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    return-void
.end method

.method public static pull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V
    .locals 1
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "callback"
        }
    .end annotation

    .line 155
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->done(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;Z)V

    return-void

    .line 164
    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->hasPending()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->drainOutbox(Z)V

    .line 165
    :cond_2
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->startPull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    .line 166
    return-void
.end method

.method public static push(Lcom/github/tvbox/osc/cache/VodRecord;)V
    .locals 0
    if-eqz p0, :done
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->rememberProgressRecord(Lcom/github/tvbox/osc/cache/VodRecord;)V
    invoke-static {p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->enqueueRecord(Ljava/lang/Object;)V
    :done
    return-void
.end method

.method public static pushRecordWorker(Lcom/github/tvbox/osc/cache/VodRecord;)V
    .locals 1
    if-eqz p0, :no_snapshot
    nop
    :no_snapshot

    .param p0, "record"    # Lcom/github/tvbox/osc/cache/VodRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "record"
        }
    .end annotation

    .line 141
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    .line 142
    :cond_0
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enqueue(Lcom/github/tvbox/osc/cache/VodRecord;)V

    .line 143
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->drainOutbox(Z)V

    .line 144
    return-void

    .line 141
    :cond_1
    :goto_0
    return-void
.end method

.method public static pushLatest()V
    .locals 4

    .line 131
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 133
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v1

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->accountScope()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getAll(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v1

    .line 134
    .local v1, "rows":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/cache/VodRecord;>;"
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/cache/VodRecord;

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enqueue(Lcom/github/tvbox/osc/cache/VodRecord;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 135
    .end local v1    # "rows":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/cache/VodRecord;>;"
    :catch_0
    move-exception v1

    :cond_1
    :goto_0
    nop

    .line 136
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->drainOutbox(Z)V

    .line 137
    return-void
.end method

.method private static recordItem(Lcom/github/tvbox/osc/cache/VodRecord;)Lcom/google/gson/JsonObject;
    .locals 10
    .param p0, "record"    # Lcom/github/tvbox/osc/cache/VodRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "record"
        }
    .end annotation

    .line 363
    new-instance v0, Lcom/google/gson/JsonParser;

    invoke-direct {v0}, Lcom/google/gson/JsonParser;-><init>()V

    iget-object v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 364
    .local v0, "vod":Lcom/google/gson/JsonObject;
    const-string v1, "playFlag"

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 365
    .local v1, "playFlag":Ljava/lang/String;
    const-string v2, "playIndex"

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v2

    .line 366
    .local v2, "playIndex":I
    const-string v3, "playNote"

    invoke-static {v0, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 368
    .local v3, "episodeName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 369
    .local v4, "progressKey":Ljava/lang/String;
    new-instance v5, Lcom/google/gson/JsonObject;

    invoke-direct {v5}, Lcom/google/gson/JsonObject;-><init>()V

    .line 370
    .local v5, "item":Lcom/google/gson/JsonObject;
    iget-object v6, p0, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;

    const-string v7, "source_key"

    invoke-virtual {v5, v7, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    iget-object v6, p0, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;

    const-string v7, "video_id"

    invoke-virtual {v5, v7, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    const-string v6, "name"

    invoke-static {v0, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "video_name"

    invoke-virtual {v5, v8, v7}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, ""

    goto :goto_0

    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_0
    const-string v8, "episode_id"

    invoke-virtual {v5, v8, v7}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    const-string v7, "episode_name"

    invoke-virtual {v5, v7, v3}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    iget-object v7, p0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;

    invoke-static {v7, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->cachedProgress(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const-string v8, "position_ms"

    invoke-virtual {v5, v8, v7}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 376
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "duration_ms"

    invoke-virtual {v5, v9, v8}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 377
    const-string v8, "progress_key"

    invoke-virtual {v5, v8, v4}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    invoke-static {v0, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->contentKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "content_key"

    invoke-virtual {v5, v8, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    const-string v6, "year"

    invoke-static {v0, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v8, "content_year"

    invoke-virtual {v5, v8, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 380
    invoke-static {v3, v2}, Lcom/github/tvbox/osc/sync/ContentFingerprint;->episodeKey(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    const-string v8, "episode_key"

    invoke-virtual {v5, v8, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 381

    invoke-static {p0, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->observedTime(Lcom/github/tvbox/osc/cache/VodRecord;Ljava/lang/String;)J
    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-string v8, "updated_at"

    invoke-virtual {v5, v8, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Number;)V

    .line 382
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "deleted"

    invoke-virtual {v5, v7, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-object v6, p0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    const-string v7, "data_json"

    invoke-virtual {v5, v7, v6}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    return-object v5
.end method

.method private static recordKey(Lcom/google/gson/JsonObject;)Ljava/lang/String;
    .locals 3
    .param p0, "item"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .line 569
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "source_key"

    invoke-static {p0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\u0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "video_id"

    invoke-static {p0, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "episode_id"

    invoke-static {p0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static rememberCrossSource(Ljava/lang/String;Lcom/google/gson/JsonObject;)V
    .locals 2
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "item"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "account",
            "item"
        }
    .end annotation

    .line 471
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->crossSourceSnapshots(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 472
    .local v0, "snapshots":Lcom/google/gson/JsonObject;
    invoke-static {v0, p1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->rememberCrossSource(Lcom/google/gson/JsonObject;Lcom/google/gson/JsonObject;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->saveCrossSource(Ljava/lang/String;Lcom/google/gson/JsonObject;)V

    .line 473
    :cond_0
    return-void
.end method

.method private static rememberCrossSource(Lcom/google/gson/JsonObject;Lcom/google/gson/JsonObject;)Z
    .locals 9
    .param p0, "snapshots"    # Lcom/google/gson/JsonObject;
    .param p1, "item"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "snapshots",
            "item"
        }
    .end annotation

    .line 484
    const-string v0, "content_key"

    invoke-static {p1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 485
    .local v0, "contentKey":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    .line 486
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "content_year"

    invoke-static {p1, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "episode_key"

    invoke-static {p1, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 487
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0, v1}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 488
    .local v3, "old":Lcom/google/gson/JsonObject;
    :goto_0
    if-eqz v3, :cond_2

    const-string v4, "updated_at"

    invoke-static {p1, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v3, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v7

    cmp-long v4, v5, v7

    if-gez v4, :cond_2

    return v2

    .line 489
    :cond_2
    invoke-virtual {p1}, Lcom/google/gson/JsonObject;->deepCopy()Lcom/google/gson/JsonObject;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 490
    const/4 v2, 0x1

    return v2
.end method

.method public static reportPlaybackProgress(Ljava/lang/String;JZ)V
    .locals 7
    .param p0, "progressKey"    # Ljava/lang/String;
    .param p1, "positionMs"    # J
    .param p3, "immediate"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "progressKey",
            "positionMs",
            "immediate"
        }
    .end annotation

    .line 95
    if-eqz p0, :cond_5

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    goto :goto_1

    .line 96
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->canReportPlayback()Z
    move-result v0
    if-eqz v0, :cond_5
    invoke-static {p0, p1, p2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->savePlaybackProgress(Ljava/lang/String;J)V

    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 98
    .local v0, "now":J
    sget-object v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastReportedProgressKey:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-wide v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastReportedPosition:J

    cmp-long v4, p1, v2

    if-nez v4, :cond_1

    sget-wide v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastProgressReport:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    .line 100
    return-void

    .line 101
    :cond_1
    if-nez p3, :cond_2

    sget-wide v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastProgressReport:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1388

    cmp-long v6, v2, v4

    if-ltz v6, :cond_4

    .line 102
    :cond_2
    sput-wide v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastProgressReport:J

    .line 103
    sput-object p0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastReportedProgressKey:Ljava/lang/String;

    .line 104
    sput-wide p1, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->lastReportedPosition:J

    invoke-static {p0, p3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pushProgress(Ljava/lang/String;Z)V

    .line 109
    :cond_4
    :goto_0
    return-void

    .line 95
    .end local v0    # "now":J
    :cond_5
    :goto_1
    return-void
.end method

.method public static retryNow()V
    .locals 1
    const-string v0, "retryNow"
    invoke-static {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->dispatch(Ljava/lang/String;)V
    return-void
.end method

.method public static retryNowWorker()V
    .locals 3

    .line 113
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 114
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sync_retry_at"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 115
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->syncNow()V

    .line 116
    return-void
.end method

.method public static retryPending()V
    .locals 1
    const-string v0, "retryPending"
    invoke-static {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->dispatch(Ljava/lang/String;)V
    return-void
.end method

.method public static retryPendingWorker()V
    .locals 3

    .line 148
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "account":Ljava/lang/String;
    const-string v1, "sync_push_pending"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->outbox(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->drainOutbox(Z)V

    .line 150
    :cond_1
    return-void
.end method

.method private static saveCrossSource(Ljava/lang/String;Lcom/google/gson/JsonObject;)V
    .locals 2
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "snapshots"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "account",
            "snapshots"
        }
    .end annotation

    .line 494
    const/16 v0, 0x12c

    invoke-static {p1, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->trimSnapshots(Lcom/google/gson/JsonObject;I)V

    .line 495
    const-string v0, "sync_cross_source_v1"

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 496
    return-void
.end method

.method private static saveOutbox(Ljava/lang/String;Lcom/google/gson/JsonObject;)V
    .locals 2
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "pending"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "account",
            "pending"
        }
    .end annotation

    .line 568
    const-string v0, "sync_outbox_v2"

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    const-string v0, "sync_push_pending"

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    return-void
.end method

.method public static setPlaybackActive(Z)V
    .locals 2
    .param p0, "active"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "active"
        }
    .end annotation

    .line 82
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PLAYBACK_ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz p0, :repair_playback_captured
    if-nez v0, :repair_playback_captured
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackAccount:Ljava/lang/String;
    :repair_playback_captured
    .line 85
    .local v0, "previous":Z
    if-nez p0, :cond_0

    if-eqz v0, :cond_0

    .line 86
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->syncNow()V

    .line 88
    :cond_0
    return-void
.end method

.method private static startPull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V
    .locals 15
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "callback"
        }
    .end annotation

    .line 169
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PULLING:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    sput-boolean v2, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAgain:Z

    invoke-static {p0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->done(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;Z)V

    return-void

    .line 170
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->endpoint()Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "endpoint":Ljava/lang/String;
    const-string v3, "sync_token"

    invoke-static {v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    .line 172
    .local v12, "token":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;

    move-result-object v13

    .line 178
    .local v13, "account":Ljava/lang/String;
    sget-object v3, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->ACCOUNT_SWITCH_LOCK:Ljava/lang/Object;

    monitor-enter v3

    .line 179
    :try_start_0
    const-string v4, "sync_local_history_account"

    invoke-static {v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v1, 0x1

    .line 180
    .local v1, "switching":Z
    :cond_1
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    const-string v2, "sync_cursor_v2"

    invoke-static {v2, v13}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 183
    .local v2, "cursorKey":Ljava/lang/String;
    const-wide/16 v3, 0x0

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {v2, v3, v4}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J

    move-result-wide v3

    :goto_0
    move-wide v4, v3

    .line 184
    .local v4, "cursor":J
    new-instance v14, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda0;

    move-object v3, v14

    move-object v6, v13

    move-object v7, v0

    move-object v8, v12

    move-object v9, v2

    move v10, v1

    move-object v11, p0

    invoke-direct/range {v3 .. v11}, Lcom/github/tvbox/osc/sync/TvboxSyncClient$$ExternalSyntheticLambda0;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    invoke-static {v14}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->executeDownload(Ljava/lang/Runnable;)V

    .line 277
    return-void

    .line 180
    .end local v1    # "switching":Z
    .end local v2    # "cursorKey":Ljava/lang/String;
    .end local v4    # "cursor":J
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "object"    # Lcom/google/gson/JsonObject;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "object",
            "key"
        }
    .end annotation

    .line 584
    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->isJsonNull()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public static syncNow()V
    .locals 1
    const-string v0, "syncNow"
    invoke-static {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->dispatch(Ljava/lang/String;)V
    return-void
.end method

.method public static syncNowWorker()V
    .locals 1

    .line 120
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 121
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAfterPush:Z

    .line 122
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pushLatest()V

    .line 123
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->hasPending()Z

    move-result v0

    if-nez v0, :cond_1

    .line 124
    const/4 v0, 0x0

    sput-boolean v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAfterPush:Z

    .line 125
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->startPull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    .line 127
    :cond_1
    return-void
.end method

.method private static trimSnapshots(Lcom/google/gson/JsonObject;I)V
    .locals 8
    .param p0, "snapshots"    # Lcom/google/gson/JsonObject;
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "snapshots",
            "limit"
        }
    .end annotation

    .line 504
    :goto_0
    invoke-virtual {p0}, Lcom/google/gson/JsonObject;->size()I

    move-result v0

    if-le v0, p1, :cond_3

    .line 505
    const/4 v0, 0x0

    .local v0, "oldestKey":Ljava/lang/String;
    const-wide v1, 0x7fffffffffffffffL

    .line 506
    .local v1, "oldest":J
    invoke-virtual {p0}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 507
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/gson/JsonElement;

    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v5

    const-string v6, "updated_at"

    invoke-static {v5, v6}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J

    move-result-wide v5

    .line 508
    .local v5, "time":J
    cmp-long v7, v5, v1

    if-gez v7, :cond_0

    move-wide v1, v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    .line 509
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    .end local v5    # "time":J
    :cond_0
    goto :goto_1

    .line 510
    :cond_1
    if-nez v0, :cond_2

    return-void

    .line 511
    :cond_2
    invoke-virtual {p0, v0}, Lcom/google/gson/JsonObject;->remove(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    .line 512
    .end local v0    # "oldestKey":Ljava/lang/String;
    .end local v1    # "oldest":J
    goto :goto_0

    .line 513
    :cond_3
    return-void
.end method

.method private static value(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 579
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "fallback"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "fallback"
        }
    .end annotation

    .line 580
    invoke-static {p0, p1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    move-object v1, p1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method private static progressTimeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "sync_observed_v1_"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "_"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private static canReportPlayback()Z
    .locals 2
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PLAYBACK_ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    move-result v0
    if-eqz v0, :allowed
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackAccount:Ljava/lang/String;
    if-eqz v0, :allowed
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    return v0
    :allowed
    const/4 v0, 0x1
    return v0
.end method

.method public static actualRecordTime(Lcom/github/tvbox/osc/cache/VodRecord;)J
    .locals 3
    :try_start
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->recordItem(Lcom/github/tvbox/osc/cache/VodRecord;)Lcom/google/gson/JsonObject;
    move-result-object v0
    const-string v1, "updated_at"
    invoke-static {v0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)J
    move-result-wide v0
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :fallback
    return-wide v0
    :fallback
    move-exception v0
    iget-wide v0, p0, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J
    return-wide v0
.end method

.method private static observeProgress(Ljava/lang/String;J)V
    .locals 5
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->cachedProgress(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v1
    cmp-long v3, v1, p1
    if-eqz v3, :done
    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->progressTimeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z
    :done
    return-void
.end method

.method private static observedTime(Lcom/github/tvbox/osc/cache/VodRecord;Ljava/lang/String;)J
    .locals 5
    iget-object v0, p0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;
    invoke-static {v0, p1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->progressTimeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    const-wide/16 v1, 0x0
    invoke-static {v0, v1, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->longValue(Ljava/lang/String;J)J
    move-result-wide v1
    iget-wide v3, p0, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J
    move-result-wide v1
    return-wide v1
.end method

# Capture the observation before the player's cache write. Otherwise a later
# report sees the same value and the server rejects its unchanged timestamp.
.method public static savePlaybackProgress(Ljava/lang/String;J)V
    .locals 0
    invoke-static {p0, p1, p2}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->enqueue(Ljava/lang/String;J)V
    return-void
.end method

# Match the exact episode being reported, independent of the history sort order.
.method private static findProgressRecord(Ljava/util/List;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;
    .locals 4
    if-eqz p0, :missing
    if-eqz p1, :missing
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v0
    :loop
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :missing
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    :try_start
    check-cast v1, Lcom/github/tvbox/osc/cache/VodRecord;
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->recordProgressKey(Lcom/github/tvbox/osc/cache/VodRecord;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :loop
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :bad_row
    return-object v1
    :bad_row
    move-exception v2
    goto :loop
    :missing
    const/4 v0, 0x0
    return-object v0
.end method

.method public static prepareProgress(Ljava/lang/String;ZLjava/lang/String;Lcom/github/tvbox/osc/cache/VodRecord;)V
    .locals 3
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z
    move-result v0
    if-eqz v0, :done
    if-eqz p1, :lookup
    const/4 v0, 0x1
    sput-boolean v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAfterPush:Z
    :lookup
    :try_start
    move-object v0, p3
    if-nez v0, :record_ready
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;
    move-result-object v0
    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;
    move-result-object v0
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->accountScope()Ljava/lang/String;
    move-result-object v1
    const/4 v2, -0x1
    invoke-interface {v0, v1, v2}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getAll(Ljava/lang/String;I)Ljava/util/List;
    move-result-object v0
    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->findProgressRecord(Ljava/util/List;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;
    move-result-object v0
    :record_ready
    if-eqz v0, :try_end
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enqueue(Lcom/github/tvbox/osc/cache/VodRecord;)V
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :lookup_failed
    goto :drain
    :lookup_failed
    move-exception v0
    :drain
    const/4 v0, 0x0
    invoke-static {p1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->drainOutbox(Z)V
    if-eqz p1, :done
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PUSHING:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    move-result v0
    if-nez v0, :done
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->hasPending()Z
    move-result v0
    if-nez v0, :done
    const/4 v0, 0x0
    sput-boolean v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pullAfterPush:Z
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->startPull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V
    :done
    return-void
.end method

.method private static executeUpload(Ljava/lang/Runnable;)V
    .locals 1
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->UPLOAD_EXECUTOR:Ljava/util/concurrent/ExecutorService;
    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    return-void
.end method

.method private static executeDownload(Ljava/lang/Runnable;)V
    .locals 1
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->DOWNLOAD_EXECUTOR:Ljava/util/concurrent/ExecutorService;
    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    return-void
.end method

.method private static priorityHttp()Lokhttp3/OkHttpClient;
    .locals 4
    new-instance v0, Lokhttp3/OkHttpClient$Builder;
    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;
    const-wide/16 v2, 0x4
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;
    const-wide/16 v2, 0x8
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;
    const-wide/16 v2, 0xc
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;
    move-result-object v0
    return-object v0
.end method

.method private static recordProgressKey(Lcom/github/tvbox/osc/cache/VodRecord;)Ljava/lang/String;
    .locals 6
    .line 363
    new-instance v0, Lcom/google/gson/JsonParser;

    invoke-direct {v0}, Lcom/google/gson/JsonParser;-><init>()V

    iget-object v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 364
    .local v0, "vod":Lcom/google/gson/JsonObject;
    const-string v1, "playFlag"

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 365
    .local v1, "playFlag":Ljava/lang/String;
    const-string v2, "playIndex"

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->intValue(Lcom/google/gson/JsonObject;Ljava/lang/String;)I

    move-result v2

    .line 366
    .local v2, "playIndex":I
    const-string v3, "playNote"

    invoke-static {v0, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->string(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 368
    .local v3, "episodeName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static pushProgress(Ljava/lang/String;Z)V
    .locals 4
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->accountId()Ljava/lang/String;
    move-result-object v0
    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->captureProgressRecord(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;
    move-result-object v1
    new-instance v2, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;
    invoke-direct {v2, p0, p1, v0, v1}, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;-><init>(Ljava/lang/String;ZLjava/lang/String;Lcom/github/tvbox/osc/cache/VodRecord;)V
    sget-object v3, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->PROGRESS_EXECUTOR:Ljava/util/concurrent/ExecutorService;
    invoke-interface {v3, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    return-void
.end method

.method private static rememberProgressRecord(Lcom/github/tvbox/osc/cache/VodRecord;)V
    .locals 3
    new-instance v0, Lcom/github/tvbox/osc/cache/VodRecord;
    invoke-direct {v0}, Lcom/github/tvbox/osc/cache/VodRecord;-><init>()V
    iget-object v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;
    iput-object v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;
    iput-object v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;
    iput-object v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;
    iput-object v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;
    iget-wide v1, p0, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J
    iput-wide v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J
    sput-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->preparedPlaybackRecord:Lcom/github/tvbox/osc/cache/VodRecord;
    return-void
.end method

.method private static captureProgressRecord(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;
    .locals 2
    sget-object v0, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->preparedPlaybackRecord:Lcom/github/tvbox/osc/cache/VodRecord;
    if-eqz v0, :missing
    :try_start
    iget-object v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :missing
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->recordProgressKey(Lcom/github/tvbox/osc/cache/VodRecord;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :missing
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :bad_record
    return-object v0
    :bad_record
    move-exception v1
    :missing
    const/4 v0, 0x0
    return-object v0
.end method

.method public static persistProgressSnapshot(Ljava/lang/String;JLjava/lang/String;J)V
    .locals 5
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    invoke-static {p3, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->cachedProgress(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v0
    cmp-long v2, v0, p1
    if-eqz v2, :save
    invoke-static {p3, p0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->progressTimeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z
    :save
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    invoke-static {p3, p0, v0}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :done
    return-void
.end method
