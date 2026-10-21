.class public Lcom/github/tvbox/osc/player/danmu/Parser;
.super Lmaster/flame/danmaku/danmaku/parser/BaseDanmakuParser;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;
    }
.end annotation


# static fields
.field private static volatile HTTP_CLIENT:Lokhttp3/OkHttpClient; = null

.field private static final HTTP_TIMEOUT_MS:J = 0x4e20L

.field private static final MULTI_SOURCE_SEPARATOR:Ljava/lang/String; = "\n<!-- continuebox:danmaku-source -->\n"

.field private static final TRUST_ALL_CERT:Ljavax/net/ssl/X509TrustManager;

.field private static final TRUST_ALL_HOSTNAME:Ljavax/net/ssl/HostnameVerifier;

.field private static volatile UNSAFE_HTTP_CLIENT:Lokhttp3/OkHttpClient;


# instance fields
.field private final cancelChecker:Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;

.field private final danmu:Lcom/github/tvbox/osc/bean/Danmu;

.field private index:I

.field private scaleX:F

.field private scaleY:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    new-instance v0, Lcom/github/tvbox/osc/player/danmu/Parser$1;

    invoke-direct {v0}, Lcom/github/tvbox/osc/player/danmu/Parser$1;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/player/danmu/Parser;->TRUST_ALL_CERT:Ljavax/net/ssl/X509TrustManager;

    .line 67
    new-instance v0, Lcom/github/tvbox/osc/player/danmu/Parser$2;

    invoke-direct {v0}, Lcom/github/tvbox/osc/player/danmu/Parser$2;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/player/danmu/Parser;->TRUST_ALL_HOSTNAME:Ljavax/net/ssl/HostnameVerifier;

    .line 73
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/player/danmu/Parser;->buildHttpClient(Z)Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/player/danmu/Parser;->HTTP_CLIENT:Lokhttp3/OkHttpClient;

    .line 74
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/github/tvbox/osc/player/danmu/Parser;->buildHttpClient(Z)Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/player/danmu/Parser;->UNSAFE_HTTP_CLIENT:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/player/danmu/Parser;-><init>(Ljava/lang/String;Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;)V
    .locals 1
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "cancelChecker"    # Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "cancelChecker"
        }
    .end annotation

    .line 85
    invoke-direct {p0}, Lmaster/flame/danmaku/danmaku/parser/BaseDanmakuParser;-><init>()V

    .line 86
    iput-object p2, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->cancelChecker:Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;

    .line 87
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/player/danmu/Parser;->resolveContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/bean/Danmu;->fromXml(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/Danmu;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->danmu:Lcom/github/tvbox/osc/bean/Danmu;

    .line 88
    return-void
.end method

.method private appendXmlItems(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 5
    .param p1, "target"    # Ljava/lang/StringBuilder;
    .param p2, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "target",
            "xml"
        }
    .end annotation

    .line 122
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 123
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "value":Ljava/lang/String;
    const-string v1, "\ufeff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 127
    :cond_1
    const-string v1, "<d "

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "<d>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 128
    :cond_2
    const-string v1, "<i"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 129
    .local v1, "root":I
    if-ltz v1, :cond_3

    .line 130
    const/16 v2, 0x3e

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 131
    .local v2, "body":I
    const-string v3, "</i>"

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 132
    .local v3, "end":I
    if-ltz v2, :cond_3

    if-le v3, v2, :cond_3

    .line 133
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v0, v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 134
    return-void

    .line 137
    .end local v2    # "body":I
    .end local v3    # "end":I
    :cond_3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    return-void
.end method

.method private static buildHttpClient(Z)Lokhttp3/OkHttpClient;
    .locals 5
    .param p0, "unsafeSsl"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "unsafeSsl"
        }
    .end annotation

    .line 210
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 211
    .local v0, "base":Lokhttp3/OkHttpClient;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v1, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v1}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v2

    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->proxySelector(Ljava/net/ProxySelector;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator()Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    move-result-object v2

    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 212
    .local v1, "builder":Lokhttp3/OkHttpClient$Builder;
    :goto_0
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x4e20

    invoke-virtual {v1, v3, v4, v2}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 213
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v2}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 214
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v2}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 215
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    .line 216
    if-eqz p0, :cond_1

    .line 217
    new-instance v2, Lcom/github/tvbox/osc/util/SSL/SSLSocketFactoryCompat;

    sget-object v3, Lcom/github/tvbox/osc/player/danmu/Parser;->TRUST_ALL_CERT:Ljavax/net/ssl/X509TrustManager;

    invoke-direct {v2, v3}, Lcom/github/tvbox/osc/util/SSL/SSLSocketFactoryCompat;-><init>(Ljavax/net/ssl/X509TrustManager;)V

    .line 218
    .local v2, "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    .line 219
    sget-object v3, Lcom/github/tvbox/osc/player/danmu/Parser;->TRUST_ALL_HOSTNAME:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    .line 221
    .end local v2    # "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    :cond_1
    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v2

    return-object v2
.end method

.method private createDanmaku(Lcom/github/tvbox/osc/bean/Danmu$Data;)Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    .locals 11
    .param p1, "data"    # Lcom/github/tvbox/osc/bean/Danmu$Data;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 328
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/Danmu$Data;->getParam()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 329
    .local v1, "values":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    return-object v0

    .line 330
    :cond_0
    const/4 v2, 0x1

    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 331
    .local v2, "type":I
    iget-object v3, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mContext:Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;

    iget-object v3, v3, Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;->mDanmakuFactory:Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;

    iget-object v4, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mContext:Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;

    invoke-virtual {v3, v2, v4}, Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;->createDanmaku(ILmaster/flame/danmaku/danmaku/model/android/DanmakuContext;)Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;

    move-result-object v3

    .line 332
    .local v3, "item":Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    if-nez v3, :cond_1

    return-object v0

    .line 333
    :cond_1
    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    const/high16 v5, 0x447a0000    # 1000.0f

    mul-float v4, v4, v5

    float-to-long v4, v4

    .line 334
    .local v4, "time":J
    const/4 v6, 0x2

    aget-object v6, v1, v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    iget v8, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mDispDensity:F

    const v9, 0x3f19999a    # 0.6f

    sub-float/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v7

    mul-float v6, v6, v7

    .line 335
    .local v6, "size":F
    invoke-static {}, Lcom/github/tvbox/osc/util/DanmuHelper;->useRandomColor()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 336
    invoke-static {}, Lcom/github/tvbox/osc/util/DanmuHelper;->randomColor()I

    move-result v7

    goto :goto_0

    .line 337
    :cond_2
    const-wide v7, 0xff000000L

    const/4 v9, 0x3

    aget-object v9, v1, v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    or-long/2addr v7, v9

    const-wide v9, 0xffffffffL

    and-long/2addr v7, v9

    long-to-int v7, v7

    :goto_0
    nop

    .line 338
    .local v7, "color":I
    invoke-virtual {v3, v4, v5}, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->setTime(J)V

    .line 339
    iget-object v8, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mTimer:Lmaster/flame/danmaku/danmaku/model/DanmakuTimer;

    invoke-virtual {v3, v8}, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->setTimer(Lmaster/flame/danmaku/danmaku/model/DanmakuTimer;)V

    .line 340
    iput v6, v3, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->textSize:F

    .line 341
    iput v7, v3, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->textColor:I

    .line 342
    const/high16 v8, -0x1000000

    if-gt v7, v8, :cond_3

    const/4 v8, -0x1

    :cond_3
    iput v8, v3, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->textShadowColor:I

    .line 343
    iget-object v8, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mContext:Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;

    iget-object v8, v8, Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;->mGlobalFlagValues:Lmaster/flame/danmaku/danmaku/model/GlobalFlagValues;

    iput-object v8, v3, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->flags:Lmaster/flame/danmaku/danmaku/model/GlobalFlagValues;

    .line 344
    iget v8, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->index:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->index:I

    iput v8, v3, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->index:I

    .line 345
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/Danmu$Data;->getText()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/github/tvbox/osc/player/danmu/Parser;->decodeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Lmaster/flame/danmaku/danmaku/util/DanmakuUtils;->fillText(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;Ljava/lang/CharSequence;)V

    .line 346
    invoke-virtual {v3}, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->getType()I

    move-result v8

    const/4 v9, 0x7

    if-ne v8, v9, :cond_4

    .line 347
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/Danmu$Data;->getText()Ljava/lang/String;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 348
    invoke-virtual {p1}, Lcom/github/tvbox/osc/bean/Danmu$Data;->getText()Ljava/lang/String;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 349
    invoke-direct {p0, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->setSpecial(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;)Z

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v8, :cond_4

    .line 350
    return-object v0

    .line 352
    :cond_4
    return-object v3

    .line 353
    .end local v1    # "values":[Ljava/lang/String;
    .end local v2    # "type":I
    .end local v3    # "item":Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    .end local v4    # "time":J
    .end local v6    # "size":F
    .end local v7    # "color":I
    :catchall_0
    move-exception v1

    .line 354
    .local v1, "ignored":Ljava/lang/Throwable;
    return-object v0
.end method

.method private decodeXmlString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 440
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    .line 441
    :cond_0
    const-string v0, "&amp;"

    const-string v1, "&"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 442
    const-string v1, "&quot;"

    const-string v2, "\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 443
    const-string v1, "&apos;"

    const-string v2, "\'"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 444
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 445
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 441
    return-object v0
.end method

.method private executeHttp(Ljava/lang/String;)Lokhttp3/Response;
    .locals 2
    .param p1, "source"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 231
    .local v0, "request":Lokhttp3/Request;
    sget-object v1, Lcom/github/tvbox/osc/player/danmu/Parser;->HTTP_CLIENT:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    return-object v1
.end method

.method private executeUnsafeHttp(Ljava/lang/String;)Lokhttp3/Response;
    .locals 2
    .param p1, "source"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 235
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 236
    .local v0, "request":Lokhttp3/Request;
    sget-object v1, Lcom/github/tvbox/osc/player/danmu/Parser;->UNSAFE_HTTP_CLIENT:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    return-object v1
.end method

.method private fillLinePath(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;Ljava/lang/String;)V
    .locals 10
    .param p1, "item"    # Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    .param p2, "motionPathString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "item",
            "motionPathString"
        }
    .end annotation

    .line 422
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 423
    .local v1, "motionPath":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    .line 424
    :cond_0
    const-string v2, "L"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 425
    .local v2, "pointStrArray":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x2

    new-array v5, v4, [I

    aput v4, v5, v0

    const/4 v6, 0x0

    aput v3, v5, v6

    const-class v3, F

    invoke-static {v3, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[F

    .line 426
    .local v3, "points":[[F
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v7, v2

    if-ge v5, v7, :cond_2

    .line 427
    aget-object v7, v2, v5

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 428
    .local v7, "pointArray":[Ljava/lang/String;
    array-length v8, v7

    if-ge v8, v4, :cond_1

    return-void

    .line 429
    :cond_1
    aget-object v8, v3, v5

    aget-object v9, v7, v6

    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v9

    aput v9, v8, v6

    .line 430
    aget-object v8, v3, v5

    aget-object v9, v7, v0

    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v9

    aput v9, v8, v0

    .line 426
    .end local v7    # "pointArray":[Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 432
    .end local v5    # "i":I
    :cond_2
    iget v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->scaleX:F

    iget v4, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->scaleY:F

    invoke-static {p1, v3, v0, v4}, Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;->fillLinePathData(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;[[FFF)V

    .line 433
    return-void
.end method

.method private inflate([B)[B
    .locals 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 277
    :try_start_0
    new-instance v0, Ljava/util/zip/InflaterInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/player/danmu/Parser;->readAll(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 278
    :catch_0
    move-exception v0

    .line 279
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/util/zip/Inflater;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 281
    .local v1, "inflater":Ljava/util/zip/Inflater;
    :try_start_1
    new-instance v2, Ljava/util/zip/InflaterInputStream;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v2, v3, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/player/danmu/Parser;->readAll(Ljava/io/InputStream;)[B

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 283
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->end()V

    .line 281
    return-object v2

    .line 283
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->end()V

    .line 284
    throw v2
.end method

.method private isCancelled()Z
    .locals 1

    .line 206
    iget-object v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->cancelChecker:Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/github/tvbox/osc/player/danmu/Parser$CancelChecker;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isLocalProxy(Ljava/lang/String;)Z
    .locals 1
    .param p1, "source"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .line 248
    const-string v0, "http://127.0.0.1:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 249
    const-string v0, "http://localhost:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 248
    :goto_1
    return v0
.end method

.method private isPercentageNumber(Ljava/lang/String;)Z
    .locals 1
    .param p1, "number"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "number"
        }
    .end annotation

    .line 436
    if-eqz p1, :cond_0

    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isSslError(Ljava/lang/Throwable;)Z
    .locals 1
    .param p1, "th"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "th"
        }
    .end annotation

    .line 240
    :goto_0
    if-eqz p1, :cond_1

    .line 241
    instance-of v0, p1, Ljavax/net/ssl/SSLException;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 242
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    goto :goto_0

    .line 244
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private looksXml([B)Z
    .locals 6
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 266
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 267
    :cond_0
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-byte v3, p1, v2

    .line 268
    .local v3, "value":B
    and-int/lit16 v4, v3, 0xff

    int-to-char v4, v4

    .line 269
    .local v4, "ch":C
    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 267
    .end local v3    # "value":B
    .end local v4    # "ch":C
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 270
    .restart local v3    # "value":B
    .restart local v4    # "ch":C
    :cond_1
    const/16 v1, 0x3c

    if-ne v4, v1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

    .line 272
    .end local v3    # "value":B
    .end local v4    # "ch":C
    :cond_3
    return v0
.end method

.method public static varargs mergeSources([Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "sources"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sources"
        }
    .end annotation

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .local v0, "result":Ljava/lang/StringBuilder;
    if-nez p0, :cond_0

    const-string v1, ""

    return-object v1

    .line 113
    :cond_0
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, p0, v2

    .line 114
    .local v3, "source":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 115
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2

    const-string v4, "\n<!-- continuebox:danmaku-source -->\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .end local v3    # "source":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 118
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private readAll(Ljava/io/InputStream;)[B
    .locals 5
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 290
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 291
    .local v0, "output":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x1000

    new-array v1, v1, [B

    .line 293
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "read":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    .line 294
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 296
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 296
    return-object v2

    .line 298
    .end local v0    # "output":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "buffer":[B
    .end local v3    # "read":I
    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 299
    throw v0
.end method

.method private readBody(Lokhttp3/Response;)Ljava/lang/String;
    .locals 5
    .param p1, "response"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "response"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 253
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 254
    :cond_0
    invoke-virtual {p1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->bytes()[B

    move-result-object v0

    .line 255
    .local v0, "bytes":[B
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/player/danmu/Parser;->looksXml([B)Z

    move-result v2

    const-string v3, "UTF-8"

    if-eqz v2, :cond_1

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1

    .line 256
    :cond_1
    const-string v2, "Content-Encoding"

    invoke-virtual {p1, v2, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 257
    .local v1, "encoding":Ljava/lang/String;
    const-string v2, "gzip"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 258
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v2, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/player/danmu/Parser;->readAll(Ljava/io/InputStream;)[B

    move-result-object v0

    goto :goto_0

    .line 259
    :cond_2
    const-string v2, "deflate"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 260
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/player/danmu/Parser;->inflate([B)[B

    move-result-object v0

    .line 262
    :cond_3
    :goto_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v2
.end method

.method public static declared-synchronized resetHttpClient()V
    .locals 2

    const-class v0, Lcom/github/tvbox/osc/player/danmu/Parser;

    monitor-enter v0

    .line 225
    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1}, Lcom/github/tvbox/osc/player/danmu/Parser;->buildHttpClient(Z)Lokhttp3/OkHttpClient;

    move-result-object v1

    sput-object v1, Lcom/github/tvbox/osc/player/danmu/Parser;->HTTP_CLIENT:Lokhttp3/OkHttpClient;

    .line 226
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/github/tvbox/osc/player/danmu/Parser;->buildHttpClient(Z)Lokhttp3/OkHttpClient;

    move-result-object v1

    sput-object v1, Lcom/github/tvbox/osc/player/danmu/Parser;->UNSAFE_HTTP_CLIENT:Lokhttp3/OkHttpClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    monitor-exit v0

    return-void

    .line 224
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private resolveContent(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 95
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    invoke-static {v1}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->cleanXml(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    return-object v1

    .line 96
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->cleanXml(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    return-object v1

    .line 97
    :cond_1
    const-string v0, "\n<!-- continuebox:danmaku-source -->\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<i>"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .local v2, "merged":Ljava/lang/StringBuilder;
    invoke-static {v0}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "sources":[Ljava/lang/String;
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_3

    aget-object v5, v0, v4

    .line 101
    .local v5, "item":Ljava/lang/String;
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v1}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->cleanXml(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    return-object v1

    .line 102
    :cond_2
    invoke-direct {p0, v5}, Lcom/github/tvbox/osc/player/danmu/Parser;->resolveSingleContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v2, v6}, Lcom/github/tvbox/osc/player/danmu/Parser;->appendXmlItems(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 100
    .end local v5    # "item":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 104
    :cond_3
    const-string v1, "</i>"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->cleanXml(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    return-object v1

    .line 106
    .end local v0    # "sources":[Ljava/lang/String;
    .end local v2    # "merged":Ljava/lang/StringBuilder;
    :cond_4
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/player/danmu/Parser;->resolveSingleContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->cleanXml(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method private resolveSingleContent(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 141
    const-string v0, ", length: "

    const-string v1, "Content-Encoding"

    const-string v2, ", encoding: "

    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v3

    const-string v4, ""

    if-eqz v3, :cond_0

    return-object v4

    .line 142
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v4

    .line 143
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 144
    .local v3, "source":Ljava/lang/String;
    const-string v5, "file"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v3}, Lcom/github/tvbox/osc/util/FileUtils;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 145
    :cond_2
    const-string v5, "http"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 147
    :try_start_0
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_3

    return-object v4

    .line 148
    :cond_3
    invoke-direct {p0, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->executeHttp(Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v5

    .line 149
    .local v5, "response":Lokhttp3/Response;
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 150
    invoke-virtual {v5}, Lokhttp3/Response;->close()V

    .line 151
    return-object v4

    .line 153
    :cond_4
    invoke-direct {p0, v5}, Lcom/github/tvbox/osc/player/danmu/Parser;->readBody(Lokhttp3/Response;)Ljava/lang/String;

    move-result-object v6

    .line 154
    .local v6, "content":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "echo-danmu http code: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lokhttp3/Response;->code()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    invoke-virtual {v5, v1, v4}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 154
    invoke-static {v7}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    return-object v6

    .line 179
    .end local v5    # "response":Lokhttp3/Response;
    .end local v6    # "content":Ljava/lang/String;
    :catchall_0
    move-exception v5

    .line 180
    .local v5, "th":Ljava/lang/Throwable;
    const-string v6, "https"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-direct {p0, v5}, Lcom/github/tvbox/osc/player/danmu/Parser;->isSslError(Ljava/lang/Throwable;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 182
    :try_start_1
    const-string v6, "echo-danmu ssl verify failed, retry unsafe ssl"

    invoke-static {v6}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 183
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_5

    return-object v4

    .line 184
    :cond_5
    invoke-direct {p0, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->executeUnsafeHttp(Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v6

    .line 185
    .local v6, "response":Lokhttp3/Response;
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 186
    invoke-virtual {v6}, Lokhttp3/Response;->close()V

    .line 187
    return-object v4

    .line 189
    :cond_6
    invoke-direct {p0, v6}, Lcom/github/tvbox/osc/player/danmu/Parser;->readBody(Lokhttp3/Response;)Ljava/lang/String;

    move-result-object v7

    .line 190
    .local v7, "content":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "echo-danmu unsafe ssl http code: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lokhttp3/Response;->code()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {v6, v1, v4}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 193
    return-object v7

    .line 194
    .end local v6    # "response":Lokhttp3/Response;
    .end local v7    # "content":Ljava/lang/String;
    :catchall_1
    move-exception v0

    .line 195
    .local v0, "retryError":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-danmu unsafe ssl retry error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 198
    .end local v0    # "retryError":Ljava/lang/Throwable;
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "echo-danmu load error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 199
    return-object v4

    .line 158
    .end local v5    # "th":Ljava/lang/Throwable;
    :catch_0
    move-exception v5

    .line 159
    .local v5, "e":Ljava/net/SocketTimeoutException;
    invoke-direct {p0, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->isLocalProxy(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 161
    :try_start_2
    const-string v6, "echo-danmu load timeout, retry local proxy"

    invoke-static {v6}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 162
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_8

    return-object v4

    .line 163
    :cond_8
    invoke-direct {p0, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->executeHttp(Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v6

    .line 164
    .restart local v6    # "response":Lokhttp3/Response;
    invoke-direct {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 165
    invoke-virtual {v6}, Lokhttp3/Response;->close()V

    .line 166
    return-object v4

    .line 168
    :cond_9
    invoke-direct {p0, v6}, Lcom/github/tvbox/osc/player/danmu/Parser;->readBody(Lokhttp3/Response;)Ljava/lang/String;

    move-result-object v7

    .line 169
    .restart local v7    # "content":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "echo-danmu retry http code: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lokhttp3/Response;->code()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    invoke-virtual {v6, v1, v4}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 169
    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 172
    return-object v7

    .line 173
    .end local v6    # "response":Lokhttp3/Response;
    .end local v7    # "content":Ljava/lang/String;
    :catchall_2
    move-exception v0

    .line 174
    .restart local v0    # "retryError":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-danmu retry error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 177
    .end local v0    # "retryError":Ljava/lang/Throwable;
    :cond_a
    const-string v0, "echo-danmu load error: timeout"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 178
    return-object v4

    .line 202
    .end local v5    # "e":Ljava/net/SocketTimeoutException;
    :cond_b
    return-object v3
.end method

.method private setSpecial(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;)Z
    .locals 36
    .param p1, "item"    # Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v15, p1

    .line 361
    const/4 v14, 0x0

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    iget-object v2, v15, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->text:Ljava/lang/CharSequence;

    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    .line 362
    .local v0, "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    move-object v13, v2

    .line 363
    .local v13, "textArr":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v13

    if-ge v2, v3, :cond_0

    .line 364
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v13, v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 368
    .end local v0    # "jsonArray":Lorg/json/JSONArray;
    .end local v2    # "i":I
    :cond_0
    nop

    .line 369
    array-length v0, v13

    const/4 v2, 0x5

    if-lt v0, v2, :cond_e

    const/4 v0, 0x4

    aget-object v3, v13, v0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v4, v13

    move-object v2, v15

    const/4 v3, 0x0

    goto/16 :goto_8

    .line 371
    :cond_1
    :try_start_1
    aget-object v0, v13, v0

    invoke-static {v15, v0}, Lmaster/flame/danmaku/danmaku/util/DanmakuUtils;->fillText(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;Ljava/lang/CharSequence;)V

    .line 372
    aget-object v0, v13, v14

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 373
    .local v0, "beginX":F
    const/4 v12, 0x1

    aget-object v3, v13, v12

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    .line 374
    .local v3, "beginY":F
    move v4, v0

    .line 375
    .local v4, "endX":F
    move v5, v3

    .line 376
    .local v5, "endY":F
    const/4 v6, 0x2

    aget-object v6, v13, v6

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    move-object v10, v6

    .line 377
    .local v10, "alphaArr":[Ljava/lang/String;
    sget v6, Lmaster/flame/danmaku/danmaku/model/AlphaValue;->MAX:I

    int-to-float v6, v6

    aget-object v7, v10, v14

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    mul-float v6, v6, v7

    float-to-int v11, v6

    .line 378
    .local v11, "beginAlpha":I
    array-length v6, v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    if-le v6, v12, :cond_2

    .line 379
    :try_start_2
    sget v6, Lmaster/flame/danmaku/danmaku/model/AlphaValue;->MAX:I

    int-to-float v6, v6

    aget-object v7, v10, v12

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    mul-float v6, v6, v7

    float-to-int v6, v6

    move/from16 v17, v6

    goto :goto_1

    .line 416
    .end local v0    # "beginX":F
    .end local v3    # "beginY":F
    .end local v4    # "endX":F
    .end local v5    # "endY":F
    .end local v10    # "alphaArr":[Ljava/lang/String;
    .end local v11    # "beginAlpha":I
    :catchall_0
    move-exception v0

    move-object v4, v13

    move-object v2, v15

    const/4 v3, 0x0

    goto/16 :goto_7

    .line 380
    .restart local v0    # "beginX":F
    .restart local v3    # "beginY":F
    .restart local v4    # "endX":F
    .restart local v5    # "endY":F
    .restart local v10    # "alphaArr":[Ljava/lang/String;
    .restart local v11    # "beginAlpha":I
    :cond_2
    move/from16 v17, v11

    :goto_1
    nop

    .line 381
    .local v17, "endAlpha":I
    const/4 v6, 0x3

    :try_start_3
    aget-object v6, v13, v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    const/high16 v7, 0x447a0000    # 1000.0f

    mul-float v6, v6, v7

    float-to-long v8, v6

    .line 382
    .local v8, "alphaDuration":J
    move-wide v6, v8

    .line 383
    .local v6, "translationDuration":J
    const-wide/16 v18, 0x0

    .line 384
    .local v18, "translationStartDelay":J
    const/16 v16, 0x0

    .line 385
    .local v16, "rotateY":F
    const/16 v20, 0x0

    .line 386
    .local v20, "rotateZ":F
    array-length v12, v13
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    const/4 v14, 0x7

    if-lt v12, v14, :cond_3

    .line 387
    :try_start_4
    aget-object v2, v13, v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    move/from16 v20, v2

    .line 388
    const/4 v2, 0x6

    aget-object v2, v13, v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move/from16 v16, v2

    move/from16 v12, v16

    move/from16 v2, v20

    goto :goto_2

    .line 386
    :cond_3
    move/from16 v12, v16

    move/from16 v2, v20

    .line 390
    .end local v16    # "rotateY":F
    .end local v20    # "rotateZ":F
    .local v2, "rotateZ":F
    .local v12, "rotateY":F
    :goto_2
    :try_start_5
    array-length v14, v13
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    move-object/from16 v20, v10

    .end local v10    # "alphaArr":[Ljava/lang/String;
    .local v20, "alphaArr":[Ljava/lang/String;
    const/16 v10, 0xb

    move/from16 v23, v4

    .end local v4    # "endX":F
    .local v23, "endX":F
    const/16 v4, 0x8

    if-lt v14, v10, :cond_6

    .line 391
    const/4 v14, 0x7

    :try_start_6
    aget-object v25, v13, v14

    invoke-static/range {v25 .. v25}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v14

    .line 392
    .end local v23    # "endX":F
    .local v14, "endX":F
    aget-object v23, v13, v4

    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v23

    move/from16 v5, v23

    .line 393
    const/16 v23, 0x9

    aget-object v24, v13, v23

    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v24

    if-nez v24, :cond_4

    aget-object v25, v13, v23

    invoke-static/range {v25 .. v25}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v25

    move-wide/from16 v6, v25

    .line 394
    :cond_4
    const/16 v23, 0xa

    aget-object v25, v13, v23

    invoke-static/range {v25 .. v25}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_5

    aget-object v23, v13, v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v10
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move/from16 v23, v5

    .end local v5    # "endY":F
    .local v23, "endY":F
    float-to-long v4, v10

    move-wide/from16 v29, v4

    move-wide/from16 v27, v6

    move v4, v14

    move/from16 v5, v23

    .end local v18    # "translationStartDelay":J
    .local v4, "translationStartDelay":J
    goto :goto_3

    .end local v4    # "translationStartDelay":J
    .end local v23    # "endY":F
    .restart local v5    # "endY":F
    .restart local v18    # "translationStartDelay":J
    :cond_5
    move/from16 v23, v5

    .end local v5    # "endY":F
    .restart local v23    # "endY":F
    move-wide/from16 v27, v6

    move v4, v14

    move-wide/from16 v29, v18

    goto :goto_3

    .line 390
    .end local v14    # "endX":F
    .restart local v5    # "endY":F
    .local v23, "endX":F
    :cond_6
    move-wide/from16 v27, v6

    move-wide/from16 v29, v18

    move/from16 v4, v23

    .line 396
    .end local v6    # "translationDuration":J
    .end local v18    # "translationStartDelay":J
    .end local v23    # "endX":F
    .local v4, "endX":F
    .local v27, "translationDuration":J
    .local v29, "translationStartDelay":J
    :goto_3
    const/4 v14, 0x0

    :try_start_7
    aget-object v6, v13, v14

    invoke-direct {v1, v6}, Lcom/github/tvbox/osc/player/danmu/Parser;->isPercentageNumber(Ljava/lang/String;)Z

    move-result v6

    const v7, 0x442a8000    # 682.0f

    if-eqz v6, :cond_7

    mul-float v0, v0, v7

    .line 397
    :cond_7
    const/16 v18, 0x1

    aget-object v6, v13, v18

    invoke-direct {v1, v6}, Lcom/github/tvbox/osc/player/danmu/Parser;->isPercentageNumber(Ljava/lang/String;)Z

    move-result v6

    const/high16 v10, 0x43db0000    # 438.0f

    if-eqz v6, :cond_8

    mul-float v3, v3, v10

    :cond_8
    move/from16 v21, v3

    .line 398
    .end local v3    # "beginY":F
    .local v21, "beginY":F
    array-length v3, v13
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    const/16 v6, 0x8

    if-lt v3, v6, :cond_9

    const/4 v3, 0x7

    :try_start_8
    aget-object v3, v13, v3

    invoke-direct {v1, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->isPercentageNumber(Ljava/lang/String;)Z

    move-result v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-eqz v3, :cond_9

    mul-float v4, v4, v7

    move/from16 v22, v4

    goto :goto_4

    .line 399
    :cond_9
    move/from16 v22, v4

    .end local v4    # "endX":F
    .local v22, "endX":F
    :goto_4
    :try_start_9
    array-length v3, v13
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    const/16 v4, 0x9

    if-lt v3, v4, :cond_a

    const/16 v3, 0x8

    :try_start_a
    aget-object v3, v13, v3

    invoke-direct {v1, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->isPercentageNumber(Ljava/lang/String;)Z

    move-result v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    if-eqz v3, :cond_a

    mul-float v5, v5, v10

    move/from16 v23, v5

    goto :goto_5

    .line 400
    :cond_a
    move/from16 v23, v5

    .end local v5    # "endY":F
    .local v23, "endY":F
    :goto_5
    :try_start_b
    new-instance v3, Lmaster/flame/danmaku/danmaku/model/Duration;

    invoke-direct {v3, v8, v9}, Lmaster/flame/danmaku/danmaku/model/Duration;-><init>(J)V

    iput-object v3, v15, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->duration:Lmaster/flame/danmaku/danmaku/model/Duration;

    .line 401
    iput v2, v15, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->rotationZ:F

    .line 402
    iput v12, v15, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->rotationY:F

    .line 403
    iget-object v3, v1, Lcom/github/tvbox/osc/player/danmu/Parser;->mContext:Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;

    iget-object v3, v3, Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;->mDanmakuFactory:Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;

    iget v10, v1, Lcom/github/tvbox/osc/player/danmu/Parser;->scaleX:F

    iget v7, v1, Lcom/github/tvbox/osc/player/danmu/Parser;->scaleY:F
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    move/from16 v24, v2

    .end local v2    # "rotateZ":F
    .local v24, "rotateZ":F
    move-object v2, v3

    move-object/from16 v3, p1

    move v4, v0

    move/from16 v5, v21

    move/from16 v6, v22

    move/from16 v16, v7

    move/from16 v7, v23

    move-wide/from16 v31, v8

    .end local v8    # "alphaDuration":J
    .local v31, "alphaDuration":J
    move-wide/from16 v8, v27

    move/from16 v19, v10

    move/from16 v25, v11

    const/16 v26, 0xb

    .end local v11    # "beginAlpha":I
    .local v25, "beginAlpha":I
    move-wide/from16 v10, v29

    move/from16 v33, v12

    const/16 v34, 0x1

    .end local v12    # "rotateY":F
    .local v33, "rotateY":F
    move/from16 v12, v19

    move-object/from16 v35, v13

    .end local v13    # "textArr":[Ljava/lang/String;
    .local v35, "textArr":[Ljava/lang/String;
    move/from16 v13, v16

    :try_start_c
    invoke-virtual/range {v2 .. v13}, Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;->fillTranslationData(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;FFFFJJFF)V

    .line 405
    iget-object v2, v1, Lcom/github/tvbox/osc/player/danmu/Parser;->mContext:Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;

    iget-object v2, v2, Lmaster/flame/danmaku/danmaku/model/android/DanmakuContext;->mDanmakuFactory:Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    const/4 v3, 0x0

    move-object v14, v2

    move-object v2, v15

    move-object/from16 v15, p1

    move/from16 v16, v25

    move-wide/from16 v18, v31

    :try_start_d
    invoke-virtual/range {v14 .. v19}, Lmaster/flame/danmaku/danmaku/model/android/DanmakuFactory;->fillAlphaData(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;IIJ)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 406
    move-object/from16 v4, v35

    .end local v35    # "textArr":[Ljava/lang/String;
    .local v4, "textArr":[Ljava/lang/String;
    :try_start_e
    array-length v5, v4

    const/16 v6, 0xc

    if-lt v5, v6, :cond_b

    const-string v5, "true"

    aget-object v6, v4, v26

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 407
    iput v3, v2, Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;->textShadowColor:I

    .line 409
    :cond_b
    array-length v5, v4

    const/16 v6, 0xe

    if-lt v5, v6, :cond_c

    .line 410
    move-object v5, v2

    check-cast v5, Lmaster/flame/danmaku/danmaku/model/SpecialDanmaku;

    const-string v7, "0"

    const/16 v8, 0xd

    aget-object v8, v4, v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    iput-boolean v7, v5, Lmaster/flame/danmaku/danmaku/model/SpecialDanmaku;->isQuadraticEaseOut:Z

    .line 412
    :cond_c
    array-length v5, v4

    const/16 v7, 0xf

    if-lt v5, v7, :cond_d

    aget-object v5, v4, v6

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_d

    .line 413
    aget-object v5, v4, v6

    invoke-direct {v1, v2, v5}, Lcom/github/tvbox/osc/player/danmu/Parser;->fillLinePath(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 415
    :cond_d
    return v34

    .line 416
    .end local v0    # "beginX":F
    .end local v17    # "endAlpha":I
    .end local v20    # "alphaArr":[Ljava/lang/String;
    .end local v21    # "beginY":F
    .end local v22    # "endX":F
    .end local v23    # "endY":F
    .end local v24    # "rotateZ":F
    .end local v25    # "beginAlpha":I
    .end local v27    # "translationDuration":J
    .end local v29    # "translationStartDelay":J
    .end local v31    # "alphaDuration":J
    .end local v33    # "rotateY":F
    :catchall_1
    move-exception v0

    goto :goto_7

    .end local v4    # "textArr":[Ljava/lang/String;
    .restart local v35    # "textArr":[Ljava/lang/String;
    :catchall_2
    move-exception v0

    move-object/from16 v4, v35

    goto :goto_6

    :catchall_3
    move-exception v0

    move-object v2, v15

    move-object/from16 v4, v35

    const/4 v3, 0x0

    .end local v35    # "textArr":[Ljava/lang/String;
    .restart local v4    # "textArr":[Ljava/lang/String;
    :goto_6
    goto :goto_7

    .end local v4    # "textArr":[Ljava/lang/String;
    .restart local v13    # "textArr":[Ljava/lang/String;
    :catchall_4
    move-exception v0

    move-object v4, v13

    move-object v2, v15

    const/4 v3, 0x0

    .line 417
    .end local v13    # "textArr":[Ljava/lang/String;
    .local v0, "ignored":Ljava/lang/Throwable;
    .restart local v4    # "textArr":[Ljava/lang/String;
    :goto_7
    return v3

    .line 369
    .end local v0    # "ignored":Ljava/lang/Throwable;
    .end local v4    # "textArr":[Ljava/lang/String;
    .restart local v13    # "textArr":[Ljava/lang/String;
    :cond_e
    move-object v4, v13

    move-object v2, v15

    const/4 v3, 0x0

    .end local v13    # "textArr":[Ljava/lang/String;
    .restart local v4    # "textArr":[Ljava/lang/String;
    :goto_8
    return v3

    .line 366
    .end local v4    # "textArr":[Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v2, v15

    const/4 v3, 0x0

    .line 367
    .local v0, "e":Lorg/json/JSONException;
    return v3
.end method


# virtual methods
.method public getDanmuCount()I
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->danmu:Lcom/github/tvbox/osc/bean/Danmu;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/Danmu;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method protected bridge synthetic parse()Lmaster/flame/danmaku/danmaku/model/IDanmakus;
    .locals 1

    .line 46
    invoke-virtual {p0}, Lcom/github/tvbox/osc/player/danmu/Parser;->parse()Lmaster/flame/danmaku/danmaku/model/android/Danmakus;

    move-result-object v0

    return-object v0
.end method

.method protected parse()Lmaster/flame/danmaku/danmaku/model/android/Danmakus;
    .locals 6

    .line 304
    new-instance v0, Lmaster/flame/danmaku/danmaku/model/android/Danmakus;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lmaster/flame/danmaku/danmaku/model/android/Danmakus;-><init>(I)V

    .line 305
    .local v0, "result":Lmaster/flame/danmaku/danmaku/model/android/Danmakus;
    const/4 v1, 0x0

    .line 306
    .local v1, "renderedCount":I
    iget-object v2, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->danmu:Lcom/github/tvbox/osc/bean/Danmu;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/Danmu;->getData()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/Danmu$Data;

    .line 307
    .local v3, "data":Lcom/github/tvbox/osc/bean/Danmu$Data;
    invoke-direct {p0, v3}, Lcom/github/tvbox/osc/player/danmu/Parser;->createDanmaku(Lcom/github/tvbox/osc/bean/Danmu$Data;)Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;

    move-result-object v4

    .line 308
    .local v4, "danmaku":Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    if-nez v4, :cond_0

    goto :goto_0

    .line 309
    :cond_0
    invoke-virtual {v0}, Lmaster/flame/danmaku/danmaku/model/android/Danmakus;->obtainSynchronizer()Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 310
    :try_start_0
    invoke-virtual {v0, v4}, Lmaster/flame/danmaku/danmaku/model/android/Danmakus;->addItem(Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;)Z

    .line 311
    monitor-exit v5

    .line 312
    nop

    .end local v3    # "data":Lcom/github/tvbox/osc/bean/Danmu$Data;
    .end local v4    # "danmaku":Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    add-int/lit8 v1, v1, 0x1

    .line 313
    goto :goto_0

    .line 311
    .restart local v3    # "data":Lcom/github/tvbox/osc/bean/Danmu$Data;
    .restart local v4    # "danmaku":Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    :catchall_0
    move-exception v2

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 314
    .end local v3    # "data":Lcom/github/tvbox/osc/bean/Danmu$Data;
    .end local v4    # "danmaku":Lmaster/flame/danmaku/danmaku/model/BaseDanmaku;
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "echo-danmu rendered count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 315
    return-object v0
.end method

.method public setDisplayer(Lmaster/flame/danmaku/danmaku/model/IDisplayer;)Lmaster/flame/danmaku/danmaku/parser/BaseDanmakuParser;
    .locals 2
    .param p1, "display"    # Lmaster/flame/danmaku/danmaku/model/IDisplayer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "display"
        }
    .end annotation

    .line 320
    invoke-super {p0, p1}, Lmaster/flame/danmaku/danmaku/parser/BaseDanmakuParser;->setDisplayer(Lmaster/flame/danmaku/danmaku/model/IDisplayer;)Lmaster/flame/danmaku/danmaku/parser/BaseDanmakuParser;

    .line 321
    iget v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mDispWidth:I

    int-to-float v0, v0

    const v1, 0x442a8000    # 682.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->scaleX:F

    .line 322
    iget v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->mDispHeight:I

    int-to-float v0, v0

    const/high16 v1, 0x43db0000    # 438.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/github/tvbox/osc/player/danmu/Parser;->scaleY:F

    .line 323
    return-object p0
.end method
