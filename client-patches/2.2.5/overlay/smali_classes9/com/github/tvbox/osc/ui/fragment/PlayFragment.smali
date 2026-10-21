.class public Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
.super Lcom/github/tvbox/osc/base/BaseLazyFragment;
.source "PlayFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/ui/fragment/PlayFragment$MyWebView;,
        Lcom/github/tvbox/osc/ui/fragment/PlayFragment$MyXWalkView;,
        Lcom/github/tvbox/osc/ui/fragment/PlayFragment$SysWebClient;,
        Lcom/github/tvbox/osc/ui/fragment/PlayFragment$XWalkWebClient;
    }
.end annotation


# static fields
.field private static final CLOUD_STALL_LAYOUT_RECOVERY_MS:J = 0x4650L

.field private static final CLOUD_STALL_RETRY_MS:J = 0x9470L

.field private static final CLOUD_SWITCH_LINE_PLAY_TIMEOUT_MS:J = 0x61a8L

.field private static final MSG_PARSE_TIMEOUT:I = 0x64

.field private static final MSG_RESOLVE_PLAY_URL_TIMEOUT:I = 0x65

.field private static final MSG_SWITCH_LINE_PLAY_TIMEOUT:I = 0x66

.field private static final RESOLVE_PLAY_URL_TIMEOUT_MS:J = 0x2ee0L

.field private static final SWITCH_LINE_PLAY_TIMEOUT_MS:J = 0x3a98L


# instance fields
.field private allowAutoSwitchLine:Z

.field private allowSwitchPlayer:Z

.field private audioRecoveryChecked:Z

.field private autoRetryCount:I

.field private danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

.field private exitingPreview:Z

.field private hasAutoSwitchedPlayer:Z

.field private inheritProgress:J

.field private inheritProgressKey:Ljava/lang/String;

.field private lastRetryTime:J

.field private lastTraktReportAt:J

.field private final loadFoundCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private loadFoundVideoUrls:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private loadFoundVideoUrlsHeader:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final loadedUrls:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mController:Lcom/github/tvbox/osc/player/controller/VodController;

.field private mDanmuView:Lmaster/flame/danmaku/ui/widget/DanmakuView;

.field private mHandler:Landroid/os/Handler;

.field private mPlayLoadErr:Landroid/widget/ImageView;

.field private mPlayLoadTip:Landroid/widget/TextView;

.field private mPlayLoading:Landroid/widget/ProgressBar;

.field private mSysWebView:Landroid/webkit/WebView;

.field private mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

.field private mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

.field private mVodPlayerCfg:Lorg/json/JSONObject;

.field private mXwalkWebView:Lorg/xwalk/core/XWalkView;

.field private parseFlag:Ljava/lang/String;

.field parseThreadPool:Ljava/util/concurrent/ExecutorService;

.field private playSubtitle:Ljava/lang/String;

.field private playTimeoutBasePosition:J

.field private playbackLayoutRecoveryTried:Z

.field private playbackStartGraceUntil:J

.field private playbackStarted:Z

.field private playbackWatchAdvancedAt:J

.field private playbackWatchPosition:J

.field private final playbackWatchdog:Ljava/lang/Runnable;

.field private progressKey:Ljava/lang/String;

.field private sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

.field private sourceKey:Ljava/lang/String;

.field private sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

.field private subtitleCacheKey:Ljava/lang/String;

.field private final syncProgressReporter:Ljava/lang/Runnable;

.field private traktPlaying:Z

.field private triedLineFlags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final videoDuration:J

.field private webHeaderMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private webPlayUrl:Ljava/lang/String;

.field private webUrl:Ljava/lang/String;

.field private webUserAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;-><init>()V

    .line 150
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$1;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$1;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncProgressReporter:Ljava/lang/Runnable;

    .line 158
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->exitingPreview:Z

    .line 163
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchPosition:J

    .line 164
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchAdvancedAt:J

    .line 165
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackLayoutRecoveryTried:Z

    .line 166
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->audioRecoveryChecked:Z

    .line 167
    new-instance v5, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$2;

    invoke-direct {v5, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$2;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchdog:Ljava/lang/Runnable;

    .line 201
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->videoDuration:J

    .line 1218
    iput v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    .line 1219
    iput-wide v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->lastRetryTime:J

    .line 1221
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    .line 1222
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    .line 1223
    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowAutoSwitchLine:Z

    .line 1224
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    .line 1225
    iput-wide v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStartGraceUntil:J

    .line 1226
    iput-wide v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playTimeoutBasePosition:J

    .line 1227
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    .line 2407
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadedUrls:Ljava/util/Map;

    .line 2408
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrls:Ljava/util/LinkedList;

    .line 2409
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrlsHeader:Ljava/util/HashMap;

    .line 2410
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    return v0
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopPlaybackWatchdog()V

    return-void
.end method

.method static synthetic access$1100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncSavedProgress()V

    return-void
.end method

.method static synthetic access$1200(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->reportPlaybackIntegration(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$1302(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Z

    .line 134
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->traktPlaying:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->startDanmuIfReady()V

    return-void
.end method

.method static synthetic access$1500(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lmaster/flame/danmaku/ui/widget/DanmakuView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mDanmuView:Lmaster/flame/danmaku/ui/widget/DanmakuView;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/bean/VodInfo;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->showManualDanmakuLinkDialog()V

    return-void
.end method

.method static synthetic access$1900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Z

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncCurrentProgress(Z)V

    return-void
.end method

.method static synthetic access$2000(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->showSendDanmakuDialog()V

    return-void
.end method

.method static synthetic access$2100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Z

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playNext(Z)V

    return-void
.end method

.method static synthetic access$2300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playPrevious()V

    return-void
.end method

.method static synthetic access$2402(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # I

    .line 134
    iput p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    return p1
.end method

.method static synthetic access$2502(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Z

    .line 134
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    return p1
.end method

.method static synthetic access$2600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lcom/github/tvbox/osc/bean/ParseBean;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/ParseBean;

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->doParse(Lcom/github/tvbox/osc/bean/ParseBean;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webHeaderMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$2902(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/util/HashMap;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webHeaderMap:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initSubtitleView()V

    return-void
.end method

.method static synthetic access$3100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->scheduleAudioTrackRecovery()V

    return-void
.end method

.method static synthetic access$3202(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Z

    .line 134
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    return p1
.end method

.method static synthetic access$3300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/controller/VodController;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lcom/github/tvbox/osc/player/TrackInfoBean;Lcom/github/tvbox/osc/player/TrackInfoBean;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Lcom/github/tvbox/osc/player/TrackInfoBean;
    .param p2, "x2"    # Lcom/github/tvbox/osc/player/TrackInfoBean;

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isSameTrack(Lcom/github/tvbox/osc/player/TrackInfoBean;Lcom/github/tvbox/osc/player/TrackInfoBean;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3500(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoadTip:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoading:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoadErr:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playSubtitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3902(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playSubtitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isCloudPlayback()Z

    move-result v0

    return v0
.end method

.method static synthetic access$4002(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;J)J
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # J

    .line 134
    iput-wide p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playTimeoutBasePosition:J

    return-wide p1
.end method

.method static synthetic access$4102(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->subtitleCacheKey:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4200(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$4300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4302(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUserAgent:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4400(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4500(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/util/HashMap;
    .param p2, "x2"    # Ljava/lang/String;

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaderValue(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .line 134
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initParse(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->checkDanmu(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->searchDanmu(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)J
    .locals 2
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchPosition:J

    return-wide v0
.end method

.method static synthetic access$5000(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$502(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;J)J
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # J

    .line 134
    iput-wide p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchPosition:J

    return-wide p1
.end method

.method static synthetic access$5100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseFlag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lorg/json/JSONObject;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Z

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->rsJsonJX(Lorg/json/JSONObject;Z)V

    return-void
.end method

.method static synthetic access$5500(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lorg/xwalk/core/XWalkView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mXwalkWebView:Lorg/xwalk/core/XWalkView;

    return-object v0
.end method

.method static synthetic access$5802(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lorg/xwalk/core/XWalkView;)Lorg/xwalk/core/XWalkView;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Lorg/xwalk/core/XWalkView;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mXwalkWebView:Lorg/xwalk/core/XWalkView;

    return-object p1
.end method

.method static synthetic access$5900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mSysWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$5902(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/webkit/WebView;)Landroid/webkit/WebView;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Landroid/webkit/WebView;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mSysWebView:Landroid/webkit/WebView;

    return-object p1
.end method

.method static synthetic access$600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)J
    .locals 2
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchAdvancedAt:J

    return-wide v0
.end method

.method static synthetic access$6000(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$602(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;J)J
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # J

    .line 134
    iput-wide p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchAdvancedAt:J

    return-wide p1
.end method

.method static synthetic access$6100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$6300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$6500(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/bean/SourceBean;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    return-object v0
.end method

.method static synthetic access$6600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadedUrls:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$6700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/util/LinkedList;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrls:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$6800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrlsHeader:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$6900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$700(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackLayoutRecoveryTried:Z

    return v0
.end method

.method static synthetic access$702(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Z

    .line 134
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackLayoutRecoveryTried:Z

    return p1
.end method

.method static synthetic access$800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$802(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 134
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopProgressReporter()V

    return-void
.end method

.method private appendHeaders(Ljava/util/HashMap;Ljava/lang/Object;)V
    .locals 4
    .param p2, "rawHeaders"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "headers",
            "rawHeaders"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1669
    .local p1, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_6

    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p2, v0, :cond_0

    goto :goto_3

    .line 1671
    :cond_0
    const/4 v0, 0x0

    .line 1672
    .local v0, "json":Lorg/json/JSONObject;
    :try_start_0
    instance-of v1, p2, Lorg/json/JSONObject;

    if-eqz v1, :cond_1

    .line 1673
    move-object v1, p2

    check-cast v1, Lorg/json/JSONObject;

    move-object v0, v1

    goto :goto_0

    .line 1674
    :cond_1
    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 1675
    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1676
    .local v1, "text":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1677
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object v0, v2

    .line 1680
    .end local v1    # "text":Ljava/lang/String;
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    return-void

    .line 1681
    :cond_3
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 1682
    .local v1, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1683
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1684
    .local v2, "key":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 1685
    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1687
    .end local v2    # "key":Ljava/lang/String;
    :cond_4
    goto :goto_1

    .line 1689
    .end local v0    # "json":Lorg/json/JSONObject;
    .end local v1    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_5
    goto :goto_2

    .line 1688
    :catchall_0
    move-exception v0

    .line 1690
    :goto_2
    return-void

    .line 1669
    :cond_6
    :goto_3
    return-void
.end method

.method private attachProxySiteKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 811
    const-string v0, "&"

    const-string v1, "?"

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_2

    .line 812
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/github/tvbox/osc/server/ControlManager;->getAddress(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "proxy?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    return-object p1

    .line 813
    :cond_1
    const-string v2, "siteKey="

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    return-object p1

    .line 815
    :cond_2
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v4, v0

    goto :goto_0

    :cond_3
    move-object v4, v1

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 816
    :catchall_0
    move-exception v3

    .line 817
    .local v3, "th":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_1

    :cond_4
    move-object v0, v1

    :goto_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 811
    .end local v3    # "th":Ljava/lang/Throwable;
    :cond_5
    :goto_2
    return-object p1
.end method

.method private checkAudioTrack(Z)V
    .locals 8
    .param p1, "finalCheck"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "finalCheck"
        }
    .end annotation

    .line 1832
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->audioRecoveryChecked:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_d

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    if-nez v1, :cond_0

    goto/16 :goto_8

    .line 1833
    :cond_0
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v0

    .line 1835
    .local v0, "player":Lxyz/doikki/videoplayer/player/AbstractPlayer;
    instance-of v1, v0, Lcom/github/tvbox/osc/player/ExoPlayer;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 1836
    move-object v1, v0

    check-cast v1, Lcom/github/tvbox/osc/player/ExoPlayer;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/ExoPlayer;->getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;

    move-result-object v1

    .local v1, "info":Lcom/github/tvbox/osc/player/TrackInfo;
    goto :goto_0

    .line 1837
    .end local v1    # "info":Lcom/github/tvbox/osc/player/TrackInfo;
    :cond_1
    instance-of v1, v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    if-eqz v1, :cond_c

    .line 1838
    move-object v1, v0

    check-cast v1, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;

    move-result-object v1

    .line 1843
    .restart local v1    # "info":Lcom/github/tvbox/osc/player/TrackInfo;
    :goto_0
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_9

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_6

    .line 1855
    :cond_2
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->audioRecoveryChecked:Z

    .line 1856
    const/4 v2, 0x0

    .line 1857
    .local v2, "selected":Lcom/github/tvbox/osc/player/TrackInfoBean;
    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/player/TrackInfoBean;

    .line 1858
    .local v4, "track":Lcom/github/tvbox/osc/player/TrackInfoBean;
    iget-boolean v5, v4, Lcom/github/tvbox/osc/player/TrackInfoBean;->selected:Z

    if-eqz v5, :cond_3

    .line 1859
    move-object v2, v4

    .line 1860
    goto :goto_2

    .line 1862
    .end local v4    # "track":Lcom/github/tvbox/osc/player/TrackInfoBean;
    :cond_3
    goto :goto_1

    .line 1863
    :cond_4
    :goto_2
    if-eqz v2, :cond_5

    return-void

    .line 1864
    :cond_5
    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/player/TrackInfoBean;

    .line 1865
    .local v3, "first":Lcom/github/tvbox/osc/player/TrackInfoBean;
    const-string v4, "echo-audio track exists but none selected, restore first track"

    invoke-static {v4}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1866
    instance-of v4, v0, Lcom/github/tvbox/osc/player/ExoPlayer;

    const-string v5, ""

    if-eqz v4, :cond_7

    .line 1867
    move-object v4, v0

    check-cast v4, Lcom/github/tvbox/osc/player/ExoPlayer;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    if-nez v6, :cond_6

    goto :goto_3

    :cond_6
    move-object v5, v6

    :goto_3
    invoke-virtual {v4, v3, v5}, Lcom/github/tvbox/osc/player/ExoPlayer;->setTrack(Lcom/github/tvbox/osc/player/TrackInfoBean;Ljava/lang/String;)V

    goto :goto_5

    .line 1869
    :cond_7
    move-object v4, v0

    check-cast v4, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    iget v6, v3, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    if-nez v7, :cond_8

    goto :goto_4

    :cond_8
    move-object v5, v7

    :goto_4
    invoke-virtual {v4, v6, v5}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setTrack(ILjava/lang/String;)V

    .line 1871
    :goto_5
    return-void

    .line 1844
    .end local v2    # "selected":Lcom/github/tvbox/osc/player/TrackInfoBean;
    .end local v3    # "first":Lcom/github/tvbox/osc/player/TrackInfoBean;
    :cond_9
    :goto_6
    if-nez p1, :cond_a

    .line 1845
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    new-instance v3, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda16;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda16;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    const-wide/16 v4, 0xdac

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_7

    .line 1847
    :cond_a
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->audioRecoveryChecked:Z

    .line 1848
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isCloudPlayback()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1849
    const-string v2, "echo-cloud stream has no usable audio track, try another player"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1850
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetry()Z

    .line 1853
    :cond_b
    :goto_7
    return-void

    .line 1840
    .end local v1    # "info":Lcom/github/tvbox/osc/player/TrackInfo;
    :cond_c
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->audioRecoveryChecked:Z

    .line 1841
    return-void

    .line 1832
    .end local v0    # "player":Lxyz/doikki/videoplayer/player/AbstractPlayer;
    :cond_d
    :goto_8
    return-void
.end method

.method private checkDanmu(Ljava/lang/String;)V
    .locals 4
    .param p1, "danmu"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "danmu"
        }
    .end annotation

    .line 238
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    if-eqz v0, :cond_2

    .line 239
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {p0, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v0

    .line 240
    .local v0, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :goto_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v2, :cond_1

    const-string v2, ""

    goto :goto_1

    :cond_1
    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    :goto_1
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;->check(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .end local v0    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_2
    return-void
.end method

.method private configWebViewSys(Landroid/webkit/WebView;)V
    .locals 7
    .param p1, "webView"    # Landroid/webkit/WebView;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "webView"
        }
    .end annotation

    .line 2575
    if-nez p1, :cond_0

    .line 2576
    return-void

    .line 2578
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "debug_open"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 2579
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/16 v4, 0x320

    const/16 v5, 0x190

    invoke-direct {v1, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    goto :goto_0

    .line 2580
    :cond_1
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    :goto_0
    nop

    .line 2581
    .local v1, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setFocusable(Z)V

    .line 2582
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setFocusableInTouchMode(Z)V

    .line 2583
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearFocus()V

    .line 2584
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setOverScrollMode(I)V

    .line 2585
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v4

    if-nez v4, :cond_2

    return-void

    .line 2586
    :cond_2
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4, p1, v1}, Landroidx/fragment/app/FragmentActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2588
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v4

    .line 2589
    .local v4, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setNeedInitialFocus(Z)V

    .line 2590
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    .line 2591
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 2592
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 2593
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 2594
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 2595
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 2596
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 2598
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-lt v5, v6, :cond_3

    .line 2599
    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 2601
    :cond_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2602
    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    goto :goto_1

    .line 2604
    :cond_4
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    .line 2606
    :goto_1
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 2607
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 2608
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 2609
    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 2610
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 2611
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 2612
    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 2613
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_5

    .line 2614
    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 2617
    :cond_5
    const/4 v0, -0x1

    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 2620
    const-string v0, "utf-8"

    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setDefaultTextEncodingName(Ljava/lang/String;)V

    .line 2621
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 2624
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$30;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$30;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 2645
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$SysWebClient;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$SysWebClient;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lcom/github/tvbox/osc/ui/fragment/PlayFragment$1;)V

    .line 2646
    .local v0, "mSysWebClient":Lcom/github/tvbox/osc/ui/fragment/PlayFragment$SysWebClient;
    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 2647
    const/high16 v2, -0x1000000

    invoke-virtual {p1, v2}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 2648
    return-void
.end method

.method private configWebViewX5(Lorg/xwalk/core/XWalkView;)V
    .locals 6
    .param p1, "webView"    # Lorg/xwalk/core/XWalkView;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "webView"
        }
    .end annotation

    .line 2761
    if-nez p1, :cond_0

    .line 2762
    return-void

    .line 2764
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "debug_open"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 2765
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/16 v4, 0x320

    const/16 v5, 0x190

    invoke-direct {v1, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    goto :goto_0

    .line 2766
    :cond_1
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    :goto_0
    nop

    .line 2767
    .local v1, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1, v0}, Lorg/xwalk/core/XWalkView;->setFocusable(Z)V

    .line 2768
    invoke-virtual {p1, v0}, Lorg/xwalk/core/XWalkView;->setFocusableInTouchMode(Z)V

    .line 2769
    invoke-virtual {p1}, Lorg/xwalk/core/XWalkView;->clearFocus()V

    .line 2770
    invoke-virtual {p1, v0}, Lorg/xwalk/core/XWalkView;->setOverScrollMode(I)V

    .line 2771
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v4

    if-nez v4, :cond_2

    return-void

    .line 2772
    :cond_2
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4, p1, v1}, Landroidx/fragment/app/FragmentActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2774
    invoke-virtual {p1}, Lorg/xwalk/core/XWalkView;->getSettings()Lorg/xwalk/core/XWalkSettings;

    move-result-object v4

    .line 2775
    .local v4, "settings":Lorg/xwalk/core/XWalkSettings;
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setAllowContentAccess(Z)V

    .line 2776
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setAllowFileAccess(Z)V

    .line 2777
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 2778
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 2779
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setDatabaseEnabled(Z)V

    .line 2780
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setDomStorageEnabled(Z)V

    .line 2781
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setJavaScriptEnabled(Z)V

    .line 2783
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2784
    invoke-virtual {v4, v0}, Lorg/xwalk/core/XWalkSettings;->setBlockNetworkImage(Z)V

    goto :goto_1

    .line 2786
    :cond_3
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setBlockNetworkImage(Z)V

    .line 2789
    :goto_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-lt v2, v5, :cond_4

    .line 2790
    invoke-virtual {v4, v0}, Lorg/xwalk/core/XWalkSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 2792
    :cond_4
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setUseWideViewPort(Z)V

    .line 2793
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setDomStorageEnabled(Z)V

    .line 2794
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 2795
    invoke-virtual {v4, v0}, Lorg/xwalk/core/XWalkSettings;->setSupportMultipleWindows(Z)V

    .line 2796
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setLoadWithOverviewMode(Z)V

    .line 2797
    invoke-virtual {v4, v3}, Lorg/xwalk/core/XWalkSettings;->setBuiltInZoomControls(Z)V

    .line 2798
    invoke-virtual {v4, v0}, Lorg/xwalk/core/XWalkSettings;->setSupportZoom(Z)V

    .line 2800
    const/4 v0, -0x1

    invoke-virtual {v4, v0}, Lorg/xwalk/core/XWalkSettings;->setCacheMode(I)V

    .line 2803
    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Lorg/xwalk/core/XWalkView;->setBackgroundColor(I)V

    .line 2804
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$31;

    invoke-direct {v0, p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$31;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lorg/xwalk/core/XWalkView;)V

    invoke-virtual {p1, v0}, Lorg/xwalk/core/XWalkView;->setUIClient(Lorg/xwalk/core/XWalkUIClient;)V

    .line 2825
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$XWalkWebClient;

    invoke-direct {v0, p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$XWalkWebClient;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lorg/xwalk/core/XWalkView;)V

    .line 2826
    .local v0, "mX5WebClient":Lcom/github/tvbox/osc/ui/fragment/PlayFragment$XWalkWebClient;
    invoke-virtual {p1, v0}, Lorg/xwalk/core/XWalkView;->setResourceClient(Lorg/xwalk/core/XWalkResourceClient;)V

    .line 2827
    return-void
.end method

.method private displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;
    .locals 1
    .param p1, "series"    # Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "series"
        }
    .end annotation

    .line 1379
    if-nez p1, :cond_0

    const-string v0, ""

    return-object v0

    .line 1380
    :cond_0
    iget-object v0, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->displayName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->displayName:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method private doParse(Lcom/github/tvbox/osc/bean/ParseBean;)V
    .locals 6
    .param p1, "pb"    # Lcom/github/tvbox/osc/bean/ParseBean;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pb"
        }
    .end annotation

    .line 2162
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 2163
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initParseLoadFound()V

    .line 2164
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    .line 2165
    invoke-direct {p0, p1, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseMix(Lcom/github/tvbox/osc/bean/ParseBean;Z)V

    goto/16 :goto_7

    .line 2167
    :cond_0
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_5

    .line 2168
    const-string v0, "\u6b63\u5728\u55c5\u63a2\u64ad\u653e\u5730\u5740"

    invoke-virtual {p0, v0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2169
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 2170
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x4e20

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 2171
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getExt()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 2174
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2175
    .local v0, "reqHeaders":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getExt()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 2176
    .local v1, "jsonObject":Lorg/json/JSONObject;
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v2

    .line 2177
    .local v2, "headerMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_3

    .line 2178
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 2179
    .local v4, "key":Ljava/lang/String;
    const-string v5, "user-agent"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2180
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUserAgent:Ljava/lang/String;

    goto :goto_1

    .line 2182
    :cond_1
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2184
    .end local v4    # "key":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .line 2185
    :cond_2
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v3

    if-lez v3, :cond_3

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webHeaderMap:Ljava/util/HashMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2189
    .end local v0    # "reqHeaders":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "headerMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    goto :goto_2

    .line 2187
    :catchall_0
    move-exception v0

    .line 2188
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2191
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_4
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadWebView(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 2193
    :cond_5
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v0

    const-string v3, "\u6b63\u5728\u89e3\u6790\u64ad\u653e\u5730\u5740"

    if-ne v0, v1, :cond_7

    .line 2194
    invoke-virtual {p0, v3, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2196
    new-instance v0, Lcom/lzy/okgo/model/HttpHeaders;

    invoke-direct {v0}, Lcom/lzy/okgo/model/HttpHeaders;-><init>()V

    .line 2198
    .local v0, "reqHeaders":Lcom/lzy/okgo/model/HttpHeaders;
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getExt()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 2199
    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v2

    .line 2200
    .restart local v2    # "headerMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_6

    .line 2201
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 2202
    .restart local v4    # "key":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lcom/lzy/okgo/model/HttpHeaders;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2203
    .end local v4    # "key":Ljava/lang/String;
    goto :goto_3

    .line 2207
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "headerMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6
    goto :goto_4

    .line 2205
    :catchall_1
    move-exception v1

    .line 2206
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2208
    .end local v1    # "e":Ljava/lang/Throwable;
    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/github/tvbox/osc/player/controller/VodController;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lzy/okgo/OkGo;->get(Ljava/lang/String;)Lcom/lzy/okgo/request/GetRequest;

    move-result-object v1

    .line 2209
    const-string v2, "json_jx"

    invoke-virtual {v1, v2}, Lcom/lzy/okgo/request/GetRequest;->tag(Ljava/lang/Object;)Lcom/lzy/okgo/request/base/Request;

    move-result-object v1

    check-cast v1, Lcom/lzy/okgo/request/GetRequest;

    .line 2210
    invoke-virtual {v1, v0}, Lcom/lzy/okgo/request/GetRequest;->headers(Lcom/lzy/okgo/model/HttpHeaders;)Lcom/lzy/okgo/request/base/Request;

    move-result-object v1

    check-cast v1, Lcom/lzy/okgo/request/GetRequest;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$23;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$23;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    .line 2211
    invoke-virtual {v1, v2}, Lcom/lzy/okgo/request/GetRequest;->execute(Lcom/lzy/okgo/callback/Callback;)V

    .line 2251
    .end local v0    # "reqHeaders":Lcom/lzy/okgo/model/HttpHeaders;
    goto :goto_7

    :cond_7
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v0

    const/4 v4, 0x2

    if-ne v0, v4, :cond_a

    .line 2252
    invoke-virtual {p0, v3, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2253
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 2254
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 2255
    .local v0, "jxs":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getParseBeanList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/ParseBean;

    .line 2256
    .local v3, "p":Lcom/github/tvbox/osc/bean/ParseBean;
    invoke-virtual {v3}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v4

    if-ne v4, v1, :cond_8

    .line 2257
    invoke-virtual {v3}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/github/tvbox/osc/bean/ParseBean;->mixUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2259
    .end local v3    # "p":Lcom/github/tvbox/osc/bean/ParseBean;
    :cond_8
    goto :goto_5

    .line 2260
    :cond_9
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$24;

    invoke-direct {v2, p0, p1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$24;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lcom/github/tvbox/osc/bean/ParseBean;Ljava/util/LinkedHashMap;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .end local v0    # "jxs":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_6

    .line 2288
    :cond_a
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_b

    .line 2289
    invoke-direct {p0, p1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseMix(Lcom/github/tvbox/osc/bean/ParseBean;Z)V

    goto :goto_7

    .line 2288
    :cond_b
    :goto_6
    nop

    .line 2291
    :goto_7
    return-void
.end method

.method private embyItemId()Ljava/lang/String;
    .locals 4

    .line 2016
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 2017
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    if-nez v2, :cond_1

    move-object v2, v1

    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2018
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_3
    :goto_0
    move-object v2, v1

    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 2019
    .local v0, "source":Ljava/lang/String;
    const-string v2, "emby"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "\u5c0f\u96c5"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    return-object v1

    .line 2020
    :cond_4
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {p0, v2, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v2

    .line 2021
    .local v2, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v2, :cond_5

    iget-object v3, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v1, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    return-object v1

    .line 2022
    :cond_5
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    if-nez v3, :cond_6

    goto :goto_2

    :cond_6
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    :goto_2
    return-object v1
.end method

.method private extractEpisodeNumber(Ljava/lang/String;)I
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 1422
    const/4 v0, -0x1

    if-nez p1, :cond_0

    .line 1423
    return v0

    .line 1425
    :cond_0
    const-string v1, "(?i)(?:S|season)\\s*0*(\\d+)\\s*(?:E|EP)\\s*0*(\\d+)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 1426
    .local v1, "seasonEpisode":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1427
    const/4 v2, 0x2

    :try_start_0
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v2

    .line 1429
    :cond_1
    const-string v2, "(?i)(?:E|EP)\\s*0*(\\d+)"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 1430
    .local v2, "ep":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    .line 1431
    :try_start_1
    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    return v0

    :catch_1
    move-exception v3

    .line 1433
    :cond_2
    const-string v3, "(?:\u7b2c)?(\\d+)(?:\u96c6|\u8bdd|\u671f|$)"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 1434
    .local v3, "episodeMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1436
    :try_start_2
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    return v0

    .line 1437
    :catch_2
    move-exception v4

    .line 1440
    :cond_3
    const-string v4, "\\d+"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 1441
    .local v4, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1443
    :try_start_3
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    return v0

    .line 1444
    :catch_3
    move-exception v5

    .line 1447
    :cond_4
    return v0
.end method

.method private extractSeasonNumber(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 1451
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1452
    :cond_0
    const-string v1, "(?i)(?:S|season|\u7b2c)\\s*0*(\\d+)(?:\u5b63|\\s*(?:E|EP))"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 1453
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_1

    return v0

    .line 1454
    :cond_1
    const/4 v2, 0x1

    :try_start_0
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v2

    .local v2, "ignored":Ljava/lang/NumberFormatException;
    return v0
.end method

.method private findLineFlagIndex(Ljava/util/List;Ljava/lang/String;)I
    .locals 3
    .param p2, "currentFlag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lineFlags",
            "currentFlag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 1355
    .local p1, "lineFlags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, -0x1

    if-eqz p1, :cond_3

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 1358
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1359
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1360
    return v1

    .line 1358
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1363
    .end local v1    # "i":I
    :cond_2
    return v0

    .line 1356
    :cond_3
    :goto_1
    return v0
.end method

.method private findSameEpisodeIndex(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I
    .locals 6
    .param p1, "currentSeries"    # Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .param p3, "fallbackIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "currentSeries",
            "targetList",
            "fallbackIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;",
            ">;I)I"
        }
    .end annotation

    .line 1384
    .local p2, "targetList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    const/4 v0, 0x0

    if-eqz p2, :cond_5

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 1387
    :cond_0
    if-eqz p1, :cond_4

    iget-object v1, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 1388
    iget-object v1, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->normalizeEpisodeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1389
    .local v1, "currentName":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 1390
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 1391
    .local v3, "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->normalizeEpisodeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1392
    return v2

    .line 1389
    .end local v3    # "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1395
    .end local v2    # "i":I
    :cond_2
    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->extractEpisodeNumber(Ljava/lang/String;)I

    move-result v2

    .line 1396
    .local v2, "currentEpisode":I
    if-ltz v2, :cond_4

    .line 1397
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 1398
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 1399
    .local v4, "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v4, :cond_3

    iget-object v5, v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->extractEpisodeNumber(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v2, :cond_3

    .line 1400
    return v3

    .line 1397
    .end local v4    # "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1405
    .end local v1    # "currentName":Ljava/lang/String;
    .end local v2    # "currentEpisode":I
    .end local v3    # "i":I
    :cond_4
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0

    .line 1385
    :cond_5
    :goto_2
    return v0
.end method

.method private static formatClock(J)Ljava/lang/String;
    .locals 14
    .param p0, "ms"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ms"
        }
    .end annotation

    .line 1957
    const-wide/16 v0, 0x3e8

    div-long v0, p0, v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 1958
    .local v0, "total":J
    const-wide/16 v4, 0xe10

    div-long v6, v0, v4

    .line 1959
    .local v6, "hours":J
    rem-long v4, v0, v4

    const-wide/16 v8, 0x3c

    div-long/2addr v4, v8

    .line 1960
    .local v4, "minutes":J
    rem-long v8, v0, v8

    .line 1961
    .local v8, "seconds":J
    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x2

    cmp-long v13, v6, v2

    if-lez v13, :cond_0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v3, v11

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v3, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v3, v12

    const-string v10, "%d:%02d:%02d"

    invoke-static {v2, v10, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1962
    :cond_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v3, v12, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v3, v11

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v3, v10

    const-string v10, "%02d:%02d"

    invoke-static {v2, v10, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1961
    :goto_0
    return-object v2
.end method

.method private getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .locals 3
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "flag",
            "index"
        }
    .end annotation

    .line 1367
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_3

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_0

    goto :goto_1

    .line 1370
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1371
    .local v1, "currentList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 1374
    :cond_1
    const/4 v0, 0x0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1375
    .local v0, "safeIndex":I
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    return-object v2

    .line 1372
    .end local v0    # "safeIndex":I
    :cond_2
    :goto_0
    return-object v0

    .line 1368
    .end local v1    # "currentList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_3
    :goto_1
    return-object v0
.end method

.method private getHeaderValue(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "headers",
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1700
    .local p1, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    goto :goto_1

    .line 1701
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

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

    .line 1702
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1703
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 1705
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 1706
    :cond_2
    return-object v0

    .line 1700
    :cond_3
    :goto_1
    return-object v0
.end method

.method private getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 3
    .param p1, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1661
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1662
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1663
    .local v1, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "header"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->appendHeaders(Ljava/util/HashMap;Ljava/lang/Object;)V

    .line 1664
    const-string v2, "headers"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->appendHeaders(Ljava/util/HashMap;Ljava/lang/Object;)V

    .line 1665
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method private getLineFlagsInDisplayOrder()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1335
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1336
    .local v0, "lineFlags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_5

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_0

    goto :goto_2

    .line 1339
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    .line 1340
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;

    .line 1341
    .local v2, "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    if-eqz v2, :cond_1

    iget-object v3, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v4, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1342
    iget-object v3, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1344
    .end local v2    # "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    :cond_1
    goto :goto_0

    .line 1346
    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1347
    .local v2, "flag":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1348
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1350
    .end local v2    # "flag":Ljava/lang/String;
    :cond_3
    goto :goto_1

    .line 1351
    :cond_4
    return-object v0

    .line 1337
    :cond_5
    :goto_2
    return-object v0
.end method

.method private getResolvePlayUrlTimeoutMs()J
    .locals 7

    .line 1715
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    const-wide/16 v1, 0x2ee0

    if-nez v0, :cond_0

    return-wide v1

    .line 1716
    :cond_0
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getPlayTimeoutSeconds()I

    move-result v0

    int-to-long v3, v0

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    const-wide/16 v5, 0x3e8

    mul-long v3, v3, v5

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private inheritProgressIfNeeded()V
    .locals 7

    .line 1566
    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 1567
    :cond_0
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 1574
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    .line 1575
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    .line 1567
    return-void

    .line 1568
    :cond_1
    :try_start_1
    iget-wide v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long v5, v3, v1

    if-gtz v5, :cond_2

    .line 1574
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    .line 1575
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    .line 1568
    return-void

    .line 1569
    :cond_2
    :try_start_2
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v3}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 1570
    .local v3, "targetCache":Ljava/lang/Object;
    if-nez v3, :cond_3

    .line 1571
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    iget-wide v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->save(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1574
    .end local v3    # "targetCache":Ljava/lang/Object;
    :cond_3
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    .line 1575
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    .line 1576
    nop

    .line 1577
    return-void

    .line 1574
    :cond_4
    :goto_0
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    .line 1575
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    .line 1566
    return-void

    .line 1574
    :catchall_0
    move-exception v3

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    .line 1575
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    .line 1576
    throw v3
.end method

.method private initDanmuView()V
    .locals 4

    .line 229
    const v0, 0x7f0a0092

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lmaster/flame/danmaku/ui/widget/DanmakuView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mDanmuView:Lmaster/flame/danmaku/ui/widget/DanmakuView;

    .line 230
    new-instance v0, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mDanmuView:Lmaster/flame/danmaku/ui/widget/DanmakuView;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;-><init>(Lcom/github/tvbox/osc/player/MyVideoView;Lcom/github/tvbox/osc/player/controller/VodController;Lmaster/flame/danmaku/ui/widget/DanmakuView;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    .line 231
    return-void
.end method

.method private initData()V
    .locals 0

    .line 1033
    return-void
.end method

.method private initParse(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "useParse"    # Z
    .param p3, "playUrl"    # Ljava/lang/String;
    .param p4, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x10
        }
        names = {
            "flag",
            "useParse",
            "playUrl",
            "url"
        }
    .end annotation

    .line 1591
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseFlag:Ljava/lang/String;

    .line 1592
    iput-object p4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUrl:Ljava/lang/String;

    .line 1593
    const/4 v0, 0x0

    .line 1594
    .local v0, "parseBean":Lcom/github/tvbox/osc/bean/ParseBean;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v1, p2}, Lcom/github/tvbox/osc/player/controller/VodController;->showParse(Z)V

    .line 1595
    if-eqz p2, :cond_0

    .line 1596
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getDefaultParse()Lcom/github/tvbox/osc/bean/ParseBean;

    move-result-object v0

    goto :goto_2

    .line 1598
    :cond_0
    const-string v1, "json:"

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1599
    new-instance v1, Lcom/github/tvbox/osc/bean/ParseBean;

    invoke-direct {v1}, Lcom/github/tvbox/osc/bean/ParseBean;-><init>()V

    move-object v0, v1

    .line 1600
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setType(I)V

    .line 1601
    const/4 v1, 0x5

    invoke-virtual {p3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setUrl(Ljava/lang/String;)V

    goto :goto_1

    .line 1602
    :cond_1
    const-string v1, "parse:"

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1603
    const/4 v1, 0x6

    invoke-virtual {p3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1604
    .local v1, "parseRedirect":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getParseBeanList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/ParseBean;

    .line 1605
    .local v3, "pb":Lcom/github/tvbox/osc/bean/ParseBean;
    invoke-virtual {v3}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1606
    move-object v0, v3

    .line 1607
    goto :goto_1

    .line 1609
    .end local v3    # "pb":Lcom/github/tvbox/osc/bean/ParseBean;
    :cond_2
    goto :goto_0

    .line 1611
    .end local v1    # "parseRedirect":Ljava/lang/String;
    :cond_3
    :goto_1
    if-nez v0, :cond_4

    .line 1612
    new-instance v1, Lcom/github/tvbox/osc/bean/ParseBean;

    invoke-direct {v1}, Lcom/github/tvbox/osc/bean/ParseBean;-><init>()V

    move-object v0, v1

    .line 1613
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setType(I)V

    .line 1614
    invoke-virtual {v0, p3}, Lcom/github/tvbox/osc/bean/ParseBean;->setUrl(Ljava/lang/String;)V

    .line 1617
    :cond_4
    :goto_2
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->doParse(Lcom/github/tvbox/osc/bean/ParseBean;)V

    .line 1618
    return-void
.end method

.method private initSubtitleView()V
    .locals 10

    .line 822
    const/4 v0, 0x0

    .line 823
    .local v0, "trackInfo":Lcom/github/tvbox/osc/player/TrackInfo;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v1

    .line 824
    .local v1, "mediaPlayer":Lxyz/doikki/videoplayer/player/AbstractPlayer;
    instance-of v2, v1, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 825
    move-object v2, v1

    check-cast v2, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;

    move-result-object v0

    .line 826
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitle()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 827
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v2, v2, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iput-boolean v3, v2, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->hasInternal:Z

    .line 830
    :cond_0
    move-object v2, v1

    check-cast v2, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-virtual {v2, v0, v4}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->loadDefaultTrack(Lcom/github/tvbox/osc/player/TrackInfo;Ljava/lang/String;)V

    .line 831
    move-object v2, v1

    check-cast v2, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    new-instance v4, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$18;

    invoke-direct {v4, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$18;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v2, v4}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setOnTimedTextListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V

    .line 843
    :cond_1
    instance-of v2, v1, Lcom/github/tvbox/osc/player/ExoPlayer;

    if-eqz v2, :cond_2

    .line 845
    move-object v2, v1

    check-cast v2, Lcom/github/tvbox/osc/player/ExoPlayer;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/github/tvbox/osc/player/ExoPlayer;->loadDefaultTrack(Ljava/lang/String;)V

    .line 847
    :cond_2
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v2, v2, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v4}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->bindToMediaPlayer(Lxyz/doikki/videoplayer/player/AbstractPlayer;)V

    .line 848
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v2, v2, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->subtitleCacheKey:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setPlaySubtitleCacheKey(Ljava/lang/String;)V

    .line 849
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->subtitleCacheKey:Ljava/lang/String;

    invoke-static {v2}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/cache/CacheManager;->getCache(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 850
    .local v2, "subtitlePathCache":Ljava/lang/String;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 851
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v3, v3, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    invoke-virtual {v3, v2}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setSubtitlePath(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 853
    :cond_3
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playSubtitle:Ljava/lang/String;

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4

    .line 854
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v3, v3, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playSubtitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setSubtitlePath(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 856
    :cond_4
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v4, v4, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iget-boolean v4, v4, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->hasInternal:Z

    if-eqz v4, :cond_8

    .line 857
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v4, v4, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iput-boolean v3, v4, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->isInternal:Z

    .line 858
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitle()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_8

    .line 859
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitle()Ljava/util/List;

    move-result-object v4

    .line 860
    .local v4, "subtitleTrackList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/player/TrackInfoBean;>;"
    invoke-virtual {v0, v3}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitleSelected(Z)I

    move-result v3

    .line 861
    .local v3, "selectedIndex":I
    const/4 v5, 0x0

    .line 862
    .local v5, "hasCh":Z
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/tvbox/osc/player/TrackInfoBean;

    .line 863
    .local v7, "subtitleTrackInfoBean":Lcom/github/tvbox/osc/player/TrackInfoBean;
    iget-object v8, v7, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    .line 864
    .local v8, "lowerLang":Ljava/lang/String;
    const-string v9, "zh"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "ch"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 865
    :cond_5
    const/4 v5, 0x1

    .line 866
    iget v9, v7, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    if-eq v3, v9, :cond_6

    .line 867
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v6}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v6

    check-cast v6, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    iget v9, v7, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    invoke-virtual {v6, v9}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setTrack(I)V

    .line 868
    goto :goto_1

    .line 871
    .end local v7    # "subtitleTrackInfoBean":Lcom/github/tvbox/osc/player/TrackInfoBean;
    .end local v8    # "lowerLang":Ljava/lang/String;
    :cond_6
    goto :goto_0

    .line 872
    :cond_7
    :goto_1
    if-nez v5, :cond_8

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v6}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v6

    check-cast v6, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    const/4 v7, 0x0

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/tvbox/osc/player/TrackInfoBean;

    iget v7, v7, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    invoke-virtual {v6, v7}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setTrack(I)V

    .line 877
    .end local v3    # "selectedIndex":I
    .end local v4    # "subtitleTrackList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/player/TrackInfoBean;>;"
    .end local v5    # "hasCh":Z
    :cond_8
    :goto_2
    return-void
.end method

.method private initView()V
    .locals 3

    .line 280
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 281
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$3;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$3;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    .line 299
    const v0, 0x7f0a0194

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/player/MyVideoView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    .line 300
    const v0, 0x7f0a01c0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoadTip:Landroid/widget/TextView;

    .line 301
    const v0, 0x7f0a01c1

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoading:Landroid/widget/ProgressBar;

    .line 302
    const v0, 0x7f0a01bf

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoadErr:Landroid/widget/ImageView;

    .line 303
    new-instance v0, Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    .line 304
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->setCanChangePosition(Z)V

    .line 305
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->setEnableInNormal(Z)V

    .line 306
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->setGestureEnabled(Z)V

    .line 307
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    .line 322
    .local v0, "progressManager":Lxyz/doikki/videoplayer/player/ProgressManager;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/player/MyVideoView;->setProgressManager(Lxyz/doikki/videoplayer/player/ProgressManager;)V

    .line 323
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$5;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$5;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/player/MyVideoView;->addOnStateChangeListener(Lxyz/doikki/videoplayer/player/VideoView$OnStateChangeListener;)V

    .line 359
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$6;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$6;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/player/controller/VodController;->setListener(Lcom/github/tvbox/osc/player/controller/VodController$VodControlListener;)V

    .line 460
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/player/MyVideoView;->setVideoController(Lxyz/doikki/videoplayer/controller/BaseVideoController;)V

    .line 461
    return-void
.end method

.method private initViewModel()V
    .locals 2

    .line 880
    new-instance v0, Landroidx/lifecycle/ViewModelProvider;

    invoke-direct {v0, p0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v1, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    .line 881
    iget-object v0, v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->playResult:Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$19;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$19;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v0, p0, v1}, Landroidx/lifecycle/MutableLiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 963
    return-void
.end method

.method private isCloudPlayback()Z
    .locals 3

    .line 1815
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1816
    .local v0, "value":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    const/16 v2, 0x20

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1817
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_1

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1818
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    if-eqz v1, :cond_2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1819
    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1820
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 1821
    .local v1, "text":Ljava/lang/String;
    const-string v2, "quark"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "\u5938\u514b"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "aliyun"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 1822
    const-string v2, "alipan"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "\u963f\u91cc\u4e91\u76d8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "uc\u7f51\u76d8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 1823
    const-string v2, "cloud"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "\u7f51\u76d8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    goto :goto_1

    :cond_5
    :goto_0
    const/4 v2, 0x1

    .line 1821
    :goto_1
    return v2
.end method

.method private isSameTrack(Lcom/github/tvbox/osc/player/TrackInfoBean;Lcom/github/tvbox/osc/player/TrackInfoBean;)Z
    .locals 2
    .param p1, "left"    # Lcom/github/tvbox/osc/player/TrackInfoBean;
    .param p2, "right"    # Lcom/github/tvbox/osc/player/TrackInfoBean;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "left",
            "right"
        }
    .end annotation

    .line 556
    iget v0, p1, Lcom/github/tvbox/osc/player/TrackInfoBean;->renderId:I

    iget v1, p2, Lcom/github/tvbox/osc/player/TrackInfoBean;->renderId:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackGroupId:I

    iget v1, p2, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackGroupId:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    iget v1, p2, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$promptProgressConflict$8(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "d"    # Landroid/content/DialogInterface;
    .param p1, "w"    # I

    .line 1943
    return-void
.end method

.method private normalizeEpisodeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 1409
    const-string v0, ""

    if-nez p1, :cond_0

    .line 1410
    return-object v0

    .line 1412
    :cond_0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 1413
    const-string v2, "\\s+"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1414
    const-string v2, "[\\[\\]\u3010\u3011()\uff08\uff09]"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1415
    const-string v2, "\u7b2c"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 1416
    const-string v2, "\u96c6"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 1417
    const-string v2, "\u8bdd"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 1418
    const-string v2, "\u671f"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1412
    return-object v0
.end method

.method private parseMix(Lcom/github/tvbox/osc/bean/ParseBean;Z)V
    .locals 11
    .param p1, "pb"    # Lcom/github/tvbox/osc/bean/ParseBean;
    .param p2, "isSuper"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "pb",
            "isSuper"
        }
    .end annotation

    .line 2295
    const-string v0, "\u6b63\u5728\u89e3\u6790\u64ad\u653e\u5730\u5740"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2296
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 2297
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 2298
    .local v0, "jxs":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v8, v2

    .line 2299
    .local v8, "json_jxs":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, ""

    .line 2300
    .local v2, "extendName":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/api/ApiConfig;->getParseBeanList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v9, v2

    .end local v2    # "extendName":Ljava/lang/String;
    .local v9, "extendName":Ljava/lang/String;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/ParseBean;

    .line 2301
    .local v2, "p":Lcom/github/tvbox/osc/bean/ParseBean;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 2302
    .local v4, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getUrl()Ljava/lang/String;

    move-result-object v5

    const-string v6, "url"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2303
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2304
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v5

    move-object v9, v5

    .line 2306
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "type"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2307
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getExt()Ljava/lang/String;

    move-result-object v5

    const-string v6, "ext"

    invoke-virtual {v4, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2308
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2310
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getType()I

    move-result v5

    if-ne v5, v1, :cond_1

    .line 2311
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/ParseBean;->mixUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2313
    .end local v2    # "p":Lcom/github/tvbox/osc/bean/ParseBean;
    .end local v4    # "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    goto :goto_0

    .line 2314
    :cond_2
    move-object v7, v9

    .line 2315
    .local v7, "finalExtendName":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v10, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$25;

    move-object v2, v10

    move-object v3, p0

    move v4, p2

    move-object v5, v0

    move-object v6, p1

    invoke-direct/range {v2 .. v7}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$25;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;ZLjava/util/LinkedHashMap;Lcom/github/tvbox/osc/bean/ParseBean;Ljava/lang/String;)V

    invoke-interface {v1, v10}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 2381
    return-void
.end method

.method private playNext(Z)V
    .locals 5
    .param p1, "isProgress"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isProgress"
        }
    .end annotation

    .line 1186
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1188
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 1191
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    add-int/2addr v0, v2

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .local v0, "hasNext":Z
    :goto_0
    goto :goto_2

    .line 1189
    .end local v0    # "hasNext":Z
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 1193
    .restart local v0    # "hasNext":Z
    :goto_2
    if-nez v0, :cond_3

    .line 1194
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "\u5df2\u7ecf\u662f\u6700\u540e\u4e00\u96c6\u4e86!"

    invoke-static {v2, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1195
    return-void

    .line 1197
    :cond_3
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    add-int/2addr v4, v2

    iput v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 1199
    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->play(Z)V

    .line 1200
    return-void
.end method

.method private playPrevious()V
    .locals 5

    .line 1203
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1204
    const/4 v0, 0x1

    .line 1205
    .local v0, "hasPre":Z
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 1208
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    sub-int/2addr v1, v3

    if-ltz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    move v0, v1

    goto :goto_2

    .line 1206
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 1210
    :goto_2
    if-nez v0, :cond_3

    .line 1211
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "\u5df2\u7ecf\u662f\u7b2c\u4e00\u96c6\u4e86!"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1212
    return-void

    .line 1214
    :cond_3
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v4, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    sub-int/2addr v4, v3

    iput v4, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 1215
    invoke-virtual {p0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->play(Z)V

    .line 1216
    return-void
.end method

.method private promptProgressConflict(Ljava/lang/String;JJ)V
    .locals 10
    .param p1, "startedKey"    # Ljava/lang/String;
    .param p2, "localMs"    # J
    .param p4, "serverMs"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0,
            0x0
        }
        names = {
            "startedKey",
            "localMs",
            "serverMs"
        }
    .end annotation

    .line 1930
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 1931
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_0

    .line 1932
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1933
    const-string v2, "\u68c0\u6d4b\u5230\u5176\u4ed6\u8bbe\u5907\u7684\u8fdb\u5ea6"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5176\u4ed6\u8bbe\u5907\u770b\u5230 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1934
    invoke-static {p4, p5}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->formatClock(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\uff0c\u672c\u673a\u5728 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2, p3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->formatClock(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\u3002\n10 \u79d2\u5185\u4e0d\u9009\u62e9\u5c06\u81ea\u52a8\u8df3\u5230\u5176\u4ed6\u8bbe\u5907\u7684\u8fdb\u5ea6\u3002"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u8df3\u5230 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1936
    invoke-static {p4, p5}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->formatClock(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, p4, p5}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;J)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u4fdd\u7559\u672c\u673a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1941
    invoke-static {p2, p3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->formatClock(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda8;->INSTANCE:Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda8;

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1944
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1945
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 1946
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    new-instance v9, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda5;

    move-object v2, v9

    move-object v3, p0

    move-object v4, v1

    move-object v5, p1

    move-wide v6, p4

    invoke-direct/range {v2 .. v7}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda5;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/app/AlertDialog;Ljava/lang/String;J)V

    const-wide/16 v2, 0x2710

    invoke-virtual {v8, v9, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1954
    return-void

    .line 1931
    .end local v1    # "dialog":Landroid/app/AlertDialog;
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v1, p4, p5}, Lcom/github/tvbox/osc/player/MyVideoView;->seekTo(J)V

    return-void
.end method

.method private pullServerProgressAndSeek(Ljava/lang/String;I)V
    .locals 1
    .param p1, "startedKey"    # Ljava/lang/String;
    .param p2, "attempt"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "startedKey",
            "attempt"
        }
    .end annotation

    .line 1899
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1900
    :cond_0
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda15;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;I)V

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    .line 1923
    return-void
.end method

.method private putHeaders(Lorg/json/JSONObject;Ljava/util/HashMap;)V
    .locals 3
    .param p1, "target"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "target",
            "headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1693
    .local p2, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_1

    .line 1694
    :cond_0
    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1695
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1696
    .end local v1    # "key":Ljava/lang/String;
    goto :goto_0

    .line 1697
    :cond_1
    return-void

    .line 1693
    :cond_2
    :goto_1
    return-void
.end method

.method private reportPlaybackIntegration(Ljava/lang/String;Z)V
    .locals 23
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "force"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "event",
            "force"
        }
    .end annotation

    .line 1987
    move-object/from16 v0, p0

    move-object/from16 v12, p1

    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v1, :cond_a

    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_a

    .line 1988
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_4

    .line 1989
    :cond_0
    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/MyVideoView;->getDuration()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .line 1990
    .local v13, "duration":J
    cmp-long v1, v13, v3

    if-gtz v1, :cond_1

    return-void

    .line 1991
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 1992
    .local v10, "now":J
    if-nez p2, :cond_2

    iget-wide v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->lastTraktReportAt:J

    sub-long v1, v10, v1

    const-wide/16 v5, 0x7530

    cmp-long v7, v1, v5

    if-gez v7, :cond_2

    return-void

    .line 1993
    :cond_2
    invoke-direct/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->trustworthyPosition()J

    move-result-wide v1

    .line 1994
    .local v1, "position":J
    cmp-long v5, v1, v3

    if-gez v5, :cond_5

    .line 1996
    const-string v5, "start"

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    return-void

    .line 1997
    :cond_3
    iget-object v5, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_0

    :cond_4
    iget-object v3, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v3

    :goto_0
    move-wide v1, v3

    move-wide v15, v1

    goto :goto_1

    .line 1998
    :cond_5
    cmp-long v5, v1, v3

    if-nez v5, :cond_7

    iget-object v5, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 1999
    const-string v5, "stop"

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    const-string v5, "pause"

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 2001
    :cond_6
    iget-object v5, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v5

    .line 2002
    .local v5, "saved":J
    cmp-long v7, v5, v3

    if-lez v7, :cond_7

    move-wide v1, v5

    move-wide v15, v1

    goto :goto_1

    .line 2004
    .end local v5    # "saved":J
    :cond_7
    move-wide v15, v1

    .end local v1    # "position":J
    .local v15, "position":J
    :goto_1
    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v2, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {v0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v8

    .line 2005
    .local v8, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    invoke-direct {v0, v8}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v9

    .line 2006
    .local v9, "episodeName":Ljava/lang/String;
    invoke-direct {v0, v9}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->extractEpisodeNumber(Ljava/lang/String;)I

    move-result v17

    .line 2007
    .local v17, "number":I
    invoke-direct {v0, v9}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->extractSeasonNumber(Ljava/lang/String;)I

    move-result v7

    .line 2008
    .local v7, "season":I
    if-lez v17, :cond_8

    const-string v1, "episode"

    goto :goto_2

    :cond_8
    const-string v1, "movie"

    :goto_2
    move-object v2, v1

    .line 2009
    .local v2, "mediaType":Ljava/lang/String;
    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v1, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v4, v1, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    .line 2010
    if-lez v17, :cond_9

    const/4 v1, 0x1

    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v5, v1

    goto :goto_3

    :cond_9
    const/4 v1, 0x0

    const/4 v5, 0x0

    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->embyItemId()Ljava/lang/String;

    move-result-object v18

    .line 2009
    move-object/from16 v1, p1

    move/from16 v6, v17

    move/from16 v19, v7

    .end local v7    # "season":I
    .local v19, "season":I
    move-object/from16 v7, v18

    move-object/from16 v18, v8

    move-object/from16 v20, v9

    .end local v8    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v9    # "episodeName":Ljava/lang/String;
    .local v18, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .local v20, "episodeName":Ljava/lang/String;
    move-wide v8, v15

    move-wide/from16 v21, v10

    .end local v10    # "now":J
    .local v21, "now":J
    move-wide v10, v13

    invoke-static/range {v1 .. v11}, Lcom/github/tvbox/osc/sync/IntegrationClient;->playbackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;JJ)V

    .line 2012
    move-wide/from16 v3, v21

    .end local v21    # "now":J
    .local v3, "now":J
    iput-wide v3, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->lastTraktReportAt:J

    .line 2013
    return-void

    .line 1988
    .end local v2    # "mediaType":Ljava/lang/String;
    .end local v3    # "now":J
    .end local v13    # "duration":J
    .end local v15    # "position":J
    .end local v17    # "number":I
    .end local v18    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v19    # "season":I
    .end local v20    # "episodeName":Ljava/lang/String;
    :cond_a
    :goto_4
    return-void
.end method

.method private resetDanmuState()V
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;->reset()V

    .line 250
    :cond_0
    return-void
.end method

.method private rsJsonJX(Lorg/json/JSONObject;Z)V
    .locals 4
    .param p1, "rs"    # Lorg/json/JSONObject;
    .param p2, "isSuper"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rs",
            "isSuper"
        }
    .end annotation

    .line 2384
    const-string v0, "url"

    if-eqz p2, :cond_2

    .line 2385
    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 2386
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopLoadWebView(Z)V

    goto :goto_1

    .line 2385
    :cond_1
    :goto_0
    return-void

    .line 2388
    :cond_2
    :goto_1
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    .line 2389
    .local v1, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "jxFrom"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2390
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v2

    if-nez v2, :cond_3

    return-void

    .line 2391
    :cond_3
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    new-instance v3, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$26;

    invoke-direct {v3, p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$26;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v3}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2398
    :cond_4
    const-string v2, ""

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 2399
    return-void
.end method

.method private scheduleAudioTrackRecovery()V
    .locals 4

    .line 1827
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    return-void

    .line 1828
    :cond_0
    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda3;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1829
    return-void
.end method

.method private searchDanmu(Ljava/lang/String;)V
    .locals 17
    .param p1, "danmaku"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "danmaku"
        }
    .end annotation

    invoke-static/range {p0 .. p0}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->capture(Ljava/lang/Object;)V
    .line 966
    move-object/from16 v1, p0

    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->canSearch()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 967
    :cond_0
    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v2, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {v1, v0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v2

    .line 968
    .local v2, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iget-object v3, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    .line 969
    .local v3, "key":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v4, 0x1

    xor-int/2addr v0, v4

    move v5, v0

    .line 970
    .local v5, "hasSourceDanmu":Z
    invoke-direct {v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v14

    .line 971
    .local v14, "episodeName":Ljava/lang/String;
    invoke-direct {v1, v14}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->extractEpisodeNumber(Ljava/lang/String;)I

    move-result v15

    .line 972
    .local v15, "episodeNumber":I
    invoke-direct {v1, v14}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->extractSeasonNumber(Ljava/lang/String;)I

    move-result v13

    .line 973
    .local v13, "seasonNumber":I
    if-lez v15, :cond_1

    const-string v0, "episode"

    goto :goto_0

    :cond_1
    const-string v0, "movie"

    :goto_0
    move-object v10, v0

    .line 974
    .local v10, "mediaType":Ljava/lang/String;
    const/4 v6, 0x0

    .line 975
    .local v6, "tmdbId":I
    :try_start_0
    iget-object v0, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->tmdbId:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, ""

    goto :goto_1

    :cond_2
    iget-object v0, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->tmdbId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v6, v0

    .line 976
    goto :goto_2

    :catch_0
    move-exception v0

    move v0, v6

    .line 977
    .end local v6    # "tmdbId":I
    .local v0, "tmdbId":I
    :goto_2
    iget-object v6, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    if-eqz v6, :cond_3

    invoke-virtual {v6}, Lcom/github/tvbox/osc/player/controller/VodController;->setDanmuLoading()V

    .line 978
    :cond_3
    iget-object v6, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iget-object v7, v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v8, v7, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    .line 979
    if-lez v15, :cond_4

    invoke-static {v4, v13}, Ljava/lang/Math;->max(II)I

    move-result v4

    move v11, v4

    goto :goto_3

    :cond_4
    const/4 v4, 0x0

    const/4 v11, 0x0

    :goto_3
    new-instance v4, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$20;

    move-object/from16 v12, p1

    invoke-direct {v4, v1, v3, v12, v5}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$20;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 978
    move-object v7, v14

    move v9, v0

    move v12, v15

    move/from16 v16, v13

    .end local v13    # "seasonNumber":I
    .local v16, "seasonNumber":I
    move-object v13, v4

    invoke-static/range {v6 .. v13}, Lcom/github/tvbox/osc/api/DanmakuApi;->search(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    .line 1001
    return-void

    .line 966
    .end local v0    # "tmdbId":I
    .end local v2    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "hasSourceDanmu":Z
    .end local v10    # "mediaType":Ljava/lang/String;
    .end local v14    # "episodeName":Ljava/lang/String;
    .end local v15    # "episodeNumber":I
    .end local v16    # "seasonNumber":I
    :cond_5
    :goto_4
    return-void
.end method

.method private setDanmuViewSettings(Z)V
    .locals 1
    .param p1, "reload"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "reload"
        }
    .end annotation

    .line 234
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;->applySettings(Z)V

    .line 235
    :cond_0
    return-void
.end method

.method private showManualDanmakuLinkDialog()V
    .locals 4

    .line 2026
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v0, :cond_0

    return-void

    .line 2027
    :cond_0
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 2028
    .local v0, "input":Landroid/widget/EditText;
    const-string v1, "\u8f93\u5165\u5f39\u5e55\u5e93\u5267\u96c6 ID"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 2029
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 2030
    const/16 v1, 0x18

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 2031
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2032
    const-string v2, "\u624b\u52a8\u5173\u8054\u5f39\u5e55\u5e93"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2033
    const-string v2, "\u4ec5\u5728\u81ea\u52a8\u5339\u914d\u9519\u8bef\u65f6\u4f7f\u7528\u3002\u957f\u6309\u201c\u5f39\u5e55\u201d\u53ef\u518d\u6b21\u4fee\u6539\u5173\u8054\u3002"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2034
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u53d6\u6d88"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u5173\u8054\u5e76\u5237\u65b0"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 2035
    .local v1, "dialog":Landroid/app/AlertDialog;
    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0, v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda9;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/app/AlertDialog;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 2053
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 2054
    return-void
.end method

.method private showSendDanmakuDialog()V
    .locals 4

    .line 2057
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2058
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const-string v2, "\u8bf7\u5148\u5728\u7528\u6237\u9875\u767b\u5f55\u7eed\u6620\u8d26\u53f7"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2059
    return-void

    .line 2061
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-nez v0, :cond_1

    goto :goto_0

    .line 2062
    :cond_1
    new-instance v0, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 2063
    .local v0, "input":Landroid/widget/EditText;
    const-string v2, "\u8f93\u5165\u5f39\u5e55\uff08\u6700\u591a100\u5b57\uff09"

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 2064
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 2065
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 2066
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 2067
    const/16 v1, 0x18

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 2068
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u53d1\u9001\u5f39\u5e55"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2069
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u53d6\u6d88"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u53d1\u9001"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 2070
    .local v1, "dialog":Landroid/app/AlertDialog;
    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0, v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda10;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/app/AlertDialog;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 2089
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 2090
    return-void

    .line 2061
    .end local v0    # "input":Landroid/widget/EditText;
    .end local v1    # "dialog":Landroid/app/AlertDialog;
    :cond_2
    :goto_0
    return-void
.end method

.method private startDanmuIfReady()V
    .locals 1

    .line 245
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;->startIfReady()V

    .line 246
    :cond_0
    return-void
.end method

.method private startPlaybackWatchdog()V
    .locals 5

    .line 1800
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    return-void

    .line 1801
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1802
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-nez v0, :cond_1

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_1
    const-wide/16 v1, 0x0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPosition()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchPosition:J

    .line 1803
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchAdvancedAt:J

    .line 1804
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackLayoutRecoveryTried:Z

    .line 1805
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isCloudPlayback()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchdog:Ljava/lang/Runnable;

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1806
    :cond_2
    return-void
.end method

.method private startProgressReporter()V
    .locals 4

    .line 1874
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    return-void

    .line 1875
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncProgressReporter:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1877
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncProgressReporter:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1878
    return-void
.end method

.method private stopPlaybackWatchdog()V
    .locals 2

    .line 1809
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchdog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1810
    :cond_0
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackWatchPosition:J

    .line 1811
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackLayoutRecoveryTried:Z

    .line 1812
    return-void
.end method

.method private stopProgressReporter()V
    .locals 2

    .line 1881
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncProgressReporter:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1882
    :cond_0
    return-void
.end method

.method private syncCurrentProgress(Z)V
    .locals 7
    .param p1, "immediate"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "immediate"
        }
    .end annotation

    .line 1885
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1886
    :cond_0
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->trustworthyPosition()J

    move-result-wide v0

    .line 1887
    .local v0, "position":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    return-void

    .line 1888
    :cond_1
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v2, v0, v1, p1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->reportPlaybackProgress(Ljava/lang/String;JZ)V

    .line 1889
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->lastTraktReportAt:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x7530

    cmp-long v6, v2, v4

    if-ltz v6, :cond_2

    .line 1890
    const/4 v2, 0x0

    const-string v3, "progress"

    invoke-direct {p0, v3, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->reportPlaybackIntegration(Ljava/lang/String;Z)V

    .line 1892
    :cond_2
    return-void

    .line 1885
    .end local v0    # "position":J
    :cond_3
    :goto_0
    return-void
.end method

.method private syncSavedProgress()V
    .locals 5

    .line 1967
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1968
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v0

    .line 1969
    .local v0, "saved":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v2, v0, v1, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->reportPlaybackProgress(Ljava/lang/String;JZ)V

    .line 1970
    :cond_1
    return-void
.end method

.method private trustworthyPosition()J
    .locals 7

    .line 1977
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPosition()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 1978
    .local v0, "position":J
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-wide v0

    .line 1979
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStartGraceUntil:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    const-wide/16 v2, 0x2710

    add-long/2addr v2, v0

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    .line 1980
    invoke-virtual {p0, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    .line 1981
    const-wide/16 v2, -0x1

    return-wide v2

    .line 1983
    :cond_1
    return-wide v0
.end method


# virtual methods
.method autoRetry()Z
    .locals 9

    .line 1229
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1230
    .local v0, "currentTime":J
    iget-wide v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->lastRetryTime:J

    sub-long v2, v0, v2

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-wide/32 v6, 0xea60

    cmp-long v8, v2, v6

    if-lez v8, :cond_0

    .line 1231
    const-string v2, "echo-reset-autoRetryCount"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1232
    iput v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    .line 1233
    iput-boolean v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    .line 1234
    iput-boolean v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    .line 1235
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 1238
    :cond_0
    iput-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->lastRetryTime:J

    .line 1239
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrls:Ljava/util/LinkedList;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 1240
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryFromLoadFoundVideoUrls()V

    .line 1241
    return v5

    .line 1243
    :cond_1
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 1244
    iget-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    if-nez v2, :cond_3

    .line 1245
    const-string v2, "echo-retry keep user-selected player"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1246
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    const/4 v2, 0x1

    .line 1247
    .local v2, "switchSkipped":Z
    iput-boolean v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    .line 1248
    iput-boolean v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    .line 1249
    if-nez v2, :cond_3

    .line 1250
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 1251
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initParseLoadFound()V

    .line 1252
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/github/tvbox/osc/player/MyVideoView;->release()V

    .line 1253
    :cond_2
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webHeaderMap:Ljava/util/HashMap;

    invoke-virtual {p0, v3, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 1254
    return v5

    .line 1257
    .end local v2    # "switchSkipped":Z
    :cond_3
    const-string v2, "echo-retry selected player failed, try next line"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1258
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->tryNextLineIfEnabled()Z

    move-result v2

    return v2

    .line 1260
    :cond_4
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->tryNextLineIfEnabled()Z

    move-result v2

    return v2
.end method

.method autoRetryFromLoadFoundVideoUrls()V
    .locals 2

    .line 1458
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrls:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1459
    .local v0, "videoUrl":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrlsHeader:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 1460
    .local v1, "header":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 1461
    return-void
.end method

.method cancelPlayTimeout()V
    .locals 2

    .line 1735
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1736
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x66

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1737
    return-void
.end method

.method cancelSwitchLinePlayTimeout()V
    .locals 0

    .line 1731
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1732
    return-void
.end method

.method checkVideoFormat(Ljava/lang/String;)Z
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 2522
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "url=http"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, ".html"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 2525
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/bean/SourceBean;->getType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 2526
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getCSP(Lcom/github/tvbox/osc/bean/SourceBean;)Lcom/github/catvod/crawler/Spider;

    move-result-object v1

    .line 2527
    .local v1, "sp":Lcom/github/catvod/crawler/Spider;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/github/catvod/crawler/Spider;->manualVideoCheck()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2528
    invoke-virtual {v1, p1}, Lcom/github/catvod/crawler/Spider;->isVideoFormat(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 2531
    .end local v1    # "sp":Lcom/github/catvod/crawler/Spider;
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webUrl:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/github/tvbox/osc/util/VideoParseRuler;->checkIsVideoForParse(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 2523
    :cond_2
    :goto_0
    return v0

    .line 2532
    :catch_0
    move-exception v1

    .line 2533
    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 1096
    if-eqz p1, :cond_0

    .line 1097
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/player/controller/VodController;->onKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1098
    const/4 v0, 0x1

    return v0

    .line 1101
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method errorWithRetry(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "err"    # Ljava/lang/String;
    .param p2, "finish"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "err",
            "finish"
        }
    .end annotation

    .line 709
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isPlaybackStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 711
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hideTipOnUiThread()V

    .line 712
    return-void

    .line 714
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetry()Z

    move-result v0

    if-nez v0, :cond_2

    .line 715
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 716
    :cond_1
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$16;

    invoke-direct {v1, p0, p2, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$16;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;ZLjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 728
    :cond_2
    return-void
.end method

.method protected getLayoutResID()I
    .locals 1

    .line 205
    const v0, 0x7f0d0025

    return v0
.end method

.method public getPlayer()Lcom/github/tvbox/osc/player/MyVideoView;
    .locals 1

    .line 2401
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    return-object v0
.end method

.method public getSavedProgress(Ljava/lang/String;)J
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 253
    const/4 v0, 0x0

    .line 255
    .local v0, "st":I
    :try_start_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-string v2, "st"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 258
    goto :goto_0

    .line 256
    :catch_0
    move-exception v1

    .line 257
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 259
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_0
    int-to-long v1, v0

    const-wide/16 v3, 0x3e8

    mul-long v1, v1, v3

    .line 260
    .local v1, "skip":J
    invoke-static {p1}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 261
    .local v3, "theCache":Ljava/lang/Object;
    if-nez v3, :cond_0

    .line 262
    return-wide v1

    .line 264
    :cond_0
    const-wide/16 v4, 0x0

    .line 265
    .local v4, "rec":J
    instance-of v6, v3, Ljava/lang/Long;

    if-eqz v6, :cond_1

    .line 266
    move-object v6, v3

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_2

    .line 267
    :cond_1
    instance-of v6, v3, Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 269
    :try_start_1
    move-object v6, v3

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-wide v4, v6

    .line 272
    :goto_1
    goto :goto_2

    .line 270
    :catch_1
    move-exception v6

    .line 271
    .local v6, "e":Ljava/lang/NumberFormatException;
    const-string v7, "echo-String value is not a valid long."

    invoke-static {v7}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .end local v6    # "e":Ljava/lang/NumberFormatException;
    goto :goto_1

    .line 274
    :cond_2
    const-string v6, "echo-Value cannot be converted to long."

    invoke-static {v6}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 276
    :goto_2
    invoke-static {v4, v5, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    return-wide v6
.end method

.method public goPlayUrl(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "url",
            "headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 750
    .local p2, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 751
    const/4 v0, 0x1

    const-string v1, "\u83b7\u53d6\u64ad\u653e\u5730\u5740\u4e3a\u7a7a"

    invoke-virtual {p0, v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->handleResolvePlayUrlFailed(Ljava/lang/String;Z)V

    .line 752
    return-void

    .line 754
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "echo-goPlayUrl:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 755
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->audioRecoveryChecked:Z

    .line 756
    iget v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    if-nez v0, :cond_1

    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    .line 757
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_2

    return-void

    .line 758
    :cond_2
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_3

    return-void

    .line 759
    :cond_3
    move-object v0, p1

    .line 760
    .local v0, "finalUrl":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;

    invoke-direct {v2, p0, v0, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 808
    return-void
.end method

.method handleResolvePlayUrlFailed(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "err"    # Ljava/lang/String;
    .param p2, "finish"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "err",
            "finish"
        }
    .end annotation

    .line 2115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "echo-resolvePlayUrl failed, try next line: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 2116
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->cancelPlayRequest()V

    .line 2117
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 2118
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->tryNextLineIfEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 2119
    :cond_1
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_2

    .line 2120
    invoke-virtual {p0, p1, v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2121
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2123
    :cond_2
    invoke-virtual {p0, p1, v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2125
    :goto_0
    return-void
.end method

.method handleResolvePlayUrlTimeout()V
    .locals 3

    .line 2108
    const-string v0, "echo-resolvePlayUrl timeout, try next line"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 2109
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->cancelPlayRequest()V

    .line 2110
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 2111
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->tryNextLineIfEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x1

    const-string v2, "\u83b7\u53d6\u64ad\u653e\u5730\u5740\u8d85\u65f6"

    invoke-virtual {p0, v2, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2112
    :cond_1
    return-void
.end method

.method handleSwitchLinePlayTimeout()V
    .locals 5

    .line 2128
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPlayState()I

    move-result v0

    .line 2129
    .local v0, "state":I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-switchLinePlay timeout state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", started: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 2130
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isPlaybackStarted()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2131
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 2132
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hideTipOnUiThread()V

    .line 2133
    return-void

    .line 2135
    :cond_1
    const-string v1, "echo-switchLinePlay timeout, try next line"

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 2136
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 2137
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-string v4, "\u64ad\u653e\u8d85\u65f6"

    if-eqz v1, :cond_3

    .line 2138
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->tryNextLineIfEnabled()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0, v4, v3, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2139
    :cond_2
    return-void

    .line 2141
    :cond_3
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetry()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0, v4, v3, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 2142
    :cond_4
    return-void
.end method

.method hasPlaybackProgress(J)Z
    .locals 4
    .param p1, "progress"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "progress"
        }
    .end annotation

    .line 2104
    iget-wide v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playTimeoutBasePosition:J

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    add-long/2addr v0, v2

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method hideTip()V
    .locals 2

    .line 693
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoadTip:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 694
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoading:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 695
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mPlayLoadErr:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 696
    return-void
.end method

.method hideTipOnUiThread()V
    .locals 2

    .line 699
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 700
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$15;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$15;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 706
    return-void
.end method

.method protected init()V
    .locals 0

    .line 222
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initView()V

    .line 223
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initDanmuView()V

    .line 224
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initViewModel()V

    .line 225
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initData()V

    .line 226
    return-void
.end method

.method initParseLoadFound()V
    .locals 2

    .line 1464
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1465
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrls:Ljava/util/LinkedList;

    .line 1466
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadFoundVideoUrlsHeader:Ljava/util/HashMap;

    .line 1467
    return-void
.end method

.method initPlayerCfg()V
    .locals 13

    .line 1037
    const-string v0, "et"

    const-string v1, "st"

    const-string v2, "sp"

    const-string v3, "sc"

    const-string v4, "ijk"

    const-string v5, "pr"

    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1040
    goto :goto_0

    .line 1038
    :catchall_0
    move-exception v6

    .line 1039
    .local v6, "th":Ljava/lang/Throwable;
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    iput-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    .line 1042
    .end local v6    # "th":Ljava/lang/Throwable;
    :goto_0
    :try_start_1
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v6}, Lcom/github/tvbox/osc/bean/SourceBean;->getPlayerType()I

    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v7, -0x1

    const-string v8, "pl"

    const/4 v9, 0x0

    if-ne v6, v7, :cond_1

    .line 1043
    :try_start_2
    const-string v6, "play_type"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v6, v10}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1044
    .local v6, "globalPlayer":I
    const-string v10, "play_type_version"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 1047
    .local v10, "globalVersion":I
    iget-object v11, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const-string v12, "plv"

    if-eqz v11, :cond_0

    :try_start_3
    iget-object v11, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v11, v12, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-eq v7, v10, :cond_2

    .line 1048
    :cond_0
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1049
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v7, v12, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_1

    .line 1051
    .end local v6    # "globalPlayer":I
    .end local v10    # "globalVersion":I
    :cond_1
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1052
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v7}, Lcom/github/tvbox/osc/bean/SourceBean;->getPlayerType()I

    move-result v7

    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_2

    .line 1051
    :cond_2
    :goto_1
    nop

    .line 1054
    :goto_2
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 1055
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-string v7, "play_render"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1057
    :cond_3
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 1058
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-string v6, "ijk_codec"

    const-string v7, "\u786c\u89e3\u7801"

    invoke-static {v6, v7}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1060
    :cond_4
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 1061
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-string v5, "play_scale"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1063
    :cond_5
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 1064
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v3, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1066
    :cond_6
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 1067
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v2, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1069
    :cond_7
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 1070
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-virtual {v1, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1074
    :cond_8
    goto :goto_3

    .line 1072
    :catchall_1
    move-exception v0

    .line 1075
    :goto_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    invoke-static {v1}, Lcom/github/tvbox/osc/util/PlayerChoice;->applyConfigured(Lorg/json/JSONObject;)V
    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->setPlayerConfig(Lorg/json/JSONObject;)V

    .line 1076
    return-void
.end method

.method initWebView(Z)V
    .locals 2
    .param p1, "useSystemWebView"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "useSystemWebView"
        }
    .end annotation

    .line 2447
    if-eqz p1, :cond_0

    .line 2448
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$MyWebView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$MyWebView;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mSysWebView:Landroid/webkit/WebView;

    .line 2449
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->configWebViewSys(Landroid/webkit/WebView;)V

    goto :goto_0

    .line 2451
    :cond_0
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$MyXWalkView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$MyXWalkView;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mXwalkWebView:Lorg/xwalk/core/XWalkView;

    .line 2452
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->configWebViewX5(Lorg/xwalk/core/XWalkView;)V

    .line 2454
    :goto_0
    return-void
.end method

.method isPlaybackStarted()Z
    .locals 5

    .line 2093
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 2094
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    const/4 v2, 0x0

    if-nez v0, :cond_1

    return v2

    .line 2095
    :cond_1
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPlayState()I

    move-result v0

    .line 2096
    .local v0, "state":I
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isStartedPlayState(I)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v3}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPosition()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasPlaybackProgress(J)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v3}, Lcom/github/tvbox/osc/player/MyVideoView;->isPlaying()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :cond_3
    :goto_0
    return v1
.end method

.method isStalePlayResult(Lorg/json/JSONObject;)Z
    .locals 7
    .param p1, "info"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "info"
        }
    .end annotation

    .line 1004
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1005
    :cond_0
    const-string v0, "proKey"

    const-string v2, ""

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1006
    .local v0, "resultKey":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    return v4

    .line 1007
    :cond_1
    const-string v3, "flag"

    invoke-virtual {p1, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1008
    .local v3, "resultFlag":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    return v4

    .line 1009
    :cond_2
    const-string v5, "key"

    invoke-virtual {p1, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1010
    .local v2, "sourceUrl":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 1011
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {p0, v5, v6}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v5

    .line 1012
    .local v5, "vs":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v5, :cond_3

    iget-object v6, v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    .line 1014
    .end local v5    # "vs":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_4
    return v1

    .line 1004
    .end local v0    # "resultKey":Ljava/lang/String;
    .end local v2    # "sourceUrl":Ljava/lang/String;
    .end local v3    # "resultFlag":Ljava/lang/String;
    :cond_5
    :goto_0
    return v1
.end method

.method isStartedPlayState(I)Z
    .locals 1
    .param p1, "state"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 2100
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method jsonParse(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 16
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "json"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1621
    move-object/from16 v0, p0

    new-instance v1, Lorg/json/JSONObject;

    move-object/from16 v2, p2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1622
    .local v1, "jsonPlayData":Lorg/json/JSONObject;
    const-string v3, "data"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 1623
    .local v3, "playData":Lorg/json/JSONObject;
    if-nez v3, :cond_0

    .line 1624
    move-object v3, v1

    .line 1626
    :cond_0
    const-string v4, "url"

    const-string v5, ""

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1627
    .local v6, "url":Ljava/lang/String;
    const-string v7, "//"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1628
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1630
    :cond_1
    const/4 v7, 0x0

    .line 1631
    .local v7, "parse":Z
    const-string v8, "video://"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1632
    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 1633
    const/4 v7, 0x1

    .line 1635
    :cond_2
    invoke-static {v6}, Lcom/github/tvbox/osc/util/DefaultConfig;->checkReplaceProxy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1636
    const-string v8, "http"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "data:application"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 1637
    const/4 v4, 0x0

    return-object v4

    .line 1639
    :cond_3
    const/4 v8, 0x0

    const-string v9, "parse"

    const/4 v10, 0x1

    if-nez v7, :cond_5

    invoke-virtual {v1, v9, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v3, v9, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    if-ne v11, v10, :cond_4

    goto :goto_0

    :cond_4
    const/4 v11, 0x0

    goto :goto_1

    :cond_5
    :goto_0
    const/4 v11, 0x1

    :goto_1
    move v7, v11

    .line 1640
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 1641
    .local v11, "headers":Lorg/json/JSONObject;
    invoke-direct {v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v12

    .line 1642
    .local v12, "headerMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v0, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getHeaders(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v13

    .line 1643
    .local v13, "dataHeaderMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v12, :cond_6

    invoke-direct {v0, v11, v12}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->putHeaders(Lorg/json/JSONObject;Ljava/util/HashMap;)V

    .line 1644
    :cond_6
    if-eqz v13, :cond_7

    invoke-direct {v0, v11, v13}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->putHeaders(Lorg/json/JSONObject;Ljava/util/HashMap;)V

    .line 1645
    :cond_7
    const-string v14, "user-agent"

    invoke-virtual {v1, v14, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1646
    .local v14, "ua":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    const-string v8, " "

    if-lez v15, :cond_8

    .line 1647
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const-string v10, "User-Agent"

    invoke-virtual {v11, v10, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1649
    :cond_8
    const-string v10, "referer"

    invoke-virtual {v1, v10, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v10, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1650
    .local v5, "referer":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_9

    .line 1651
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v10, "Referer"

    invoke-virtual {v11, v10, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1653
    :cond_9
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 1654
    .local v8, "taskResult":Lorg/json/JSONObject;
    const-string v10, "header"

    invoke-virtual {v8, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1655
    invoke-virtual {v8, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1656
    if-eqz v7, :cond_a

    const/4 v4, 0x1

    goto :goto_2

    :cond_a
    const/4 v4, 0x0

    :goto_2
    invoke-virtual {v8, v9, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1657
    return-object v8
.end method

.method synthetic lambda$checkAudioTrack$3$com-github-tvbox-osc-ui-fragment-PlayFragment()V
    .locals 1

    .line 1845
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->checkAudioTrack(Z)V

    return-void
.end method

.method synthetic lambda$promptProgressConflict$7$com-github-tvbox-osc-ui-fragment-PlayFragment(Ljava/lang/String;JLandroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "startedKey"    # Ljava/lang/String;
    .param p2, "serverMs"    # J
    .param p4, "d"    # Landroid/content/DialogInterface;
    .param p5, "w"    # I

    .line 1937
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1938
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0, p2, p3}, Lcom/github/tvbox/osc/player/MyVideoView;->seekTo(J)V

    .line 1940
    :cond_0
    return-void
.end method

.method synthetic lambda$promptProgressConflict$9$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/app/AlertDialog;Ljava/lang/String;J)V
    .locals 1
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "startedKey"    # Ljava/lang/String;
    .param p3, "serverMs"    # J

    .line 1947
    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1948
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 1949
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1950
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0, p3, p4}, Lcom/github/tvbox/osc/player/MyVideoView;->seekTo(J)V

    .line 1953
    :cond_0
    return-void
.end method

.method synthetic lambda$pullServerProgressAndSeek$4$com-github-tvbox-osc-ui-fragment-PlayFragment(Ljava/lang/String;I)V
    .locals 1
    .param p1, "startedKey"    # Ljava/lang/String;
    .param p2, "attempt"    # I

    .line 1919
    add-int/lit8 v0, p2, 0x1

    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->pullServerProgressAndSeek(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic lambda$pullServerProgressAndSeek$5$com-github-tvbox-osc-ui-fragment-PlayFragment(Ljava/lang/String;ZI)V
    .locals 11
    .param p1, "startedKey"    # Ljava/lang/String;
    .param p2, "success"    # Z
    .param p3, "attempt"    # I

    .line 1903
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    .line 1904
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 1905
    :cond_0
    if-eqz p2, :cond_2

    .line 1906
    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v7

    .line 1907
    .local v7, "server":J
    const-wide/16 v0, 0x0

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPosition()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    .line 1908
    .local v9, "current":J
    const-wide/16 v0, 0x1388

    add-long/2addr v0, v9

    cmp-long v2, v7, v0

    if-lez v2, :cond_3

    .line 1909
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStartGraceUntil:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_3

    .line 1912
    const-wide/32 v0, 0xea60

    add-long/2addr v0, v9

    cmp-long v2, v7, v0

    if-lez v2, :cond_1

    const-wide/16 v0, 0x2710

    cmp-long v2, v9, v0

    if-lez v2, :cond_1

    .line 1913
    move-object v1, p0

    move-object v2, p1

    move-wide v3, v9

    move-wide v5, v7

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->promptProgressConflict(Ljava/lang/String;JJ)V

    goto :goto_0

    .line 1915
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0, v7, v8}, Lcom/github/tvbox/osc/player/MyVideoView;->seekTo(J)V

    goto :goto_0

    .line 1918
    .end local v7    # "server":J
    .end local v9    # "current":J
    :cond_2
    const/4 v0, 0x3

    if-ge p3, v0, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStartGraceUntil:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_3

    .line 1919
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1, p3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda6;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;I)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .line 1918
    :cond_3
    :goto_0
    nop

    .line 1921
    :goto_1
    return-void

    .line 1904
    :cond_4
    :goto_2
    return-void
.end method

.method synthetic lambda$pullServerProgressAndSeek$6$com-github-tvbox-osc-ui-fragment-PlayFragment(Ljava/lang/String;IZ)V
    .locals 2
    .param p1, "startedKey"    # Ljava/lang/String;
    .param p2, "attempt"    # I
    .param p3, "success"    # Z

    .line 1901
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    return-void

    .line 1902
    :cond_0
    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda7;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;ZI)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1922
    return-void
.end method

.method synthetic lambda$refreshPlayerLayout$0$com-github-tvbox-osc-ui-fragment-PlayFragment()V
    .locals 1

    .line 1756
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->refreshVideoLayout()V

    .line 1757
    :cond_0
    return-void
.end method

.method synthetic lambda$refreshPlayerLayout$1$com-github-tvbox-osc-ui-fragment-PlayFragment()V
    .locals 1

    .line 1759
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->refreshVideoLayout()V

    .line 1760
    :cond_0
    return-void
.end method

.method synthetic lambda$scheduleAudioTrackRecovery$2$com-github-tvbox-osc-ui-fragment-PlayFragment()V
    .locals 1

    .line 1828
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->checkAudioTrack(Z)V

    return-void
.end method

.method synthetic lambda$showManualDanmakuLinkDialog$10$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/app/AlertDialog;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "result"    # Lorg/json/JSONObject;
    .param p3, "error"    # Ljava/lang/String;

    .line 2043
    if-eqz p3, :cond_0

    .line 2044
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2045
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-static {v0, p3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2046
    return-void

    .line 2048
    :cond_0
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 2049
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "\u5f39\u5e55\u5173\u8054\u5df2\u66f4\u65b0\uff0c\u6b63\u5728\u91cd\u65b0\u52a0\u8f7d"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2050
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->searchDanmu(Ljava/lang/String;)V

    .line 2051
    return-void
.end method

.method synthetic lambda$showManualDanmakuLinkDialog$11$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 8
    .param p1, "input"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/app/AlertDialog;
    .param p3, "v"    # Landroid/view/View;

    .line 2037
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2038
    .local v5, "episodeId":I
    nop

    .line 2039
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v1

    .line 2040
    .local v1, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    const/4 v2, -0x1

    invoke-virtual {p2, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2041
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v0, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v4, v0, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    new-instance v7, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda13;

    invoke-direct {v7, p0, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda13;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/app/AlertDialog;)V

    const-string v6, "\u624b\u52a8\u5173\u8054"

    invoke-static/range {v2 .. v7}, Lcom/github/tvbox/osc/sync/IntegrationClient;->linkDanmaku(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 2052
    return-void

    .line 2038
    .end local v1    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v5    # "episodeId":I
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const-string v3, "\u8bf7\u8f93\u5165\u6709\u6548 EpisodeId"

    invoke-static {v2, v3, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$showManualDanmakuLinkDialog$12$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "input"    # Landroid/widget/EditText;
    .param p3, "ignored"    # Landroid/content/DialogInterface;

    .line 2035
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0, p2, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda11;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$showSendDanmakuDialog$13$com-github-tvbox-osc-ui-fragment-PlayFragment()V
    .locals 1

    .line 2086
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->searchDanmu(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$showSendDanmakuDialog$14$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/app/AlertDialog;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 4
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "result"    # Lorg/json/JSONObject;
    .param p4, "error"    # Ljava/lang/String;

    .line 2078
    const/4 v0, 0x1

    if-eqz p4, :cond_0

    .line 2079
    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2080
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    invoke-static {v1, p4, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2081
    return-void

    .line 2083
    :cond_0
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 2084
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    if-eqz v1, :cond_1

    const v2, 0xffffff

    invoke-virtual {v1, p2, v0, v2}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;->addLive(Ljava/lang/String;II)Z

    .line 2085
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "\u5df2\u53d1\u9001\u5230\u7eed\u6620\u670d\u52a1\u5668\u5f39\u5e55\u5e93"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 2086
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda4;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2087
    return-void
.end method

.method synthetic lambda$showSendDanmakuDialog$15$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 11
    .param p1, "input"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/app/AlertDialog;
    .param p3, "v"    # Landroid/view/View;

    .line 2071
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 2072
    .local v0, "text":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const-string v3, "\u8bf7\u8f93\u5165\u5f39\u5e55\u5185\u5bb9"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    return-void

    .line 2073
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0x64

    if-le v1, v3, :cond_1

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const-string v3, "\u5f39\u5e55\u4e0d\u80fd\u8d85\u8fc7100\u5b57"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    return-void

    .line 2074
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {p0, v1, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v10

    .line 2075
    .local v10, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    const/4 v1, -0x1

    invoke-virtual {p2, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2076
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-direct {p0, v10}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    const-wide/16 v4, 0x0

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    .line 2077
    invoke-virtual {v6}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPosition()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    const/4 v7, 0x1

    const v8, 0xffffff

    new-instance v9, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda14;

    invoke-direct {v9, p0, p2, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda14;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/app/AlertDialog;Ljava/lang/String;)V

    .line 2076
    move-object v6, v0

    invoke-static/range {v1 .. v9}, Lcom/github/tvbox/osc/sync/IntegrationClient;->sendDanmaku(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 2088
    return-void
.end method

.method synthetic lambda$showSendDanmakuDialog$16$com-github-tvbox-osc-ui-fragment-PlayFragment(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "input"    # Landroid/widget/EditText;
    .param p3, "ignored"    # Landroid/content/DialogInterface;

    .line 2070
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, p2, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda12;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method loadUrl(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 2457
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 2458
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$28;

    invoke-direct {v1, p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$28;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2487
    return-void
.end method

.method loadWebView(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 2413
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mSysWebView:Landroid/webkit/WebView;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mXwalkWebView:Lorg/xwalk/core/XWalkView;

    if-nez v0, :cond_1

    .line 2414
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "parse_webview"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 2415
    .local v1, "useSystemWebView":Z
    if-nez v1, :cond_0

    .line 2416
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$27;

    invoke-direct {v2, p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$27;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)V

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/util/XWalkUtils;->tryUseXWalk(Landroid/content/Context;Lcom/github/tvbox/osc/util/XWalkUtils$XWalkState;)V

    goto :goto_0

    .line 2438
    :cond_0
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initWebView(Z)V

    .line 2439
    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadUrl(Ljava/lang/String;)V

    .line 2441
    .end local v1    # "useSystemWebView":Z
    :goto_0
    goto :goto_1

    .line 2442
    :cond_1
    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->loadUrl(Ljava/lang/String;)V

    .line 2444
    :goto_1
    return-void
.end method

.method markPlaybackStarted()V
    .locals 5

    .line 1782
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    .line 1785
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3a98

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStartGraceUntil:J

    .line 1788
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->pullServerProgressAndSeek(Ljava/lang/String;I)V

    .line 1789
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->setPlaybackActive(Z)V

    .line 1790
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->traktPlaying:Z

    if-nez v1, :cond_0

    .line 1791
    const-string v1, "start"

    invoke-direct {p0, v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->reportPlaybackIntegration(Ljava/lang/String;Z)V

    .line 1792
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->traktPlaying:Z

    .line 1794
    :cond_0
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->startProgressReporter()V

    .line 1795
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->startPlaybackWatchdog()V

    .line 1796
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1797
    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    .line 1079
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getRequestedOrientation()I

    move-result v0

    .line 1081
    .local v0, "requestedOrientation":I
    invoke-static {v0}, Lcom/github/tvbox/osc/player/controller/VodController;->isPortraitOrientation(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1082
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentActivity;->setRequestedOrientation(I)V

    .line 1083
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v1, v1, Lcom/github/tvbox/osc/player/controller/VodController;->mLandscapePortraitBtn:Landroid/widget/TextView;

    const-string v2, "\u7ad6\u5c4f"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1085
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/controller/VodController;->onBackPressed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1086
    const/4 v1, 0x1

    return v1

    .line 1088
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public onDestroyView()V
    .locals 3

    .line 1158
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->traktPlaying:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string v0, "stop"

    invoke-direct {p0, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->reportPlaybackIntegration(Ljava/lang/String;Z)V

    .line 1159
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->traktPlaying:Z

    .line 1160
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncCurrentProgress(Z)V

    .line 1161
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopProgressReporter()V

    .line 1162
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onDestroyView()V

    .line 1163
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->setPlaybackActive(Z)V

    .line 1164
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/api/ApiConfig;->setCurrentPlaySourceKey(Ljava/lang/String;)V

    .line 1165
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1166
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    .line 1167
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 1168
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;->destroy()V

    .line 1169
    iput-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->danmuLoadController:Lcom/github/tvbox/osc/player/danmu/DanmuLoadController;

    .line 1171
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_2

    .line 1172
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->release()V

    .line 1173
    iput-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    .line 1175
    :cond_2
    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopLoadWebView(Z)V

    .line 1176
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 1177
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/controller/VodController;->stopOther()V

    .line 1178
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 1
    .param p1, "hidden"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hidden"
        }
    .end annotation

    .line 1144
    if-eqz p1, :cond_0

    .line 1145
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_1

    .line 1146
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->pause()V

    goto :goto_0

    .line 1149
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_1

    .line 1150
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->resume()V

    .line 1153
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onHiddenChanged(Z)V

    .line 1154
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyCode",
            "event"
        }
    .end annotation

    .line 1105
    if-eqz p2, :cond_0

    .line 1106
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, p1, p2}, Lcom/github/tvbox/osc/player/controller/VodController;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1107
    const/4 v0, 0x1

    return v0

    .line 1110
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyCode",
            "event"
        }
    .end annotation

    .line 1114
    if-eqz p2, :cond_0

    .line 1115
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, p1, p2}, Lcom/github/tvbox/osc/player/controller/VodController;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1116
    const/4 v0, 0x1

    return v0

    .line 1119
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onPause()V
    .locals 2

    .line 1124
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onPause()V

    .line 1125
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->exitingPreview:Z

    if-nez v1, :cond_0

    .line 1126
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->pause()V

    .line 1128
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncCurrentProgress(Z)V

    .line 1129
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopProgressReporter()V

    .line 1130
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->setPlaybackActive(Z)V

    .line 1131
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1135
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onResume()V

    .line 1136
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->exitingPreview:Z

    .line 1137
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    .line 1138
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->resume()V

    .line 1140
    :cond_0
    return-void
.end method

.method public pauseForHidden()V
    .locals 1

    .line 1764
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncCurrentProgress(Z)V

    .line 1765
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopProgressReporter()V

    .line 1766
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopPlaybackWatchdog()V

    .line 1767
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1768
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 1769
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    .line 1770
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v0, :cond_0

    .line 1771
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->pause()V

    .line 1772
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->release()V

    .line 1774
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/controller/VodController;->stopOther()V

    .line 1775
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->resetDanmuState()V

    .line 1776
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    .line 1777
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webHeaderMap:Ljava/util/HashMap;

    .line 1778
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initParseLoadFound()V

    .line 1779
    return-void
.end method

.method public play(Z)V
    .locals 10
    .param p1, "reset"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "reset"
        }
    .end annotation

    .line 1484
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v0, :cond_0

    return-void

    .line 1485
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->syncCurrentProgress(Z)V

    .line 1486
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopProgressReporter()V

    .line 1487
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->exitingPreview:Z

    .line 1488
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 1489
    .local v2, "vs":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v3

    new-instance v4, Lcom/github/tvbox/osc/event/RefreshEvent;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {v4, v1, v5}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v3, v4}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 1490
    const-string v3, "\u6b63\u5728\u83b7\u53d6\u64ad\u653e\u4fe1\u606f"

    invoke-virtual {p0, v3, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 1491
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1492
    .local v3, "playTitleInfo":Ljava/lang/String;
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v4, v3}, Lcom/github/tvbox/osc/player/controller/VodController;->setTitle(Ljava/lang/String;)V

    .line 1494
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 1495
    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playbackStarted:Z

    .line 1496
    invoke-static {v1}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->setPlaybackActive(Z)V

    .line 1497
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playTimeoutBasePosition:J

    .line 1498
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webPlayUrl:Ljava/lang/String;

    .line 1499
    iput-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->webHeaderMap:Ljava/util/HashMap;

    .line 1500
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initParseLoadFound()V

    .line 1501
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    .line 1502
    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    .line 1503
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v5}, Lcom/github/tvbox/osc/player/controller/VodController;->stopOther()V

    .line 1504
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->resetDanmuState()V

    .line 1505
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Lcom/github/tvbox/osc/player/MyVideoView;->release()V

    .line 1506
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/util/ImgUtil;->clearMemoryCache()V

    .line 1507
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->sourceKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "-subt"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->subtitleCacheKey:Ljava/lang/String;

    .line 1508
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->sourceKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v6, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    .line 1510
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->startResolvePlayUrlTimeout()V

    .line 1512
    if-eqz p1, :cond_2

    .line 1513
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/cache/AccountScopedCache;->delete(Ljava/lang/String;)V

    .line 1514
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->subtitleCacheKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/github/tvbox/osc/cache/CacheManager;->delete(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 1516
    :cond_2
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressIfNeeded()V

    .line 1518
    :try_start_0
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-string v6, "pl"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 1519
    .local v5, "playerType":I
    if-ne v5, v0, :cond_3

    .line 1520
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setVisibility(I)V

    goto :goto_0

    .line 1522
    :cond_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    const/16 v6, 0x8

    invoke-virtual {v0, v6}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setVisibility(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1526
    .end local v5    # "playerType":I
    :goto_0
    goto :goto_1

    .line 1524
    :catch_0
    move-exception v0

    .line 1525
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 1529
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    iget-object v0, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/util/thunder/Jianpian;->isJpUrl(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1530
    iget-object v0, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    .line 1531
    .local v0, "jp_url":Ljava/lang/String;
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v5, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->showParse(Z)V

    .line 1532
    iget-object v1, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    const-string v5, "tvbox-xg:"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1533
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/thunder/Jianpian;->JPUrlDec(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_2

    .line 1535
    :cond_4
    invoke-static {v0}, Lcom/github/tvbox/osc/util/thunder/Jianpian;->JPUrlDec(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->playUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 1537
    :goto_2
    return-void

    .line 1539
    .end local v0    # "jp_url":Ljava/lang/String;
    :cond_5
    iget-object v0, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    new-instance v4, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$22;

    invoke-direct {v4, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$22;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-static {v0, v4}, Lcom/github/tvbox/osc/util/thunder/Thunder;->play(Ljava/lang/String;Lcom/github/tvbox/osc/util/thunder/Thunder$ThunderCallback;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1558
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->showParse(Z)V

    .line 1559
    return-void

    .line 1561
    :cond_6
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    iget-object v8, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    iget-object v9, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->subtitleCacheKey:Ljava/lang/String;

    invoke-virtual/range {v4 .. v9}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->getPlay(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1562
    return-void
.end method

.method playUrl(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "url",
            "headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 731
    .local p2, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->startSwitchLinePlayTimeout()V

    .line 732
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->attachProxySiteKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 733
    const-string v0, "data:application"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    new-instance v2, Lcom/github/tvbox/osc/event/RefreshEvent;

    invoke-direct {v2, v1, p1}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 734
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "m3u8_purify"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 735
    invoke-virtual {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->goPlayUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 736
    return-void

    .line 738
    :cond_1
    const-string v0, "http://127.0.0.1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, ".m3u8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 742
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/util/DefaultConfig;->noAd(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 743
    invoke-virtual {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->goPlayUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 744
    return-void

    .line 746
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "echo-playM3u8:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 747
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v0, p1, p2}, Lcom/github/tvbox/osc/player/controller/VodController;->playM3u8(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 748
    return-void

    .line 739
    :cond_4
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->goPlayUrl(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 740
    return-void
.end method

.method public refresh(Lcom/github/tvbox/osc/event/RefreshEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/github/tvbox/osc/event/RefreshEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 210
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    .line 211
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iget-object v1, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setTextSize(F)V

    .line 213
    :cond_0
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/16 v1, 0x12

    if-ne v0, v1, :cond_2

    .line 214
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setDanmuViewSettings(Z)V

    goto :goto_2

    .line 215
    :cond_2
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/16 v1, 0x13

    if-ne v0, v1, :cond_4

    .line 216
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    :cond_3
    const-string v0, ""

    :goto_1
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->checkDanmu(Ljava/lang/String;)V

    .line 218
    :cond_4
    :goto_2
    return-void
.end method

.method public refreshPlayerLayout()V
    .locals 4

    .line 1754
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-nez v0, :cond_0

    return-void

    .line 1755
    :cond_0
    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/MyVideoView;->post(Ljava/lang/Runnable;)Z

    .line 1758
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$$ExternalSyntheticLambda2;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    const-wide/16 v2, 0xb4

    invoke-virtual {v0, v1, v2, v3}, Lcom/github/tvbox/osc/player/MyVideoView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1761
    return-void
.end method

.method selectMyAudioTrack()V
    .locals 7

    .line 562
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v0

    .line 563
    .local v0, "mediaPlayer":Lxyz/doikki/videoplayer/player/AbstractPlayer;
    const/4 v1, 0x0

    .line 564
    .local v1, "trackInfo":Lcom/github/tvbox/osc/player/TrackInfo;
    instance-of v2, v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    if-eqz v2, :cond_0

    .line 565
    move-object v2, v0

    check-cast v2, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;

    move-result-object v1

    .line 567
    :cond_0
    instance-of v2, v0, Lcom/github/tvbox/osc/player/ExoPlayer;

    if-eqz v2, :cond_1

    .line 568
    move-object v2, v0

    check-cast v2, Lcom/github/tvbox/osc/player/ExoPlayer;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/ExoPlayer;->getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;

    move-result-object v1

    .line 570
    :cond_1
    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 571
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const-string v4, "\u6ca1\u6709\u97f3\u8f68"

    invoke-static {v3, v4, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 572
    return-void

    .line 574
    :cond_2
    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v3

    .line 575
    .local v3, "bean":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/player/TrackInfoBean;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_3

    return-void

    .line 576
    :cond_3
    new-instance v4, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;-><init>(Landroid/content/Context;)V

    .line 577
    .local v4, "dialog":Lcom/github/tvbox/osc/ui/dialog/SelectDialog;, "Lcom/github/tvbox/osc/ui/dialog/SelectDialog<Lcom/github/tvbox/osc/player/TrackInfoBean;>;"
    const-string v5, "\u5207\u6362\u97f3\u8f68"

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setTip(Ljava/lang/String;)V

    .line 578
    new-instance v5, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$10;

    invoke-direct {v5, p0, v3, v0, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$10;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/util/List;Lxyz/doikki/videoplayer/player/AbstractPlayer;Lcom/github/tvbox/osc/ui/dialog/SelectDialog;)V

    new-instance v6, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$11;

    invoke-direct {v6, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$11;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    .line 616
    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudioSelected(Z)I

    move-result v2

    .line 578
    invoke-virtual {v4, v5, v6, v3, v2}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setAdapter(Lcom/github/tvbox/osc/ui/adapter/SelectDialogAdapter$SelectDialogInterface;Landroidx/recyclerview/widget/DiffUtil$ItemCallback;Ljava/util/List;I)V

    .line 617
    invoke-virtual {v4}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->show()V

    .line 618
    return-void
.end method

.method selectMyInternalSubtitle()V
    .locals 7

    .line 621
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->getMediaPlayer()Lxyz/doikki/videoplayer/player/AbstractPlayer;

    move-result-object v0

    .line 622
    .local v0, "mediaPlayer":Lxyz/doikki/videoplayer/player/AbstractPlayer;
    instance-of v1, v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    if-nez v1, :cond_0

    .line 623
    return-void

    .line 625
    :cond_0
    const/4 v1, 0x0

    .line 626
    .local v1, "trackInfo":Lcom/github/tvbox/osc/player/TrackInfo;
    move-object v2, v0

    check-cast v2, Lcom/github/tvbox/osc/player/IjkMediaPlayer;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;

    move-result-object v1

    .line 627
    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 628
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mContext:Landroid/content/Context;

    const-string v4, "\u6ca1\u6709\u5185\u7f6e\u5b57\u5e55"

    invoke-static {v3, v4, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 629
    return-void

    .line 631
    :cond_1
    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitle()Ljava/util/List;

    move-result-object v3

    .line 632
    .local v3, "bean":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/player/TrackInfoBean;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_2

    return-void

    .line 633
    :cond_2
    new-instance v4, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;-><init>(Landroid/content/Context;)V

    .line 634
    .local v4, "dialog":Lcom/github/tvbox/osc/ui/dialog/SelectDialog;, "Lcom/github/tvbox/osc/ui/dialog/SelectDialog<Lcom/github/tvbox/osc/player/TrackInfoBean;>;"
    const-string v5, "\u5207\u6362\u5185\u7f6e\u5b57\u5e55"

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setTip(Ljava/lang/String;)V

    .line 635
    new-instance v5, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$12;

    invoke-direct {v5, p0, v3, v0, v4}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$12;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/util/List;Lxyz/doikki/videoplayer/player/AbstractPlayer;Lcom/github/tvbox/osc/ui/dialog/SelectDialog;)V

    new-instance v6, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$13;

    invoke-direct {v6, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$13;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    .line 675
    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitleSelected(Z)I

    move-result v2

    .line 635
    invoke-virtual {v4, v5, v6, v3, v2}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setAdapter(Lcom/github/tvbox/osc/ui/adapter/SelectDialogAdapter$SelectDialogInterface;Landroidx/recyclerview/widget/DiffUtil$ItemCallback;Ljava/util/List;I)V

    .line 676
    invoke-virtual {v4}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->show()V

    .line 677
    return-void
.end method

.method selectMySubtitle()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 474
    new-instance v0, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;-><init>(Landroid/content/Context;)V

    .line 475
    .local v0, "subtitleDialog":Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodPlayerCfg:Lorg/json/JSONObject;

    const-string v2, "pl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 476
    .local v1, "playerType":I
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v2, v2, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    iget-boolean v2, v2, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->hasInternal:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 477
    iget-object v2, v0, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;->selectInternal:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 479
    :cond_0
    iget-object v2, v0, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;->selectInternal:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 481
    :goto_0
    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$7;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$7;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;->setSubtitleViewListener(Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog$SubtitleViewListener;)V

    .line 499
    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$8;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$8;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;->setSearchSubtitleListener(Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog$SearchSubtitleListener;)V

    .line 526
    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$9;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$9;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;->setLocalFileChooserListener(Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog$LocalFileChooserListener;)V

    .line 543
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/dialog/SubtitleDialog;->show()V

    .line 544
    return-void
.end method

.method public setAutoSwitchLineEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 1740
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowAutoSwitchLine:Z

    .line 1741
    if-nez p1, :cond_0

    .line 1742
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1743
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1745
    :cond_0
    return-void
.end method

.method public setData(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bundle"
        }
    .end annotation

    .line 1019
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/base/App;->getVodInfo()Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    .line 1020
    const-string v0, "sourceKey"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    .line 1021
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceBean:Lcom/github/tvbox/osc/bean/SourceBean;

    .line 1022
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->sourceKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->setCurrentPlaySourceKey(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/github/tvbox/osc/util/PlayerChoice;->begin(Ljava/lang/Object;)V
    return-void
.end method

.method public setExitingPreview(Z)V
    .locals 0
    .param p1, "exitingPreview"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "exitingPreview"
        }
    .end annotation

    .line 1092
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->exitingPreview:Z

    .line 1093
    return-void
.end method

.method public setPlayTitle(Z)V
    .locals 4
    .param p1, "show"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "show"
        }
    .end annotation

    .line 1471
    if-eqz p1, :cond_1

    .line 1472
    const-string v0, ""

    .line 1473
    .local v0, "playTitleInfo":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_0

    .line 1474
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 1475
    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 1474
    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->displayEpisodeName(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1477
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/player/controller/VodController;->setTitle(Ljava/lang/String;)V

    .line 1478
    .end local v0    # "playTitleInfo":Ljava/lang/String;
    goto :goto_0

    .line 1479
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/controller/VodController;->setTitle(Ljava/lang/String;)V

    .line 1481
    :goto_0
    return-void
.end method

.method public setPreviewMode(Z)V
    .locals 1
    .param p1, "previewMode"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "previewMode"
        }
    .end annotation

    .line 1748
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    if-eqz v0, :cond_0

    .line 1749
    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/player/controller/VodController;->setPreviewMode(Z)V

    .line 1751
    :cond_0
    return-void
.end method

.method setSubtitle(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "path"
        }
    .end annotation

    .line 465
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 467
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setVisibility(I)V

    .line 468
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setSubtitlePath(Ljava/lang/String;)V

    .line 469
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setVisibility(I)V

    .line 471
    :cond_0
    return-void
.end method

.method setSubtitleViewTextStyle(I)V
    .locals 3
    .param p1, "style"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "style"
        }
    .end annotation

    .line 548
    if-nez p1, :cond_0

    .line 549
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060055

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    .line 550
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 551
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mController:Lcom/github/tvbox/osc/player/controller/VodController;

    iget-object v0, v0, Lcom/github/tvbox/osc/player/controller/VodController;->mSubtitleView:Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060053

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/subtitle/widget/SimpleSubtitleView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 553
    :cond_1
    :goto_0
    return-void
.end method

.method setTip(Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "loading"    # Z
    .param p3, "err"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "msg",
            "loading",
            "err"
        }
    .end annotation

    .line 680
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 681
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$14;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$14;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;ZZ)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 690
    return-void
.end method

.method startResolvePlayUrlTimeout()V
    .locals 4

    .line 1710
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1711
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getResolvePlayUrlTimeoutMs()J

    move-result-wide v1

    const/16 v3, 0x65

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1712
    return-void
.end method

.method startSwitchLinePlayTimeout()V
    .locals 4

    .line 1720
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowAutoSwitchLine:Z

    if-nez v0, :cond_0

    .line 1721
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1722
    return-void

    .line 1724
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->cancelPlayTimeout()V

    .line 1725
    const-string v0, "echo-switchLinePlay start timeout"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1726
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x66

    .line 1727
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isCloudPlayback()Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/16 v2, 0x61a8

    goto :goto_0

    :cond_1
    const-wide/16 v2, 0x3a98

    .line 1726
    :goto_0
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1728
    return-void
.end method

.method stopLoadWebView(Z)V
    .locals 2
    .param p1, "destroy"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "destroy"
        }
    .end annotation

    .line 2490
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 2491
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 2492
    :cond_1
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$29;

    invoke-direct {v1, p0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$29;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Z)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2518
    return-void
.end method

.method stopParse()V
    .locals 2

    .line 2145
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 2146
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopLoadWebView(Z)V

    .line 2147
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "play"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 2148
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "json_jx"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 2149
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseThreadPool:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 2151
    :try_start_0
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 2152
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->parseThreadPool:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2155
    goto :goto_0

    .line 2153
    :catchall_0
    move-exception v0

    .line 2154
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2157
    .end local v0    # "th":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-void
.end method

.method tryNextLine()Z
    .locals 19

    .line 1274
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_9

    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto/16 :goto_5

    .line 1280
    :cond_0
    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 1281
    .local v1, "currentFlag":Ljava/lang/String;
    iget-object v3, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 1282
    .local v3, "currentIndex":I
    invoke-direct {v0, v1, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getCurrentSeries(Ljava/lang/String;I)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v4

    .line 1283
    .local v4, "currentSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1284
    iget-object v5, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v5, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1286
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getLineFlagsInDisplayOrder()Ljava/util/List;

    move-result-object v5

    .line 1287
    .local v5, "lineFlags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0, v5, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findLineFlagIndex(Ljava/util/List;Ljava/lang/String;)I

    move-result v6

    .line 1288
    .local v6, "currentLineIndex":I
    if-ltz v6, :cond_2

    add-int/lit8 v7, v6, 0x1

    goto :goto_0

    :cond_2
    const/4 v7, 0x0

    .line 1290
    .local v7, "startLineIndex":I
    :goto_0
    const/4 v8, 0x0

    .line 1291
    .local v8, "nextFlag":Ljava/lang/String;
    const/4 v9, 0x0

    .line 1292
    .local v9, "nextIndex":I
    move v10, v7

    .local v10, "i":I
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_4

    .line 1293
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 1294
    .local v11, "flag":Ljava/lang/String;
    iget-object v12, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v12, v12, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v12, v11}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 1295
    .local v12, "seriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    iget-object v13, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v13, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_3

    if-eqz v12, :cond_3

    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_3

    .line 1296
    move-object v8, v11

    .line 1297
    invoke-direct {v0, v4, v12, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->findSameEpisodeIndex(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I

    move-result v9

    .line 1298
    goto :goto_2

    .line 1292
    .end local v11    # "flag":Ljava/lang/String;
    .end local v12    # "seriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 1301
    .end local v10    # "i":I
    :cond_4
    :goto_2
    if-nez v8, :cond_5

    .line 1303
    const-string v10, "echo-autoRetry all lines exhausted"

    invoke-static {v10}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1304
    iget-object v10, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->clear()V

    .line 1305
    iput v2, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    .line 1306
    return v2

    .line 1308
    :cond_5
    move-object v10, v8

    .line 1309
    .local v10, "flagToSwitch":Ljava/lang/String;
    iget-object v11, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->progressKey:Ljava/lang/String;

    .line 1310
    .local v11, "preProgressKey":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    const-wide/16 v13, 0x0

    if-eqz v12, :cond_6

    move-wide v15, v13

    goto :goto_3

    :cond_6
    invoke-virtual {v0, v11}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v15

    :goto_3
    move-wide/from16 v17, v15

    .line 1311
    .local v17, "savedProgress":J
    iget-object v12, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVideoView:Lcom/github/tvbox/osc/player/MyVideoView;

    if-nez v12, :cond_7

    goto :goto_4

    :cond_7
    invoke-virtual {v12}, Lcom/github/tvbox/osc/player/MyVideoView;->getCurrentPosition()J

    move-result-wide v13

    :goto_4
    move v15, v3

    move-wide/from16 v2, v17

    .end local v3    # "currentIndex":I
    .end local v17    # "savedProgress":J
    .local v2, "savedProgress":J
    .local v15, "currentIndex":I
    invoke-static {v2, v3, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .line 1312
    .local v13, "preProgress":J
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v17, v1

    .end local v1    # "currentFlag":Ljava/lang/String;
    .local v17, "currentFlag":Ljava/lang/String;
    const-string v1, "echo-autoRetry switch line: "

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " -> "

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1314
    invoke-virtual/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1315
    invoke-virtual/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    new-instance v12, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$21;

    invoke-direct {v12, v0, v10}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$21;-><init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;)V

    invoke-virtual {v1, v12}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1323
    :cond_8
    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iput-object v10, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 1324
    iget-object v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->mVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iput v9, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 1325
    const/4 v1, 0x0

    iput v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    .line 1326
    const/4 v12, 0x1

    iput-boolean v12, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    .line 1327
    iput-boolean v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    .line 1328
    iput-object v11, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgressKey:Ljava/lang/String;

    .line 1329
    iput-wide v13, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->inheritProgress:J

    .line 1330
    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->play(Z)V

    .line 1331
    return v12

    .line 1274
    .end local v2    # "savedProgress":J
    .end local v4    # "currentSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v5    # "lineFlags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "currentLineIndex":I
    .end local v7    # "startLineIndex":I
    .end local v8    # "nextFlag":Ljava/lang/String;
    .end local v9    # "nextIndex":I
    .end local v10    # "flagToSwitch":Ljava/lang/String;
    .end local v11    # "preProgressKey":Ljava/lang/String;
    .end local v13    # "preProgress":J
    .end local v15    # "currentIndex":I
    .end local v17    # "currentFlag":Ljava/lang/String;
    :cond_9
    const/4 v1, 0x0

    .line 1275
    :goto_5
    iput v1, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    .line 1276
    iget-object v2, v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 1277
    return v1
.end method

.method tryNextLineIfEnabled()Z
    .locals 3

    .line 1264
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowAutoSwitchLine:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v2, "auto_switch_line"

    invoke-static {v2, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->tryNextLine()Z

    move-result v0

    return v0

    .line 1265
    :cond_0
    const-string v0, "echo-autoRetry line switching disabled"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1266
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->autoRetryCount:I

    .line 1267
    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->allowSwitchPlayer:Z

    .line 1268
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hasAutoSwitchedPlayer:Z

    .line 1269
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->triedLineFlags:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 1270
    return v0
.end method
