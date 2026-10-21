.class public Lcom/github/tvbox/osc/cache/RoomDataManger;
.super Ljava/lang/Object;
.source "RoomDataManger.java"


# static fields
.field private static final SCOPE_LOCK:Ljava/lang/Object;

.field private static final SCOPE_OWNER:Ljava/lang/String; = "local_media_scope_owner_v1"

.field static vodInfoStrategy:Lcom/google/gson/ExclusionStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/cache/RoomDataManger;->SCOPE_LOCK:Ljava/lang/Object;

    .line 50
    new-instance v0, Lcom/github/tvbox/osc/cache/RoomDataManger$1;

    invoke-direct {v0}, Lcom/github/tvbox/osc/cache/RoomDataManger$1;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/cache/RoomDataManger;->vodInfoStrategy:Lcom/google/gson/ExclusionStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accountScope()Ljava/lang/String;
    .locals 1

    .line 230
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static currentScope()Ljava/lang/String;
    .locals 5

    .line 33
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountScope;->current()Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "scope":Ljava/lang/String;
    sget-object v1, Lcom/github/tvbox/osc/cache/RoomDataManger;->SCOPE_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 35
    :try_start_0
    const-string v2, "local_media_scope_owner_v1"

    const-string v3, ""

    invoke-static {v2, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 36
    .local v2, "owner":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 37
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/github/tvbox/osc/cache/VodRecordDao;->claimLegacy(Ljava/lang/String;)I

    .line 38
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/github/tvbox/osc/cache/VodCollectDao;->claimLegacy(Ljava/lang/String;)I

    .line 39
    const-string v3, "local_media_scope_owner_v1"

    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    goto :goto_0

    .line 40
    :cond_0
    const-string v3, "local"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "local"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 43
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v3

    const-string v4, "local"

    invoke-interface {v3, v4, v0}, Lcom/github/tvbox/osc/cache/VodRecordDao;->moveAccount(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v3

    const-string v4, "local"

    invoke-interface {v3, v4, v0}, Lcom/github/tvbox/osc/cache/VodCollectDao;->moveAccount(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    const-string v3, "local_media_scope_owner_v1"

    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 47
    .end local v2    # "owner":Ljava/lang/String;
    :cond_1
    :goto_0
    monitor-exit v1

    .line 48
    return-object v0

    .line 47
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static deleteVodCollect(I)V
    .locals 1
    .param p0, "id"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "id"
        }
    .end annotation

    .line 202
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/github/tvbox/osc/cache/VodCollectDao;->delete(I)V

    .line 203
    return-void
.end method

.method public static deleteVodCollect(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 3
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodInfo"
        }
    .end annotation

    .line 206
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    invoke-interface {v0, v1, p0, v2}, Lcom/github/tvbox/osc/cache/VodCollectDao;->getVodCollect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodCollect;

    move-result-object v0

    .line 207
    .local v0, "record":Lcom/github/tvbox/osc/cache/VodCollect;
    if-eqz v0, :cond_0

    .line 208
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/github/tvbox/osc/cache/VodCollectDao;->delete(Lcom/github/tvbox/osc/cache/VodCollect;)I

    .line 210
    :cond_0
    return-void
.end method

.method public static deleteVodCollectAll()V
    .locals 2

    .line 213
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/tvbox/osc/cache/VodCollectDao;->deleteAll(Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method public static deleteVodRecord(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 3
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodInfo"
        }
    .end annotation

    .line 148
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    invoke-interface {v0, v1, p0, v2}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getVodRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;

    move-result-object v0

    .line 149
    .local v0, "record":Lcom/github/tvbox/osc/cache/VodRecord;
    if-eqz v0, :cond_0

    .line 150
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/github/tvbox/osc/cache/VodRecordDao;->delete(Lcom/github/tvbox/osc/cache/VodRecord;)I

    .line 152
    :cond_0
    return-void
.end method

.method public static deleteVodRecordAll()V
    .locals 2

    .line 217
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/tvbox/osc/cache/VodRecordDao;->deleteAll(Ljava/lang/String;)V

    .line 218
    return-void
.end method

.method public static getAllVodCollect()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/cache/VodCollect;",
            ">;"
        }
    .end annotation

    .line 226
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/tvbox/osc/cache/VodCollectDao;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getAllVodRecord(I)Ljava/util/List;
    .locals 11
    .param p0, "limit"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "limit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/VodInfo;",
            ">;"
        }
    .end annotation

    .line 155
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "history_num"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 156
    .local v0, "index":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/HistoryHelper;->getHisNum(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 160
    .local v1, "hisNum":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez p0, :cond_0

    invoke-static {p0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 161
    .local v2, "displayLimit":I
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v3

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getAll(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v3

    .line 162
    .local v3, "recordList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/cache/VodRecord;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .local v4, "vodInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    if-eqz v3, :cond_3

    .line 164
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/github/tvbox/osc/cache/VodRecord;

    .line 165
    .local v6, "record":Lcom/github/tvbox/osc/cache/VodRecord;
    const/4 v7, 0x0

    .line 167
    .local v7, "info":Lcom/github/tvbox/osc/bean/VodInfo;
    :try_start_0
    iget-object v8, v6, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    if-eqz v8, :cond_1

    iget-object v8, v6, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 168
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getVodInfoGson()Lcom/google/gson/Gson;

    move-result-object v8

    iget-object v9, v6, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    new-instance v10, Lcom/github/tvbox/osc/cache/RoomDataManger$5;

    invoke-direct {v10}, Lcom/github/tvbox/osc/cache/RoomDataManger$5;-><init>()V

    .line 169
    invoke-virtual {v10}, Lcom/github/tvbox/osc/cache/RoomDataManger$5;->getType()Ljava/lang/reflect/Type;

    move-result-object v10

    .line 168
    invoke-virtual {v8, v9, v10}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/tvbox/osc/bean/VodInfo;

    move-object v7, v8

    .line 170
    iget-object v8, v6, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;

    iput-object v8, v7, Lcom/github/tvbox/osc/bean/VodInfo;->sourceKey:Ljava/lang/String;

    .line 172
    iget-object v8, v7, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v8, :cond_1

    .line 173
    const/4 v7, 0x0

    .line 177
    :cond_1
    goto :goto_1

    .line 175
    :catch_0
    move-exception v8

    .line 176
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .line 178
    .end local v8    # "e":Ljava/lang/Exception;
    :goto_1
    if-eqz v7, :cond_2

    .line 179
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .end local v6    # "record":Lcom/github/tvbox/osc/cache/VodRecord;
    .end local v7    # "info":Lcom/github/tvbox/osc/bean/VodInfo;
    :cond_2
    goto :goto_0

    .line 182
    :cond_3
    return-object v4
.end method

.method public static getVodInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/bean/VodInfo;
    .locals 5
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodId"
        }
    .end annotation

    .line 132
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0, p1}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getVodRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;

    move-result-object v0

    .line 134
    .local v0, "record":Lcom/github/tvbox/osc/cache/VodRecord;
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v2, v0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 135
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getVodInfoGson()Lcom/google/gson/Gson;

    move-result-object v2

    iget-object v3, v0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    new-instance v4, Lcom/github/tvbox/osc/cache/RoomDataManger$4;

    invoke-direct {v4}, Lcom/github/tvbox/osc/cache/RoomDataManger$4;-><init>()V

    .line 136
    invoke-virtual {v4}, Lcom/github/tvbox/osc/cache/RoomDataManger$4;->getType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 135
    invoke-virtual {v2, v3, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo;

    .line 137
    .local v2, "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    iget-object v3, v2, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v3, :cond_0

    .line 138
    return-object v1

    .line 139
    :cond_0
    return-object v2

    .line 141
    .end local v2    # "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    :catch_0
    move-exception v2

    .line 142
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 143
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    nop

    .line 144
    :goto_0
    return-object v1
.end method

.method private static getVodInfoGson()Lcom/google/gson/Gson;
    .locals 2

    .line 69
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    sget-object v1, Lcom/github/tvbox/osc/cache/RoomDataManger;->vodInfoStrategy:Lcom/google/gson/ExclusionStrategy;

    invoke-virtual {v0, v1}, Lcom/google/gson/GsonBuilder;->addSerializationExclusionStrategy(Lcom/google/gson/ExclusionStrategy;)Lcom/google/gson/GsonBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    return-object v0
.end method

.method public static insertVodCollect(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 4
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodInfo"
        }
    .end annotation

    .line 186
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "account":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v1

    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    invoke-interface {v1, v0, p0, v2}, Lcom/github/tvbox/osc/cache/VodCollectDao;->getVodCollect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodCollect;

    move-result-object v1

    .line 188
    .local v1, "record":Lcom/github/tvbox/osc/cache/VodCollect;
    if-eqz v1, :cond_0

    .line 189
    return-void

    .line 191
    :cond_0
    new-instance v2, Lcom/github/tvbox/osc/cache/VodCollect;

    invoke-direct {v2}, Lcom/github/tvbox/osc/cache/VodCollect;-><init>()V

    move-object v1, v2

    .line 192
    iput-object p0, v1, Lcom/github/tvbox/osc/cache/VodCollect;->sourceKey:Ljava/lang/String;

    .line 193
    iput-object v0, v1, Lcom/github/tvbox/osc/cache/VodCollect;->accountKey:Ljava/lang/String;

    .line 194
    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    iput-object v2, v1, Lcom/github/tvbox/osc/cache/VodCollect;->vodId:Ljava/lang/String;

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/github/tvbox/osc/cache/VodCollect;->updateTime:J

    .line 196
    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iput-object v2, v1, Lcom/github/tvbox/osc/cache/VodCollect;->name:Ljava/lang/String;

    .line 197
    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->pic:Ljava/lang/String;

    iput-object v2, v1, Lcom/github/tvbox/osc/cache/VodCollect;->pic:Ljava/lang/String;

    .line 198
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/github/tvbox/osc/cache/VodCollectDao;->insert(Lcom/github/tvbox/osc/cache/VodCollect;)J

    .line 199
    return-void
.end method

.method public static insertVodRecord(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 4
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodInfo"
        }
    .end annotation

    .line 73
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "account":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v1

    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    invoke-interface {v1, v0, p0, v2}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getVodRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;

    move-result-object v1

    .line 75
    .local v1, "record":Lcom/github/tvbox/osc/cache/VodRecord;
    if-nez v1, :cond_0

    .line 76
    new-instance v2, Lcom/github/tvbox/osc/cache/VodRecord;

    invoke-direct {v2}, Lcom/github/tvbox/osc/cache/VodRecord;-><init>()V

    move-object v1, v2

    .line 78
    :cond_0
    iput-object p0, v1, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;

    .line 79
    iput-object v0, v1, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;

    .line 80
    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    iput-object v2, v1, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;

    .line 81
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J

    .line 82
    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getVodInfoGson()Lcom/google/gson/Gson;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    .line 83
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/github/tvbox/osc/cache/VodRecordDao;->insert(Lcom/github/tvbox/osc/cache/VodRecord;)J

    .line 84
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->push(Lcom/github/tvbox/osc/cache/VodRecord;)V

    .line 85
    return-void
.end method

.method public static isVodCollect(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "sourceKey"    # Ljava/lang/String;
    .param p1, "vodId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodId"
        }
    .end annotation

    .line 221
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodCollectDao()Lcom/github/tvbox/osc/cache/VodCollectDao;

    move-result-object v0

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0, p1}, Lcom/github/tvbox/osc/cache/VodCollectDao;->getVodCollect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodCollect;

    move-result-object v0

    .line 222
    .local v0, "record":Lcom/github/tvbox/osc/cache/VodCollect;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static runBatch(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "body"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "body"
        }
    .end annotation

    .line 97
    if-nez p0, :cond_0

    return-void

    .line 99
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/github/tvbox/osc/data/AppDataBase;->runInTransaction(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 102
    .local v0, "error":Ljava/lang/Exception;
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 104
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static upsertSyncedRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JLjava/lang/String;)V
    .locals 16
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "sourceKey"    # Ljava/lang/String;
    .param p2, "vodId"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "episodeId"    # Ljava/lang/String;
    .param p5, "episodeName"    # Ljava/lang/String;
    .param p6, "updatedAt"    # J
    .param p8, "dataJson"    # Ljava/lang/String;
    .param p9, "positionMs"    # J
    .param p11, "progressKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "account",
            "sourceKey",
            "vodId",
            "name",
            "episodeId",
            "episodeName",
            "updatedAt",
            "dataJson",
            "positionMs",
            "progressKey"
        }
    .end annotation

    .line 107
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-wide/from16 v4, p6

    if-eqz v1, :cond_b

    if-eqz v2, :cond_b

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object/from16 v10, p3

    move-object/from16 v12, p5

    move-object/from16 v9, p8

    goto/16 :goto_8

    .line 108
    :cond_0
    invoke-static/range {p0 .. p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->currentScope()Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    .end local p0    # "account":Ljava/lang/String;
    .local v0, "account":Ljava/lang/String;
    goto :goto_0

    .end local v0    # "account":Ljava/lang/String;
    .restart local p0    # "account":Ljava/lang/String;
    :cond_1
    move-object/from16 v6, p0

    .line 109
    .end local p0    # "account":Ljava/lang/String;
    .local v6, "account":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v0

    invoke-interface {v0, v6, v1, v2}, Lcom/github/tvbox/osc/cache/VodRecordDao;->getVodRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/cache/VodRecord;

    move-result-object v7

    .line 113
    .local v7, "old":Lcom/github/tvbox/osc/cache/VodRecord;
    if-eqz v7, :cond_2

    invoke-static {v7}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->actualRecordTime(Lcom/github/tvbox/osc/cache/VodRecord;)J
    move-result-wide v8

    cmp-long v0, v8, v4

    if-ltz v0, :cond_2

    return-void

    .line 114
    :cond_2
    invoke-static/range {p8 .. p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getVodInfoGson()Lcom/google/gson/Gson;

    move-result-object v0

    new-instance v8, Lcom/github/tvbox/osc/cache/RoomDataManger$2;

    invoke-direct {v8}, Lcom/github/tvbox/osc/cache/RoomDataManger$2;-><init>()V

    invoke-virtual {v8}, Lcom/github/tvbox/osc/cache/RoomDataManger$2;->getType()Ljava/lang/reflect/Type;

    move-result-object v8

    move-object/from16 v9, p8

    invoke-virtual {v0, v9, v8}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    :goto_1
    check-cast v0, Lcom/github/tvbox/osc/bean/VodInfo;

    goto :goto_2

    :cond_3
    move-object/from16 v9, p8

    if-eqz v7, :cond_4

    iget-object v0, v7, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getVodInfoGson()Lcom/google/gson/Gson;

    move-result-object v0

    iget-object v8, v7, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    new-instance v10, Lcom/github/tvbox/osc/cache/RoomDataManger$3;

    invoke-direct {v10}, Lcom/github/tvbox/osc/cache/RoomDataManger$3;-><init>()V

    invoke-virtual {v10}, Lcom/github/tvbox/osc/cache/RoomDataManger$3;->getType()Ljava/lang/reflect/Type;

    move-result-object v10

    invoke-virtual {v0, v8, v10}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    :cond_4
    new-instance v0, Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {v0}, Lcom/github/tvbox/osc/bean/VodInfo;-><init>()V

    :goto_2
    move-object v8, v0

    .line 115
    .local v8, "info":Lcom/github/tvbox/osc/bean/VodInfo;
    iput-object v1, v8, Lcom/github/tvbox/osc/bean/VodInfo;->sourceKey:Ljava/lang/String;

    iput-object v2, v8, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    iget-object v0, v8, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    move-object/from16 v10, p3

    iput-object v10, v8, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    goto :goto_3

    :cond_5
    move-object/from16 v10, p3

    .line 116
    :goto_3
    if-nez v3, :cond_6

    const/4 v0, -0x1

    goto :goto_4

    :cond_6
    const/16 v0, 0x23

    invoke-virtual {v3, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    :goto_4
    move v11, v0

    .line 117
    .local v11, "separator":I
    if-lez v11, :cond_7

    .line 118
    const/4 v0, 0x0

    invoke-virtual {v3, v0, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 119
    add-int/lit8 v0, v11, 0x1

    :try_start_0
    invoke-virtual {v3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    .line 121
    :cond_7
    :goto_5
    move-object/from16 v12, p5

    iput-object v12, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    .line 122
    if-nez v7, :cond_8

    new-instance v0, Lcom/github/tvbox/osc/cache/VodRecord;

    invoke-direct {v0}, Lcom/github/tvbox/osc/cache/VodRecord;-><init>()V

    goto :goto_6

    :cond_8
    move-object v0, v7

    .line 123
    .local v0, "record":Lcom/github/tvbox/osc/cache/VodRecord;
    :goto_6
    iput-object v6, v0, Lcom/github/tvbox/osc/cache/VodRecord;->accountKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/github/tvbox/osc/cache/VodRecord;->sourceKey:Ljava/lang/String;

    iput-object v2, v0, Lcom/github/tvbox/osc/cache/VodRecord;->vodId:Ljava/lang/String;

    iput-wide v4, v0, Lcom/github/tvbox/osc/cache/VodRecord;->updateTime:J

    invoke-static {}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getVodInfoGson()Lcom/google/gson/Gson;

    move-result-object v13

    invoke-virtual {v13, v8}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v0, Lcom/github/tvbox/osc/cache/VodRecord;->dataJson:Ljava/lang/String;

    .line 124
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->get()Lcom/github/tvbox/osc/data/AppDataBase;

    move-result-object v13

    invoke-virtual {v13}, Lcom/github/tvbox/osc/data/AppDataBase;->getVodRecordDao()Lcom/github/tvbox/osc/cache/VodRecordDao;

    move-result-object v13

    invoke-interface {v13, v0}, Lcom/github/tvbox/osc/cache/VodRecordDao;->insert(Lcom/github/tvbox/osc/cache/VodRecord;)J

    .line 125
    const-wide/16 v13, 0x0

    cmp-long v15, p9, v13

    if-ltz v15, :cond_a

    .line 126
    invoke-static/range {p11 .. p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_9

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v14, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_7

    :cond_9
    move-object/from16 v13, p11

    .line 127
    .local v13, "key":Ljava/lang/String;
    :goto_7
    invoke-static/range {p9 .. p10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-static {v6, v13, v14}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    .end local v13    # "key":Ljava/lang/String;
    :cond_a
    return-void

    .line 107
    .end local v0    # "record":Lcom/github/tvbox/osc/cache/VodRecord;
    .end local v6    # "account":Ljava/lang/String;
    .end local v7    # "old":Lcom/github/tvbox/osc/cache/VodRecord;
    .end local v8    # "info":Lcom/github/tvbox/osc/bean/VodInfo;
    .end local v11    # "separator":I
    .restart local p0    # "account":Ljava/lang/String;
    :cond_b
    move-object/from16 v10, p3

    move-object/from16 v12, p5

    move-object/from16 v9, p8

    :goto_8
    return-void
.end method
