.class public Lcom/github/tvbox/osc/base/App;
.super Landroidx/multidex/MultiDexApplication;
.source "App.java"


# static fields
.field private static final IDLE_PULL_MS:J = 0x7530L

.field private static final SYNC_LOOP_MS:J = 0x3a98L

.field public static burl:Ljava/lang/String;

.field private static dashData:Ljava/lang/String;

.field private static instance:Lcom/github/tvbox/osc/base/App;

.field private static volatile lastForegroundSync:J

.field private static p:Lcom/p2p/P2PClass;


# instance fields
.field private vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Landroidx/multidex/MultiDexApplication;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/github/tvbox/osc/base/App;
    .locals 1

    .line 182
    sget-object v0, Lcom/github/tvbox/osc/base/App;->instance:Lcom/github/tvbox/osc/base/App;

    return-object v0
.end method

.method public static getp2p()Lcom/p2p/P2PClass;
    .locals 2

    .line 202
    :try_start_0
    sget-object v0, Lcom/github/tvbox/osc/base/App;->p:Lcom/p2p/P2PClass;

    if-nez v0, :cond_0

    .line 203
    new-instance v0, Lcom/p2p/P2PClass;

    invoke-static {}, Lcom/github/tvbox/osc/util/FileUtils;->getExternalCachePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/p2p/P2PClass;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/github/tvbox/osc/base/App;->p:Lcom/p2p/P2PClass;

    .line 205
    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/base/App;->p:Lcom/p2p/P2PClass;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 206
    :catch_0
    move-exception v0

    .line 207
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 208
    const/4 v1, 0x0

    return-object v1
.end method

.method private initParams()V
    .locals 3
    invoke-static {p0}, Lcom/orhanobut/hawk/Hawk;->init(Landroid/content/Context;)Lcom/orhanobut/hawk/HawkBuilder;
    move-result-object v0
    invoke-virtual {v0}, Lcom/orhanobut/hawk/HawkBuilder;->build()V
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->restorePendingLogin()V
    const-string v0, "debug_open"
    const/4 v1, 0x0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v2
    invoke-static {v0, v2}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z
    const-string v0, "play_render"
    invoke-static {v0}, Lcom/orhanobut/hawk/Hawk;->contains(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :done
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z
    :done
    return-void
.end method

.method private registerNetworkRecovery()V
    .locals 2

    .line 103
    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 104
    .local v0, "filter":Landroid/content/IntentFilter;
    new-instance v1, Lcom/github/tvbox/osc/base/App$1;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/base/App$1;-><init>(Lcom/github/tvbox/osc/base/App;)V

    invoke-virtual {p0, v1, v0}, Lcom/github/tvbox/osc/base/App;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    nop

    .end local v0    # "filter":Landroid/content/IntentFilter;
    goto :goto_0

    :catchall_0
    move-exception v0

    .line 110
    :goto_0
    return-void
.end method

.method private startSyncLoop()V
    .locals 6

    .line 113
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 114
    .local v0, "handler":Landroid/os/Handler;
    const/4 v1, 0x1

    new-array v2, v1, [Z

    const/4 v3, 0x0

    aput-boolean v3, v2, v3

    .line 115
    .local v2, "wasPlaying":[Z
    new-array v1, v1, [J

    const-wide/16 v4, 0x0

    aput-wide v4, v1, v3

    .line 116
    .local v1, "lastIdlePull":[J
    new-instance v3, Lcom/github/tvbox/osc/base/App$2;

    invoke-direct {v3, p0, v2, v1, v0}, Lcom/github/tvbox/osc/base/App$2;-><init>(Lcom/github/tvbox/osc/base/App;[Z[JLandroid/os/Handler;)V

    .line 145
    .local v3, "sync":Ljava/lang/Runnable;
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 147
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/github/tvbox/osc/sync/FavoritesSync;->sync(Lcom/github/tvbox/osc/sync/FavoritesSync$Callback;)V

    .line 148
    invoke-static {v4}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->sync(Lcom/github/tvbox/osc/sync/SearchHistorySync$Callback;)V

    .line 149
    return-void
.end method

.method public static syncForegroundNow()V
    .locals 7

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 87
    .local v0, "now":J
    sget-wide v2, Lcom/github/tvbox/osc/base/App;->lastForegroundSync:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1388

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    return-void

    .line 88
    :cond_0
    sput-wide v0, Lcom/github/tvbox/osc/base/App;->lastForegroundSync:J

    .line 91
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 92
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->retryNow()V

    .line 93
    return-void

    .line 95
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->retryNow()V

    .line 96
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/FavoritesSync;->sync(Lcom/github/tvbox/osc/sync/FavoritesSync$Callback;)V

    .line 97
    invoke-static {v2}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->sync(Lcom/github/tvbox/osc/sync/SearchHistorySync$Callback;)V

    .line 98
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->periodic()V

    .line 99
    return-void
.end method


# virtual methods
.method public getCurrentActivity()Landroid/app/Activity;
    .locals 1

    .line 213
    invoke-static {}, Lcom/github/tvbox/osc/util/AppManager;->getInstance()Lcom/github/tvbox/osc/util/AppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/AppManager;->currentActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public getDashData()Ljava/lang/String;
    .locals 1

    .line 220
    sget-object v0, Lcom/github/tvbox/osc/base/App;->dashData:Ljava/lang/String;

    return-object v0
.end method

.method public getVodInfo()Lcom/github/tvbox/osc/bean/VodInfo;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/github/tvbox/osc/base/App;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .line 53
    invoke-super {p0}, Landroidx/multidex/MultiDexApplication;->onCreate()V

    .line 54
    sput-object p0, Lcom/github/tvbox/osc/base/App;->instance:Lcom/github/tvbox/osc/base/App;

    .line 55
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/App;->initParams()V

    .line 57
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->init()V

    .line 58
    invoke-static {}, Lcom/github/tvbox/osc/util/EpgUtil;->init()V

    .line 60
    invoke-static {p0}, Lcom/github/tvbox/osc/server/ControlManager;->init(Landroid/content/Context;)V

    .line 62
    invoke-static {}, Lcom/github/tvbox/osc/data/AppDataManager;->init()V

    .line 63
    invoke-static {}, Lcom/kingja/loadsir/core/LoadSir;->beginBuilder()Lcom/kingja/loadsir/core/LoadSir$Builder;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/callback/EmptyCallback;

    invoke-direct {v1}, Lcom/github/tvbox/osc/callback/EmptyCallback;-><init>()V

    .line 64
    invoke-virtual {v0, v1}, Lcom/kingja/loadsir/core/LoadSir$Builder;->addCallback(Lcom/kingja/loadsir/callback/Callback;)Lcom/kingja/loadsir/core/LoadSir$Builder;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/callback/LoadingCallback;

    invoke-direct {v1}, Lcom/github/tvbox/osc/callback/LoadingCallback;-><init>()V

    .line 65
    invoke-virtual {v0, v1}, Lcom/kingja/loadsir/core/LoadSir$Builder;->addCallback(Lcom/kingja/loadsir/callback/Callback;)Lcom/kingja/loadsir/core/LoadSir$Builder;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/kingja/loadsir/core/LoadSir$Builder;->commit()V

    .line 67
    invoke-static {}, Lme/jessyan/autosize/AutoSizeConfig;->getInstance()Lme/jessyan/autosize/AutoSizeConfig;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lme/jessyan/autosize/AutoSizeConfig;->setCustomFragment(Z)Lme/jessyan/autosize/AutoSizeConfig;

    move-result-object v0

    invoke-virtual {v0}, Lme/jessyan/autosize/AutoSizeConfig;->getUnitsManager()Lme/jessyan/autosize/unit/UnitsManager;

    move-result-object v0

    .line 68
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/jessyan/autosize/unit/UnitsManager;->setSupportDP(Z)Lme/jessyan/autosize/unit/UnitsManager;

    move-result-object v0

    .line 69
    invoke-virtual {v0, v1}, Lme/jessyan/autosize/unit/UnitsManager;->setSupportSP(Z)Lme/jessyan/autosize/unit/UnitsManager;

    move-result-object v0

    sget-object v1, Lme/jessyan/autosize/unit/Subunits;->MM:Lme/jessyan/autosize/unit/Subunits;

    .line 70
    invoke-virtual {v0, v1}, Lme/jessyan/autosize/unit/UnitsManager;->setSupportSubunits(Lme/jessyan/autosize/unit/Subunits;)Lme/jessyan/autosize/unit/UnitsManager;

    .line 71
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerHelper;->init()V

    .line 72
    invoke-static {}, Lcom/whl/quickjs/android/QuickJSLoader;->init()V

    .line 73
    invoke-static {}, Lcom/github/tvbox/osc/util/FileUtils;->cleanPlayerCache()V

    .line 74
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->retryPending()V

    .line 75
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->periodic()V

    .line 76
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/App;->startSyncLoop()V

    .line 77
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/App;->registerNetworkRecovery()V

    .line 78
    return-void
.end method

.method public onTerminate()V
    .locals 0

    .line 187
    invoke-super {p0}, Landroidx/multidex/MultiDexApplication;->onTerminate()V

    .line 188
    invoke-static {}, Lcom/github/catvod/crawler/JsLoader;->destroy()V

    .line 189
    return-void
.end method

.method public setDashData(Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 217
    sput-object p1, Lcom/github/tvbox/osc/base/App;->dashData:Ljava/lang/String;

    .line 218
    return-void
.end method

.method public setVodInfo(Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 0
    .param p1, "vodinfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "vodinfo"
        }
    .end annotation

    .line 194
    iput-object p1, p0, Lcom/github/tvbox/osc/base/App;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    .line 195
    return-void
.end method
