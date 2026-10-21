.class public Lcom/github/tvbox/osc/api/DanmakuApi;
.super Ljava/lang/Object;
.source "DanmakuApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;,
        Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;,
        Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;
    }
.end annotation


# static fields
.field private static final BUILTIN_API:Ljava/lang/String; = ""

.field private static final BUILTIN_MAX_RETRY:I = 0x2

.field private static final BUILTIN_TIMEOUT:J

.field private static final EPISODE_QUERY_EMPTY:I = 0x1

.field private static final EPISODE_QUERY_NUMBER:I = 0x0

.field private static final PRIORITY_KEY:Ljava/lang/String; = "danmu_source_priority"

.field public static final PRIORITY_LOCAL_FIRST:I = 0x1

.field public static final PRIORITY_LOCAL_ONLY:I = 0x3

.field public static final PRIORITY_SERVER_FIRST:I = 0x0

.field public static final PRIORITY_SERVER_ONLY:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field private static final USE_DEFAULT_KEY:Ljava/lang/String; = "danmu_api_use_default"

.field private static final handler:Landroid/os/Handler;

.field private static volatile lastIntegrationError:Ljava/lang/String;

.field private static final searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 31
    const-class v0, Lcom/github/tvbox/osc/api/DanmakuApi;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    .line 43
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x14

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/github/tvbox/osc/api/DanmakuApi;->BUILTIN_TIMEOUT:J

    .line 47
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->handler:Landroid/os/Handler;

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 87
    const-string v0, ""

    sput-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->lastIntegrationError:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Z)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # I
    .param p6, "x6"    # I
    .param p7, "x7"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p8, "x8"    # Z

    .line 30
    invoke-static/range {p0 .. p8}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchIntegration(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Z)V

    return-void
.end method

.method static synthetic access$100(I)Z
    .locals 1
    .param p0, "x0"    # I

    .line 30
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isCurrentSearch(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;II)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .line 30
    invoke-static/range {p0 .. p5}, Lcom/github/tvbox/osc/api/DanmakuApi;->tryNextEpisodeQuery(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;II)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 30
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->safeLog(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findAnimeId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "x4"    # I

    .line 30
    invoke-static {p0, p1, p2, p3, p4}, Lcom/github/tvbox/osc/api/DanmakuApi;->loadBuiltinBangumi(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V

    return-void
.end method

.method static synthetic access$1400(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->findEpisode(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->commentJsonToXml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p1, "x1"    # I

    .line 30
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->notifyNotFound(Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V

    return-void
.end method

.method static synthetic access$300(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->parseUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400()Landroid/os/Handler;
    .locals 1

    .line 30
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;III)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "x4"    # I
    .param p5, "x5"    # I
    .param p6, "x6"    # I

    .line 30
    invoke-static/range {p0 .. p6}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchBuiltin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;III)V

    return-void
.end method

.method static synthetic access$600(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;IZ)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "x4"    # I
    .param p5, "x5"    # Z

    .line 30
    invoke-static/range {p0 .. p5}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchBuiltinAnime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;IZ)V

    return-void
.end method

.method static synthetic access$700(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->findEpisodeFromSearchEpisodes(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .param p4, "x4"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p5, "x5"    # I

    .line 30
    invoke-static/range {p0 .. p5}, Lcom/github/tvbox/osc/api/DanmakuApi;->loadBuiltinComment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V

    return-void
.end method

.method static synthetic access$900(Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 30
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isSearchEpisodesMovieResult(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static canSearch()Z
    .locals 1

    .line 58
    invoke-static {}, Lcom/github/tvbox/osc/util/DanmuHelper;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getApiUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static cancel()V
    .locals 1

    .line 267
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 268
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/catvod/net/OkHttp;->cancel(Ljava/lang/String;)V

    .line 269
    return-void
.end method

.method private static commentJsonToXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "body"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 694
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 695
    .local v0, "object":Lorg/json/JSONObject;
    const-string v1, "comments"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 696
    .local v1, "comments":Lorg/json/JSONArray;
    if-nez v1, :cond_0

    const-string v2, "data"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 697
    :cond_0
    const-string v2, ""

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-gtz v3, :cond_1

    goto/16 :goto_2

    .line 698
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 699
    .local v3, "builder":Ljava/lang/StringBuilder;
    const-string v4, "<i>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 700
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_6

    .line 701
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 702
    .local v5, "item":Lorg/json/JSONObject;
    if-nez v5, :cond_2

    goto :goto_1

    .line 703
    :cond_2
    const-string v6, "p"

    invoke-virtual {v5, v6, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 704
    .local v6, "param":Ljava/lang/String;
    const-string v7, "m"

    invoke-virtual {v5, v7, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 705
    .local v7, "text":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    const-string v8, "text"

    invoke-virtual {v5, v8, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 706
    :cond_3
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    goto :goto_1

    .line 707
    :cond_4
    const-string v8, "<d p=\""

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Lcom/github/tvbox/osc/api/DanmakuApi;->normalizeDanmakuParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/github/tvbox/osc/api/DanmakuApi;->escapeXml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\">"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 708
    invoke-static {v7}, Lcom/github/tvbox/osc/api/DanmakuApi;->escapeXml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "</d>"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 700
    .end local v5    # "item":Lorg/json/JSONObject;
    .end local v6    # "param":Ljava/lang/String;
    .end local v7    # "text":Ljava/lang/String;
    :cond_5
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 710
    .end local v4    # "i":I
    :cond_6
    const-string v2, "</i>"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 711
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 712
    .local v2, "xml":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "echo-danmaku builtin xml length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 713
    return-object v2

    .line 697
    .end local v2    # "xml":Ljava/lang/String;
    .end local v3    # "builder":Ljava/lang/StringBuilder;
    :cond_7
    :goto_2
    return-object v2
.end method

.method private static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 488
    const-string v0, ""

    if-nez p0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object v1, p0

    :goto_0
    :try_start_0
    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 489
    :catchall_0
    move-exception v1

    .line 490
    .local v1, "th":Ljava/lang/Throwable;
    if-nez p0, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, p0

    :goto_1
    return-object v0
.end method

.method private static escapeXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 791
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 792
    :cond_0
    const-string v0, "&"

    const-string v1, "&amp;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 793
    const-string v1, "\""

    const-string v2, "&quot;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 794
    const-string v1, "\'"

    const-string v2, "&apos;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 795
    const-string v1, ">"

    const-string v2, "&gt;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 796
    const-string v1, "<"

    const-string v2, "&lt;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 792
    return-object v0
.end method

.method private static extractNumber(Ljava/lang/String;)I
    .locals 5
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 679
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 680
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 681
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 682
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 683
    .local v3, "ch":C
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 681
    .end local v3    # "ch":C
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 685
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_3

    return v1

    .line 687
    :cond_3
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v1

    .line 688
    :catchall_0
    move-exception v2

    .line 689
    .local v2, "th":Ljava/lang/Throwable;
    return v1
.end method

.method private static findAnimeId(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "body"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 508
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 509
    .local v0, "object":Lorg/json/JSONObject;
    const-string v1, "animes"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 510
    .local v1, "array":Lorg/json/JSONArray;
    if-nez v1, :cond_0

    const-string v2, "anime"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 511
    :cond_0
    if-nez v1, :cond_1

    const-string v2, "data"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 512
    :cond_1
    const-string v2, ""

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-gtz v3, :cond_2

    goto :goto_0

    .line 513
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 514
    .local v3, "item":Lorg/json/JSONObject;
    if-nez v3, :cond_3

    return-object v2

    .line 515
    :cond_3
    const-string v4, "animeId"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 516
    .local v4, "id":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v5, "id"

    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 517
    :cond_4
    return-object v4

    .line 512
    .end local v3    # "item":Lorg/json/JSONObject;
    .end local v4    # "id":Ljava/lang/String;
    :cond_5
    :goto_0
    return-object v2
.end method

.method private static findEpisode(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .locals 1
    .param p0, "body"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "body",
            "episode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 521
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findEpisode(Ljava/lang/String;Ljava/lang/String;Z)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    move-result-object v0

    return-object v0
.end method

.method private static findEpisode(Ljava/lang/String;Ljava/lang/String;Z)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .locals 16
    .param p0, "body"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "allowMovieFallback"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "body",
            "episode",
            "allowMovieFallback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 525
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 526
    .local v0, "object":Lorg/json/JSONObject;
    invoke-static {v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findEpisodeList(Lorg/json/JSONObject;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;

    move-result-object v2

    .line 527
    .local v2, "episodeList":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;
    const/4 v3, 0x0

    if-nez v2, :cond_0

    move-object v4, v3

    goto :goto_0

    :cond_0
    iget-object v4, v2, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;->episodes:Lorg/json/JSONArray;

    .line 528
    .local v4, "episodes":Lorg/json/JSONArray;
    :goto_0
    if-eqz v4, :cond_e

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-gtz v5, :cond_1

    move-object/from16 v14, p1

    goto/16 :goto_5

    .line 529
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->extractNumber(Ljava/lang/String;)I

    move-result v5

    .line 530
    .local v5, "targetNumber":I
    const/4 v6, 0x0

    .line 531
    .local v6, "first":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    const/4 v7, 0x0

    .line 532
    .local v7, "firstMandarin":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_a

    .line 533
    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 534
    .local v9, "item":Lorg/json/JSONObject;
    if-nez v9, :cond_2

    goto :goto_2

    .line 535
    :cond_2
    const-string v10, "episodeId"

    const-string v11, "id"

    filled-new-array {v10, v11}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/github/tvbox/osc/api/DanmakuApi;->firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 536
    .local v10, "id":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 532
    .end local v9    # "item":Lorg/json/JSONObject;
    .end local v10    # "id":Ljava/lang/String;
    :goto_2
    move-object/from16 v14, p1

    goto :goto_3

    .line 537
    .restart local v9    # "item":Lorg/json/JSONObject;
    .restart local v10    # "id":Ljava/lang/String;
    :cond_3
    const-string v11, "episodeTitle"

    const-string v12, "title"

    const-string v13, "name"

    filled-new-array {v11, v12, v13}, [Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Lcom/github/tvbox/osc/api/DanmakuApi;->firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 538
    .local v11, "title":Ljava/lang/String;
    const-string v12, "episodeNumber"

    const-string v13, "number"

    const-string v14, "sort"

    filled-new-array {v12, v13, v14}, [Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Lcom/github/tvbox/osc/api/DanmakuApi;->firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/github/tvbox/osc/api/DanmakuApi;->parseEpisodeNumber(Ljava/lang/String;)I

    move-result v12

    .line 539
    .local v12, "number":I
    new-instance v13, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    invoke-direct {v13, v10, v11, v12}, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 540
    .local v13, "match":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    if-nez v6, :cond_4

    move-object v6, v13

    .line 541
    :cond_4
    if-nez v7, :cond_5

    invoke-static {v11}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMandarinTitle(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_5

    move-object v7, v13

    .line 542
    :cond_5
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_6

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_6

    move-object/from16 v14, p1

    invoke-virtual {v11, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 543
    return-object v13

    .line 542
    :cond_6
    move-object/from16 v14, p1

    .line 545
    :cond_7
    if-lez v5, :cond_8

    if-ne v12, v5, :cond_8

    return-object v13

    .line 546
    :cond_8
    if-lez v5, :cond_9

    invoke-static {v11}, Lcom/github/tvbox/osc/api/DanmakuApi;->extractNumber(Ljava/lang/String;)I

    move-result v15

    if-ne v15, v5, :cond_9

    return-object v13

    .line 532
    .end local v9    # "item":Lorg/json/JSONObject;
    .end local v10    # "id":Ljava/lang/String;
    .end local v11    # "title":Ljava/lang/String;
    .end local v12    # "number":I
    .end local v13    # "match":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    :cond_9
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_a
    move-object/from16 v14, p1

    .line 548
    .end local v8    # "i":I
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_b

    return-object v6

    .line 549
    :cond_b
    if-eqz p2, :cond_d

    iget-boolean v8, v2, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;->isMovie:Z

    if-eqz v8, :cond_d

    if-nez v7, :cond_c

    move-object v3, v6

    goto :goto_4

    :cond_c
    move-object v3, v7

    :goto_4
    return-object v3

    .line 550
    :cond_d
    return-object v3

    .line 528
    .end local v5    # "targetNumber":I
    .end local v6    # "first":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .end local v7    # "firstMandarin":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    :cond_e
    move-object/from16 v14, p1

    :goto_5
    return-object v3
.end method

.method private static findEpisodeFromSearchEpisodes(Ljava/lang/String;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .locals 4
    .param p0, "body"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "body",
            "episode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 554
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findEpisode(Ljava/lang/String;Ljava/lang/String;Z)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    move-result-object v0

    .line 555
    .local v0, "match":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    if-eqz v0, :cond_0

    return-object v0

    .line 556
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->findMovieFallback(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    move-result-object v1

    .line 557
    .local v1, "movieFallback":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    if-eqz v1, :cond_1

    .line 558
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "echo-danmaku episodes movie fallback episode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;->title:Ljava/lang/String;

    invoke-static {v3}, Lcom/github/tvbox/osc/api/DanmakuApi;->safeLog(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", episodeId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 560
    :cond_1
    return-object v1
.end method

.method private static findEpisodeList(Lorg/json/JSONObject;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;
    .locals 7
    .param p0, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 569
    const-string v0, "episodes"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 570
    .local v1, "array":Lorg/json/JSONArray;
    if-eqz v1, :cond_0

    new-instance v0, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;

    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieType(Lorg/json/JSONObject;)Z

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;-><init>(Lorg/json/JSONArray;Z)V

    return-object v0

    .line 571
    :cond_0
    const-string v2, "bangumi"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 572
    .local v2, "bangumi":Lorg/json/JSONObject;
    if-eqz v2, :cond_1

    .line 573
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 574
    if-eqz v1, :cond_1

    new-instance v0, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;

    invoke-static {v2}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieType(Lorg/json/JSONObject;)Z

    move-result v3

    invoke-direct {v0, v1, v3}, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;-><init>(Lorg/json/JSONArray;Z)V

    return-object v0

    .line 576
    :cond_1
    const-string v3, "animes"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 577
    .local v3, "animes":Lorg/json/JSONArray;
    if-nez v3, :cond_2

    const-string v4, "anime"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 578
    :cond_2
    if-nez v3, :cond_3

    const-string v4, "data"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 579
    :cond_3
    if-eqz v3, :cond_6

    .line 580
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_6

    .line 581
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 582
    .local v5, "item":Lorg/json/JSONObject;
    if-nez v5, :cond_4

    goto :goto_1

    .line 583
    :cond_4
    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 584
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_5

    new-instance v0, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;

    invoke-static {v5}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieType(Lorg/json/JSONObject;)Z

    move-result v6

    invoke-direct {v0, v1, v6}, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;-><init>(Lorg/json/JSONArray;Z)V

    return-object v0

    .line 580
    .end local v5    # "item":Lorg/json/JSONObject;
    :cond_5
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 587
    .end local v4    # "i":I
    :cond_6
    const/4 v0, 0x0

    return-object v0
.end method

.method private static findEpisodes(Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .locals 2
    .param p0, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 564
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findEpisodeList(Lorg/json/JSONObject;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;

    move-result-object v0

    .line 565
    .local v0, "episodeList":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeList;->episodes:Lorg/json/JSONArray;

    :goto_0
    return-object v1
.end method

.method private static findMovieFallback(Lorg/json/JSONObject;Ljava/lang/String;)Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .locals 14
    .param p0, "object"    # Lorg/json/JSONObject;
    .param p1, "episode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "object",
            "episode"
        }
    .end annotation

    .line 644
    const-string v0, "animes"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 645
    .local v0, "animes":Lorg/json/JSONArray;
    if-nez v0, :cond_0

    const-string v1, "anime"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 646
    :cond_0
    if-nez v0, :cond_1

    const-string v1, "data"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 647
    :cond_1
    if-nez v0, :cond_2

    const/4 v1, 0x0

    return-object v1

    .line 648
    :cond_2
    invoke-static {p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->prefersCantonese(Ljava/lang/String;)Z

    move-result v1

    .line 649
    .local v1, "preferCantonese":Z
    const/4 v2, 0x0

    .line 650
    .local v2, "firstMovie":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_a

    .line 651
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 652
    .local v4, "anime":Lorg/json/JSONObject;
    if-eqz v4, :cond_9

    invoke-static {v4}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieType(Lorg/json/JSONObject;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_3

    .line 653
    :cond_3
    const-string v5, "episodes"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 654
    .local v5, "episodes":Lorg/json/JSONArray;
    if-nez v5, :cond_4

    goto :goto_3

    .line 655
    :cond_4
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_9

    .line 656
    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 657
    .local v7, "item":Lorg/json/JSONObject;
    if-nez v7, :cond_5

    goto :goto_2

    .line 658
    :cond_5
    const-string v8, "episodeId"

    const-string v9, "id"

    filled-new-array {v8, v9}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/github/tvbox/osc/api/DanmakuApi;->firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 659
    .local v8, "id":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6

    goto :goto_2

    .line 660
    :cond_6
    const-string v9, "episodeTitle"

    const-string v10, "title"

    const-string v11, "name"

    filled-new-array {v9, v10, v11}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/github/tvbox/osc/api/DanmakuApi;->firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 661
    .local v9, "title":Ljava/lang/String;
    new-instance v10, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;

    const-string v11, "episodeNumber"

    const-string v12, "number"

    const-string v13, "sort"

    filled-new-array {v11, v12, v13}, [Ljava/lang/String;

    move-result-object v11

    invoke-static {v7, v11}, Lcom/github/tvbox/osc/api/DanmakuApi;->firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/github/tvbox/osc/api/DanmakuApi;->parseEpisodeNumber(Ljava/lang/String;)I

    move-result v11

    invoke-direct {v10, v8, v9, v11}, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 662
    .local v10, "match":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    if-nez v2, :cond_7

    move-object v2, v10

    .line 663
    :cond_7
    invoke-static {v9, v1}, Lcom/github/tvbox/osc/api/DanmakuApi;->isPreferredLanguageTitle(Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_8

    return-object v10

    .line 655
    .end local v7    # "item":Lorg/json/JSONObject;
    .end local v8    # "id":Ljava/lang/String;
    .end local v9    # "title":Ljava/lang/String;
    .end local v10    # "match":Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    :cond_8
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 650
    .end local v4    # "anime":Lorg/json/JSONObject;
    .end local v5    # "episodes":Lorg/json/JSONArray;
    .end local v6    # "j":I
    :cond_9
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 666
    .end local v3    # "i":I
    :cond_a
    return-object v2
.end method

.method private static findPayload(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 7
    .param p0, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 820
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 821
    :cond_0
    const/4 v1, 0x4

    const-string v2, "url"

    const-string v3, "xml"

    const-string v4, "danmaku"

    const-string v5, "content"

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, v2, v3

    .line 822
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {p0, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 823
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    return-object v5

    .line 821
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 825
    :cond_2
    const-string v1, "data"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 826
    .local v1, "data":Ljava/lang/Object;
    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_3

    move-object v0, v1

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findPayload(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 827
    :cond_3
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_4

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 828
    :cond_4
    const-string v2, "result"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 829
    .local v2, "result":Ljava/lang/Object;
    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_5

    move-object v0, v2

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->findPayload(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 830
    :cond_5
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_6

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 831
    :cond_6
    return-object v0
.end method

.method private static varargs firstString(Lorg/json/JSONObject;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "object"    # Lorg/json/JSONObject;
    .param p1, "keys"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "object",
            "keys"
        }
    .end annotation

    .line 757
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    const-string v2, ""

    if-ge v1, v0, :cond_1

    aget-object v3, p1, v1

    .line 758
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 759
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    return-object v2

    .line 757
    .end local v2    # "value":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 761
    :cond_1
    return-object v2
.end method

.method private static getApiUrl()Ljava/lang/String;
    .locals 4

    .line 464
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->isUseDefault()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_1

    .line 465
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getDanmaku()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 466
    .local v0, "config":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1

    .line 468
    .end local v0    # "config":Ljava/lang/String;
    :cond_1
    const-string v0, "danmu_api"

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 469
    .local v0, "custom":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 470
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getDanmaku()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 471
    .local v2, "config":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    return-object v2

    .line 472
    :cond_3
    return-object v1
.end method

.method public static getDisplayApiUrl()Ljava/lang/String;
    .locals 4

    .line 62
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->isUseDefault()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    return-object v1

    .line 63
    :cond_0
    const-string v0, "danmu_api"

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    .local v0, "custom":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 65
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getDanmaku()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "config":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    move-object v1, v2

    :goto_0
    return-object v1
.end method

.method private static getEpisodeQuery(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "episode"    # Ljava/lang/String;
    .param p1, "queryMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "episode",
            "queryMode"
        }
    .end annotation

    .line 495
    const-string v0, ""

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    return-object v0

    .line 496
    :cond_0
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->extractNumber(Ljava/lang/String;)I

    move-result v1

    .line 497
    .local v1, "number":I
    if-lez v1, :cond_1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private static getNextEpisodeQueryMode(Ljava/lang/String;I)I
    .locals 1
    .param p0, "episode"    # Ljava/lang/String;
    .param p1, "queryMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "episode",
            "queryMode"
        }
    .end annotation

    .line 501
    if-nez p1, :cond_0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->getEpisodeQuery(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 502
    const/4 v0, 0x1

    return v0

    .line 504
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public static getPriority()I
    .locals 1
    invoke-static {}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->priority()I
    move-result v0
    return v0
.end method

.method private static hasPlaceholder(Ljava/lang/String;)Z
    .locals 1
    .param p0, "apiUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apiUrl"
        }
    .end annotation

    .line 476
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "{name}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "{episode}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isCantoneseTitle(Ljava/lang/String;)Z
    .locals 1
    .param p0, "title"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "title"
        }
    .end annotation

    .line 616
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\u7ca4\u8bed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isColorValue(Ljava/lang/String;)Z
    .locals 8
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 734
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    .line 735
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 736
    .local v1, "text":Ljava/lang/String;
    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    return v3

    .line 737
    :cond_1
    const-string v2, "0x"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "0X"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 738
    :cond_2
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 739
    .local v4, "color":J
    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-ltz v2, :cond_3

    const-wide/32 v6, 0xffffff

    cmp-long v2, v4, v6

    if-gtz v2, :cond_3

    const/4 v0, 0x1

    :cond_3
    return v0

    .line 737
    .end local v4    # "color":J
    :cond_4
    :goto_0
    return v3

    .line 740
    .end local v1    # "text":Ljava/lang/String;
    :catchall_0
    move-exception v1

    .line 741
    .local v1, "th":Ljava/lang/Throwable;
    return v0
.end method

.method private static isCurrentSearch(I)Z
    .locals 1
    .param p0, "seq"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "seq"
        }
    .end annotation

    .line 448
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isMandarinTitle(Ljava/lang/String;)Z
    .locals 1
    .param p0, "title"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "title"
        }
    .end annotation

    .line 612
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u56fd\u8bed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\u666e\u901a\u8bdd"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isMovieType(Lorg/json/JSONObject;)Z
    .locals 9
    .param p0, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 591
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 592
    :cond_0
    const-string v1, "type"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieTypeText(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    return v4

    .line 593
    :cond_1
    const-string v3, "typeDescription"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieTypeText(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v4

    .line 594
    :cond_2
    const-string v3, "bangumi"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 595
    .local v3, "bangumi":Lorg/json/JSONObject;
    if-eqz v3, :cond_3

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieTypeText(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    return v4

    .line 596
    :cond_3
    const-string v5, "animes"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 597
    .local v5, "animes":Lorg/json/JSONArray;
    if-nez v5, :cond_4

    const-string v6, "anime"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 598
    :cond_4
    if-nez v5, :cond_5

    const-string v6, "data"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 599
    :cond_5
    if-nez v5, :cond_6

    return v0

    .line 600
    :cond_6
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_8

    .line 601
    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 602
    .local v7, "item":Lorg/json/JSONObject;
    if-eqz v7, :cond_7

    invoke-virtual {v7, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieTypeText(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    return v4

    .line 600
    .end local v7    # "item":Lorg/json/JSONObject;
    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 604
    .end local v6    # "i":I
    :cond_8
    return v0
.end method

.method private static isMovieTypeText(Ljava/lang/String;)Z
    .locals 1
    .param p0, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .line 608
    const-string v0, "\u7535\u5f71"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isPreferredLanguageTitle(Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "preferCantonese"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "title",
            "preferCantonese"
        }
    .end annotation

    .line 624
    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isCantoneseTitle(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMandarinTitle(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method private static isSearchEpisodesMovieResult(Ljava/lang/String;)Z
    .locals 6
    .param p0, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "body"
        }
    .end annotation

    .line 629
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 630
    .local v1, "object":Lorg/json/JSONObject;
    const-string v2, "animes"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 631
    .local v2, "animes":Lorg/json/JSONArray;
    if-nez v2, :cond_0

    const-string v3, "anime"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    move-object v2, v3

    .line 632
    :cond_0
    if-nez v2, :cond_1

    const-string v3, "data"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    move-object v2, v3

    .line 633
    :cond_1
    if-nez v2, :cond_2

    return v0

    .line 634
    :cond_2
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 635
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 636
    .local v4, "anime":Lorg/json/JSONObject;
    if-eqz v4, :cond_3

    invoke-static {v4}, Lcom/github/tvbox/osc/api/DanmakuApi;->isMovieType(Lorg/json/JSONObject;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "episodes"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_3

    const/4 v0, 0x1

    return v0

    .line 634
    .end local v4    # "anime":Lorg/json/JSONObject;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 639
    .end local v1    # "object":Lorg/json/JSONObject;
    .end local v2    # "animes":Lorg/json/JSONArray;
    .end local v3    # "i":I
    :cond_4
    goto :goto_1

    .line 638
    :catchall_0
    move-exception v1

    .line 640
    :goto_1
    return v0
.end method

.method public static isUseDefault()Z
    .locals 2

    .line 70
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "danmu_api_use_default"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$searchIntegration$0(ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;ZLjava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 4
    .param p0, "seq"    # I
    .param p1, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p2, "fallbackToLegacy"    # Z
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "episode"    # Ljava/lang/String;
    .param p5, "result"    # Lorg/json/JSONObject;
    .param p6, "error"    # Ljava/lang/String;

    .line 200
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isCurrentSearch(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 201
    :cond_0
    const-string v0, ""

    if-nez p5, :cond_1

    move-object v1, v0

    goto :goto_0

    :cond_1
    const-string v1, "xml"

    invoke-virtual {p5, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 202
    .local v1, "xml":Ljava/lang/String;
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 203
    sput-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->lastIntegrationError:Ljava/lang/String;

    .line 204
    invoke-interface {p1, v1}, Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;->onFound(Ljava/lang/String;)V

    .line 205
    return-void

    .line 207
    :cond_2
    if-eqz p6, :cond_3

    move-object v2, p6

    goto :goto_1

    :cond_3
    if-nez p5, :cond_4

    move-object v2, v0

    goto :goto_1

    .line 208
    :cond_4
    const-string v2, "upstream_error"

    invoke-virtual {p5, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "match_error"

    invoke-virtual {p5, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_1
    nop

    .line 209
    .local v2, "reason":Ljava/lang/String;
    if-nez v2, :cond_5

    goto :goto_2

    :cond_5
    move-object v0, v2

    :goto_2
    sput-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->lastIntegrationError:Ljava/lang/String;

    .line 210
    if-eqz p2, :cond_6

    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getApiUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 211
    invoke-static {p3, p4, p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchLegacy(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    goto :goto_3

    .line 213
    :cond_6
    invoke-interface {p1}, Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;->onNotFound()V

    .line 215
    :goto_3
    return-void
.end method

.method public static lastIntegrationError()Ljava/lang/String;
    .locals 1

    .line 91
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->lastIntegrationError:Ljava/lang/String;

    return-object v0
.end method

.method private static loadBuiltinBangumi(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V
    .locals 3
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "animeId"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "seq"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "baseUrl",
            "animeId",
            "episode",
            "callback",
            "seq"
        }
    .end annotation

    .line 367
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v2/bangumi/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 369
    .local v0, "bangumiUrl":Ljava/lang/String;
    sget-wide v1, Lcom/github/tvbox/osc/api/DanmakuApi;->BUILTIN_TIMEOUT:J

    invoke-static {v1, v2}, Lcom/github/catvod/net/OkHttp;->client(J)Lokhttp3/OkHttpClient;

    move-result-object v1

    sget-object v2, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/github/catvod/net/OkHttp;->newCall(Lokhttp3/OkHttpClient;Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/api/DanmakuApi$5;

    invoke-direct {v2, p4, p3, p2, p0}, Lcom/github/tvbox/osc/api/DanmakuApi$5;-><init>(ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 395
    return-void
.end method

.method private static loadBuiltinComment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V
    .locals 3
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "episodeMatch"    # Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;
    .param p4, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p5, "seq"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "baseUrl",
            "title",
            "episode",
            "episodeMatch",
            "callback",
            "seq"
        }
    .end annotation

    .line 398
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v2/comment/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p3, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?format=json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 399
    .local v0, "commentUrl":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-danmaku builtin load title: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->safeLog(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", request episode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    invoke-static {p2}, Lcom/github/tvbox/osc/api/DanmakuApi;->safeLog(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", matched episode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p3, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;->title:Ljava/lang/String;

    .line 401
    invoke-static {v2}, Lcom/github/tvbox/osc/api/DanmakuApi;->safeLog(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", matched number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p3, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;->number:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", episodeId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p3, Lcom/github/tvbox/osc/api/DanmakuApi$EpisodeMatch;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 399
    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 404
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-danmaku builtin comment: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 405
    sget-wide v1, Lcom/github/tvbox/osc/api/DanmakuApi;->BUILTIN_TIMEOUT:J

    invoke-static {v1, v2}, Lcom/github/catvod/net/OkHttp;->client(J)Lokhttp3/OkHttpClient;

    move-result-object v1

    sget-object v2, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/github/catvod/net/OkHttp;->newCall(Lokhttp3/OkHttpClient;Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/api/DanmakuApi$6;

    invoke-direct {v2, p5, p4}, Lcom/github/tvbox/osc/api/DanmakuApi$6;-><init>(ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    invoke-interface {v1, v2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 435
    return-void
.end method

.method private static newCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;
    .locals 3
    .param p0, "apiUrl"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "name",
            "episode"
        }
    .end annotation

    .line 452
    const-string v0, ""

    if-nez p1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object v1, p1

    :goto_0
    invoke-static {v1}, Lcom/github/catvod/crawler/js/Trans;->t2s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 453
    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, p2

    :goto_1
    invoke-static {v0}, Lcom/github/catvod/crawler/js/Trans;->t2s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 454
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->hasPlaceholder(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 455
    const-string v0, "{name}"

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "{episode}"

    invoke-virtual {v0, v1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/github/catvod/net/OkHttp;->newCall(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v0

    return-object v0

    .line 457
    :cond_2
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    .line 458
    .local v0, "params":Landroidx/collection/ArrayMap;, "Landroidx/collection/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "name"

    invoke-virtual {v0, v1, p1}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    const-string v1, "episode"

    invoke-virtual {v0, v1, p2}, Landroidx/collection/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    invoke-static {v0}, Lcom/github/catvod/net/OkHttp;->toBody(Landroidx/collection/ArrayMap;)Lokhttp3/FormBody;

    move-result-object v1

    sget-object v2, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {p0, v1, v2}, Lcom/github/catvod/net/OkHttp;->newCall(Ljava/lang/String;Lokhttp3/RequestBody;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v1

    return-object v1
.end method

.method public static nextPriority(I)I
    .locals 1
    add-int/lit8 v0, p0, 0x1
    rem-int/lit8 v0, v0, 0x5
    return v0
.end method

.method private static normalizeBaseUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "apiUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apiUrl"
        }
    .end annotation

    .line 480
    if-nez p0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 481
    .local v0, "url":Ljava/lang/String;
    :goto_0
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 482
    :cond_1
    const-string v1, "/87654321"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v3, v1

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 483
    :cond_2
    return-object v0
.end method

.method private static normalizeColor(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "color"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "color"
        }
    .end annotation

    .line 746
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "16777215"

    return-object v0

    .line 747
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 749
    .local v0, "text":Ljava/lang/String;
    :try_start_0
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x10

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 750
    :cond_1
    const-string v1, "0x"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "0X"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 752
    :cond_2
    goto :goto_1

    .line 750
    :cond_3
    :goto_0
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    .line 751
    :catchall_0
    move-exception v1

    .line 753
    :goto_1
    return-object v0
.end method

.method private static normalizeDanmakuParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "param"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "param"
        }
    .end annotation

    .line 717
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 718
    .local v1, "values":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    return-object p0

    .line 719
    :cond_0
    const/4 v2, 0x0

    aget-object v2, v1, v2

    .line 720
    .local v2, "time":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v1, v3

    .line 721
    .local v3, "type":Ljava/lang/String;
    const/4 v4, 0x2

    aget-object v4, v1, v4

    .line 722
    .local v4, "size":Ljava/lang/String;
    const/4 v5, 0x3

    aget-object v5, v1, v5

    .line 723
    .local v5, "color":Ljava/lang/String;
    invoke-static {v4}, Lcom/github/tvbox/osc/api/DanmakuApi;->isColorValue(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 724
    move-object v5, v4

    .line 725
    const-string v4, "25"

    goto :goto_0

    .line 726
    :cond_1
    invoke-static {v5}, Lcom/github/tvbox/osc/api/DanmakuApi;->isColorValue(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 727
    const-string v5, "16777215"

    .line 729
    :cond_2
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Lcom/github/tvbox/osc/api/DanmakuApi;->normalizeColor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static notifyNotFound(Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V
    .locals 2
    .param p0, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p1, "seq"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "callback",
            "seq"
        }
    .end annotation

    .line 438
    if-eqz p0, :cond_1

    invoke-static {p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->isCurrentSearch(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 439
    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/api/DanmakuApi$7;

    invoke-direct {v1, p1, p0}, Lcom/github/tvbox/osc/api/DanmakuApi$7;-><init>(ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 445
    return-void

    .line 438
    :cond_1
    :goto_0
    return-void
.end method

.method private static parseEpisodeNumber(Ljava/lang/String;)I
    .locals 2
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 671
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 672
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    float-to-int v0, v0

    return v0

    .line 673
    :catchall_0
    move-exception v0

    .line 674
    .local v0, "th":Ljava/lang/Throwable;
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->extractNumber(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private static parseUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "body"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 800
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    return-object v1

    .line 801
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 802
    .local v0, "text":Ljava/lang/String;
    const-string v2, "<"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v0

    .line 803
    :cond_1
    const-string v2, "["

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 804
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 805
    .local v2, "array":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 806
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 807
    .local v4, "object":Lorg/json/JSONObject;
    if-nez v4, :cond_2

    goto :goto_1

    .line 808
    :cond_2
    const-string v5, "url"

    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 809
    .local v5, "url":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    return-object v5

    .line 805
    .end local v4    # "object":Lorg/json/JSONObject;
    .end local v5    # "url":Ljava/lang/String;
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 811
    .end local v2    # "array":Lorg/json/JSONArray;
    .end local v3    # "i":I
    :cond_4
    goto :goto_2

    :cond_5
    const-string v2, "{"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 812
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/github/tvbox/osc/api/DanmakuApi;->findPayload(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 813
    :cond_6
    const-string v2, "http"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "file"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_3

    .line 816
    :cond_7
    :goto_2
    return-object v1

    .line 814
    :cond_8
    :goto_3
    return-object v0
.end method

.method private static prefersCantonese(Ljava/lang/String;)Z
    .locals 1
    .param p0, "episode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "episode"
        }
    .end annotation

    .line 620
    invoke-static {p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->isCantoneseTitle(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static priorityLabel(I)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    const/4 v0, 0x4
    if-ne p0, v0, :aggregate_label_original
    const-string v0, "聚合全部弹幕（公共库、续映、配置与片源）"
    return-object v0
    :aggregate_label_original
    .line 112
    packed-switch p0, :pswitch_data_0

    .line 120
    const-string v0, "\u7eed\u6620\u5f39\u5e55\u5e93\u4f18\u5148\uff0c\u914d\u7f6e\u6e90/\u7247\u6e90\u515c\u5e95"

    return-object v0

    .line 118
    :pswitch_0
    const-string v0, "\u4ec5\u914d\u7f6e\u6e90/\u7247\u6e90\u5f39\u5e55"

    return-object v0

    .line 116
    :pswitch_1
    const-string v0, "\u4ec5\u7eed\u6620\u5f39\u5e55\u5e93\uff08\u542b\u5f39\u5f39play\uff09"

    return-object v0

    .line 114
    :pswitch_2
    const-string v0, "\u914d\u7f6e\u6e90/\u7247\u6e90\u4f18\u5148\uff0c\u7eed\u6620\u5f39\u5e55\u5e93\u515c\u5e95"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static priorityShortLabel(I)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 125
    packed-switch p0, :pswitch_data_0

    .line 129
    const-string v0, "\u7eed\u6620\u5f39\u5e55\u5e93\u4f18\u5148"

    return-object v0

    .line 128
    :pswitch_0
    const-string v0, "\u4ec5\u914d\u7f6e\u5f39\u5e55"

    return-object v0

    .line 127
    :pswitch_1
    const-string v0, "\u4ec5\u7eed\u6620\u5f39\u5e55\u5e93"

    return-object v0

    .line 126
    :pswitch_2
    const-string v0, "\u914d\u7f6e\u5f39\u5e55\u4f18\u5148"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static safeLog(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 765
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p0

    :goto_0
    return-object v0
.end method

.method public static search(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V
    .locals 16
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "tmdbId"    # I
    .param p4, "mediaType"    # Ljava/lang/String;
    .param p5, "season"    # I
    .param p6, "episodeNumber"    # I
    .param p7, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
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
            "name",
            "episode",
            "year",
            "tmdbId",
            "mediaType",
            "season",
            "episodeNumber",
            "callback"
        }
    .end annotation

    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getPriority()I
    move-result v0
    const/4 v1, 0x4
    if-ne v0, v1, :aggregate_search_original
    invoke-static/range {p0 .. p7}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILjava/lang/Object;)V
    return-void
    :aggregate_search_original
    .line 139
    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p7

    if-nez v12, :cond_0

    return-void

    .line 140
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getPriority()I

    move-result v13

    .line 141
    .local v13, "priority":I
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v14

    .line 142
    .local v14, "serverAvailable":Z
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getApiUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    move v15, v0

    .line 144
    .local v15, "localAvailable":Z
    if-ne v13, v1, :cond_3

    .line 145
    if-eqz v15, :cond_1

    .line 146
    new-instance v9, Lcom/github/tvbox/osc/api/DanmakuApi$1;

    move-object v0, v9

    move-object/from16 v1, p7

    move v2, v14

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    move-object v12, v9

    move/from16 v9, p6

    invoke-direct/range {v0 .. v9}, Lcom/github/tvbox/osc/api/DanmakuApi$1;-><init>(Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;ZLjava/lang/String;Ljava/lang/String;IILjava/lang/String;II)V

    invoke-static {v10, v11, v12}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchLegacy(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    goto :goto_0

    .line 162
    :cond_1
    if-eqz v14, :cond_2

    .line 163
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchIntegration(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Z)V

    goto :goto_0

    .line 166
    :cond_2
    invoke-interface/range {p7 .. p7}, Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;->onNotFound()V

    .line 168
    :goto_0
    return-void

    .line 170
    :cond_3
    const/4 v0, 0x2

    if-ne v13, v0, :cond_5

    .line 171
    if-eqz v14, :cond_4

    .line 172
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchIntegration(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Z)V

    goto :goto_1

    .line 175
    :cond_4
    invoke-interface/range {p7 .. p7}, Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;->onNotFound()V

    .line 177
    :goto_1
    return-void

    .line 179
    :cond_5
    const/4 v0, 0x3

    if-ne v13, v0, :cond_7

    .line 180
    if-eqz v15, :cond_6

    move-object/from16 v9, p7

    invoke-static {v10, v11, v9}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchLegacy(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    goto :goto_2

    .line 181
    :cond_6
    move-object/from16 v9, p7

    invoke-interface/range {p7 .. p7}, Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;->onNotFound()V

    .line 182
    :goto_2
    return-void

    .line 184
    :cond_7
    move-object/from16 v9, p7

    if-eqz v14, :cond_8

    .line 185
    const/4 v8, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-static/range {v0 .. v8}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchIntegration(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Z)V

    goto :goto_3

    .line 187
    :cond_8
    if-eqz v15, :cond_9

    .line 188
    invoke-static {v10, v11, v9}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchLegacy(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    goto :goto_3

    .line 190
    :cond_9
    invoke-interface/range {p7 .. p7}, Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;->onNotFound()V

    .line 192
    :goto_3
    return-void
.end method

.method public static search(Ljava/lang/String;Ljava/lang/String;ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "episode",
            "year",
            "callback"
        }
    .end annotation

    .line 134
    const/4 v3, 0x0

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Lcom/github/tvbox/osc/api/DanmakuApi;->search(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    .line 135
    return-void
.end method

.method public static search(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "episode",
            "callback"
        }
    .end annotation

    .line 84
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/github/tvbox/osc/api/DanmakuApi;->search(Ljava/lang/String;Ljava/lang/String;ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    .line 85
    return-void
.end method

.method private static searchBuiltin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;II)V
    .locals 7
    .param p0, "apiUrl"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "retry"    # I
    .param p5, "seq"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "name",
            "episode",
            "callback",
            "retry",
            "seq"
        }
    .end annotation

    .line 272
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchBuiltin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;III)V

    .line 273
    return-void
.end method

.method private static searchBuiltin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;III)V
    .locals 18
    .param p0, "apiUrl"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "retry"    # I
    .param p5, "seq"    # I
    .param p6, "queryMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "name",
            "episode",
            "callback",
            "retry",
            "seq",
            "queryMode"
        }
    .end annotation

    .line 276
    invoke-static/range {p0 .. p0}, Lcom/github/tvbox/osc/api/DanmakuApi;->normalizeBaseUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 277
    .local v11, "baseUrl":Ljava/lang/String;
    const-string v0, ""

    if-nez p1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object/from16 v1, p1

    :goto_0
    invoke-static {v1}, Lcom/github/catvod/crawler/js/Trans;->t2s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 278
    .local v12, "simpleName":Ljava/lang/String;
    if-nez p2, :cond_1

    move-object v1, v0

    goto :goto_1

    :cond_1
    move-object/from16 v1, p2

    :goto_1
    invoke-static {v1}, Lcom/github/catvod/crawler/js/Trans;->t2s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 279
    .local v13, "simpleEpisode":Ljava/lang/String;
    move/from16 v14, p6

    invoke-static {v13, v14}, Lcom/github/tvbox/osc/api/DanmakuApi;->getEpisodeQuery(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v15

    .line 280
    .local v15, "episodeQuery":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api/v2/search/episodes?anime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v12}, Lcom/github/tvbox/osc/api/DanmakuApi;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "&episode="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v15}, Lcom/github/tvbox/osc/api/DanmakuApi;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 283
    .local v10, "searchUrl":Ljava/lang/String;
    sget-wide v0, Lcom/github/tvbox/osc/api/DanmakuApi;->BUILTIN_TIMEOUT:J

    invoke-static {v0, v1}, Lcom/github/catvod/net/OkHttp;->client(J)Lokhttp3/OkHttpClient;

    move-result-object v0

    sget-object v1, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v0, v10, v1}, Lcom/github/catvod/net/OkHttp;->newCall(Lokhttp3/OkHttpClient;Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v9

    new-instance v8, Lcom/github/tvbox/osc/api/DanmakuApi$3;

    move-object v0, v8

    move/from16 v1, p5

    move/from16 v2, p4

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p6

    move-object v14, v8

    move-object v8, v11

    move-object/from16 v16, v11

    move-object v11, v9

    .end local v11    # "baseUrl":Ljava/lang/String;
    .local v16, "baseUrl":Ljava/lang/String;
    move-object v9, v12

    move-object/from16 v17, v10

    .end local v10    # "searchUrl":Ljava/lang/String;
    .local v17, "searchUrl":Ljava/lang/String;
    move-object v10, v13

    invoke-direct/range {v0 .. v10}, Lcom/github/tvbox/osc/api/DanmakuApi$3;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v11, v14}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 326
    return-void
.end method

.method private static searchBuiltinAnime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;IZ)V
    .locals 9
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "seq"    # I
    .param p5, "notifyOnEmpty"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "baseUrl",
            "name",
            "episode",
            "callback",
            "seq",
            "notifyOnEmpty"
        }
    .end annotation

    .line 337
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v2/search/anime?keyword="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 338
    .local v0, "searchUrl":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-danmaku builtin search anime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 339
    sget-wide v1, Lcom/github/tvbox/osc/api/DanmakuApi;->BUILTIN_TIMEOUT:J

    invoke-static {v1, v2}, Lcom/github/catvod/net/OkHttp;->client(J)Lokhttp3/OkHttpClient;

    move-result-object v1

    sget-object v2, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/github/catvod/net/OkHttp;->newCall(Lokhttp3/OkHttpClient;Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v1

    new-instance v8, Lcom/github/tvbox/osc/api/DanmakuApi$4;

    move-object v2, v8

    move v3, p4

    move v4, p5

    move-object v5, p3

    move-object v6, p0

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/github/tvbox/osc/api/DanmakuApi$4;-><init>(IZLcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v8}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 364
    return-void
.end method

.method private static searchIntegration(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;Z)V
    .locals 10
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "tmdbId"    # I
    .param p4, "mediaType"    # Ljava/lang/String;
    .param p5, "season"    # I
    .param p6, "episodeNumber"    # I
    .param p7, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p8, "fallbackToLegacy"    # Z
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
            0x0
        }
        names = {
            "name",
            "episode",
            "year",
            "tmdbId",
            "mediaType",
            "season",
            "episodeNumber",
            "callback",
            "fallbackToLegacy"
        }
    .end annotation

    .line 197
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    .line 198
    .local v0, "seq":I
    const-string v1, ""

    if-nez p0, :cond_0

    move-object v7, v1

    goto :goto_0

    :cond_0
    move-object v7, p0

    :goto_0
    if-nez p1, :cond_1

    move-object v8, v1

    goto :goto_1

    :cond_1
    move-object v8, p1

    :goto_1
    new-instance v9, Lcom/github/tvbox/osc/api/DanmakuApi$$ExternalSyntheticLambda0;

    move-object v1, v9

    move v2, v0

    move-object/from16 v3, p7

    move/from16 v4, p8

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/api/DanmakuApi$$ExternalSyntheticLambda0;-><init>(ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;ZLjava/lang/String;Ljava/lang/String;)V

    move-object v2, v7

    move-object v3, v8

    move v4, p2

    move v5, p3

    move-object v6, p4

    move v7, p5

    move/from16 v8, p6

    invoke-static/range {v2 .. v9}, Lcom/github/tvbox/osc/sync/IntegrationClient;->fetchDanmaku(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 216
    return-void
.end method

.method private static searchLegacy(Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "episode",
            "callback"
        }
    .end annotation

    .line 219
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getApiUrl()Ljava/lang/String;

    move-result-object v6

    .line 221
    .local v6, "apiUrl":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    if-nez p2, :cond_0

    goto :goto_1

    .line 223
    :cond_0
    :try_start_0
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/catvod/net/OkHttp;->cancel(Ljava/lang/String;)V

    .line 224
    sget-object v0, Lcom/github/tvbox/osc/api/DanmakuApi;->searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    move v7, v0

    .line 226
    .local v7, "seq":I
    invoke-static {v6}, Lcom/github/tvbox/osc/api/DanmakuApi;->hasPlaceholder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 227
    const/4 v4, 0x0

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v5, v7

    invoke-static/range {v0 .. v5}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchBuiltin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;II)V

    .line 228
    return-void

    .line 230
    :cond_1
    invoke-static {v6, p0, p1}, Lcom/github/tvbox/osc/api/DanmakuApi;->newCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Call;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/api/DanmakuApi$2;

    invoke-direct {v1, v7, p2}, Lcom/github/tvbox/osc/api/DanmakuApi$2;-><init>(ILcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;)V

    invoke-interface {v0, v1}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    .end local v7    # "seq":I
    goto :goto_0

    .line 260
    :catchall_0
    move-exception v0

    .line 261
    .local v0, "th":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-danmaku search start error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 262
    sget-object v1, Lcom/github/tvbox/osc/api/DanmakuApi;->searchSeq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    invoke-static {p2, v1}, Lcom/github/tvbox/osc/api/DanmakuApi;->notifyNotFound(Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;I)V

    .line 264
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 221
    :cond_2
    :goto_1
    return-void
.end method

.method public static setCustomApi(Ljava/lang/String;)V
    .locals 2
    .param p0, "api"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "api"
        }
    .end annotation

    .line 79
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "danmu_api_use_default"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 80
    const-string v0, "danmu_api"

    invoke-static {v0, p0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 81
    return-void
.end method

.method public static setPriority(I)V
    .locals 2
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 99
    const/4 v0, 0x4

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "danmu_source_priority"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 100
    return-void
.end method

.method public static setUseDefault(Z)V
    .locals 2
    .param p0, "useDefault"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "useDefault"
        }
    .end annotation

    .line 74
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "danmu_api_use_default"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 75
    if-eqz p0, :cond_0

    const-string v0, "danmu_api"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 76
    :cond_0
    return-void
.end method

.method private static tryNextEpisodeQuery(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;II)Z
    .locals 8
    .param p0, "apiUrl"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;
    .param p4, "seq"    # I
    .param p5, "queryMode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apiUrl",
            "name",
            "episode",
            "callback",
            "seq",
            "queryMode"
        }
    .end annotation

    .line 329
    if-nez p2, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    invoke-static {v0}, Lcom/github/catvod/crawler/js/Trans;->t2s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p5}, Lcom/github/tvbox/osc/api/DanmakuApi;->getNextEpisodeQueryMode(Ljava/lang/String;I)I

    move-result v0

    .line 330
    .local v0, "nextMode":I
    if-gez v0, :cond_1

    const/4 v1, 0x0

    return v1

    .line 332
    :cond_1
    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v6, p4

    move v7, v0

    invoke-static/range {v1 .. v7}, Lcom/github/tvbox/osc/api/DanmakuApi;->searchBuiltin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/api/DanmakuApi$SearchCallback;III)V

    .line 333
    const/4 v1, 0x1

    return v1
.end method
