.class public Lcom/github/tvbox/osc/api/ApiConfig;
.super Ljava/lang/Object;
.source "ApiConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;,
        Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;,
        Lcom/github/tvbox/osc/api/ApiConfig$ConfigFetchCallback;,
        Lcom/github/tvbox/osc/api/ApiConfig$JarDownloadCallback;,
        Lcom/github/tvbox/osc/api/ApiConfig$FastParseCallback;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final JAR_INIT_TIMEOUT_MS:J = 0x7530L

.field private static final LOAD_JAR_MAX_RETRY:I = 0x1

.field private static instance:Lcom/github/tvbox/osc/api/ApiConfig;

.field private static jarCache:Ljava/lang/String;


# instance fields
.field private TempKey:Ljava/lang/String;

.field private final configLoadExecutor:Ljava/util/concurrent/ExecutorService;

.field private currentLivePyKey:Ljava/lang/String;

.field private currentLiveSpider:Ljava/lang/String;

.field private currentPlaySourceKey:Ljava/lang/String;

.field private currentPyKey:Ljava/lang/String;

.field private danmaku:Ljava/lang/String;

.field private final danmuSearchExecutor:Ljava/util/concurrent/ExecutorService;

.field private final emptyHome:Lcom/github/tvbox/osc/bean/SourceBean;

.field private final gson:Lcom/google/gson/Gson;

.field private ijkCodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/IJKCode;",
            ">;"
        }
    .end annotation
.end field

.field private final jarLoadExecutor:Ljava/util/concurrent/ExecutorService;

.field private final jarLoader:Lcom/github/catvod/crawler/JarLoader;

.field private final jsLoader:Lcom/github/catvod/crawler/JsLoader;

.field private final liveChannelGroupList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/LiveChannelGroup;",
            ">;"
        }
    .end annotation
.end field

.field private final liveSettingGroupList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/LiveSettingGroup;",
            ">;"
        }
    .end annotation
.end field

.field private liveSpider:Ljava/lang/String;

.field private loadedLiveConfigUrl:Ljava/lang/String;

.field private mDefaultParse:Lcom/github/tvbox/osc/bean/ParseBean;

.field private mHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

.field private final mainHandler:Landroid/os/Handler;

.field private myHosts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final parseBeanList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/ParseBean;",
            ">;"
        }
    .end annotation
.end field

.field private final pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

.field private searchSourceBeanList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/SourceBean;",
            ">;"
        }
    .end annotation
.end field

.field private final sourceBeanList:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/github/tvbox/osc/bean/SourceBean;",
            ">;"
        }
    .end annotation
.end field

.field private spider:Ljava/lang/String;

.field private final userAgent:Ljava/lang/String;

.field private vipParseFlags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public wallpaper:Ljava/lang/String;

.field private final warmedSearchSpiderKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 77
    nop

    .line 876
    const-string v0, "true"

    sput-object v0, Lcom/github/tvbox/osc/api/ApiConfig;->jarCache:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    .line 88
    const-string v1, ""

    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    .line 89
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPlaySourceKey:Ljava/lang/String;

    .line 91
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->loadedLiveConfigUrl:Ljava/lang/String;

    .line 92
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->wallpaper:Ljava/lang/String;

    .line 93
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->danmaku:Ljava/lang/String;

    .line 95
    new-instance v2, Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-direct {v2}, Lcom/github/tvbox/osc/bean/SourceBean;-><init>()V

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->emptyHome:Lcom/github/tvbox/osc/bean/SourceBean;

    .line 97
    new-instance v2, Lcom/github/catvod/crawler/JarLoader;

    invoke-direct {v2}, Lcom/github/catvod/crawler/JarLoader;-><init>()V

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    .line 98
    new-instance v2, Lcom/github/catvod/crawler/JsLoader;

    invoke-direct {v2}, Lcom/github/catvod/crawler/JsLoader;-><init>()V

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    .line 99
    new-instance v2, Lcom/github/catvod/crawler/pyLoader;

    invoke-direct {v2}, Lcom/github/catvod/crawler/pyLoader;-><init>()V

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    .line 101
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mainHandler:Landroid/os/Handler;

    .line 102
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->configLoadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 106
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 107
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->danmuSearchExecutor:Ljava/util/concurrent/ExecutorService;

    .line 108
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->warmedSearchSpiderKeys:Ljava/util/Set;

    .line 110
    const-string v2, "okhttp/3.15"

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->userAgent:Ljava/lang/String;

    .line 175
    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->TempKey:Ljava/lang/String;

    .line 1208
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    .line 1257
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    .line 114
    invoke-virtual {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->clearLoader()V

    .line 115
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    .line 119
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->gson:Lcom/google/gson/Gson;

    .line 120
    new-instance v0, Lcom/google/gson/JsonArray;

    invoke-direct {v0}, Lcom/google/gson/JsonArray;-><init>()V

    const-string v1, "live_group_list"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 121
    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->loadDefaultConfig()V

    .line 122
    return-void
.end method

.method public static FindResult(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "configKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "json",
            "configKey"
        }
    .end annotation

    .line 136
    const-string v0, "0"

    move-object v1, p0

    .line 138
    .local v1, "content":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Lcom/github/tvbox/osc/util/AES;->isJson(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 139
    :cond_0
    const-string v2, "[A-Za-z0-9]{8}\\*\\*"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/RegexUtils;->getPattern(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 140
    .local v2, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 141
    .local v3, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 142
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0xa

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    move-object v1, v4

    .line 143
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v1, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    move-object v1, v4

    .line 145
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    move-object v1, v4

    .line 146
    const-string v4, "2423"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 147
    const-string v4, "\\s+"

    const-string v5, ""

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v1, v4

    .line 148
    const-string v4, "2324"

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1a

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 149
    .local v4, "data":Ljava/lang/String;
    new-instance v5, Ljava/lang/String;

    invoke-static {v1}, Lcom/github/tvbox/osc/util/AES;->toBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    move-object v1, v5

    .line 150
    const-string v5, "$#"

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    const-string v6, "#$"

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v5, v0, v6}, Lcom/github/tvbox/osc/util/AES;->rightPadding(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    .line 151
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0xd

    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v0, v6}, Lcom/github/tvbox/osc/util/AES;->rightPadding(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "iv":Ljava/lang/String;
    invoke-static {v4, v5, v0}, Lcom/github/tvbox/osc/util/AES;->CBC(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object p0, v6

    .line 153
    .end local v0    # "iv":Ljava/lang/String;
    .end local v4    # "data":Ljava/lang/String;
    .end local v5    # "key":Ljava/lang/String;
    goto :goto_0

    :cond_2
    if-eqz p1, :cond_3

    invoke-static {v1}, Lcom/github/tvbox/osc/util/AES;->isJson(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 154
    invoke-static {v1, p1}, Lcom/github/tvbox/osc/util/AES;->ECB(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object p0, v0

    goto :goto_0

    .line 157
    :cond_3
    move-object p0, v1

    .line 161
    .end local v2    # "pattern":Ljava/util/regex/Pattern;
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    :goto_0
    goto :goto_1

    .line 159
    :catch_0
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 162
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-object p0
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->switchApiCollectionIfNeeded(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->clearApiLinesIfUnmatched(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/github/tvbox/osc/api/ApiConfig;->updateJarRuntime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->readableJarError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lcom/github/tvbox/osc/api/ApiConfig;J)Lokhttp3/OkHttpClient;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # J

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->importHttpClient(J)Lokhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/io/Closeable;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/io/Closeable;

    .line 77
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->closeQuietly(Ljava/io/Closeable;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/github/tvbox/osc/api/ApiConfig;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;

    .line 77
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1500(Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 77
    invoke-static {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->getImgJar(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/io/File;Ljava/io/File;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/io/File;
    .param p2, "x2"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->replaceCache(Ljava/io/File;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Lcom/github/tvbox/osc/api/ApiConfig;ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;I)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    .param p4, "x4"    # I

    .line 77
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJar(ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;I)V

    return-void
.end method

.method static synthetic access$1900(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/io/File;
    .param p2, "x2"    # Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJarAsync(Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V

    return-void
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->parseJson(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/github/tvbox/osc/api/ApiConfig;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;

    .line 77
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->warmedSearchSpiderKeys:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 77
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->readConfigFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveConfigContent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/github/tvbox/osc/api/ApiConfig;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;

    .line 77
    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->hasLiveConfigResult()Z

    move-result v0

    return v0
.end method

.method static synthetic access$602(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    iput-object p1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->loadedLiveConfigUrl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveConfigContent(Ljava/lang/String;Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$800(Lcom/github/tvbox/osc/api/ApiConfig;)Lcom/github/catvod/crawler/JarLoader;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;

    .line 77
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    return-object v0
.end method

.method static synthetic access$900(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/ApiConfig;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->safeJarSource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addSuperParse()V
    .locals 3

    .line 1967
    new-instance v0, Lcom/github/tvbox/osc/bean/ParseBean;

    invoke-direct {v0}, Lcom/github/tvbox/osc/bean/ParseBean;-><init>()V

    .line 1968
    .local v0, "superPb":Lcom/github/tvbox/osc/bean/ParseBean;
    const-string v1, "\u8d85\u7ea7\u89e3\u6790"

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setName(Ljava/lang/String;)V

    .line 1969
    const-string v1, "SuperParse"

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setUrl(Ljava/lang/String;)V

    .line 1970
    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setExt(Ljava/lang/String;)V

    .line 1971
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setType(I)V

    .line 1972
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1973
    return-void
.end method

.method private clearApiLinesIfUnmatched(Ljava/lang/String;)V
    .locals 4
    .param p1, "apiUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apiUrl"
        }
    .end annotation

    .line 864
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "api_line_list"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 865
    .local v0, "apiLines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 866
    return-void

    .line 868
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 869
    .local v2, "apiLine":Ljava/lang/String;
    invoke-static {v2}, Lcom/github/tvbox/osc/util/HistoryHelper;->getApiLineUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 870
    return-void

    .line 872
    .end local v2    # "apiLine":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 873
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/util/HistoryHelper;->clearApiLineList()V

    .line 874
    return-void
.end method

.method private closeQuietly(Ljava/io/Closeable;)V
    .locals 1
    .param p1, "closeable"    # Ljava/io/Closeable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "closeable"
        }
    .end annotation

    .line 654
    if-eqz p1, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 655
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 656
    :cond_0
    :goto_0
    nop

    .line 657
    :goto_1
    return-void
.end method

.method private configUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "apiUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apiUrl"
        }
    .end annotation

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->TempKey:Ljava/lang/String;

    .line 178
    const-string v0, ""

    .local v0, "configUrl":Ljava/lang/String;
    const-string v1, ";pk;"

    .line 179
    .local v1, "pk":Ljava/lang/String;
    const-string v2, "file://"

    const-string v3, "clan://localhost/"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 180
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, "http://"

    const-string v4, "http"

    const-string v5, "clan"

    if-eqz v2, :cond_2

    .line 181
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "a":[Ljava/lang/String;
    const/4 v6, 0x1

    aget-object v6, v2, v6

    iput-object v6, p0, Lcom/github/tvbox/osc/api/ApiConfig;->TempKey:Ljava/lang/String;

    .line 183
    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_0

    .line 184
    aget-object v3, v2, v6

    invoke-virtual {p0, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->clanToAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 185
    :cond_0
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 186
    aget-object v0, v2, v6

    goto :goto_0

    .line 188
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v2, v6

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    .end local v2    # "a":[Ljava/lang/String;
    :goto_0
    goto :goto_1

    :cond_2
    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 191
    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->clanToAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 192
    :cond_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 193
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 195
    :cond_4
    move-object v0, p1

    .line 197
    :goto_1
    return-object v0
.end method

.method private downloadJarAsync(Ljava/lang/String;ZLjava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarDownloadCallback;)V
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "isJarInImg"    # Z
    .param p3, "cache"    # Ljava/io/File;
    .param p4, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$JarDownloadCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "url",
            "isJarInImg",
            "cache",
            "callback"
        }
    .end annotation

    .line 556
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoadExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lcom/github/tvbox/osc/api/ApiConfig$7;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p3

    move-object v4, p1

    move v5, p2

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/api/ApiConfig$7;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/io/File;Ljava/lang/String;ZLcom/github/tvbox/osc/api/ApiConfig$JarDownloadCallback;)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 624
    return-void
.end method

.method private extractLiveTextEpg(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "content"
        }
    .end annotation

    .line 1183
    const-string v0, ""

    if-nez p1, :cond_0

    return-object v0

    .line 1184
    :cond_0
    const-string v1, "\r\n"

    const-string v2, "\n"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0xd

    const/16 v4, 0xa

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 1185
    .local v1, "text":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1186
    .local v2, "lines":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_5

    aget-object v5, v2, v4

    .line 1187
    .local v5, "line":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 1188
    const-string v6, "\ufeff"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 1189
    :cond_1
    const-string v6, "#EXTM3U"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1186
    .end local v5    # "line":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1190
    .restart local v5    # "line":Ljava/lang/String;
    :cond_2
    const-string v0, "x-tvg-url"

    invoke-direct {p0, v5, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->extractQuotedAttr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1191
    .local v0, "epg":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "tvg-url"

    invoke-direct {p0, v5, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->extractQuotedAttr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1192
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "url-tvg"

    invoke-direct {p0, v5, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->extractQuotedAttr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1193
    :cond_4
    return-object v0

    .line 1195
    .end local v0    # "epg":Ljava/lang/String;
    .end local v5    # "line":Ljava/lang/String;
    :cond_5
    return-object v0
.end method

.method private extractQuotedAttr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "line",
            "key"
        }
    .end annotation

    .line 1199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1200
    .local v0, "token":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 1201
    .local v1, "start":I
    const-string v2, ""

    if-gez v1, :cond_0

    return-object v2

    .line 1202
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    .line 1203
    const-string v3, "\""

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 1204
    .local v3, "end":I
    if-gez v3, :cond_1

    return-object v2

    .line 1205
    :cond_1
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private fetchConfigAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$ConfigFetchCallback;)V
    .locals 8
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "requestUrl"    # Ljava/lang/String;
    .param p3, "configKey"    # Ljava/lang/String;
    .param p4, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$ConfigFetchCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            "apiUrl",
            "requestUrl",
            "configKey",
            "callback"
        }
    .end annotation

    .line 475
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->configLoadExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lcom/github/tvbox/osc/api/ApiConfig$4;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p1

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/api/ApiConfig$4;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$ConfigFetchCallback;)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 518
    return-void
.end method

.method private findLiveChannel(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/github/tvbox/osc/bean/LiveChannelItem;
    .locals 3
    .param p2, "channelName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "channelItems",
            "channelName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/github/tvbox/osc/bean/LiveChannelItem;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/github/tvbox/osc/bean/LiveChannelItem;"
        }
    .end annotation

    .line 1402
    .local p1, "channelItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveChannelItem;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/LiveChannelItem;

    .line 1403
    .local v1, "item":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    if-eqz p2, :cond_0

    invoke-virtual {v1}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->getChannelName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 1404
    .end local v1    # "item":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    :cond_0
    goto :goto_0

    .line 1405
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static get()Lcom/github/tvbox/osc/api/ApiConfig;
    .locals 2

    .line 125
    sget-object v0, Lcom/github/tvbox/osc/api/ApiConfig;->instance:Lcom/github/tvbox/osc/api/ApiConfig;

    if-nez v0, :cond_1

    .line 126
    const-class v0, Lcom/github/tvbox/osc/api/ApiConfig;

    monitor-enter v0

    .line 127
    :try_start_0
    sget-object v1, Lcom/github/tvbox/osc/api/ApiConfig;->instance:Lcom/github/tvbox/osc/api/ApiConfig;

    if-nez v1, :cond_0

    .line 128
    new-instance v1, Lcom/github/tvbox/osc/api/ApiConfig;

    invoke-direct {v1}, Lcom/github/tvbox/osc/api/ApiConfig;-><init>()V

    sput-object v1, Lcom/github/tvbox/osc/api/ApiConfig;->instance:Lcom/github/tvbox/osc/api/ApiConfig;

    .line 130
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 132
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/tvbox/osc/api/ApiConfig;->instance:Lcom/github/tvbox/osc/api/ApiConfig;

    return-object v0
.end method

.method private getCurrentProxySource(Ljava/util/Map;)Lcom/github/tvbox/osc/bean/SourceBean;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "param"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/github/tvbox/osc/bean/SourceBean;"
        }
    .end annotation

    .line 1756
    .local p1, "param":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "siteKey"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1757
    .local v1, "siteKey":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1758
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPlaySourceKey:Ljava/lang/String;

    .line 1759
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1761
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    .line 1762
    .local v0, "sourceBean":Lcom/github/tvbox/osc/bean/SourceBean;
    :goto_0
    if-nez v0, :cond_2

    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v2, v0

    :goto_1
    return-object v2
.end method

.method private getCurrentPyKey()Ljava/lang/String;
    .locals 5

    .line 1770
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getCurrentProxySource(Ljava/util/Map;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    .line 1771
    .local v0, "sourceBean":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".py"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1772
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1773
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    .line 1774
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getExt()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v1, v3, v4}, Lcom/github/catvod/crawler/python/IPyLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    .line 1775
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/github/catvod/crawler/python/IPyLoader;->setRecentPyKey(Ljava/lang/String;)V

    .line 1777
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    return-object v1

    .line 1779
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    return-object v1
.end method

.method private static getImgJar(Ljava/lang/String;)[B
    .locals 3
    .param p0, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "body"
        }
    .end annotation

    .line 166
    const-string v0, "[A-Za-z0-9]{8}\\*\\*"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/RegexUtils;->getPattern(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 167
    .local v0, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 168
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0xa

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 170
    const/4 v2, 0x0

    invoke-static {p0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    return-object v2

    .line 172
    :cond_0
    const-string v2, ""

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    return-object v2
.end method

.method public static getLiveGroupIndex()I
    .locals 2

    .line 349
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->getLiveGroupIndexKey()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getLiveGroupIndexKey()Ljava/lang/String;
    .locals 3

    .line 341
    const-string v0, "live_api_url"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 342
    .local v0, "liveApiUrl":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 345
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "live_group_index_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 343
    :cond_1
    :goto_0
    const-string v1, "live_group_index"

    return-object v1
.end method

.method private hasLiveConfigResult()Z
    .locals 1

    .line 331
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private importHttpClient(J)Lokhttp3/OkHttpClient;
    .locals 5
    .param p1, "readSeconds"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "readSeconds"
        }
    .end annotation

    .line 631
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 632
    .local v0, "base":Lokhttp3/OkHttpClient;
    if-nez v0, :cond_0

    invoke-static {}, Lcom/github/catvod/net/OkHttp;->client()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 633
    :cond_0
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    const-wide/16 v2, 0x8

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 634
    invoke-virtual {v1, v2, v3, v4}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 635
    invoke-virtual {v1, p1, p2, v2}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 636
    invoke-virtual {v1, p1, p2, v2}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 637
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 638
    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 633
    return-object v1
.end method

.method private initLiveSettings()V
    .locals 15

    .line 1259
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "\u7ebf\u8def\u9009\u62e9"

    const-string v2, "\u753b\u9762\u6bd4\u4f8b"

    const-string v3, "\u64ad\u653e\u89e3\u7801"

    const-string v4, "\u8d85\u65f6\u6362\u6e90"

    const-string v5, "\u504f\u597d\u8bbe\u7f6e"

    const-string v6, "\u591a\u6e90\u5207\u6362"

    const-string v7, "\u914d\u7f6e\u5207\u6362"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1260
    .local v0, "groupNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1261
    .local v1, "itemsArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1262
    .local v2, "sourceItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    const-string v4, "\u9ed8\u8ba4"

    const-string v5, "16:9"

    const-string v6, "4:3"

    const-string v7, "\u586b\u5145"

    const-string v8, "\u539f\u59cb"

    const-string v9, "\u88c1\u526a"

    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1263
    .local v3, "scaleItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    const-string v5, "\u7cfb\u7edf"

    const-string v6, "ijk\u786c\u89e3"

    const-string v7, "ijk\u8f6f\u89e3"

    const-string v8, "exo"

    filled-new-array {v5, v6, v7, v8}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1264
    .local v4, "playerDecoderItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/ArrayList;

    const-string v6, "5s"

    const-string v7, "10s"

    const-string v8, "15s"

    const-string v9, "20s"

    const-string v10, "25s"

    const-string v11, "30s"

    filled-new-array/range {v6 .. v11}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1265
    .local v5, "timeoutItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    const-string v7, "\u663e\u793a\u65f6\u95f4"

    const-string v8, "\u663e\u793a\u7f51\u901f"

    const-string v9, "\u663e\u5206\u8fa8\u7387"

    const-string v10, "\u6362\u53f0\u53cd\u8f6c"

    const-string v11, "\u8de8\u9009\u5206\u7c7b"

    filled-new-array {v7, v8, v9, v10, v11}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1266
    .local v6, "personalSettingItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1267
    .local v7, "yumItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1269
    .local v8, "liveApiHistoryItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1270
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1271
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1272
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1273
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1274
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1275
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1277
    iget-object v9, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->clear()V

    .line 1278
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v9, v10, :cond_1

    .line 1279
    new-instance v10, Lcom/github/tvbox/osc/bean/LiveSettingGroup;

    invoke-direct {v10}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;-><init>()V

    .line 1280
    .local v10, "liveSettingGroup":Lcom/github/tvbox/osc/bean/LiveSettingGroup;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1281
    .local v11, "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    invoke-virtual {v10, v9}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;->setGroupIndex(I)V

    .line 1282
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v10, v12}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;->setGroupName(Ljava/lang/String;)V

    .line 1283
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_1
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v12, v13, :cond_0

    .line 1284
    new-instance v13, Lcom/github/tvbox/osc/bean/LiveSettingItem;

    invoke-direct {v13}, Lcom/github/tvbox/osc/bean/LiveSettingItem;-><init>()V

    .line 1285
    .local v13, "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    invoke-virtual {v13, v12}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemIndex(I)V

    .line 1286
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/ArrayList;

    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v13, v14}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemName(Ljava/lang/String;)V

    .line 1287
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1283
    .end local v13    # "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 1289
    .end local v12    # "j":I
    :cond_0
    invoke-virtual {v10, v11}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;->setLiveSettingItems(Ljava/util/ArrayList;)V

    .line 1290
    iget-object v12, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1278
    .end local v10    # "liveSettingGroup":Lcom/github/tvbox/osc/bean/LiveSettingGroup;
    .end local v11    # "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1292
    .end local v9    # "i":I
    :cond_1
    invoke-virtual {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->refreshLiveApiHistoryItems()V

    .line 1293
    return-void
.end method

.method private isLiveJsonContent(Ljava/lang/String;)Z
    .locals 2
    .param p1, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "content"
        }
    .end annotation

    .line 1161
    if-nez p1, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1162
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1163
    .local v0, "text":Ljava/lang/String;
    const-string v1, "\ufeff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1164
    :cond_1
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private isLiveSpiderApi(Ljava/lang/String;)Z
    .locals 1
    .param p1, "api"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "api"
        }
    .end annotation

    .line 1664
    const-string v0, ".py"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".js"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private loadDefaultConfig()V
    .locals 16

    .line 1087
    move-object/from16 v0, p0

    const-string v1, "{\"ijk\":[{\"options\":[{\"name\":\"opensles\",\"category\":4,\"value\":\"0\"},{\"name\":\"framedrop\",\"category\":4,\"value\":\"1\"},{\"name\":\"soundtouch\",\"category\":4,\"value\":\"1\"},{\"name\":\"start-on-prepared\",\"category\":4,\"value\":\"1\"},{\"name\":\"http-detect-rangeupport\",\"category\":1,\"value\":\"0\"},{\"name\":\"fflags\",\"category\":1,\"value\":\"fastseek\"},{\"name\":\"skip_loop_filter\",\"category\":2,\"value\":\"48\"},{\"name\":\"reconnect\",\"category\":4,\"value\":\"1\"},{\"name\":\"enable-accurate-seek\",\"category\":4,\"value\":\"0\"},{\"name\":\"mediacodec\",\"category\":4,\"value\":\"0\"},{\"name\":\"mediacodec-all-videos\",\"category\":4,\"value\":\"0\"},{\"name\":\"mediacodec-auto-rotate\",\"category\":4,\"value\":\"0\"},{\"name\":\"mediacodec-handle-resolution-change\",\"category\":4,\"value\":\"0\"},{\"name\":\"mediacodec-hevc\",\"category\":4,\"value\":\"0\"},{\"name\":\"max-buffer-size\",\"category\":4,\"value\":\"15728640\"}],\"group\":\"\u8f6f\u89e3\u7801\"},{\"options\":[{\"name\":\"opensles\",\"category\":4,\"value\":\"0\"},{\"name\":\"framedrop\",\"category\":4,\"value\":\"1\"},{\"name\":\"soundtouch\",\"category\":4,\"value\":\"1\"},{\"name\":\"start-on-prepared\",\"category\":4,\"value\":\"1\"},{\"name\":\"http-detect-rangeupport\",\"category\":1,\"value\":\"0\"},{\"name\":\"fflags\",\"category\":1,\"value\":\"fastseek\"},{\"name\":\"skip_loop_filter\",\"category\":2,\"value\":\"48\"},{\"name\":\"reconnect\",\"category\":4,\"value\":\"1\"},{\"name\":\"enable-accurate-seek\",\"category\":4,\"value\":\"0\"},{\"name\":\"mediacodec\",\"category\":4,\"value\":\"1\"},{\"name\":\"mediacodec-all-videos\",\"category\":4,\"value\":\"1\"},{\"name\":\"mediacodec-auto-rotate\",\"category\":4,\"value\":\"1\"},{\"name\":\"mediacodec-handle-resolution-change\",\"category\":4,\"value\":\"1\"},{\"name\":\"mediacodec-hevc\",\"category\":4,\"value\":\"1\"},{\"name\":\"max-buffer-size\",\"category\":4,\"value\":\"15728640\"}],\"group\":\"\u786c\u89e3\u7801\"}],\"ads\":[\"mimg.0c1q0l.cn\",\"www.googletagmanager.com\",\"www.google-analytics.com\",\"mc.usihnbcq.cn\",\"mg.g1mm3d.cn\",\"mscs.svaeuzh.cn\",\"cnzz.hhttm.top\",\"tp.vinuxhome.com\",\"cnzz.mmstat.com\",\"www.baihuillq.com\",\"s23.cnzz.com\",\"z3.cnzz.com\",\"c.cnzz.com\",\"stj.v1vo.top\",\"z12.cnzz.com\",\"img.mosflower.cn\",\"tips.gamevvip.com\",\"ehwe.yhdtns.com\",\"xdn.cqqc3.com\",\"www.jixunkyy.cn\",\"sp.chemacid.cn\",\"hm.baidu.com\",\"s9.cnzz.com\",\"z6.cnzz.com\",\"um.cavuc.com\",\"mav.mavuz.com\",\"wofwk.aoidf3.com\",\"z5.cnzz.com\",\"xc.hubeijieshikj.cn\",\"tj.tianwenhu.com\",\"xg.gars57.cn\",\"k.jinxiuzhilv.com\",\"cdn.bootcss.com\",\"ppl.xunzhuo123.com\",\"xomk.jiangjunmh.top\",\"img.xunzhuo123.com\",\"z1.cnzz.com\",\"s13.cnzz.com\",\"xg.huataisangao.cn\",\"z7.cnzz.com\",\"xg.huataisangao.cn\",\"z2.cnzz.com\",\"s96.cnzz.com\",\"q11.cnzz.com\",\"thy.dacedsfa.cn\",\"xg.whsbpw.cn\",\"s19.cnzz.com\",\"z8.cnzz.com\",\"s4.cnzz.com\",\"f5w.as12df.top\",\"ae01.alicdn.com\",\"www.92424.cn\",\"k.wudejia.com\",\"vivovip.mmszxc.top\",\"qiu.xixiqiu.com\",\"cdnjs.hnfenxun.com\",\"cms.qdwght.com\"]}"

    .line 1088
    .local v1, "defaultIJKADS":Ljava/lang/String;
    iget-object v2, v0, Lcom/github/tvbox/osc/api/ApiConfig;->gson:Lcom/google/gson/Gson;

    const-class v3, Lcom/google/gson/JsonObject;

    invoke-virtual {v2, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/gson/JsonObject;

    .line 1090
    .local v2, "defaultJson":Lcom/google/gson/JsonObject;
    invoke-static {}, Lcom/github/tvbox/osc/util/AdBlocker;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1092
    const-string v3, "ads"

    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/gson/JsonElement;

    .line 1093
    .local v4, "host":Lcom/google/gson/JsonElement;
    invoke-virtual {v4}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/github/tvbox/osc/util/AdBlocker;->addAdHost(Ljava/lang/String;)V

    .line 1094
    .end local v4    # "host":Lcom/google/gson/JsonElement;
    goto :goto_0

    .line 1097
    :cond_0
    iget-object v3, v0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    if-nez v3, :cond_5

    .line 1098
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    .line 1099
    const/4 v3, 0x0

    .line 1100
    .local v3, "foundOldSelect":Z
    const-string v4, "ijk_codec"

    const-string v5, "\u786c\u89e3\u7801"

    invoke-static {v4, v5}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1101
    .local v4, "ijkCodec":Ljava/lang/String;
    const-string v5, "ijk"

    invoke-virtual {v2, v5}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v5

    .line 1102
    .local v5, "ijkJsonArray":Lcom/google/gson/JsonArray;
    invoke-virtual {v5}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/gson/JsonElement;

    .line 1103
    .local v7, "opt":Lcom/google/gson/JsonElement;
    move-object v10, v7

    check-cast v10, Lcom/google/gson/JsonObject;

    .line 1104
    .local v10, "obj":Lcom/google/gson/JsonObject;
    const-string v11, "group"

    invoke-virtual {v10, v11}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v11

    .line 1105
    .local v11, "name":Ljava/lang/String;
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1106
    .local v12, "baseOpt":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v13, "options"

    invoke-virtual {v10, v13}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v13

    invoke-virtual {v13}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v13

    invoke-virtual {v13}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/gson/JsonElement;

    .line 1107
    .local v14, "cfg":Lcom/google/gson/JsonElement;
    move-object v15, v14

    check-cast v15, Lcom/google/gson/JsonObject;

    .line 1108
    .local v15, "cObj":Lcom/google/gson/JsonObject;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "category"

    invoke-virtual {v15, v9}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "|"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "name"

    invoke-virtual {v15, v9}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1109
    .local v8, "key":Ljava/lang/String;
    const-string v9, "value"

    invoke-virtual {v15, v9}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    .line 1110
    .local v9, "val":Ljava/lang/String;
    invoke-virtual {v12, v8, v9}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "val":Ljava/lang/String;
    .end local v14    # "cfg":Lcom/google/gson/JsonElement;
    .end local v15    # "cObj":Lcom/google/gson/JsonObject;
    goto :goto_2

    .line 1112
    :cond_1
    new-instance v8, Lcom/github/tvbox/osc/bean/IJKCode;

    invoke-direct {v8}, Lcom/github/tvbox/osc/bean/IJKCode;-><init>()V

    .line 1113
    .local v8, "codec":Lcom/github/tvbox/osc/bean/IJKCode;
    invoke-virtual {v8, v11}, Lcom/github/tvbox/osc/bean/IJKCode;->setName(Ljava/lang/String;)V

    .line 1114
    invoke-virtual {v8, v12}, Lcom/github/tvbox/osc/bean/IJKCode;->setOption(Ljava/util/LinkedHashMap;)V

    .line 1115
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_3

    .line 1120
    :cond_2
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/github/tvbox/osc/bean/IJKCode;->selected(Z)V

    goto :goto_4

    .line 1116
    :cond_3
    :goto_3
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/github/tvbox/osc/bean/IJKCode;->selected(Z)V

    .line 1117
    move-object v4, v11

    .line 1118
    const/4 v3, 0x1

    .line 1122
    :goto_4
    iget-object v9, v0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1123
    .end local v7    # "opt":Lcom/google/gson/JsonElement;
    .end local v8    # "codec":Lcom/github/tvbox/osc/bean/IJKCode;
    .end local v10    # "obj":Lcom/google/gson/JsonObject;
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "baseOpt":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_1

    .line 1124
    :cond_4
    if-nez v3, :cond_5

    iget-object v6, v0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_5

    .line 1125
    iget-object v6, v0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/github/tvbox/osc/bean/IJKCode;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/github/tvbox/osc/bean/IJKCode;->selected(Z)V

    .line 1128
    .end local v3    # "foundOldSelect":Z
    .end local v4    # "ijkCodec":Ljava/lang/String;
    .end local v5    # "ijkJsonArray":Lcom/google/gson/JsonArray;
    :cond_5
    const-string v3, "echo-default-config-----------load"

    invoke-static {v3}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1129
    return-void
.end method

.method private loadJar(ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;I)V
    .locals 16
    .param p1, "useCache"    # Z
    .param p2, "spider"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    .param p4, "retryCount"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "useCache",
            "spider",
            "callback",
            "retryCount"
        }
    .end annotation

    .line 660
    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    const-string v0, ";md5;"

    invoke-virtual {v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 661
    .local v10, "urls":[Ljava/lang/String;
    const/4 v0, 0x0

    aget-object v0, v10, v0

    .line 662
    .local v0, "jarUrl":Ljava/lang/String;
    array-length v1, v10

    const-string v2, ""

    const/4 v3, 0x1

    if-le v1, v3, :cond_0

    aget-object v1, v10, v3

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    move-object v11, v1

    .line 663
    .local v11, "md5":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/tvbox/osc/base/App;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/csp/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".jar"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v12, v1

    .line 665
    .local v12, "cache":Ljava/io/File;
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v3, "jar_runtime_mode"

    if-eqz v1, :cond_4

    if-eqz p1, :cond_1

    move/from16 v13, p4

    goto :goto_1

    .line 689
    :cond_1
    sget-object v1, Lcom/github/tvbox/osc/api/ApiConfig;->jarCache:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {v12}, Lcom/github/tvbox/osc/util/FileUtils;->isWeekAgo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 690
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "echo-load jar jarCache:"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 691
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 692
    const-string v1, "\u8fd1\u671f\u7f13\u5b58"

    invoke-static {v3, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 693
    new-instance v1, Lcom/github/tvbox/osc/api/ApiConfig$9;

    move/from16 v13, p4

    invoke-direct {v1, v7, v9, v8, v13}, Lcom/github/tvbox/osc/api/ApiConfig$9;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;Ljava/lang/String;I)V

    invoke-direct {v7, v12, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJarAsync(Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V

    .line 703
    return-void

    .line 705
    :cond_2
    move/from16 v13, p4

    iget-object v1, v7, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/github/catvod/crawler/JarLoader;->load(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 706
    invoke-interface/range {p3 .. p3}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->success()V

    .line 707
    return-void

    .line 689
    :cond_3
    move/from16 v13, p4

    goto :goto_4

    .line 665
    :cond_4
    move/from16 v13, p4

    .line 666
    :goto_1
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_9

    if-nez p1, :cond_5

    invoke-static {v12}, Lcom/github/tvbox/osc/util/MD5;->getFileMd5(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 667
    :cond_5
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 668
    if-eqz p1, :cond_6

    const-string v1, "\u914d\u7f6e\u7f13\u5b58"

    goto :goto_2

    :cond_6
    const-string v1, "\u6821\u9a8c\u7f13\u5b58"

    :goto_2
    invoke-static {v3, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 669
    new-instance v1, Lcom/github/tvbox/osc/api/ApiConfig$8;

    invoke-direct {v1, v7, v9}, Lcom/github/tvbox/osc/api/ApiConfig$8;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V

    invoke-direct {v7, v12, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJarAsync(Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V

    .line 679
    return-void

    .line 681
    :cond_7
    iget-object v1, v7, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/github/catvod/crawler/JarLoader;->load(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 682
    invoke-interface/range {p3 .. p3}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->success()V

    goto :goto_3

    .line 684
    :cond_8
    const-string v1, "md5\u7f13\u5b58\u5931\u6548"

    invoke-interface {v9, v1}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->error(Ljava/lang/String;)V

    .line 686
    :goto_3
    return-void

    .line 712
    :cond_9
    :goto_4
    const-string v1, "img+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    .line 713
    .local v14, "isJarInImg":Z
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v15

    .line 714
    .end local v0    # "jarUrl":Ljava/lang/String;
    .local v15, "jarUrl":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "echo-load jar start:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 715
    move-object v6, v15

    .line 716
    .local v6, "requestUrl":Ljava/lang/String;
    const-string v0, "\u8fdc\u7a0b\u66f4\u65b0"

    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 717
    new-instance v5, Lcom/github/tvbox/osc/api/ApiConfig$10;

    move-object v0, v5

    move-object/from16 v1, p0

    move/from16 v2, p4

    move-object v3, v12

    move-object v4, v6

    move-object v8, v5

    move-object/from16 v5, p2

    move-object v9, v6

    .end local v6    # "requestUrl":Ljava/lang/String;
    .local v9, "requestUrl":Ljava/lang/String;
    move-object/from16 v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/api/ApiConfig$10;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;ILjava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V

    invoke-direct {v7, v9, v14, v12, v8}, Lcom/github/tvbox/osc/api/ApiConfig;->downloadJarAsync(Ljava/lang/String;ZLjava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarDownloadCallback;)V

    .line 768
    return-void
.end method

.method private loadJarAsync(Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V
    .locals 10
    .param p1, "file"    # Ljava/io/File;
    .param p2, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "callback"
        }
    .end annotation

    .line 521
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 522
    .local v0, "completed":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v1, Lcom/github/tvbox/osc/api/ApiConfig$5;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig$5;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V

    .line 531
    .local v1, "timeout":Ljava/lang/Runnable;
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mainHandler:Landroid/os/Handler;

    const-wide/16 v3, 0x7530

    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 532
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoadExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lcom/github/tvbox/osc/api/ApiConfig$6;

    move-object v2, v9

    move-object v3, p0

    move-object v4, p1

    move-object v5, v0

    move-object v6, v1

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/github/tvbox/osc/api/ApiConfig$6;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/io/File;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Lcom/github/tvbox/osc/api/ApiConfig$JarLoadCallback;)V

    invoke-interface {v8, v9}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 553
    return-void
.end method

.method private loadProxyRules(Lcom/google/gson/JsonObject;)V
    .locals 3
    .param p1, "infoJson"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "infoJson"
        }
    .end annotation

    .line 1948
    const-string v0, "proxy"

    invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 1949
    invoke-static {v2}, Lcom/github/tvbox/osc/util/OkGoHelper;->setProxyList(Ljava/util/List;)V

    .line 1950
    return-void

    .line 1953
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/bean/ProxyRule;->arrayFrom(Lcom/google/gson/JsonElement;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/OkGoHelper;->setProxyList(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1957
    goto :goto_0

    .line 1954
    :catchall_0
    move-exception v0

    .line 1955
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1956
    invoke-static {v2}, Lcom/github/tvbox/osc/util/OkGoHelper;->setProxyList(Ljava/util/List;)V

    .line 1958
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method

.method private mergeLiveChannel(Ljava/util/ArrayList;Lcom/github/tvbox/osc/bean/LiveChannelItem;)Z
    .locals 2
    .param p2, "newItem"    # Lcom/github/tvbox/osc/bean/LiveChannelItem;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "channelItems",
            "newItem"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/github/tvbox/osc/bean/LiveChannelItem;",
            ">;",
            "Lcom/github/tvbox/osc/bean/LiveChannelItem;",
            ")Z"
        }
    .end annotation

    .line 1392
    .local p1, "channelItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveChannelItem;>;"
    invoke-virtual {p2}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->getChannelName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->findLiveChannel(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/github/tvbox/osc/bean/LiveChannelItem;

    move-result-object v0

    .line 1393
    .local v0, "oldItem":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    if-nez v0, :cond_0

    .line 1394
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1395
    const/4 v1, 0x1

    return v1

    .line 1397
    :cond_0
    invoke-direct {p0, v0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->mergeLiveChannelUrls(Lcom/github/tvbox/osc/bean/LiveChannelItem;Lcom/github/tvbox/osc/bean/LiveChannelItem;)V

    .line 1398
    const/4 v1, 0x0

    return v1
.end method

.method private mergeLiveChannelUrls(Lcom/github/tvbox/osc/bean/LiveChannelItem;Lcom/github/tvbox/osc/bean/LiveChannelItem;)V
    .locals 9
    .param p1, "oldItem"    # Lcom/github/tvbox/osc/bean/LiveChannelItem;
    .param p2, "newItem"    # Lcom/github/tvbox/osc/bean/LiveChannelItem;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldItem",
            "newItem"
        }
    .end annotation

    .line 1409
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->getChannelUrls()Ljava/util/ArrayList;

    move-result-object v0

    .line 1410
    .local v0, "oldUrls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->getChannelSourceNames()Ljava/util/ArrayList;

    move-result-object v1

    .line 1411
    .local v1, "oldSourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 1412
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v2

    .line 1413
    invoke-virtual {p1, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelUrls(Ljava/util/ArrayList;)V

    .line 1415
    :cond_0
    if-nez v1, :cond_1

    .line 1416
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 1417
    invoke-virtual {p1, v1}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelSourceNames(Ljava/util/ArrayList;)V

    .line 1419
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const-string v4, "\u6e90"

    if-ge v2, v3, :cond_2

    .line 1420
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1422
    :cond_2
    invoke-virtual {p2}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->getChannelUrls()Ljava/util/ArrayList;

    move-result-object v2

    .line 1423
    .local v2, "newUrls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p2}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->getChannelSourceNames()Ljava/util/ArrayList;

    move-result-object v3

    .line 1424
    .local v3, "newSourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v2, :cond_3

    return-void

    .line 1425
    :cond_3
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_6

    .line 1426
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1427
    .local v6, "url":Ljava/lang/String;
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    goto :goto_2

    .line 1428
    :cond_4
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1429
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_5

    .line 1430
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1432
    :cond_5
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1425
    .end local v6    # "url":Ljava/lang/String;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1435
    .end local v5    # "i":I
    :cond_6
    invoke-virtual {p1, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelUrls(Ljava/util/ArrayList;)V

    .line 1436
    invoke-virtual {p1, v1}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelSourceNames(Ljava/util/ArrayList;)V

    .line 1437
    return-void
.end method

.method private parseApiCollection(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 11
    .param p1, "jsonStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonStr"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 807
    const-string v0, "urls"

    const-string v1, ""

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 809
    .local v2, "apiLines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->trimJsonObject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 810
    .local v3, "json":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 811
    return-object v2

    .line 813
    :cond_0
    iget-object v4, p0, Lcom/github/tvbox/osc/api/ApiConfig;->gson:Lcom/google/gson/Gson;

    const-class v5, Lcom/google/gson/JsonObject;

    invoke-virtual {v4, v3, v5}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/gson/JsonObject;

    .line 814
    .local v4, "infoJson":Lcom/google/gson/JsonObject;
    if-eqz v4, :cond_6

    const-string v5, "sites"

    invoke-virtual {v4, v5}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {v4, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v4, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->isJsonArray()Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_3

    .line 817
    :cond_1
    invoke-virtual {v4, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v0

    .line 818
    .local v0, "urls":Lcom/google/gson/JsonArray;
    invoke-virtual {v0}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/gson/JsonElement;

    .line 819
    .local v6, "element":Lcom/google/gson/JsonElement;
    move-object v7, v1

    .line 820
    .local v7, "name":Ljava/lang/String;
    move-object v8, v1

    .line 821
    .local v8, "url":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/google/gson/JsonElement;->isJsonObject()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 822
    invoke-virtual {v6}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v9

    .line 823
    .local v9, "item":Lcom/google/gson/JsonObject;
    const-string v10, "name"

    invoke-static {v9, v10, v1}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object v7, v10

    .line 824
    const-string v10, "url"

    invoke-static {v9, v10, v1}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object v8, v10

    .line 825
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 826
    const-string v10, "api"

    invoke-static {v9, v10, v1}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object v8, v10

    goto :goto_1

    .line 828
    .end local v9    # "item":Lcom/google/gson/JsonObject;
    :cond_2
    invoke-virtual {v6}, Lcom/google/gson/JsonElement;->isJsonPrimitive()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 829
    invoke-virtual {v6}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    move-object v8, v9

    goto :goto_2

    .line 828
    :cond_3
    :goto_1
    nop

    .line 831
    :goto_2
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 832
    invoke-static {v7, v8}, Lcom/github/tvbox/osc/util/HistoryHelper;->buildApiLine(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 834
    .end local v6    # "element":Lcom/google/gson/JsonElement;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "url":Ljava/lang/String;
    :cond_4
    goto :goto_0

    .line 836
    .end local v0    # "urls":Lcom/google/gson/JsonArray;
    .end local v3    # "json":Ljava/lang/String;
    .end local v4    # "infoJson":Lcom/google/gson/JsonObject;
    :cond_5
    goto :goto_4

    .line 815
    .restart local v3    # "json":Ljava/lang/String;
    .restart local v4    # "infoJson":Lcom/google/gson/JsonObject;
    :cond_6
    :goto_3
    return-object v2

    .line 835
    .end local v3    # "json":Ljava/lang/String;
    .end local v4    # "infoJson":Lcom/google/gson/JsonObject;
    :catchall_0
    move-exception v0

    .line 837
    :goto_4
    return-object v2
.end method

.method private parseJson(Ljava/lang/String;Ljava/io/File;)V
    .locals 1
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "f"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 771
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->readConfigFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->parseJson(Ljava/lang/String;Ljava/lang/String;)V

    .line 772
    return-void
.end method

.method private parseJson(Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "jsonStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "jsonStr"
        }
    .end annotation

    .line 878
    move-object/from16 v1, p0

    invoke-direct/range {p0 .. p0}, Lcom/github/tvbox/osc/api/ApiConfig;->resetConfigData()V

    .line 879
    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->gson:Lcom/google/gson/Gson;

    const-class v2, Lcom/google/gson/JsonObject;

    move-object/from16 v3, p2

    invoke-virtual {v0, v3, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/google/gson/JsonObject;

    .line 881
    .local v2, "infoJson":Lcom/google/gson/JsonObject;
    const-string v0, "spider"

    const-string v4, ""

    invoke-static {v2, v0, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    .line 882
    const-string v0, "jarCache"

    const-string v5, "true"

    invoke-static {v2, v0, v5}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/api/ApiConfig;->jarCache:Ljava/lang/String;

    .line 883
    const-string v0, "danmaku"

    invoke-static {v2, v0, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->danmaku:Ljava/lang/String;

    .line 885
    const-string v0, "wallpaper"

    invoke-static {v2, v0, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->wallpaper:Ljava/lang/String;

    .line 887
    const/4 v0, 0x0

    .line 888
    .local v0, "firstSite":Lcom/github/tvbox/osc/bean/SourceBean;
    const-string v5, "sites"

    invoke-virtual {v2, v5}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v6, v0

    .end local v0    # "firstSite":Lcom/github/tvbox/osc/bean/SourceBean;
    .local v6, "firstSite":Lcom/github/tvbox/osc/bean/SourceBean;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const-string v7, "type"

    const-string v8, "ext"

    const/4 v9, 0x0

    const-string v10, "name"

    const/4 v11, 0x1

    if-eqz v0, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonElement;

    .line 889
    .local v0, "opt":Lcom/google/gson/JsonElement;
    move-object v12, v0

    check-cast v12, Lcom/google/gson/JsonObject;

    .line 890
    .local v12, "obj":Lcom/google/gson/JsonObject;
    new-instance v13, Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-direct {v13}, Lcom/github/tvbox/osc/bean/SourceBean;-><init>()V

    .line 891
    .local v13, "sb":Lcom/github/tvbox/osc/bean/SourceBean;
    const-string v14, "key"

    invoke-virtual {v12, v14}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 892
    .local v14, "siteKey":Ljava/lang/String;
    invoke-virtual {v13, v14}, Lcom/github/tvbox/osc/bean/SourceBean;->setKey(Ljava/lang/String;)V

    .line 893
    invoke-virtual {v12, v10}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_0

    invoke-virtual {v12, v10}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    :cond_0
    move-object v10, v14

    :goto_1
    invoke-virtual {v13, v10}, Lcom/github/tvbox/osc/bean/SourceBean;->setName(Ljava/lang/String;)V

    .line 894
    invoke-virtual {v12, v7}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/JsonElement;->getAsInt()I

    move-result v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setType(I)V

    .line 895
    const-string v7, "api"

    invoke-virtual {v12, v7}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setApi(Ljava/lang/String;)V

    .line 896
    const-string v7, "searchable"

    invoke-static {v12, v7, v11}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonInt(Lcom/google/gson/JsonObject;Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setSearchable(I)V

    .line 897
    const-string v7, "quickSearch"

    invoke-static {v12, v7, v11}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonInt(Lcom/google/gson/JsonObject;Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setQuickSearch(I)V

    .line 898
    const-string v7, "py_"

    invoke-virtual {v14, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 899
    invoke-virtual {v13, v11}, Lcom/github/tvbox/osc/bean/SourceBean;->setFilterable(I)V

    goto :goto_2

    .line 901
    :cond_1
    const-string v7, "filterable"

    invoke-static {v12, v7, v11}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonInt(Lcom/google/gson/JsonObject;Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setFilterable(I)V

    .line 903
    :goto_2
    const-string v7, "playUrl"

    invoke-static {v12, v7, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setPlayerUrl(Ljava/lang/String;)V

    .line 904
    invoke-static {v12, v8, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setExt(Ljava/lang/String;)V

    .line 905
    const-string v7, "jar"

    invoke-static {v12, v7, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setJar(Ljava/lang/String;)V

    .line 906
    const/4 v7, -0x1

    const-string v8, "playerType"

    invoke-static {v12, v8, v7}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonInt(Lcom/google/gson/JsonObject;Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setPlayerType(I)V

    .line 907
    const-string v7, "categories"

    invoke-static {v12, v7}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonStringList(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setCategories(Ljava/util/ArrayList;)V

    .line 908
    const-string v7, "timeout"

    invoke-static {v12, v7, v9}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonInt(Lcom/google/gson/JsonObject;Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setTimeout(I)V

    .line 909
    const-string v7, "click"

    invoke-static {v12, v7, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setClickSelector(Ljava/lang/String;)V

    .line 910
    const-string v7, "style"

    invoke-static {v12, v7, v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/github/tvbox/osc/bean/SourceBean;->setStyle(Ljava/lang/String;)V

    .line 911
    if-nez v6, :cond_2

    move-object v6, v13

    .line 912
    :cond_2
    iget-object v7, v1, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v7, v14, v13}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    .end local v0    # "opt":Lcom/google/gson/JsonElement;
    .end local v12    # "obj":Lcom/google/gson/JsonObject;
    .end local v13    # "sb":Lcom/github/tvbox/osc/bean/SourceBean;
    .end local v14    # "siteKey":Ljava/lang/String;
    goto/16 :goto_0

    .line 914
    :cond_3
    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    if-lez v0, :cond_6

    .line 915
    const-string v0, "home_api"

    invoke-static {v0, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 916
    .local v0, "home":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v5

    .line 917
    .local v5, "sh":Lcom/github/tvbox/osc/bean/SourceBean;
    if-nez v5, :cond_5

    .line 918
    if-eqz v6, :cond_4

    .line 919
    invoke-virtual {v1, v6}, Lcom/github/tvbox/osc/api/ApiConfig;->setSourceBean(Lcom/github/tvbox/osc/bean/SourceBean;)V

    goto :goto_3

    .line 918
    :cond_4
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 922
    :cond_5
    invoke-virtual {v1, v5}, Lcom/github/tvbox/osc/api/ApiConfig;->setSourceBean(Lcom/github/tvbox/osc/bean/SourceBean;)V

    .line 925
    .end local v0    # "home":Ljava/lang/String;
    .end local v5    # "sh":Lcom/github/tvbox/osc/bean/SourceBean;
    :cond_6
    :goto_3
    const-string v0, "flags"

    invoke-static {v2, v0}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonStringList(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->vipParseFlags:Ljava/util/List;

    .line 927
    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 928
    const-string v0, "parses"

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 929
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v0

    .line 930
    .local v0, "parses":Lcom/google/gson/JsonArray;
    invoke-virtual {v0}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/gson/JsonElement;

    .line 931
    .local v12, "opt":Lcom/google/gson/JsonElement;
    move-object v13, v12

    check-cast v13, Lcom/google/gson/JsonObject;

    .line 932
    .local v13, "obj":Lcom/google/gson/JsonObject;
    new-instance v14, Lcom/github/tvbox/osc/bean/ParseBean;

    invoke-direct {v14}, Lcom/github/tvbox/osc/bean/ParseBean;-><init>()V

    .line 933
    .local v14, "pb":Lcom/github/tvbox/osc/bean/ParseBean;
    invoke-virtual {v13, v10}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/github/tvbox/osc/bean/ParseBean;->setName(Ljava/lang/String;)V

    .line 934
    const-string v15, "url"

    invoke-virtual {v13, v15}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/github/tvbox/osc/bean/ParseBean;->setUrl(Ljava/lang/String;)V

    .line 935
    invoke-virtual {v13, v8}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-virtual {v13, v8}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v15

    invoke-virtual {v15}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v15

    goto :goto_5

    :cond_7
    move-object v15, v4

    .line 936
    .local v15, "ext":Ljava/lang/String;
    :goto_5
    invoke-virtual {v14, v15}, Lcom/github/tvbox/osc/bean/ParseBean;->setExt(Ljava/lang/String;)V

    .line 937
    invoke-static {v13, v7, v9}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonInt(Lcom/google/gson/JsonObject;Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v14, v11}, Lcom/github/tvbox/osc/bean/ParseBean;->setType(I)V

    .line 938
    iget-object v11, v1, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    invoke-interface {v11, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 939
    .end local v12    # "opt":Lcom/google/gson/JsonElement;
    .end local v13    # "obj":Lcom/google/gson/JsonObject;
    .end local v14    # "pb":Lcom/github/tvbox/osc/bean/ParseBean;
    .end local v15    # "ext":Ljava/lang/String;
    const/4 v11, 0x1

    goto :goto_4

    .line 940
    :cond_8
    iget-object v5, v1, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_9

    invoke-direct/range {p0 .. p0}, Lcom/github/tvbox/osc/api/ApiConfig;->addSuperParse()V

    .line 943
    .end local v0    # "parses":Lcom/google/gson/JsonArray;
    :cond_9
    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    if-eqz v0, :cond_c

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_c

    .line 944
    const-string v0, "parse_default"

    invoke-static {v0, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 945
    .local v0, "defaultParse":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 946
    iget-object v5, v1, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/tvbox/osc/bean/ParseBean;

    .line 947
    .local v7, "pb":Lcom/github/tvbox/osc/bean/ParseBean;
    invoke-virtual {v7}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 948
    invoke-virtual {v1, v7}, Lcom/github/tvbox/osc/api/ApiConfig;->setDefaultParse(Lcom/github/tvbox/osc/bean/ParseBean;)V

    .line 949
    .end local v7    # "pb":Lcom/github/tvbox/osc/bean/ParseBean;
    :cond_a
    goto :goto_6

    .line 950
    :cond_b
    iget-object v5, v1, Lcom/github/tvbox/osc/api/ApiConfig;->mDefaultParse:Lcom/github/tvbox/osc/bean/ParseBean;

    if-nez v5, :cond_c

    .line 951
    iget-object v5, v1, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/tvbox/osc/bean/ParseBean;

    invoke-virtual {v1, v5}, Lcom/github/tvbox/osc/api/ApiConfig;->setDefaultParse(Lcom/github/tvbox/osc/bean/ParseBean;)V

    .line 955
    .end local v0    # "defaultParse":Ljava/lang/String;
    :cond_c
    const-string v0, "live_api_url"

    invoke-static {v0, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 956
    .local v5, "live_api_url":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    move-object/from16 v7, p1

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_7

    :cond_d
    move-object/from16 v7, p1

    .line 957
    :goto_7
    const-string v0, "echo-load-config_live"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 958
    invoke-direct/range {p0 .. p0}, Lcom/github/tvbox/osc/api/ApiConfig;->initLiveSettings()V

    .line 959
    const-string v0, "lives"

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 960
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v8

    .line 961
    .local v8, "lives_groups":Lcom/google/gson/JsonArray;
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->getLiveGroupIndex()I

    move-result v0

    .line 962
    .local v0, "live_group_index":I
    invoke-virtual {v8}, Lcom/google/gson/JsonArray;->size()I

    move-result v11

    const/4 v12, 0x1

    sub-int/2addr v11, v12

    if-le v0, v11, :cond_e

    const/4 v0, 0x0

    :cond_e
    move v11, v0

    .line 963
    .end local v0    # "live_group_index":I
    .local v11, "live_group_index":I
    const-string v0, "live_group_list"

    invoke-static {v0, v8}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 966
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 967
    .local v0, "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_8
    invoke-virtual {v8}, Lcom/google/gson/JsonArray;->size()I

    move-result v13

    if-ge v12, v13, :cond_10

    .line 968
    invoke-virtual {v8, v12}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v13

    invoke-virtual {v13}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v13

    .line 969
    .local v13, "jsonObject":Lcom/google/gson/JsonObject;
    invoke-virtual {v13, v10}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_f

    invoke-virtual {v13, v10}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v14

    goto :goto_9

    :cond_f
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u7ebf\u8def"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v15, v12, 0x1

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 970
    .local v14, "name":Ljava/lang/String;
    :goto_9
    new-instance v15, Lcom/github/tvbox/osc/bean/LiveSettingItem;

    invoke-direct {v15}, Lcom/github/tvbox/osc/bean/LiveSettingItem;-><init>()V

    .line 971
    .local v15, "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    invoke-virtual {v15, v12}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemIndex(I)V

    .line 972
    invoke-virtual {v15, v14}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemName(Ljava/lang/String;)V

    .line 973
    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 967
    nop

    .end local v13    # "jsonObject":Lcom/google/gson/JsonObject;
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    .line 975
    .end local v12    # "i":I
    :cond_10
    iget-object v10, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    const/4 v12, 0x5

    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/github/tvbox/osc/bean/LiveSettingGroup;

    invoke-virtual {v10, v0}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;->setLiveSettingItems(Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 979
    .end local v0    # "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    goto :goto_a

    .line 976
    :catch_0
    move-exception v0

    .line 978
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 981
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_a
    invoke-virtual {v8, v11}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 982
    .local v0, "livesOBJ":Lcom/google/gson/JsonObject;
    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->loadLiveApi(Lcom/google/gson/JsonObject;)V

    .line 986
    .end local v0    # "livesOBJ":Lcom/google/gson/JsonObject;
    .end local v8    # "lives_groups":Lcom/google/gson/JsonArray;
    .end local v11    # "live_group_index":I
    :cond_11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->myHosts:Ljava/util/Map;

    .line 987
    const-string v0, "hosts"

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_13

    .line 988
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v8

    .line 989
    .local v8, "hostsArray":Lcom/google/gson/JsonArray;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_b
    invoke-virtual {v8}, Lcom/google/gson/JsonArray;->size()I

    move-result v11

    if-ge v10, v11, :cond_13

    .line 990
    invoke-virtual {v8, v10}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v11

    .line 991
    .local v11, "entry":Ljava/lang/String;
    const-string v12, "="

    const/4 v13, 0x2

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v12

    .line 992
    .local v12, "parts":[Ljava/lang/String;
    array-length v14, v12

    if-ne v14, v13, :cond_12

    .line 993
    iget-object v13, v1, Lcom/github/tvbox/osc/api/ApiConfig;->myHosts:Ljava/util/Map;

    aget-object v14, v12, v9

    const/4 v15, 0x1

    aget-object v9, v12, v15

    invoke-interface {v13, v14, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c

    .line 992
    :cond_12
    const/4 v15, 0x1

    .line 989
    .end local v11    # "entry":Ljava/lang/String;
    .end local v12    # "parts":[Ljava/lang/String;
    :goto_c
    add-int/lit8 v10, v10, 0x1

    const/4 v9, 0x0

    goto :goto_b

    .line 998
    .end local v8    # "hostsArray":Lcom/google/gson/JsonArray;
    .end local v10    # "i":I
    :cond_13
    invoke-direct {v1, v2}, Lcom/github/tvbox/osc/api/ApiConfig;->loadProxyRules(Lcom/google/gson/JsonObject;)V

    .line 1001
    const-string v8, "rules"

    invoke-virtual {v2, v8}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1e

    .line 1002
    invoke-static {}, Lcom/github/tvbox/osc/util/VideoParseRuler;->clearRule()V

    .line 1003
    invoke-virtual {v2, v8}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/gson/JsonElement;

    .line 1004
    .local v9, "oneHostRule":Lcom/google/gson/JsonElement;
    move-object v10, v9

    check-cast v10, Lcom/google/gson/JsonObject;

    .line 1006
    .local v10, "obj":Lcom/google/gson/JsonObject;
    const-string v11, "host"

    invoke-virtual {v10, v11}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_17

    .line 1007
    invoke-virtual {v10, v11}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v11

    .line 1008
    .local v11, "host":Ljava/lang/String;
    const-string v12, "rule"

    invoke-virtual {v10, v12}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_15

    .line 1009
    invoke-virtual {v10, v12}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v12

    .line 1010
    .local v12, "ruleJsonArr":Lcom/google/gson/JsonArray;
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 1011
    .local v13, "rule":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v12}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_e
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_14

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/gson/JsonElement;

    .line 1012
    .local v15, "one":Lcom/google/gson/JsonElement;
    invoke-virtual {v15}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v1

    .line 1013
    .local v1, "oneRule":Ljava/lang/String;
    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1014
    .end local v1    # "oneRule":Ljava/lang/String;
    .end local v15    # "one":Lcom/google/gson/JsonElement;
    move-object/from16 v1, p0

    goto :goto_e

    .line 1015
    :cond_14
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_15

    .line 1016
    invoke-static {v11, v13}, Lcom/github/tvbox/osc/util/VideoParseRuler;->addHostRule(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1019
    .end local v12    # "ruleJsonArr":Lcom/google/gson/JsonArray;
    .end local v13    # "rule":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_15
    const-string v1, "filter"

    invoke-virtual {v10, v1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_17

    .line 1020
    invoke-virtual {v10, v1}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v1

    .line 1021
    .local v1, "filterJsonArr":Lcom/google/gson/JsonArray;
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1022
    .local v12, "filter":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_f
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_16

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/gson/JsonElement;

    .line 1023
    .local v14, "one":Lcom/google/gson/JsonElement;
    invoke-virtual {v14}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v15

    .line 1024
    .local v15, "oneFilter":Ljava/lang/String;
    invoke-virtual {v12, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1025
    .end local v14    # "one":Lcom/google/gson/JsonElement;
    .end local v15    # "oneFilter":Ljava/lang/String;
    goto :goto_f

    .line 1026
    :cond_16
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_17

    .line 1027
    invoke-static {v11, v12}, Lcom/github/tvbox/osc/util/VideoParseRuler;->addHostFilter(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1032
    .end local v1    # "filterJsonArr":Lcom/google/gson/JsonArray;
    .end local v11    # "host":Ljava/lang/String;
    .end local v12    # "filter":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_17
    invoke-virtual {v10, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const-string v1, "regex"

    invoke-virtual {v10, v1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1b

    .line 1033
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1034
    .local v11, "rule":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1035
    .local v12, "ads":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v10, v1}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v1

    .line 1036
    .local v1, "regexArray":Lcom/google/gson/JsonArray;
    invoke-virtual {v1}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_10
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_19

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/gson/JsonElement;

    .line 1037
    .restart local v14    # "one":Lcom/google/gson/JsonElement;
    invoke-virtual {v14}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v15

    .line 1038
    .local v15, "regex":Ljava/lang/String;
    invoke-static {v15}, Lcom/github/tvbox/osc/util/M3u8;->isAd(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_18

    invoke-virtual {v12, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 1039
    :cond_18
    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1040
    .end local v14    # "one":Lcom/google/gson/JsonElement;
    .end local v15    # "regex":Ljava/lang/String;
    :goto_11
    goto :goto_10

    .line 1041
    :cond_19
    invoke-virtual {v10, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v13

    .line 1042
    .local v13, "array":Lcom/google/gson/JsonArray;
    invoke-virtual {v13}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_12
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1a

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/gson/JsonElement;

    .line 1043
    .local v15, "one":Lcom/google/gson/JsonElement;
    move-object/from16 v16, v1

    .end local v1    # "regexArray":Lcom/google/gson/JsonArray;
    .local v16, "regexArray":Lcom/google/gson/JsonArray;
    invoke-virtual {v15}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v1

    .line 1044
    .local v1, "host":Ljava/lang/String;
    invoke-static {v1, v11}, Lcom/github/tvbox/osc/util/VideoParseRuler;->addHostRule(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1045
    invoke-static {v1, v12}, Lcom/github/tvbox/osc/util/VideoParseRuler;->addHostRegex(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1046
    .end local v1    # "host":Ljava/lang/String;
    .end local v15    # "one":Lcom/google/gson/JsonElement;
    move-object/from16 v1, v16

    goto :goto_12

    .line 1042
    .end local v16    # "regexArray":Lcom/google/gson/JsonArray;
    .local v1, "regexArray":Lcom/google/gson/JsonArray;
    :cond_1a
    move-object/from16 v16, v1

    .line 1049
    .end local v1    # "regexArray":Lcom/google/gson/JsonArray;
    .end local v11    # "rule":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "ads":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v13    # "array":Lcom/google/gson/JsonArray;
    :cond_1b
    invoke-virtual {v10, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    const-string v1, "script"

    invoke-virtual {v10, v1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1d

    .line 1050
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1051
    .local v11, "scripts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v10, v1}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v1

    .line 1052
    .local v1, "scriptArray":Lcom/google/gson/JsonArray;
    invoke-virtual {v1}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_13
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1c

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/gson/JsonElement;

    .line 1053
    .local v13, "one":Lcom/google/gson/JsonElement;
    invoke-virtual {v13}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v14

    .line 1054
    .local v14, "script":Ljava/lang/String;
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1055
    .end local v13    # "one":Lcom/google/gson/JsonElement;
    .end local v14    # "script":Ljava/lang/String;
    goto :goto_13

    .line 1056
    :cond_1c
    invoke-virtual {v10, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v12

    .line 1057
    .local v12, "array":Lcom/google/gson/JsonArray;
    invoke-virtual {v12}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_14
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1d

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/gson/JsonElement;

    .line 1058
    .local v14, "one":Lcom/google/gson/JsonElement;
    invoke-virtual {v14}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v15

    .line 1059
    .local v15, "host":Ljava/lang/String;
    invoke-static {v15, v11}, Lcom/github/tvbox/osc/util/VideoParseRuler;->addHostScript(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1060
    .end local v14    # "one":Lcom/google/gson/JsonElement;
    .end local v15    # "host":Ljava/lang/String;
    goto :goto_14

    .line 1062
    .end local v1    # "scriptArray":Lcom/google/gson/JsonArray;
    .end local v9    # "oneHostRule":Lcom/google/gson/JsonElement;
    .end local v10    # "obj":Lcom/google/gson/JsonObject;
    .end local v11    # "scripts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "array":Lcom/google/gson/JsonArray;
    :cond_1d
    move-object/from16 v1, p0

    goto/16 :goto_d

    .line 1065
    :cond_1e
    const-string v0, "doh"

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v1

    const-string v8, "doh_json"

    if-eqz v1, :cond_20

    .line 1066
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonArray;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1067
    .local v0, "doh_json":Ljava/lang/String;
    invoke-static {v8, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 1068
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "doh_url"

    invoke-static {v4, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1069
    invoke-static {v8, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1071
    .end local v0    # "doh_json":Ljava/lang/String;
    :cond_1f
    goto :goto_15

    .line 1072
    :cond_20
    invoke-static {v8, v4}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1074
    :goto_15
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->setDnsList()V

    .line 1075
    const-string v0, "echo-api-config-----------load"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1077
    const-string v0, "ads"

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1078
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/JsonElement;

    .line 1079
    .local v1, "host":Lcom/google/gson/JsonElement;
    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/github/tvbox/osc/util/AdBlocker;->hasHost(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_21

    .line 1080
    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/github/tvbox/osc/util/AdBlocker;->addAdHost(Ljava/lang/String;)V

    .line 1082
    .end local v1    # "host":Lcom/google/gson/JsonElement;
    :cond_21
    goto :goto_16

    .line 1084
    :cond_22
    return-void
.end method

.method private parseLiveConfigContent(Ljava/lang/String;Ljava/io/File;)V
    .locals 5
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "f"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1131
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 1132
    .local v0, "bReader":Ljava/io/BufferedReader;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1133
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, ""

    .line 1134
    .local v2, "s":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    if-eqz v3, :cond_0

    .line 1135
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1137
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 1138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveConfigContent(Ljava/lang/String;Ljava/lang/String;)V

    .line 1139
    return-void
.end method

.method private parseLiveConfigContent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "content"
        }
    .end annotation

    .line 1142
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->trimJsonObject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1143
    .local v0, "jsonContent":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1145
    :try_start_0
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->gson:Lcom/google/gson/Gson;

    const-class v2, Lcom/google/gson/JsonObject;

    invoke-virtual {v1, v0, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/JsonObject;

    .line 1146
    .local v1, "infoJson":Lcom/google/gson/JsonObject;
    if-eqz v1, :cond_0

    const-string v2, "lives"

    invoke-virtual {v1, v2}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1147
    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveJson(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1148
    return-void

    .line 1151
    .end local v1    # "infoJson":Lcom/google/gson/JsonObject;
    :cond_0
    goto :goto_0

    .line 1150
    :catchall_0
    move-exception v1

    .line 1153
    :cond_1
    :goto_0
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->isLiveJsonContent(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1154
    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveJson(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1156
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveText(Ljava/lang/String;Ljava/lang/String;)V

    .line 1158
    :goto_1
    return-void
.end method

.method private parseLiveJson(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "jsonStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "jsonStr"
        }
    .end annotation

    .line 1210
    const-string v0, "name"

    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1211
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->gson:Lcom/google/gson/Gson;

    const-class v2, Lcom/google/gson/JsonObject;

    invoke-virtual {v1, p2, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/JsonObject;

    .line 1213
    .local v1, "infoJson":Lcom/google/gson/JsonObject;
    const-string v2, "spider"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    .line 1215
    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->initLiveSettings()V

    .line 1216
    const-string v2, "lives"

    invoke-virtual {v1, v2}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    .line 1217
    invoke-virtual {v1, v2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v2

    .line 1219
    .local v2, "lives_groups":Lcom/google/gson/JsonArray;
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->getLiveGroupIndex()I

    move-result v3

    .line 1220
    .local v3, "live_group_index":I
    invoke-virtual {v2}, Lcom/google/gson/JsonArray;->size()I

    move-result v5

    sub-int/2addr v5, v4

    if-le v3, v5, :cond_0

    const/4 v3, 0x0

    .line 1221
    :cond_0
    const-string v5, "live_group_list"

    invoke-static {v5, v2}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1224
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1225
    .local v5, "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v2}, Lcom/google/gson/JsonArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_2

    .line 1226
    invoke-virtual {v2, v6}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v7

    .line 1227
    .local v7, "jsonObject":Lcom/google/gson/JsonObject;
    invoke-virtual {v7, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-virtual {v7, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u7ebf\u8def"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v9, v6, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1228
    .local v8, "name":Ljava/lang/String;
    :goto_1
    new-instance v9, Lcom/github/tvbox/osc/bean/LiveSettingItem;

    invoke-direct {v9}, Lcom/github/tvbox/osc/bean/LiveSettingItem;-><init>()V

    .line 1229
    .local v9, "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    invoke-virtual {v9, v6}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemIndex(I)V

    .line 1230
    invoke-virtual {v9, v8}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemName(Ljava/lang/String;)V

    .line 1231
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1225
    nop

    .end local v7    # "jsonObject":Lcom/google/gson/JsonObject;
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1233
    .end local v6    # "i":I
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    const/4 v6, 0x5

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/LiveSettingGroup;

    invoke-virtual {v0, v5}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;->setLiveSettingItems(Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1237
    .end local v5    # "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    goto :goto_2

    .line 1234
    :catch_0
    move-exception v0

    .line 1236
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1239
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 1240
    .local v0, "livesOBJ":Lcom/google/gson/JsonObject;
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->loadLiveApi(Lcom/google/gson/JsonObject;)V

    .line 1243
    .end local v0    # "livesOBJ":Lcom/google/gson/JsonObject;
    .end local v2    # "lives_groups":Lcom/google/gson/JsonArray;
    .end local v3    # "live_group_index":I
    :cond_3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->myHosts:Ljava/util/Map;

    .line 1244
    const-string v0, "hosts"

    invoke-virtual {v1, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1245
    invoke-virtual {v1, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v0

    .line 1246
    .local v0, "hostsArray":Lcom/google/gson/JsonArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    invoke-virtual {v0}, Lcom/google/gson/JsonArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 1247
    invoke-virtual {v0, v2}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v3

    .line 1248
    .local v3, "entry":Ljava/lang/String;
    const-string v5, "="

    const/4 v6, 0x2

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .line 1249
    .local v5, "parts":[Ljava/lang/String;
    array-length v7, v5

    if-ne v7, v6, :cond_4

    .line 1250
    iget-object v6, p0, Lcom/github/tvbox/osc/api/ApiConfig;->myHosts:Ljava/util/Map;

    const/4 v7, 0x0

    aget-object v7, v5, v7

    aget-object v8, v5, v4

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1246
    .end local v3    # "entry":Ljava/lang/String;
    .end local v5    # "parts":[Ljava/lang/String;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1254
    .end local v0    # "hostsArray":Lcom/google/gson/JsonArray;
    .end local v2    # "i":I
    :cond_5
    const-string v0, "echo-api-live-config-----------load"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1255
    return-void
.end method

.method private parseLiveText(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "content"
        }
    .end annotation

    .line 1168
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1169
    const-string v0, ""

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    .line 1170
    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1171
    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 1172
    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->initLiveSettings()V

    .line 1173
    new-instance v0, Lcom/google/gson/JsonArray;

    invoke-direct {v0}, Lcom/google/gson/JsonArray;-><init>()V

    const-string v1, "live_group_list"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1174
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->extractLiveTextEpg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "epg_url"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1175
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "play_type"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    const-string v1, "live_play_type"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1176
    const-string v0, "live_web_header"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1177
    invoke-static {p2}, Lcom/github/tvbox/osc/util/live/TxtSubscribe;->parseToJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v0

    .line 1178
    .local v0, "livesArray":Lcom/google/gson/JsonArray;
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->loadLives(Lcom/google/gson/JsonArray;)V

    .line 1179
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-live-text-config-----------load:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1180
    return-void
.end method

.method private proxyDirect(Ljava/util/Map;)[Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "param"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1737
    .local p1, "param":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "url"

    const/4 v1, 0x0

    :try_start_0
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1738
    .local v2, "url":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v1

    .line 1739
    :cond_0
    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    .line 1740
    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    return-object v1

    .line 1741
    :cond_1
    invoke-static {v2}, Lcom/github/tvbox/osc/util/DefaultConfig;->isVideoFormat(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    return-object v1

    .line 1742
    :cond_2
    const-string v3, ".m3u8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1743
    invoke-interface {p1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1744
    const-string v0, "go"

    const-string v3, "live"

    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1745
    const-string v0, "type"

    const-string v3, "m3u8"

    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1746
    invoke-static {p1}, Lcom/github/tvbox/osc/util/Proxy;->itv(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 1748
    :cond_3
    return-object v1

    .line 1749
    .end local v2    # "url":Ljava/lang/String;
    :catchall_0
    move-exception v0

    .line 1750
    .local v0, "th":Ljava/lang/Throwable;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "echo-proxy direct fallback error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 1751
    return-object v1
.end method

.method private readConfigFile(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "f"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 775
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 776
    .local v0, "bReader":Ljava/io/BufferedReader;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 777
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, ""

    .line 778
    .local v2, "s":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    if-eqz v3, :cond_0

    .line 779
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 781
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 782
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private readableJarError(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "msg"
        }
    .end annotation

    .line 452
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "JAR \u52a0\u8f7d\u5931\u8d25\uff0c\u672a\u8fd4\u56de\u5177\u4f53\u539f\u56e0"

    return-object v0

    .line 453
    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 454
    .local v0, "lower":Ljava/lang/String;
    const-string v1, "md5"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "\u7f13\u5b58\u6821\u9a8c\u5931\u8d25\uff0c\u9700\u8981\u91cd\u65b0\u4e0b\u8f7d\u6269\u5c55"

    return-object v1

    .line 455
    :cond_1
    const-string v1, "network"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "\u7f51\u7edc"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    .line 456
    :cond_2
    const-string v1, "jar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "\u52a0\u8f7d"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 457
    :cond_3
    return-object p1

    .line 456
    :cond_4
    :goto_0
    const-string v1, "\u6269\u5c55\u6587\u4ef6\u65e0\u6cd5\u521d\u59cb\u5316\uff0c\u53ef\u80fd\u4e0e\u5f53\u524d\u5ba2\u6237\u7aef\u4e0d\u517c\u5bb9"

    return-object v1

    .line 455
    :cond_5
    :goto_1
    const-string v1, "\u6269\u5c55\u4e0b\u8f7d\u5931\u8d25\uff0c\u5df2\u5c1d\u8bd5\u7f13\u5b58\u56de\u9000"

    return-object v1
.end method

.method private replaceCache(Ljava/io/File;Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p1, "temp"    # Ljava/io/File;
    .param p2, "cache"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "temp",
            "cache"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 642
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 643
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "echo---delete old jar cache failed:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 645
    :cond_0
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 646
    invoke-static {p1, p2}, Lcom/github/tvbox/osc/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 647
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 649
    :cond_1
    return-object p2
.end method

.method private resetConfigData()V
    .locals 2

    .line 854
    invoke-virtual {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->clearSpiderCache()V

    .line 855
    const-string v0, ""

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPlaySourceKey:Ljava/lang/String;

    .line 856
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 857
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 858
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 859
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    .line 860
    new-instance v0, Lcom/google/gson/JsonArray;

    invoke-direct {v0}, Lcom/google/gson/JsonArray;-><init>()V

    const-string v1, "live_group_list"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 861
    return-void
.end method

.method private safeJarSource(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 437
    :try_start_0
    const-string v0, ";md5;"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const-string v1, "img+"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 438
    .local v0, "raw":Ljava/lang/String;
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 439
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 440
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 441
    .local v3, "path":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v5, "Spider JAR"

    if-eqz v4, :cond_0

    move-object v4, v5

    goto :goto_0

    :cond_0
    const/16 v4, 0x2f

    :try_start_1
    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 442
    .local v4, "name":Ljava/lang/String;
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v4, v5

    .line 443
    :cond_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 444
    :cond_2
    const-string v5, "assets"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u5e94\u7528\u5185\u7f6e/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 445
    :cond_3
    const-string v5, "file"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u672c\u5730\u6587\u4ef6/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v5

    .line 447
    .end local v0    # "raw":Ljava/lang/String;
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v2    # "host":Ljava/lang/String;
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "name":Ljava/lang/String;
    :cond_4
    goto :goto_1

    .line 446
    :catchall_0
    move-exception v0

    .line 448
    :goto_1
    const-string v0, "\u5df2\u9690\u85cf\u7684\u6269\u5c55\u5730\u5740"

    return-object v0
.end method

.method public static setLiveGroupIndex(I)V
    .locals 2
    .param p0, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 353
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->getLiveGroupIndexKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 354
    return-void
.end method

.method private switchApiCollectionIfNeeded(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p1, "apiUrl"    # Ljava/lang/String;
    .param p2, "jsonStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "jsonStr"
        }
    .end annotation

    .line 786
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->parseApiCollection(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 787
    .local v0, "apiLines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 788
    return v2

    .line 790
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/github/tvbox/osc/util/HistoryHelper;->getApiLineUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 791
    .local v1, "firstApi":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 794
    :cond_1
    const-string v2, "api_line_list"

    invoke-static {v2, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 795
    const-string v2, "api_line_source"

    invoke-static {v2, p1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 796
    const-string v2, "api_url"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 797
    invoke-static {p1}, Lcom/github/tvbox/osc/util/HistoryHelper;->setApiHistory(Ljava/lang/String;)V

    .line 798
    const-string v2, "live_api_url"

    const-string v3, ""

    invoke-static {v2, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 799
    .local v3, "liveApiUrl":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 800
    :cond_2
    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 801
    invoke-static {v1}, Lcom/github/tvbox/osc/util/HistoryHelper;->setLiveApiHistory(Ljava/lang/String;)V

    .line 803
    :cond_3
    const/4 v2, 0x1

    return v2

    .line 792
    .end local v3    # "liveApiUrl":Ljava/lang/String;
    :cond_4
    :goto_0
    return v2
.end method

.method private trimJsonObject(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "content"
        }
    .end annotation

    .line 841
    if-nez p1, :cond_0

    .line 842
    const-string v0, ""

    return-object v0

    .line 844
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 845
    .local v0, "trimContent":Ljava/lang/String;
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 846
    .local v1, "start":I
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 847
    .local v2, "end":I
    if-ltz v1, :cond_1

    if-le v2, v1, :cond_1

    .line 848
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 850
    :cond_1
    return-object v0
.end method

.method private updateJarRuntime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/lang/String;
    .param p4, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "state",
            "message",
            "source",
            "mode"
        }
    .end annotation

    .line 428
    const-string v0, "jar_runtime_state"

    invoke-static {v0, p1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 429
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u672a\u77e5\u7ed3\u679c"

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    const-string v1, "jar_runtime_message"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 430
    const-string v0, "jar_runtime_source"

    invoke-static {v0, p3}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 431
    const-string v0, "jar_runtime_mode"

    invoke-static {v0, p4}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 432
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "jar_runtime_time"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 433
    return-void
.end method


# virtual methods
.method clanContentFix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "lanLink"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lanLink",
            "content"
        }
    .end annotation

    .line 1922
    const-string v0, "/file/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x6

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1923
    .local v0, "fix":Ljava/lang/String;
    const-string v1, "clan://localhost/"

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "file://"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method clanToAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "lanLink"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lanLink"
        }
    .end annotation

    .line 1912
    const-string v0, "clan://localhost/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1913
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/github/tvbox/osc/server/ControlManager;->getAddress(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "file/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1915
    :cond_0
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1916
    .local v0, "link":Ljava/lang/String;
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1917
    .local v1, "end":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/file/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public clearJarLoader()V
    .locals 1

    .line 1962
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0}, Lcom/github/catvod/crawler/JarLoader;->clear()V

    .line 1963
    return-void
.end method

.method public clearLoader()V
    .locals 2

    .line 1976
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0}, Lcom/github/catvod/crawler/JarLoader;->clear()V

    .line 1977
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-interface {v0}, Lcom/github/catvod/crawler/python/IPyLoader;->clear()V

    .line 1978
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-virtual {v0}, Lcom/github/catvod/crawler/JsLoader;->clear()V

    .line 1979
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->warmedSearchSpiderKeys:Ljava/util/Set;

    monitor-enter v0

    .line 1980
    :try_start_0
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->warmedSearchSpiderKeys:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 1981
    monitor-exit v0

    .line 1982
    return-void

    .line 1981
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public clearSpiderCache()V
    .locals 1

    .line 1985
    const-string v0, ""

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    .line 1986
    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 1987
    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1988
    invoke-virtual {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->clearLoader()V

    .line 1989
    return-void
.end method

.method fixContentPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "url",
            "content"
        }
    .end annotation

    .line 1927
    const-string v0, "\"./"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\"../"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1928
    :cond_0
    const-string v0, "file://"

    const-string v1, "clan://localhost/"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1929
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "clan://"

    if-nez v0, :cond_1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1930
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1932
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->clanToAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1933
    :cond_2
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1934
    .local v1, "base":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_3
    move-object v3, v1

    .line 1935
    .local v3, "parent":Ljava/lang/String;
    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 1936
    .local v0, "parentEnd":I
    if-ltz v0, :cond_4

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1937
    :cond_4
    const-string v2, "../"

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 1938
    const-string v2, "./"

    invoke-virtual {p2, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 1940
    .end local v0    # "parentEnd":I
    .end local v1    # "base":Ljava/lang/String;
    .end local v3    # "parent":Ljava/lang/String;
    :cond_5
    return-object p2
.end method

.method public getCSP(Lcom/github/tvbox/osc/bean/SourceBean;)Lcom/github/catvod/crawler/Spider;
    .locals 5
    .param p1, "sourceBean"    # Lcom/github/tvbox/osc/bean/SourceBean;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceBean"
        }
    .end annotation

    .line 1587
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".js"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".js?"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1591
    :cond_0
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v0

    const-string v2, ".py"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1592
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    .line 1593
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-interface {v1, v0}, Lcom/github/catvod/crawler/python/IPyLoader;->setRecentPyKey(Ljava/lang/String;)V

    .line 1594
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getExt()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/github/catvod/crawler/python/IPyLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    return-object v0

    .line 1597
    :cond_1
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    .line 1598
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getExt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getJar()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/catvod/crawler/JarLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    return-object v0

    .line 1588
    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPyKey:Ljava/lang/String;

    .line 1589
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getExt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getJar()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/catvod/crawler/JsLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    return-object v0
.end method

.method public getChannelGroupList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/LiveChannelGroup;",
            ">;"
        }
    .end annotation

    .line 1891
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    return-object v0
.end method

.method public getCurrentIJKCode()Lcom/github/tvbox/osc/bean/IJKCode;
    .locals 2

    .line 1899
    const-string v0, "ijk_codec"

    const-string v1, "\u786c\u89e3\u7801"

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1900
    .local v0, "codeName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getIJKCodec(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/IJKCode;

    move-result-object v1

    return-object v1
.end method

.method public getDanmaku()Ljava/lang/String;
    .locals 1

    .line 1583
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->danmaku:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :cond_0
    return-object v0
.end method

.method public getDefaultParse()Lcom/github/tvbox/osc/bean/ParseBean;
    .locals 1

    .line 1838
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mDefaultParse:Lcom/github/tvbox/osc/bean/ParseBean;

    return-object v0
.end method

.method public getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;
    .locals 1

    .line 1887
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->emptyHome:Lcom/github/tvbox/osc/bean/SourceBean;

    :cond_0
    return-object v0
.end method

.method public getIJKCodec(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/IJKCode;
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

    .line 1904
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/IJKCode;

    .line 1905
    .local v1, "code":Lcom/github/tvbox/osc/bean/IJKCode;
    invoke-virtual {v1}, Lcom/github/tvbox/osc/bean/IJKCode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1906
    return-object v1

    .line 1907
    .end local v1    # "code":Lcom/github/tvbox/osc/bean/IJKCode;
    :cond_0
    goto :goto_0

    .line 1908
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/IJKCode;

    return-object v0
.end method

.method public getIjkCodes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/IJKCode;",
            ">;"
        }
    .end annotation

    .line 1895
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->ijkCodes:Ljava/util/List;

    return-object v0
.end method

.method public getJarRuntimeDetails()Ljava/lang/String;
    .locals 9

    .line 411
    invoke-virtual {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->getJarRuntimeState()Ljava/lang/String;

    move-result-object v0

    .line 412
    .local v0, "state":Ljava/lang/String;
    const-string v1, "jar_runtime_message"

    const-string v2, "\u5c1a\u65e0\u52a0\u8f7d\u8bb0\u5f55"

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 413
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "\u65e0"

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/api/ApiConfig;->safeJarSource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "jar_runtime_source"

    invoke-static {v3, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 414
    .local v2, "source":Ljava/lang/String;
    :goto_0
    const-string v3, "jar_runtime_mode"

    const-string v4, "-"

    invoke-static {v3, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 415
    .local v3, "mode":Ljava/lang/String;
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-string v7, "jar_runtime_time"

    invoke-static {v7, v6}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 416
    .local v6, "time":J
    cmp-long v8, v6, v4

    if-gtz v8, :cond_1

    const-string v4, "\u5c1a\u672a\u68c0\u6d4b"

    goto :goto_1

    :cond_1
    new-instance v4, Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    const-string v8, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v4, v8, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v6, v7}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 417
    .local v4, "timeText":Ljava/lang/String;
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u8fd0\u884c\u72b6\u6001\uff1a"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n\u52a0\u8f7d\u65b9\u5f0f\uff1a"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n\u6269\u5c55\u6765\u6e90\uff1a"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n\u7f51\u76d8\u63a5\u53e3\uff1a"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v8}, Lcom/github/catvod/crawler/JarLoader;->hasCloudHooks()Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v8, "\u5df2\u8bc6\u522b\uff08\u4ec5\u8868\u793a\u652f\u6301\uff0c\u4e0d\u4ee3\u8868\u5df2\u767b\u5f55\uff09"

    goto :goto_2

    :cond_2
    const-string v8, "\u672a\u8bc6\u522b\u6216\u5c1a\u672a\u52a0\u8f7d"

    :goto_2
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n\u767b\u5f55\u72b6\u6001\uff1a\u8bf7\u8fdb\u5165\u201c\u7ba1\u7406\u7f51\u76d8\u201d\u7531\u5f53\u524d\u6570\u636e\u6e90\u786e\u8ba4\n\u6700\u8fd1\u7ed3\u679c\uff1a"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n\u68c0\u6d4b\u65f6\u95f4\uff1a"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n\n\u8fd9\u91cc\u4e0d\u4f1a\u663e\u793a\u6216\u4e0a\u4f20 Cookie\u3001Token \u548c\u5b8c\u6574\u914d\u7f6e\u5730\u5740\u3002"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 417
    return-object v5
.end method

.method public getJarRuntimeShortText()Ljava/lang/String;
    .locals 5

    .line 405
    invoke-virtual {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->getJarRuntimeState()Ljava/lang/String;

    move-result-object v0

    .line 406
    .local v0, "state":Ljava/lang/String;
    const-string v1, "jar_runtime_mode"

    const-string v2, "-"

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 407
    .local v1, "mode":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u7f51\u76d8\u7ba1\u7406  \u00b7  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  \u00b7  "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getJarRuntimeState()Ljava/lang/String;
    .locals 2

    .line 400
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u672a\u914d\u7f6e"

    return-object v0

    .line 401
    :cond_0
    const-string v0, "jar_runtime_state"

    const-string v1, "\u7b49\u5f85\u68c0\u6d4b"

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getJsCSP(Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;
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

    .line 1636
    iput-object p1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1637
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-static {p1}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v0, v1, p1, v2, v2}, Lcom/github/catvod/crawler/JsLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    return-object v0
.end method

.method public getLiveCSP(Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 1641
    const-string v0, ".js"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->getJsCSP(Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->getPyCSP(Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getLiveConnectTimeoutSeconds()I
    .locals 3

    .line 1660
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "live_connect_timeout"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x5

    return v1
.end method

.method public getLiveSettingGroupList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/LiveSettingGroup;",
            ">;"
        }
    .end annotation

    .line 1296
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    return-object v0
.end method

.method public getMyHost()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1944
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->myHosts:Ljava/util/Map;

    return-object v0
.end method

.method public getParseBeanList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/ParseBean;",
            ">;"
        }
    .end annotation

    .line 1879
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->parseBeanList:Ljava/util/List;

    return-object v0
.end method

.method public getPyCSP(Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;
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

    .line 1630
    invoke-static {p1}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 1631
    iput-object p1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1632
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    const-string v2, ""

    invoke-interface {v1, v0, p1, v2}, Lcom/github/catvod/crawler/python/IPyLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    move-result-object v0

    return-object v0
.end method

.method public getSearchSourceBeanList()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/SourceBean;",
            ">;"
        }
    .end annotation

    .line 1854
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1855
    const-string v0, "echo-\u7b2c\u4e00\u6b21getSearchSourceBeanList"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1856
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    .line 1857
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/SourceBean;

    .line 1858
    .local v1, "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-virtual {v1}, Lcom/github/tvbox/osc/bean/SourceBean;->isSearchable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1859
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1861
    .end local v1    # "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    :cond_0
    goto :goto_0

    .line 1865
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->embyAvailable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1866
    const/4 v0, 0x0

    .line 1867
    .local v0, "present":Z
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "continuebox_emby"

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/SourceBean;

    .line 1868
    .local v2, "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    .line 1869
    .end local v2    # "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    :cond_2
    goto :goto_1

    .line 1870
    :cond_3
    :goto_2
    if-nez v0, :cond_4

    .line 1871
    invoke-virtual {p0, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v1

    .line 1872
    .local v1, "emby":Lcom/github/tvbox/osc/bean/SourceBean;
    if-eqz v1, :cond_4

    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1875
    .end local v0    # "present":Z
    .end local v1    # "emby":Lcom/github/tvbox/osc/bean/SourceBean;
    :cond_4
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->searchSourceBeanList:Ljava/util/List;

    return-object v0
.end method

.method public getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 1804
    const-string v0, "continuebox_emby"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1805
    new-instance v1, Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-direct {v1}, Lcom/github/tvbox/osc/bean/SourceBean;-><init>()V

    .line 1806
    .local v1, "source":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setKey(Ljava/lang/String;)V

    .line 1807
    const-string v0, "\u5c0f\u96c5 Emby"

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setName(Ljava/lang/String;)V

    .line 1808
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setType(I)V

    .line 1809
    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setSearchable(I)V

    .line 1810
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setQuickSearch(I)V

    .line 1811
    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setFilterable(I)V

    .line 1815
    const/4 v0, -0x1

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setPlayerType(I)V

    .line 1816
    const/16 v0, 0x19

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/bean/SourceBean;->setTimeout(I)V

    .line 1817
    return-object v1

    .line 1819
    .end local v1    # "source":Lcom/github/tvbox/osc/bean/SourceBean;
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1820
    const/4 v0, 0x0

    return-object v0

    .line 1821
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/SourceBean;

    return-object v0
.end method

.method public getSourceBeanList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/SourceBean;",
            ">;"
        }
    .end annotation

    .line 1842
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getSpider()Ljava/lang/String;
    .locals 1

    .line 1579
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    return-object v0
.end method

.method public getSwitchSourceBeanList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/SourceBean;",
            ">;"
        }
    .end annotation

    .line 1845
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1846
    .local v0, "filteredList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/SourceBean;>;"
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/SourceBean;

    .line 1847
    .local v2, "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1848
    .end local v2    # "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    goto :goto_0

    .line 1849
    :cond_0
    return-object v0
.end method

.method public getVipParseFlags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1883
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->vipParseFlags:Ljava/util/List;

    return-object v0
.end method

.method public hasDanmuSearchUi()Z
    .locals 1

    .line 1656
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0}, Lcom/github/catvod/crawler/JarLoader;->hasDanmuSearchUi()Z

    move-result v0

    return v0
.end method

.method public jsonExt(Ljava/lang/String;Ljava/util/LinkedHashMap;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "jxs",
            "url"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 1783
    .local p2, "jxs":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0, p1, p2, p3}, Lcom/github/catvod/crawler/JarLoader;->jsonExt(Ljava/lang/String;Ljava/util/LinkedHashMap;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public jsonExtMix(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/LinkedHashMap;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p5, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "flag",
            "key",
            "name",
            "jxs",
            "url"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            ")",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 1787
    .local p4, "jxs":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/github/catvod/crawler/JarLoader;->jsonExtMix(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/LinkedHashMap;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$refreshCloudDiskOrder$0$com-github-tvbox-osc-api-ApiConfig(Ljava/lang/String;)V
    .locals 1
    .param p1, "sourceKey"    # Ljava/lang/String;

    .line 627
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0, p1}, Lcom/github/catvod/crawler/JarLoader;->refreshCloudDiskNames(Ljava/lang/String;)Z

    return-void
.end method

.method synthetic lambda$searchDanmuUi$1$com-github-tvbox-osc-api-ApiConfig(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "longClick"    # Z

    .line 1647
    :try_start_0
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0, p1, p2, p3}, Lcom/github/catvod/crawler/JarLoader;->searchDanmuUi(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1651
    goto :goto_0

    .line 1648
    :catchall_0
    move-exception v0

    .line 1649
    .local v0, "th":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ApiConfig searchDanmuUi error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 1650
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1652
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method

.method public loadConfig(ZLcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;Landroid/app/Activity;)V
    .locals 11
    .param p1, "useCache"    # Z
    .param p2, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    .param p3, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "useCache",
            "callback",
            "activity"
        }
    .end annotation

    .line 200
    const-string v0, "api_url"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 201
    .local v0, "apiUrl":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 202
    const-string v1, "-1"

    invoke-interface {p2, v1}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->error(Ljava/lang/String;)V

    .line 203
    return-void

    .line 205
    :cond_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/base/App;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/github/tvbox/osc/util/MD5;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v7, v1

    .line 206
    .local v7, "cache":Ljava/io/File;
    if-eqz p1, :cond_2

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 208
    :try_start_0
    invoke-direct {p0, v7}, Lcom/github/tvbox/osc/api/ApiConfig;->readConfigFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 209
    .local v1, "json":Ljava/lang/String;
    invoke-direct {p0, v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->switchApiCollectionIfNeeded(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 210
    const/4 v2, 0x0

    invoke-virtual {p0, v2, p2, p3}, Lcom/github/tvbox/osc/api/ApiConfig;->loadConfig(ZLcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;Landroid/app/Activity;)V

    .line 211
    return-void

    .line 213
    :cond_1
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->clearApiLinesIfUnmatched(Ljava/lang/String;)V

    .line 214
    invoke-direct {p0, v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->parseJson(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    invoke-interface {p2}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->success()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    return-void

    .line 217
    .end local v1    # "json":Ljava/lang/String;
    :catchall_0
    move-exception v1

    .line 218
    .local v1, "th":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 221
    .end local v1    # "th":Ljava/lang/Throwable;
    :cond_2
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->configUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 223
    .local v8, "configUrl":Ljava/lang/String;
    iget-object v9, p0, Lcom/github/tvbox/osc/api/ApiConfig;->TempKey:Ljava/lang/String;

    .line 225
    .local v9, "configKey":Ljava/lang/String;
    new-instance v10, Lcom/github/tvbox/osc/api/ApiConfig$1;

    move-object v1, v10

    move-object v2, p0

    move-object v3, v0

    move-object v4, v7

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/api/ApiConfig$1;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/io/File;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;Landroid/app/Activity;)V

    invoke-direct {p0, v0, v8, v9, v10}, Lcom/github/tvbox/osc/api/ApiConfig;->fetchConfigAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$ConfigFetchCallback;)V

    .line 265
    return-void
.end method

.method public loadJar(ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V
    .locals 4
    .param p1, "useCache"    # Z
    .param p2, "spider"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "useCache",
            "spider",
            "callback"
        }
    .end annotation

    .line 359
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    const-string v0, "\u672a\u914d\u7f6e"

    const-string v1, "\u5f53\u524d\u914d\u7f6e\u6ca1\u6709 Spider JAR"

    const-string v2, "\u65e0"

    const-string v3, "-"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->updateJarRuntime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    invoke-interface {p3, v1}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->error(Ljava/lang/String;)V

    .line 362
    return-void

    .line 364
    :cond_0
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/api/ApiConfig;->safeJarSource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_1

    const-string v1, "\u914d\u7f6e\u7f13\u5b58"

    goto :goto_0

    :cond_1
    const-string v1, "\u5728\u7ebf\u68c0\u67e5"

    :goto_0
    const-string v2, "\u52a0\u8f7d\u4e2d"

    const-string v3, "\u6b63\u5728\u521d\u59cb\u5316\u7f51\u76d8\u6269\u5c55"

    invoke-direct {p0, v2, v3, v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->updateJarRuntime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    new-instance v0, Lcom/github/tvbox/osc/api/ApiConfig$3;

    invoke-direct {v0, p0, p2, p3}, Lcom/github/tvbox/osc/api/ApiConfig$3;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V

    .line 386
    .local v0, "trackedCallback":Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJar(ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;I)V

    .line 387
    return-void
.end method

.method public loadLiveApi(Lcom/google/gson/JsonObject;)V
    .locals 20
    .param p1, "livesOBJ"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "livesOBJ"
        }
    .end annotation

    .line 1441
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "jar"

    const-string v3, "ua"

    const-string v4, "header"

    const-string v5, "timeout"

    const-string v6, "playerType"

    const-string v7, "url"

    const-string v8, "epg"

    const-string v9, "type"

    const-string v10, "api"

    const-string v11, ""

    :try_start_0
    const-string v12, "echo-loadLiveApi"

    invoke-static {v12}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1442
    iget-object v12, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->clear()V

    .line 1443
    iput-object v11, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1444
    iput-object v11, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 1445
    invoke-virtual/range {p1 .. p1}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1446
    .local v12, "lives":Ljava/lang/String;
    const-string v13, "proxy://"

    invoke-virtual {v12, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1448
    .local v13, "index":I
    const-string v15, "http"

    const-string v14, "UTF-8"

    move-object/from16 v17, v3

    const-string v3, "ext"

    move-object/from16 v18, v4

    const/4 v4, -0x1

    if-eq v13, v4, :cond_3

    .line 1449
    :try_start_1
    const-string v0, "\""

    invoke-virtual {v12, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 1450
    .local v0, "endIndex":I
    invoke-virtual {v12, v13, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 1451
    .local v4, "url":Ljava/lang/String;
    invoke-static {v4}, Lcom/github/tvbox/osc/util/DefaultConfig;->checkReplaceProxy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object v4, v7

    .line 1452
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1453
    .local v3, "extUrl":Ljava/lang/String;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 1455
    invoke-virtual {v3, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, "clan://"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_0

    .line 1458
    :cond_0
    new-instance v7, Ljava/lang/String;

    const/16 v9, 0xa

    invoke-static {v3, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v10

    invoke-direct {v7, v10, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .local v7, "extUrlFix":Ljava/lang/String;
    goto :goto_1

    .line 1456
    .end local v7    # "extUrlFix":Ljava/lang/String;
    :cond_1
    :goto_0
    move-object v7, v3

    .line 1460
    .restart local v7    # "extUrlFix":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    const/16 v10, 0xa

    invoke-static {v9, v10}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v9

    move-object v7, v9

    .line 1461
    invoke-virtual {v4, v3, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    move-object v4, v9

    .line 1463
    .end local v0    # "endIndex":I
    .end local v3    # "extUrl":Ljava/lang/String;
    .end local v7    # "extUrlFix":Ljava/lang/String;
    :cond_2
    move-object/from16 v16, v12

    move/from16 v19, v13

    goto/16 :goto_b

    .line 1464
    .end local v4    # "url":Ljava/lang/String;
    :cond_3
    invoke-virtual {v2, v10}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v2, v10}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_4
    move-object v4, v11

    .line 1465
    .local v4, "api":Ljava/lang/String;
    :goto_2
    invoke-virtual {v2, v9}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object/from16 v16, v12

    .end local v12    # "lives":Ljava/lang/String;
    .local v16, "lives":Ljava/lang/String;
    const-string v12, "0"

    move/from16 v19, v13

    .end local v13    # "index":I
    .local v19, "index":I
    const-string v13, "3"

    if-eqz v10, :cond_5

    :try_start_2
    invoke-virtual {v2, v9}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    goto :goto_3

    :cond_5
    invoke-direct {v1, v4}, Lcom/github/tvbox/osc/api/ApiConfig;->isLiveSpiderApi(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    move-object v9, v13

    goto :goto_3

    :cond_6
    move-object v9, v12

    .line 1466
    .local v9, "type":Ljava/lang/String;
    :goto_3
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_8

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    goto :goto_4

    .line 1515
    :cond_7
    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1516
    return-void

    .line 1467
    :cond_8
    :goto_4
    invoke-virtual {v2, v7}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-virtual {v2, v7}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v7

    goto :goto_5

    :cond_9
    move-object v7, v11

    .line 1468
    .local v7, "url":Ljava/lang/String;
    :goto_5
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_a

    move-object v7, v4

    .line 1469
    :cond_a
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "echo-liveurl"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1470
    const-string v10, "http://127.0.0.1"

    invoke-virtual {v7, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_c

    .line 1471
    invoke-virtual {v7, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 1472
    invoke-virtual {v7, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    const/16 v12, 0xa

    invoke-static {v10, v12}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v10

    move-object v7, v10

    .line 1474
    :cond_b
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "http://127.0.0.1:9978/proxy?do=live&type=txt&ext="

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move-object v7, v10

    .line 1476
    :cond_c
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_15

    .line 1477
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_d

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_d
    move-object v0, v11

    .line 1478
    .local v0, "jarUrl":Ljava/lang/String;
    :goto_6
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "echo-liveApi1"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1479
    const-string v10, ".py"

    invoke-virtual {v4, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 1480
    const-string v10, "echo-pyLoader.getSpider"

    invoke-static {v10}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1481
    move-object v10, v11

    .line 1482
    .local v10, "ext":Ljava/lang/String;
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_f

    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/gson/JsonElement;->isJsonObject()Z

    move-result v12

    if-nez v12, :cond_e

    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/gson/JsonElement;->isJsonArray()Z

    move-result v12

    if-eqz v12, :cond_f

    .line 1483
    :cond_e
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v10    # "ext":Ljava/lang/String;
    .local v3, "ext":Ljava/lang/String;
    goto :goto_7

    .line 1485
    .end local v3    # "ext":Ljava/lang/String;
    .restart local v10    # "ext":Ljava/lang/String;
    :cond_f
    invoke-static {v2, v3, v11}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1488
    .end local v10    # "ext":Ljava/lang/String;
    .restart local v3    # "ext":Ljava/lang/String;
    :goto_7
    invoke-static {v4}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 1489
    iput-object v4, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1490
    iget-object v12, v1, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-interface {v12, v10, v4, v3}, Lcom/github/catvod/crawler/python/IPyLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    .line 1491
    nop

    .end local v3    # "ext":Ljava/lang/String;
    goto :goto_9

    :cond_10
    const-string v10, ".js"

    invoke-virtual {v4, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_13

    .line 1492
    const-string v10, "echo-jsLoader.getSpider"

    invoke-static {v10}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 1493
    move-object v10, v11

    .line 1494
    .restart local v10    # "ext":Ljava/lang/String;
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_12

    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/gson/JsonElement;->isJsonObject()Z

    move-result v12

    if-nez v12, :cond_11

    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/gson/JsonElement;->isJsonArray()Z

    move-result v12

    if-eqz v12, :cond_12

    .line 1495
    :cond_11
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v10    # "ext":Ljava/lang/String;
    .restart local v3    # "ext":Ljava/lang/String;
    goto :goto_8

    .line 1497
    .end local v3    # "ext":Ljava/lang/String;
    .restart local v10    # "ext":Ljava/lang/String;
    :cond_12
    invoke-static {v2, v3, v11}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1499
    .end local v10    # "ext":Ljava/lang/String;
    .restart local v3    # "ext":Ljava/lang/String;
    :goto_8
    iput-object v4, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1500
    iget-object v10, v1, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-static {v4}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12, v4, v3, v0}, Lcom/github/catvod/crawler/JsLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    .line 1502
    .end local v3    # "ext":Ljava/lang/String;
    :cond_13
    :goto_9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_14

    invoke-direct {v1, v4}, Lcom/github/tvbox/osc/api/ApiConfig;->isLiveSpiderApi(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_14

    .line 1503
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v3, v0}, Lcom/github/catvod/crawler/JarLoader;->loadLiveJar(Ljava/lang/String;)V

    .line 1504
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 1505
    iput-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    goto :goto_a

    .line 1507
    :cond_14
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_15

    invoke-direct {v1, v4}, Lcom/github/tvbox/osc/api/ApiConfig;->isLiveSpiderApi(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 1508
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    iget-object v10, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    invoke-virtual {v3, v10}, Lcom/github/catvod/crawler/JarLoader;->loadLiveJar(Ljava/lang/String;)V

    .line 1509
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 1510
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    iput-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1520
    .end local v0    # "jarUrl":Ljava/lang/String;
    .end local v4    # "api":Ljava/lang/String;
    .end local v9    # "type":Ljava/lang/String;
    :cond_15
    :goto_a
    move-object v4, v7

    .end local v7    # "url":Ljava/lang/String;
    .local v4, "url":Ljava/lang/String;
    :goto_b
    invoke-virtual {v2, v8}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v3, "epg_url"

    if-eqz v0, :cond_16

    .line 1521
    :try_start_3
    invoke-virtual {v2, v8}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    .line 1522
    .local v0, "epg":Ljava/lang/String;
    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1523
    nop

    .end local v0    # "epg":Ljava/lang/String;
    goto :goto_c

    .line 1524
    :cond_16
    invoke-static {v3, v11}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1527
    :goto_c
    invoke-virtual {v2, v6}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string v3, "live_play_type"

    if-eqz v0, :cond_17

    .line 1528
    :try_start_4
    invoke-virtual {v2, v6}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    .line 1529
    .local v0, "livePlayType":Ljava/lang/String;
    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1530
    nop

    .end local v0    # "livePlayType":Ljava/lang/String;
    goto :goto_d

    .line 1531
    :cond_17
    const-string v0, "play_type"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1534
    :goto_d
    invoke-virtual {v2, v5}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 1535
    const/16 v0, 0x1e

    invoke-virtual {v2, v5}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsInt()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v3, 0x5

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1536
    .local v0, "timeout":I
    const-string v5, "live_connect_timeout"

    add-int/lit8 v6, v0, 0x4

    div-int/2addr v6, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1538
    .end local v0    # "timeout":I
    :cond_18
    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const-string v5, "live_web_header"

    if-eqz v3, :cond_1a

    .line 1539
    :try_start_5
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 1540
    .local v0, "headerObj":Lcom/google/gson/JsonObject;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1541
    .local v3, "liveHeader":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v0}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_19

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 1542
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/gson/JsonElement;

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1543
    nop

    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    goto :goto_e

    .line 1544
    :cond_19
    invoke-static {v5, v3}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1545
    nop

    .end local v0    # "headerObj":Lcom/google/gson/JsonObject;
    .end local v3    # "liveHeader":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_f

    :cond_1a
    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 1546
    invoke-virtual {v2, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    .line 1547
    .local v0, "ua":Ljava/lang/String;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1548
    .restart local v3    # "liveHeader":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "User-Agent"

    invoke-virtual {v3, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1549
    invoke-static {v5, v3}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1550
    nop

    .end local v0    # "ua":Ljava/lang/String;
    .end local v3    # "liveHeader":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_f

    .line 1551
    :cond_1b
    const/4 v0, 0x0

    invoke-static {v5, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1553
    :goto_f
    new-instance v0, Lcom/github/tvbox/osc/bean/LiveChannelGroup;

    invoke-direct {v0}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;-><init>()V

    .line 1554
    .local v0, "liveChannelGroup":Lcom/github/tvbox/osc/bean/LiveChannelGroup;
    invoke-virtual {v0, v4}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->setGroupName(Ljava/lang/String;)V

    .line 1555
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 1556
    iget-object v3, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1559
    nop

    .end local v0    # "liveChannelGroup":Lcom/github/tvbox/osc/bean/LiveChannelGroup;
    .end local v4    # "url":Ljava/lang/String;
    .end local v16    # "lives":Ljava/lang/String;
    .end local v19    # "index":I
    goto :goto_10

    .line 1557
    :catchall_0
    move-exception v0

    .line 1558
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1560
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_10
    return-void
.end method

.method public loadLiveConfig(ZLcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V
    .locals 7
    .param p1, "useCache"    # Z
    .param p2, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "useCache",
            "callback"
        }
    .end annotation

    .line 268
    const-string v0, "live_api_url"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 269
    .local v0, "apiUrl":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 270
    const-string v2, "api_url"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    .line 272
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 273
    const-string v1, "-1"

    invoke-interface {p2, v1}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->error(Ljava/lang/String;)V

    .line 274
    return-void

    .line 276
    :cond_1
    move-object v1, v0

    .line 277
    .local v1, "liveApiUrl":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->configUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, "liveApiConfigUrl":Ljava/lang/String;
    iget-object v3, p0, Lcom/github/tvbox/osc/api/ApiConfig;->TempKey:Ljava/lang/String;

    .line 279
    .local v3, "liveConfigKey":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/tvbox/osc/base/App;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/github/tvbox/osc/util/MD5;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 280
    .local v4, "live_cache":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "echo-load live config "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 281
    if-eqz p1, :cond_3

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 283
    :try_start_0
    invoke-direct {p0, v1, v4}, Lcom/github/tvbox/osc/api/ApiConfig;->parseLiveConfigContent(Ljava/lang/String;Ljava/io/File;)V

    .line 284
    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->hasLiveConfigResult()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 285
    iput-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->loadedLiveConfigUrl:Ljava/lang/String;

    .line 286
    invoke-interface {p2}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->success()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    return-void

    .line 291
    :cond_2
    goto :goto_0

    .line 289
    :catchall_0
    move-exception v5

    .line 290
    .local v5, "th":Ljava/lang/Throwable;
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    .line 293
    .end local v5    # "th":Ljava/lang/Throwable;
    :cond_3
    :goto_0
    new-instance v5, Lcom/github/tvbox/osc/api/ApiConfig$2;

    invoke-direct {v5, p0, v1, p2, v4}, Lcom/github/tvbox/osc/api/ApiConfig$2;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;Ljava/io/File;)V

    invoke-direct {p0, v1, v2, v3, v5}, Lcom/github/tvbox/osc/api/ApiConfig;->fetchConfigAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$ConfigFetchCallback;)V

    .line 328
    return-void
.end method

.method public loadLives(Lcom/google/gson/JsonArray;)V
    .locals 24
    .param p1, "livesArray"    # Lcom/google/gson/JsonArray;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "livesArray"
        }
    .end annotation

    .line 1313
    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1314
    const/4 v0, 0x0

    .line 1315
    .local v0, "groupIndex":I
    const/4 v2, 0x0

    .line 1316
    .local v2, "channelIndex":I
    const/4 v3, 0x0

    .line 1317
    .local v3, "channelNum":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/gson/JsonElement;

    .line 1318
    .local v5, "groupElement":Lcom/google/gson/JsonElement;
    new-instance v6, Lcom/github/tvbox/osc/bean/LiveChannelGroup;

    invoke-direct {v6}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;-><init>()V

    .line 1319
    .local v6, "liveChannelGroup":Lcom/github/tvbox/osc/bean/LiveChannelGroup;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6, v7}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->setLiveChannels(Ljava/util/ArrayList;)V

    .line 1320
    add-int/lit8 v7, v0, 0x1

    .end local v0    # "groupIndex":I
    .local v7, "groupIndex":I
    invoke-virtual {v6, v0}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->setGroupIndex(I)V

    .line 1321
    move-object v0, v5

    check-cast v0, Lcom/google/gson/JsonObject;

    const-string v8, "group"

    invoke-virtual {v0, v8}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 1322
    .local v8, "groupName":Ljava/lang/String;
    const-string v0, "_"

    const/4 v9, 0x2

    invoke-virtual {v8, v0, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v10

    .line 1323
    .local v10, "splitGroupName":[Ljava/lang/String;
    const/4 v11, 0x0

    aget-object v0, v10, v11

    invoke-virtual {v6, v0}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->setGroupName(Ljava/lang/String;)V

    .line 1324
    array-length v0, v10

    const/4 v12, 0x1

    const-string v13, ""

    if-le v0, v12, :cond_0

    .line 1325
    aget-object v0, v10, v12

    invoke-virtual {v6, v0}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->setGroupPassword(Ljava/lang/String;)V

    goto :goto_1

    .line 1327
    :cond_0
    invoke-virtual {v6, v13}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->setGroupPassword(Ljava/lang/String;)V

    .line 1328
    :goto_1
    const/4 v0, 0x0

    .line 1329
    .end local v2    # "channelIndex":I
    .local v0, "channelIndex":I
    move-object v2, v5

    check-cast v2, Lcom/google/gson/JsonObject;

    const-string v14, "channels"

    invoke-virtual {v2, v14}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonArray;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v14, v3

    move v3, v0

    .end local v0    # "channelIndex":I
    .local v3, "channelIndex":I
    .local v14, "channelNum":I
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Lcom/google/gson/JsonElement;

    .line 1330
    .local v15, "channelElement":Lcom/google/gson/JsonElement;
    move-object v12, v15

    check-cast v12, Lcom/google/gson/JsonObject;

    .line 1331
    .local v12, "obj":Lcom/google/gson/JsonObject;
    new-instance v0, Lcom/github/tvbox/osc/bean/LiveChannelItem;

    invoke-direct {v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;-><init>()V

    move-object/from16 v16, v0

    .line 1332
    .local v16, "liveChannelItem":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    const-string v0, "name"

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v11, v16

    .end local v16    # "liveChannelItem":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    .local v11, "liveChannelItem":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelName(Ljava/lang/String;)V

    .line 1333
    const-string v0, "logo"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelLogo(Ljava/lang/String;)V

    .line 1334
    const-string v0, "epg"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelEpg(Ljava/lang/String;)V

    .line 1335
    const-string v0, "ua"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelUa(Ljava/lang/String;)V

    .line 1336
    const-string v0, "click"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelClick(Ljava/lang/String;)V

    .line 1337
    const-string v0, "format"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelFormat(Ljava/lang/String;)V

    .line 1338
    const-string v0, "origin"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelOrigin(Ljava/lang/String;)V

    .line 1339
    const-string v0, "referer"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelReferer(Ljava/lang/String;)V

    .line 1340
    const-string v0, "tvg-id"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelTvgId(Ljava/lang/String;)V

    .line 1341
    const-string v0, "tvg-name"

    invoke-static {v12, v0, v13}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonString(Lcom/google/gson/JsonObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelTvgName(Ljava/lang/String;)V

    .line 1342
    const-string v0, "parse"

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 1344
    :try_start_0
    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelParse(Ljava/lang/Integer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1346
    goto :goto_3

    .line 1345
    :catchall_0
    move-exception v0

    .line 1348
    :cond_1
    :goto_3
    const-string v0, "catchup"

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_5

    .line 1349
    new-instance v16, Lcom/google/gson/JsonObject;

    invoke-direct/range {v16 .. v16}, Lcom/google/gson/JsonObject;-><init>()V

    move-object/from16 v17, v16

    .line 1350
    .local v17, "catchupObj":Lcom/google/gson/JsonObject;
    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/google/gson/JsonElement;->isJsonObject()Z

    move-result v16

    if-eqz v16, :cond_2

    .line 1351
    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v17

    move-object/from16 v18, v2

    move-object/from16 v2, v17

    goto :goto_4

    .line 1353
    :cond_2
    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    const-string v9, "type"

    move-object/from16 v18, v2

    move-object/from16 v2, v17

    .end local v17    # "catchupObj":Lcom/google/gson/JsonObject;
    .local v2, "catchupObj":Lcom/google/gson/JsonObject;
    invoke-virtual {v2, v9, v0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1354
    const-string v0, "catchup-source"

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    const-string v9, "source"

    invoke-virtual {v2, v9, v0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1355
    :cond_3
    const-string v0, "catchup-replace"

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v0

    const-string v9, "replace"

    invoke-virtual {v2, v9, v0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1357
    :cond_4
    :goto_4
    invoke-virtual {v11, v2}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelCatchup(Lcom/google/gson/JsonObject;)V

    goto :goto_5

    .line 1348
    .end local v2    # "catchupObj":Lcom/google/gson/JsonObject;
    :cond_5
    move-object/from16 v18, v2

    .line 1359
    :goto_5
    const-string v0, "header"

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->isJsonObject()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1360
    invoke-virtual {v12, v0}, Lcom/google/gson/JsonObject;->getAsJsonObject(Ljava/lang/String;)Lcom/google/gson/JsonObject;

    move-result-object v0

    .line 1361
    .local v0, "headerObj":Lcom/google/gson/JsonObject;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1362
    .local v2, "channelHeader":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v0}, Lcom/google/gson/JsonObject;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/Map$Entry;

    .line 1363
    .local v17, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v20, v0

    .end local v0    # "headerObj":Lcom/google/gson/JsonObject;
    .local v20, "headerObj":Lcom/google/gson/JsonObject;
    move-object/from16 v0, v19

    check-cast v0, Ljava/lang/String;

    invoke-interface/range {v17 .. v17}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/google/gson/JsonElement;

    move-object/from16 v21, v4

    invoke-virtual/range {v19 .. v19}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1364
    .end local v17    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/google/gson/JsonElement;>;"
    move-object/from16 v0, v20

    move-object/from16 v4, v21

    goto :goto_6

    .line 1365
    .end local v20    # "headerObj":Lcom/google/gson/JsonObject;
    .restart local v0    # "headerObj":Lcom/google/gson/JsonObject;
    :cond_6
    move-object/from16 v20, v0

    move-object/from16 v21, v4

    .end local v0    # "headerObj":Lcom/google/gson/JsonObject;
    .restart local v20    # "headerObj":Lcom/google/gson/JsonObject;
    invoke-virtual {v11, v2}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelHeader(Ljava/util/Map;)V

    goto :goto_7

    .line 1359
    .end local v2    # "channelHeader":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v20    # "headerObj":Lcom/google/gson/JsonObject;
    :cond_7
    move-object/from16 v21, v4

    .line 1367
    :goto_7
    const-string v0, "urls"

    invoke-static {v12, v0}, Lcom/github/tvbox/osc/util/DefaultConfig;->safeJsonStringList(Lcom/google/gson/JsonObject;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1368
    .local v0, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1369
    .local v2, "sourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1370
    .local v4, "sourceUrls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v9, 0x1

    .line 1371
    .local v9, "sourceIndex":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_8
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_9

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v20, v0

    .end local v0    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v20, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, v19

    check-cast v0, Ljava/lang/String;

    .line 1372
    .local v0, "url":Ljava/lang/String;
    move-object/from16 v19, v5

    .end local v5    # "groupElement":Lcom/google/gson/JsonElement;
    .local v19, "groupElement":Lcom/google/gson/JsonElement;
    const-string v5, "\\$"

    move/from16 v22, v7

    const/4 v7, 0x2

    .end local v7    # "groupIndex":I
    .local v22, "groupIndex":I
    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .line 1373
    .local v5, "splitText":[Ljava/lang/String;
    const/16 v16, 0x0

    aget-object v7, v5, v16

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1374
    array-length v7, v5

    move-object/from16 v23, v8

    const/4 v8, 0x1

    .end local v8    # "groupName":Ljava/lang/String;
    .local v23, "groupName":Ljava/lang/String;
    if-le v7, v8, :cond_8

    .line 1375
    aget-object v7, v5, v8

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 1377
    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u6e90"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1378
    :goto_9
    nop

    .end local v0    # "url":Ljava/lang/String;
    .end local v5    # "splitText":[Ljava/lang/String;
    add-int/lit8 v9, v9, 0x1

    .line 1379
    move-object/from16 v5, v19

    move-object/from16 v0, v20

    move/from16 v7, v22

    move-object/from16 v8, v23

    goto :goto_8

    .line 1380
    .end local v19    # "groupElement":Lcom/google/gson/JsonElement;
    .end local v20    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v22    # "groupIndex":I
    .end local v23    # "groupName":Ljava/lang/String;
    .local v0, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v5, "groupElement":Lcom/google/gson/JsonElement;
    .restart local v7    # "groupIndex":I
    .restart local v8    # "groupName":Ljava/lang/String;
    :cond_9
    move-object/from16 v20, v0

    move-object/from16 v19, v5

    move/from16 v22, v7

    move-object/from16 v23, v8

    const/16 v16, 0x0

    .end local v0    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "groupElement":Lcom/google/gson/JsonElement;
    .end local v7    # "groupIndex":I
    .end local v8    # "groupName":Ljava/lang/String;
    .restart local v19    # "groupElement":Lcom/google/gson/JsonElement;
    .restart local v20    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v22    # "groupIndex":I
    .restart local v23    # "groupName":Ljava/lang/String;
    invoke-virtual {v11, v2}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelSourceNames(Ljava/util/ArrayList;)V

    .line 1381
    invoke-virtual {v11, v4}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelUrls(Ljava/util/ArrayList;)V

    .line 1382
    invoke-virtual {v6}, Lcom/github/tvbox/osc/bean/LiveChannelGroup;->getLiveChannels()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {v1, v0, v11}, Lcom/github/tvbox/osc/api/ApiConfig;->mergeLiveChannel(Ljava/util/ArrayList;Lcom/github/tvbox/osc/bean/LiveChannelItem;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1383
    add-int/lit8 v0, v3, 0x1

    .end local v3    # "channelIndex":I
    .local v0, "channelIndex":I
    invoke-virtual {v11, v3}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelIndex(I)V

    .line 1384
    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v11, v14}, Lcom/github/tvbox/osc/bean/LiveChannelItem;->setChannelNum(I)V

    move v3, v0

    .line 1386
    .end local v0    # "channelIndex":I
    .end local v2    # "sourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "sourceUrls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "sourceIndex":I
    .end local v11    # "liveChannelItem":Lcom/github/tvbox/osc/bean/LiveChannelItem;
    .end local v12    # "obj":Lcom/google/gson/JsonObject;
    .end local v15    # "channelElement":Lcom/google/gson/JsonElement;
    .end local v20    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v3    # "channelIndex":I
    :cond_a
    move-object/from16 v2, v18

    move-object/from16 v5, v19

    move-object/from16 v4, v21

    move/from16 v7, v22

    move-object/from16 v8, v23

    const/4 v9, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    goto/16 :goto_2

    .line 1387
    .end local v19    # "groupElement":Lcom/google/gson/JsonElement;
    .end local v22    # "groupIndex":I
    .end local v23    # "groupName":Ljava/lang/String;
    .restart local v5    # "groupElement":Lcom/google/gson/JsonElement;
    .restart local v7    # "groupIndex":I
    .restart local v8    # "groupName":Ljava/lang/String;
    :cond_b
    move-object/from16 v21, v4

    move-object/from16 v19, v5

    move/from16 v22, v7

    move-object/from16 v23, v8

    .end local v5    # "groupElement":Lcom/google/gson/JsonElement;
    .end local v7    # "groupIndex":I
    .end local v8    # "groupName":Ljava/lang/String;
    .restart local v19    # "groupElement":Lcom/google/gson/JsonElement;
    .restart local v22    # "groupIndex":I
    .restart local v23    # "groupName":Ljava/lang/String;
    iget-object v0, v1, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1388
    .end local v6    # "liveChannelGroup":Lcom/github/tvbox/osc/bean/LiveChannelGroup;
    .end local v10    # "splitGroupName":[Ljava/lang/String;
    .end local v19    # "groupElement":Lcom/google/gson/JsonElement;
    .end local v23    # "groupName":Ljava/lang/String;
    move v2, v3

    move v3, v14

    move/from16 v0, v22

    goto/16 :goto_0

    .line 1389
    .end local v14    # "channelNum":I
    .end local v22    # "groupIndex":I
    .local v0, "groupIndex":I
    .local v2, "channelIndex":I
    .local v3, "channelNum":I
    :cond_c
    return-void
.end method

.method public proxyLocal(Ljava/util/Map;)[Ljava/lang/Object;
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "param"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1668
    .local p1, "param":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->getCurrentProxySource(Ljava/util/Map;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    .line 1669
    .local v0, "source":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getApi()Ljava/lang/String;

    move-result-object v1

    .line 1671
    .local v1, "api":Ljava/lang/String;
    const-string v2, "siteKey"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1672
    .local v2, "siteKey":Ljava/lang/String;
    const-string v3, "do"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1674
    .local v3, "action":Ljava/lang/String;
    const-string v4, "js"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1675
    .local v4, "isJs":Z
    const-string v5, "py"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 1676
    .local v5, "isPy":Z
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const-string v8, "player_is_live"

    invoke-static {v8, v7}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    .line 1677
    .local v7, "isLive":Z
    const-string v8, ".js"

    invoke-virtual {v1, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    .line 1678
    .local v9, "isApiJs":Z
    const-string v10, ".py"

    invoke-virtual {v1, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    .line 1680
    .local v11, "isApiPy":Z
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 1681
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getType()I

    move-result v12

    const/4 v13, 0x3

    if-ne v12, v13, :cond_0

    if-nez v4, :cond_0

    if-nez v5, :cond_0

    if-nez v7, :cond_0

    if-nez v9, :cond_0

    if-nez v11, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 1688
    .local v6, "canUseType3":Z
    :goto_0
    if-eqz v6, :cond_4

    .line 1690
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getCSP(Lcom/github/tvbox/osc/bean/SourceBean;)Lcom/github/catvod/crawler/Spider;

    move-result-object v10

    .line 1692
    .local v10, "spider":Lcom/github/catvod/crawler/Spider;
    invoke-virtual {v10, p1}, Lcom/github/catvod/crawler/Spider;->proxy(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v12

    .line 1693
    .local v12, "result":[Ljava/lang/Object;
    if-eqz v12, :cond_1

    return-object v12

    .line 1695
    :cond_1
    iget-object v13, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v13, p1}, Lcom/github/catvod/crawler/JarLoader;->proxyInvoke(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v13

    move-object v12, v13

    .line 1696
    if-eqz v12, :cond_2

    return-object v12

    .line 1698
    :cond_2
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->proxyDirect(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v12, v13

    .line 1699
    if-eqz v12, :cond_3

    return-object v12

    .line 1701
    :cond_3
    return-object v8

    .line 1702
    .end local v10    # "spider":Lcom/github/catvod/crawler/Spider;
    .end local v12    # "result":[Ljava/lang/Object;
    :catchall_0
    move-exception v10

    .line 1703
    .local v10, "th":Ljava/lang/Throwable;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "echo-proxy siteKey error: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 1704
    return-object v8

    .line 1708
    .end local v10    # "th":Ljava/lang/Throwable;
    :cond_4
    if-eqz v4, :cond_5

    .line 1709
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-virtual {v8, p1}, Lcom/github/catvod/crawler/JsLoader;->proxyInvoke(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 1712
    :cond_5
    if-eqz v7, :cond_9

    .line 1713
    iget-object v12, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    if-eqz v12, :cond_6

    goto :goto_1

    :cond_6
    const-string v12, ""

    .line 1715
    .local v12, "liveApi":Ljava/lang/String;
    :goto_1
    invoke-virtual {v12, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 1716
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    iget-object v10, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    invoke-interface {v8, p1, v10}, Lcom/github/catvod/crawler/python/IPyLoader;->proxyInvoke(Ljava/util/Map;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 1718
    :cond_7
    invoke-virtual {v12, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1719
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-virtual {v8, p1}, Lcom/github/catvod/crawler/JsLoader;->proxyInvoke(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 1721
    :cond_8
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v8, p1}, Lcom/github/catvod/crawler/JarLoader;->proxyInvoke(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 1724
    .end local v12    # "liveApi":Ljava/lang/String;
    :cond_9
    if-eqz v5, :cond_a

    .line 1725
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->getCurrentPyKey()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, p1, v10}, Lcom/github/catvod/crawler/python/IPyLoader;->proxyInvoke(Ljava/util/Map;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 1728
    :cond_a
    if-eqz v11, :cond_b

    .line 1729
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-direct {p0}, Lcom/github/tvbox/osc/api/ApiConfig;->getCurrentPyKey()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, p1, v10}, Lcom/github/catvod/crawler/python/IPyLoader;->proxyInvoke(Ljava/util/Map;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 1732
    :cond_b
    iget-object v8, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v8, p1}, Lcom/github/catvod/crawler/JarLoader;->proxyInvoke(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v8

    return-object v8
.end method

.method public refreshCloudDiskOrder(Ljava/lang/String;)V
    .locals 2
    .param p1, "sourceKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceKey"
        }
    .end annotation

    .line 627
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoadExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/github/tvbox/osc/api/ApiConfig$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/github/tvbox/osc/api/ApiConfig$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 628
    return-void
.end method

.method public refreshLiveApiHistoryItems()V
    .locals 5

    .line 1300
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x7

    if-ge v0, v1, :cond_0

    return-void

    .line 1301
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1302
    .local v0, "liveSettingItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/LiveSettingItem;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "live_api_history"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1303
    .local v1, "history":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 1304
    new-instance v3, Lcom/github/tvbox/osc/bean/LiveSettingItem;

    invoke-direct {v3}, Lcom/github/tvbox/osc/bean/LiveSettingItem;-><init>()V

    .line 1305
    .local v3, "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    invoke-virtual {v3, v2}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemIndex(I)V

    .line 1306
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/github/tvbox/osc/bean/LiveSettingItem;->setItemName(Ljava/lang/String;)V

    .line 1307
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1303
    .end local v3    # "liveSettingItem":Lcom/github/tvbox/osc/bean/LiveSettingItem;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1309
    .end local v2    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSettingGroupList:Ljava/util/List;

    const/4 v3, 0x6

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/LiveSettingGroup;

    invoke-virtual {v2, v0}, Lcom/github/tvbox/osc/bean/LiveSettingGroup;->setLiveSettingItems(Ljava/util/ArrayList;)V

    .line 1310
    return-void
.end method

.method public reloadMainJar(Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V
    .locals 4
    .param p1, "callback"    # Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation

    .line 390
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 391
    const-string v0, "\u672a\u914d\u7f6e"

    const-string v1, "\u5f53\u524d\u914d\u7f6e\u6ca1\u6709 Spider JAR"

    const-string v2, "\u65e0"

    const-string v3, "-"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->updateJarRuntime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    invoke-interface {p1, v1}, Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;->error(Ljava/lang/String;)V

    .line 393
    return-void

    .line 395
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-virtual {v0}, Lcom/github/catvod/crawler/JarLoader;->clear()V

    .line 396
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->spider:Ljava/lang/String;

    invoke-virtual {p0, v0, v1, p1}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJar(ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V

    .line 397
    return-void
.end method

.method public searchDanmuUi(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "longClick"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "episode",
            "longClick"
        }
    .end annotation

    .line 1645
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->danmuSearchExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/github/tvbox/osc/api/ApiConfig$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/github/tvbox/osc/api/ApiConfig$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1653
    return-void
.end method

.method public setCurrentPlaySourceKey(Ljava/lang/String;)V
    .locals 1
    .param p1, "sourceKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceKey"
        }
    .end annotation

    .line 1766
    if-nez p1, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentPlaySourceKey:Ljava/lang/String;

    .line 1767
    return-void
.end method

.method public setDefaultParse(Lcom/github/tvbox/osc/bean/ParseBean;)V
    .locals 2
    .param p1, "parseBean"    # Lcom/github/tvbox/osc/bean/ParseBean;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parseBean"
        }
    .end annotation

    .line 1830
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mDefaultParse:Lcom/github/tvbox/osc/bean/ParseBean;

    if-eqz v0, :cond_0

    .line 1831
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/bean/ParseBean;->setDefault(Z)V

    .line 1832
    :cond_0
    iput-object p1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mDefaultParse:Lcom/github/tvbox/osc/bean/ParseBean;

    .line 1833
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/ParseBean;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "parse_default"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1834
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/github/tvbox/osc/bean/ParseBean;->setDefault(Z)V

    .line 1835
    return-void
.end method

.method public setLiveJar(Ljava/lang/String;)V
    .locals 3
    .param p1, "liveJar"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "liveJar"
        }
    .end annotation

    .line 1565
    const-string v0, ".py"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    .line 1566
    invoke-static {p1}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    .line 1567
    iget-object v2, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    invoke-interface {v2, v0, p1, v1}, Lcom/github/catvod/crawler/python/IPyLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    .line 1568
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->pyLoader:Lcom/github/catvod/crawler/python/IPyLoader;

    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLivePyKey:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/github/catvod/crawler/python/IPyLoader;->setRecentPyKey(Ljava/lang/String;)V

    goto :goto_1

    .line 1569
    :cond_0
    const-string v0, ".js"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1570
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jsLoader:Lcom/github/catvod/crawler/JsLoader;

    invoke-static {p1}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, p1, v1, v1}, Lcom/github/catvod/crawler/JsLoader;->getSpider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/catvod/crawler/Spider;

    goto :goto_1

    .line 1572
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    move-object v0, p1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveSpider:Ljava/lang/String;

    .line 1573
    .local v0, "jarUrl":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->jarLoader:Lcom/github/catvod/crawler/JarLoader;

    invoke-static {v0}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/github/catvod/crawler/JarLoader;->setRecentJarKey(Ljava/lang/String;)V

    .line 1575
    .end local v0    # "jarUrl":Ljava/lang/String;
    :goto_1
    iput-object p1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->currentLiveSpider:Ljava/lang/String;

    .line 1576
    return-void
.end method

.method public setSourceBean(Lcom/github/tvbox/osc/bean/SourceBean;)V
    .locals 2
    .param p1, "sourceBean"    # Lcom/github/tvbox/osc/bean/SourceBean;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceBean"
        }
    .end annotation

    .line 1825
    iput-object p1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->mHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

    .line 1826
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "home_api"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1827
    return-void
.end method

.method public shouldReloadLiveConfig()Z
    .locals 3

    .line 335
    const-string v0, "live_api_url"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 336
    .local v0, "apiUrl":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "api_url"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    .line 337
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->liveChannelGroupList:Ljava/util/List;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->loadedLiveConfigUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public warmSearchSpiders()V
    .locals 3

    .line 1603
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->sourceBeanList:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1604
    .local v0, "sources":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/SourceBean;>;"
    iget-object v1, p0, Lcom/github/tvbox/osc/api/ApiConfig;->configLoadExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/github/tvbox/osc/api/ApiConfig$11;

    invoke-direct {v2, p0, v0}, Lcom/github/tvbox/osc/api/ApiConfig$11;-><init>(Lcom/github/tvbox/osc/api/ApiConfig;Ljava/util/ArrayList;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1627
    return-void
.end method
