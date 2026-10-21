.class public final Lcom/github/tvbox/osc/sync/IntegrationClient;
.super Ljava/lang/Object;
.source "IntegrationClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    }
.end annotation


# static fields
.field public static final EMBY_SOURCE_KEY:Ljava/lang/String; = "continuebox_emby"

.field private static final EXECUTOR:Ljava/util/concurrent/ExecutorService;

.field private static final HTTP:Lokhttp3/OkHttpClient;

.field private static final JSON:Lokhttp3/MediaType;

.field private static final MAIN:Landroid/os/Handler;

.field private static final PLAYBACK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 24
    const-string v0, "application/json; charset=utf-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->JSON:Lokhttp3/MediaType;

    .line 25
    const/4 v0, 0x5

    const/16 v1, 0x19

    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lcom/github/tvbox/osc/sync/SyncHttp;->with(III)Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->HTTP:Lokhttp3/OkHttpClient;

    .line 28
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->EXECUTOR:Ljava/util/concurrent/ExecutorService;

    .line 29
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->PLAYBACK:Ljava/util/concurrent/ExecutorService;

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static delete(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "path",
            "callback"
        }
    .end annotation

    .line 230
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const-string v1, "\u8bf7\u5148\u767b\u5f55\u98de\u725b\u540c\u6b65\u670d\u52a1\u5668"

    invoke-static {p1, v0, v1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 231
    :cond_0
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Authorization"

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->delete()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 233
    .local v0, "request":Lokhttp3/Request;
    invoke-static {v0, p1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 234
    return-void
.end method

.method private static done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "result"    # Lorg/json/JSONObject;
    .param p2, "error"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "callback",
            "result",
            "error"
        }
    .end annotation

    .line 267
    if-eqz p0, :cond_0

    sget-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda5;-><init>(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 268
    :cond_0
    return-void
.end method

.method public static embyAvailable()Z
    .locals 1

    .line 44
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

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

.method public static enabled()Z
    .locals 1

    .line 39
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

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
    .locals 4

    .line 257
    const-string v0, "sync_endpoint"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 258
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/+$"

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method private static execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 1
    .param p0, "request"    # Lokhttp3/Request;
    .param p1, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "request",
            "callback"
        }
    .end annotation

    .line 237
    sget-object v0, Lcom/github/tvbox/osc/sync/IntegrationClient;->EXECUTOR:Ljava/util/concurrent/ExecutorService;

    invoke-static {v0, p0, p1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->executeOn(Ljava/util/concurrent/ExecutorService;Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 238
    return-void
.end method

.method private static executeOn(Ljava/util/concurrent/ExecutorService;Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 1
    .param p0, "executor"    # Ljava/util/concurrent/ExecutorService;
    .param p1, "request"    # Lokhttp3/Request;
    .param p2, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "executor",
            "request",
            "callback"
        }
    .end annotation

    .line 241
    new-instance v0, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda6;

    invoke-direct {v0, p1, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda6;-><init>(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 254
    return-void
.end method

.method public static fetchDanmaku(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 6
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "episodeName"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "tmdbId"    # I
    .param p4, "mediaType"    # Ljava/lang/String;
    .param p5, "season"    # I
    .param p6, "episode"    # I
    .param p7, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            "title",
            "episodeName",
            "year",
            "tmdbId",
            "mediaType",
            "season",
            "episode",
            "callback"
        }
    .end annotation

    .line 53
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "\u8bf7\u5148\u767b\u5f55\u98de\u725b\u540c\u6b65\u670d\u52a1\u5668"

    invoke-static {p7, v1, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api/v1/danmaku/comments"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 55
    .local v0, "base":Lokhttp3/HttpUrl;
    if-nez v0, :cond_1

    const-string v2, "\u540c\u6b65\u670d\u52a1\u5668\u5730\u5740\u65e0\u6548"

    invoke-static {p7, v1, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 56
    :cond_1
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v1, v2, p0}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 57
    const-string v2, ""

    if-nez p1, :cond_2

    move-object v3, v2

    goto :goto_0

    :cond_2
    move-object v3, p1

    :goto_0
    const-string v4, "episode_name"

    invoke-virtual {v1, v4, v3}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 58
    const/4 v3, 0x0

    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "year"

    invoke-virtual {v1, v5, v4}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 59
    invoke-static {v3, p3}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "tmdb_id"

    invoke-virtual {v1, v5, v4}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 60
    if-nez p4, :cond_3

    goto :goto_1

    :cond_3
    move-object v2, p4

    :goto_1
    const-string v4, "media_type"

    invoke-virtual {v1, v4, v2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 61
    invoke-static {v3, p5}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "season"

    invoke-virtual {v1, v4, v2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 62
    invoke-static {v3, p6}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "episode"

    invoke-virtual {v1, v3, v2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-static {v1, p0, p1}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->addSource(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    .line 63
    .local v1, "url":Lokhttp3/HttpUrl;
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v2, v1}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bearer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Authorization"

    invoke-virtual {v2, v4, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    invoke-static {v2, p7}, Lcom/github/tvbox/osc/sync/IntegrationClient;->execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 64
    return-void
.end method

.method public static fetchDanmaku(Ljava/lang/String;Ljava/lang/String;ILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 8
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "episodeName"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "title",
            "episodeName",
            "year",
            "callback"
        }
    .end annotation

    .line 48
    const/4 v3, 0x0

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Lcom/github/tvbox/osc/sync/IntegrationClient;->fetchDanmaku(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 49
    return-void
.end method

.method public static fetchEmbyCatalog(Ljava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 2
    .param p0, "section"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "limit"    # I
    .param p3, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "section",
            "start",
            "limit",
            "callback"
        }
    .end annotation

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/api/v1/emby/catalog?section="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&start="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "&limit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "path":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 125
    new-instance v1, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda0;

    invoke-direct {v1, p3, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;)V

    invoke-static {p0, p1, p2, v1}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->catalog(Ljava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_0

    .line 129
    :cond_0
    invoke-static {v0, p3}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 130
    :goto_0
    return-void
.end method

.method public static fetchEmbyCatalog(Ljava/lang/String;ILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 1
    .param p0, "section"    # Ljava/lang/String;
    .param p1, "limit"    # I
    .param p2, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "section",
            "limit",
            "callback"
        }
    .end annotation

    .line 119
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->fetchEmbyCatalog(Ljava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 120
    return-void
.end method

.method public static fetchEmbyItem(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 2
    .param p0, "itemId"    # Ljava/lang/String;
    .param p1, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "itemId",
            "callback"
        }
    .end annotation

    .line 144
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    new-instance v0, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1, p0}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->item(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_0

    .line 149
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/api/v1/emby/item/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 150
    :goto_0
    return-void
.end method

.method public static fetchEmbyPlay(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 2
    .param p0, "itemId"    # Ljava/lang/String;
    .param p1, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "itemId",
            "callback"
        }
    .end annotation

    .line 153
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    new-instance v0, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1, p0}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda2;-><init>(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->play(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_0

    .line 158
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/api/v1/emby/play/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 159
    :goto_0
    return-void
.end method

.method public static fetchEmbyResume(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 9
    .param p0, "mediaType"    # Ljava/lang/String;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "season"    # I
    .param p4, "episode"    # I
    .param p5, "embyItemId"    # Ljava/lang/String;
    .param p6, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            "mediaType",
            "title",
            "year",
            "season",
            "episode",
            "embyItemId",
            "callback"
        }
    .end annotation

    .line 163
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p5, :cond_0

    invoke-virtual {p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 164
    new-instance v0, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda4;

    move-object v1, v0

    move-object v2, p6

    move-object v3, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    invoke-direct/range {v1 .. v8}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda4;-><init>(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V

    invoke-static {p5, v0}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->resume(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 168
    return-void

    .line 170
    :cond_0
    invoke-static/range {p0 .. p6}, Lcom/github/tvbox/osc/sync/IntegrationClient;->fetchEmbyResumeFromServer(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 171
    return-void
.end method

.method private static fetchEmbyResumeFromServer(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 5
    .param p0, "mediaType"    # Ljava/lang/String;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "season"    # I
    .param p4, "episode"    # I
    .param p5, "embyItemId"    # Ljava/lang/String;
    .param p6, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            "mediaType",
            "title",
            "year",
            "season",
            "episode",
            "embyItemId",
            "callback"
        }
    .end annotation

    .line 176
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 177
    .local v0, "body":Lorg/json/JSONObject;
    const-string v1, "media_type"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "year"

    const/4 v3, 0x0

    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "season"

    .line 178
    invoke-static {v3, p3}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "episode"

    invoke-static {v3, p4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "emby_item_id"

    .line 179
    if-nez p5, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    move-object v3, p5

    :goto_0
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    const-string v1, "/api/v1/emby/resume"

    invoke-static {v1, v0, p6}, Lcom/github/tvbox/osc/sync/IntegrationClient;->post(Ljava/lang/String;Lorg/json/JSONObject;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .end local v0    # "body":Lorg/json/JSONObject;
    goto :goto_1

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "error":Ljava/lang/Exception;
    const/4 v1, 0x0

    const-string v2, "\u65e0\u6cd5\u751f\u6210 Emby \u7eed\u64ad\u8bf7\u6c42"

    invoke-static {p6, v1, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 184
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public static fetchEmbySearch(Ljava/lang/String;ILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 2
    .param p0, "keyword"    # Ljava/lang/String;
    .param p1, "limit"    # I
    .param p2, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyword",
            "limit",
            "callback"
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/api/v1/emby/search?keyword="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&limit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    const/4 v1, 0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "path":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    new-instance v1, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda3;

    invoke-direct {v1, p2, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient$$ExternalSyntheticLambda3;-><init>(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;)V

    invoke-static {p0, p1, v1}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->search(Ljava/lang/String;ILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_0

    .line 140
    :cond_0
    invoke-static {v0, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 141
    :goto_0
    return-void
.end method

.method public static fetchReviews(Ljava/lang/String;ILjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 5
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "year"    # I
    .param p2, "mediaType"    # Ljava/lang/String;
    .param p3, "season"    # I
    .param p4, "episode"    # I
    .param p5, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            "title",
            "year",
            "mediaType",
            "season",
            "episode",
            "callback"
        }
    .end annotation

    .line 94
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "\u8bf7\u5148\u767b\u5f55\u98de\u725b\u540c\u6b65\u670d\u52a1\u5668"

    invoke-static {p5, v1, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 95
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/api/v1/reviews"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    .line 96
    .local v0, "base":Lokhttp3/HttpUrl;
    if-nez v0, :cond_1

    const-string v2, "\u540c\u6b65\u670d\u52a1\u5668\u5730\u5740\u65e0\u6548"

    invoke-static {p5, v1, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 97
    :cond_1
    invoke-virtual {v0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v1, v2, p0}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 98
    const/4 v2, 0x0

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "year"

    invoke-virtual {v1, v4, v3}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 99
    const-string v3, "media_type"

    invoke-virtual {v1, v3, p2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 100
    invoke-static {v2, p3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "season"

    invoke-virtual {v1, v4, v3}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 101
    invoke-static {v2, p4}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "episode"

    invoke-virtual {v1, v3, v2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    .line 102
    .local v1, "url":Lokhttp3/HttpUrl;
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v2, v1}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bearer "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Authorization"

    invoke-virtual {v2, v4, v3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    invoke-static {v2, p5}, Lcom/github/tvbox/osc/sync/IntegrationClient;->execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 103
    return-void
.end method

.method public static get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "path",
            "callback"
        }
    .end annotation

    .line 207
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const-string v1, "\u8bf7\u5148\u767b\u5f55\u98de\u725b\u540c\u6b65\u670d\u52a1\u5668"

    invoke-static {p1, v0, v1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 208
    :cond_0
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Authorization"

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 210
    .local v0, "request":Lokhttp3/Request;
    invoke-static {v0, p1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 211
    return-void
.end method

.method static synthetic lambda$done$6(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "result"    # Lorg/json/JSONObject;
    .param p2, "error"    # Ljava/lang/String;

    .line 267
    invoke-interface {p0, p1, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;->complete(Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$executeOn$5(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 7
    .param p0, "request"    # Lokhttp3/Request;
    .param p1, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;

    .line 242
    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lcom/github/tvbox/osc/sync/IntegrationClient;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, p0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .local v1, "response":Lokhttp3/Response;
    :try_start_1
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v2

    .line 244
    .local v2, "content":Ljava/lang/String;
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    goto :goto_1

    :cond_1
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 245
    .local v3, "result":Lorg/json/JSONObject;
    :goto_1
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v4

    if-nez v4, :cond_2

    .line 246
    const-string v4, "detail"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u670d\u52a1\u5668\u8fd4\u56de HTTP "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v0, v4}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto :goto_2

    .line 248
    :cond_2
    invoke-static {p1, v3, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 250
    .end local v2    # "content":Ljava/lang/String;
    .end local v3    # "result":Lorg/json/JSONObject;
    :goto_2
    if-eqz v1, :cond_3

    :try_start_2
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 252
    .end local v1    # "response":Lokhttp3/Response;
    :cond_3
    goto :goto_5

    .line 242
    .restart local v1    # "response":Lokhttp3/Response;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_4

    :try_start_3
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "request":Lokhttp3/Request;
    .end local p1    # "callback":Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    :cond_4
    :goto_3
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 250
    .end local v1    # "response":Lokhttp3/Response;
    .restart local p0    # "request":Lokhttp3/Request;
    .restart local p1    # "callback":Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    :catch_0
    move-exception v1

    .line 251
    .local v1, "error":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u65e0\u6cd5\u8fde\u63a5\u98de\u725b\u670d\u52a1\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    const-string v3, "\u7f51\u7edc\u9519\u8bef"

    goto :goto_4

    :cond_5
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    :goto_4
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 253
    .end local v1    # "error":Ljava/lang/Exception;
    :goto_5
    return-void
.end method

.method static synthetic lambda$fetchEmbyCatalog$0(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "result"    # Lorg/json/JSONObject;
    .param p3, "error"    # Ljava/lang/String;

    .line 126
    if-eqz p3, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    invoke-static {p1, p0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_1

    .line 126
    :cond_1
    :goto_0
    invoke-static {p0, p2, p3}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 128
    :goto_1
    return-void
.end method

.method static synthetic lambda$fetchEmbyItem$2(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "result"    # Lorg/json/JSONObject;
    .param p3, "error"    # Ljava/lang/String;

    .line 146
    if-eqz p3, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 147
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/api/v1/emby/item/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_1

    .line 146
    :cond_1
    :goto_0
    invoke-static {p0, p2, p3}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 148
    :goto_1
    return-void
.end method

.method static synthetic lambda$fetchEmbyPlay$3(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "result"    # Lorg/json/JSONObject;
    .param p3, "error"    # Ljava/lang/String;

    .line 155
    if-eqz p3, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 156
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/api/v1/emby/play/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_1

    .line 155
    :cond_1
    :goto_0
    invoke-static {p0, p2, p3}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 157
    :goto_1
    return-void
.end method

.method static synthetic lambda$fetchEmbyResume$4(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 7
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "mediaType"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "year"    # I
    .param p4, "season"    # I
    .param p5, "episode"    # I
    .param p6, "embyItemId"    # Ljava/lang/String;
    .param p7, "result"    # Lorg/json/JSONObject;
    .param p8, "error"    # Ljava/lang/String;

    .line 165
    if-eqz p8, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 166
    :cond_0
    move-object v0, p1

    move-object v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lcom/github/tvbox/osc/sync/IntegrationClient;->fetchEmbyResumeFromServer(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_1

    .line 165
    :cond_1
    :goto_0
    invoke-static {p0, p7, p8}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 167
    :goto_1
    return-void
.end method

.method static synthetic lambda$fetchEmbySearch$1(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 1
    .param p0, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "result"    # Lorg/json/JSONObject;
    .param p3, "error"    # Ljava/lang/String;

    .line 137
    if-eqz p3, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 138
    :cond_0
    invoke-static {p1, p0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    goto :goto_1

    .line 137
    :cond_1
    :goto_0
    invoke-static {p0, p2, p3}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 139
    :goto_1
    return-void
.end method

.method public static linkDanmaku(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 5
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "episodeName"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "episodeId"    # I
    .param p4, "matchedTitle"    # Ljava/lang/String;
    .param p5, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            "title",
            "episodeName",
            "year",
            "episodeId",
            "matchedTitle",
            "callback"
        }
    .end annotation

    .line 82
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 83
    .local v0, "body":Lorg/json/JSONObject;
    const-string v1, "title"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "episode_name"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, ""

    if-nez p1, :cond_0

    move-object v4, v3

    goto :goto_0

    :cond_0
    move-object v4, p1

    :goto_0
    :try_start_1
    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "year"

    const/4 v4, 0x0

    .line 84
    invoke-static {v4, p2}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "dandan_episode_id"

    invoke-virtual {v1, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "dandan_title"

    .line 85
    if-nez p4, :cond_1

    goto :goto_1

    :cond_1
    move-object v3, p4

    :goto_1
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    const-string v1, "/api/v1/danmaku/link"

    invoke-static {v1, v0, p5}, Lcom/github/tvbox/osc/sync/IntegrationClient;->put(Ljava/lang/String;Lorg/json/JSONObject;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 89
    .end local v0    # "body":Lorg/json/JSONObject;
    goto :goto_2

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "error":Ljava/lang/Exception;
    const/4 v1, 0x0

    const-string v2, "\u65e0\u6cd5\u751f\u6210\u5f39\u5e55\u5173\u8054\u8bf7\u6c42"

    invoke-static {p5, v1, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 90
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method public static playbackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;JJ)V
    .locals 16
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "mediaType"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "year"    # I
    .param p4, "season"    # I
    .param p5, "episode"    # I
    .param p6, "embyItemId"    # Ljava/lang/String;
    .param p7, "positionMs"    # J
    .param p9, "durationMs"    # J
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
            "event",
            "mediaType",
            "title",
            "year",
            "season",
            "episode",
            "embyItemId",
            "positionMs",
            "durationMs"
        }
    .end annotation

    .line 189
    move-object/from16 v1, p2

    move-wide/from16 v8, p9

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-lez v0, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move/from16 v7, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move-wide/from16 v14, p7

    goto/16 :goto_7

    .line 190
    :cond_0
    move-object/from16 v2, p0

    move-object/from16 v3, p6

    move-wide/from16 v4, p7

    move-wide/from16 v6, p9

    invoke-static/range {v2 .. v7}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->playbackEvent(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 191
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 193
    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 194
    .local v0, "body":Lorg/json/JSONObject;
    const-string v2, "event"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    move-object/from16 v3, p0

    :try_start_1
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "media_type"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    move-object/from16 v5, p1

    :try_start_2
    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "title"

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "year"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 195
    const/4 v6, 0x0

    move/from16 v7, p3

    :try_start_3
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {v2, v4, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "season"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move/from16 v12, p4

    :try_start_4
    invoke-static {v6, v12}, Ljava/lang/Math;->max(II)I

    move-result v13

    invoke-virtual {v2, v4, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "episode"
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 196
    move/from16 v13, p5

    :try_start_5
    invoke-static {v6, v13}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v2, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "emby_item_id"

    if-nez p6, :cond_2

    const-string v6, ""

    goto :goto_0

    :cond_2
    move-object/from16 v6, p6

    :goto_0
    invoke-virtual {v2, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "position_ms"
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 197
    move-wide/from16 v14, p7

    :try_start_6
    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    invoke-virtual {v2, v4, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "duration_ms"

    .line 198
    invoke-virtual {v2, v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 199
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/api/v1/playback/event"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    const-string v4, "Authorization"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Bearer "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    sget-object v4, Lcom/github/tvbox/osc/sync/IntegrationClient;->JSON:Lokhttp3/MediaType;

    .line 201
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v4

    invoke-virtual {v2, v4}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    .line 202
    .local v2, "request":Lokhttp3/Request;
    sget-object v4, Lcom/github/tvbox/osc/sync/IntegrationClient;->PLAYBACK:Ljava/util/concurrent/ExecutorService;

    const/4 v6, 0x0

    invoke-static {v4, v2, v6}, Lcom/github/tvbox/osc/sync/IntegrationClient;->executeOn(Ljava/util/concurrent/ExecutorService;Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .end local v0    # "body":Lorg/json/JSONObject;
    .end local v2    # "request":Lokhttp3/Request;
    goto :goto_6

    .line 203
    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    goto :goto_4

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    goto :goto_2

    :catch_5
    move-exception v0

    goto :goto_1

    :catch_6
    move-exception v0

    move-object/from16 v3, p0

    :goto_1
    move-object/from16 v5, p1

    :goto_2
    move/from16 v7, p3

    :goto_3
    move/from16 v12, p4

    :goto_4
    move/from16 v13, p5

    :goto_5
    move-wide/from16 v14, p7

    :goto_6
    nop

    .line 204
    return-void

    .line 189
    :cond_3
    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move/from16 v7, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move-wide/from16 v14, p7

    :goto_7
    return-void
.end method

.method public static post(Ljava/lang/String;Lorg/json/JSONObject;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "body"    # Lorg/json/JSONObject;
    .param p2, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "path",
            "body",
            "callback"
        }
    .end annotation

    .line 214
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const-string v1, "\u8bf7\u5148\u767b\u5f55\u98de\u725b\u540c\u6b65\u670d\u52a1\u5668"

    invoke-static {p2, v0, v1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 215
    :cond_0
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Authorization"

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    sget-object v1, Lcom/github/tvbox/osc/sync/IntegrationClient;->JSON:Lokhttp3/MediaType;

    .line 217
    if-nez p1, :cond_1

    const-string v2, "{}"

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {v1, v2}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 218
    .local v0, "request":Lokhttp3/Request;
    invoke-static {v0, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 219
    return-void
.end method

.method public static postReview(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;IZILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 4
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "mediaType"    # Ljava/lang/String;
    .param p4, "season"    # I
    .param p5, "episode"    # I
    .param p6, "text"    # Ljava/lang/String;
    .param p7, "rating"    # I
    .param p8, "spoiler"    # Z
    .param p9, "visibility"    # I
    .param p10, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            0x0,
            0x0
        }
        names = {
            "source",
            "title",
            "year",
            "mediaType",
            "season",
            "episode",
            "text",
            "rating",
            "spoiler",
            "visibility",
            "callback"
        }
    .end annotation

    .line 109
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "source"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "year"

    .line 110
    const/4 v2, 0x0

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "media_type"

    invoke-virtual {v0, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "season"

    .line 111
    invoke-static {v2, p4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "episode"

    invoke-static {v2, p5}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "text"

    .line 112
    invoke-virtual {v0, v1, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "rating"

    const/16 v3, 0xa

    invoke-static {v3, p7}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "spoiler"

    .line 113
    invoke-virtual {v0, v1, p8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "visibility"

    const/4 v3, 0x2

    invoke-static {v3, p9}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    .line 114
    .local v0, "body":Lorg/json/JSONObject;
    const-string v1, "/api/v1/reviews"

    invoke-static {v1, v0, p10}, Lcom/github/tvbox/osc/sync/IntegrationClient;->post(Ljava/lang/String;Lorg/json/JSONObject;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .end local v0    # "body":Lorg/json/JSONObject;
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "error":Ljava/lang/Exception;
    const/4 v1, 0x0

    const-string v2, "\u65e0\u6cd5\u751f\u6210\u8bc4\u8bba\u8bf7\u6c42"

    invoke-static {p10, v1, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 116
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public static put(Ljava/lang/String;Lorg/json/JSONObject;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "body"    # Lorg/json/JSONObject;
    .param p2, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "path",
            "body",
            "callback"
        }
    .end annotation

    .line 222
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const-string v1, "\u8bf7\u5148\u767b\u5f55\u98de\u725b\u540c\u6b65\u670d\u52a1\u5668"

    invoke-static {p2, v0, v1}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void

    .line 223
    :cond_0
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->endpoint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->token()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Authorization"

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    sget-object v1, Lcom/github/tvbox/osc/sync/IntegrationClient;->JSON:Lokhttp3/MediaType;

    .line 225
    if-nez p1, :cond_1

    const-string v2, "{}"

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {v1, v2}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->put(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 226
    .local v0, "request":Lokhttp3/Request;
    invoke-static {v0, p2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->execute(Lokhttp3/Request;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 227
    return-void
.end method

.method public static sendDanmaku(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    .locals 5
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "episodeName"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "positionMs"    # J
    .param p5, "text"    # Ljava/lang/String;
    .param p6, "mode"    # I
    .param p7, "color"    # I
    .param p8, "callback"    # Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;
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
            "title",
            "episodeName",
            "year",
            "positionMs",
            "text",
            "mode",
            "color",
            "callback"
        }
    .end annotation

    .line 69
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 70
    .local v0, "body":Lorg/json/JSONObject;
    const-string v1, "title"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "episode_name"

    if-nez p1, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    move-object v3, p1

    :goto_0
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "year"

    const/4 v3, 0x0

    .line 71
    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "position_ms"

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "text"

    .line 72
    invoke-virtual {v1, v2, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "mode"

    invoke-virtual {v1, v2, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "color"

    invoke-virtual {v1, v2, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 73
    const-string v1, "/api/v1/danmaku/comments"

    invoke-static {v1, v0, p8}, Lcom/github/tvbox/osc/sync/IntegrationClient;->post(Ljava/lang/String;Lorg/json/JSONObject;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .end local v0    # "body":Lorg/json/JSONObject;
    goto :goto_1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "error":Ljava/lang/Exception;
    const/4 v1, 0x0

    const-string v2, "\u65e0\u6cd5\u751f\u6210\u5f39\u5e55\u8bf7\u6c42"

    invoke-static {p8, v1, v2}, Lcom/github/tvbox/osc/sync/IntegrationClient;->done(Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 77
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static token()Ljava/lang/String;
    .locals 2

    .line 262
    const-string v0, "sync_token"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 263
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method
