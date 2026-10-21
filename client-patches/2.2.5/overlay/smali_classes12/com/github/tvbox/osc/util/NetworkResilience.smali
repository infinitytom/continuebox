.class public final Lcom/github/tvbox/osc/util/NetworkResilience;
.super Ljava/lang/Object;
.source "NetworkResilience.java"

# interfaces
.implements Lokhttp3/Interceptor;


# static fields
.field private static final POOL:Lokhttp3/ConnectionPool;

.field private static observing:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 23
    new-instance v0, Lokhttp3/ConnectionPool;

    const-wide/16 v1, 0x14

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v4, 0x8

    invoke-direct {v0, v4, v1, v2, v3}, Lokhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    sput-object v0, Lcom/github/tvbox/osc/util/NetworkResilience;->POOL:Lokhttp3/ConnectionPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lokhttp3/ConnectionPool;
    .locals 1

    .line 22
    sget-object v0, Lcom/github/tvbox/osc/util/NetworkResilience;->POOL:Lokhttp3/ConnectionPool;

    return-object v0
.end method

.method public static install(Lokhttp3/OkHttpClient$Builder;)V
    .locals 4
    .param p0, "builder"    # Lokhttp3/OkHttpClient$Builder;

    .line 27
    sget-object v0, Lcom/github/tvbox/osc/util/NetworkResilience;->POOL:Lokhttp3/ConnectionPool;

    invoke-virtual {p0, v0}, Lokhttp3/OkHttpClient$Builder;->connectionPool(Lokhttp3/ConnectionPool;)Lokhttp3/OkHttpClient$Builder;

    .line 28
    const/4 v0, 0x0

    .line 29
    .local v0, "present":Z
    invoke-virtual {p0}, Lokhttp3/OkHttpClient$Builder;->interceptors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokhttp3/Interceptor;

    .line 30
    .local v2, "interceptor":Lokhttp3/Interceptor;
    instance-of v3, v2, Lcom/github/tvbox/osc/util/NetworkResilience;

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    .line 31
    .end local v2    # "interceptor":Lokhttp3/Interceptor;
    :cond_0
    goto :goto_0

    .line 32
    :cond_1
    if-nez v0, :cond_2

    new-instance v1, Lcom/github/tvbox/osc/util/NetworkResilience;

    invoke-direct {v1}, Lcom/github/tvbox/osc/util/NetworkResilience;-><init>()V

    invoke-virtual {p0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 33
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/util/NetworkResilience;->observeNetwork()V

    .line 34
    return-void
.end method

.method private static declared-synchronized observeNetwork()V
    .locals 5

    const-class v0, Lcom/github/tvbox/osc/util/NetworkResilience;

    monitor-enter v0

    .line 37
    :try_start_0
    sget-boolean v1, Lcom/github/tvbox/osc/util/NetworkResilience;->observing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 39
    :cond_0
    :try_start_1
    const-string v1, "com.github.tvbox.osc.base.App"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 40
    .local v1, "app":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "getInstance"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    .line 41
    .local v2, "context":Landroid/content/Context;
    if-eqz v2, :cond_3

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x18

    if-ge v3, v4, :cond_1

    goto :goto_0

    .line 42
    :cond_1
    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .local v3, "manager":Landroid/net/ConnectivityManager;
    if-nez v3, :cond_2

    monitor-exit v0

    return-void

    .line 44
    :cond_2
    :try_start_2
    new-instance v4, Lcom/github/tvbox/osc/util/NetworkResilience$1;

    invoke-direct {v4}, Lcom/github/tvbox/osc/util/NetworkResilience$1;-><init>()V

    invoke-virtual {v3, v4}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 48
    const/4 v4, 0x1

    sput-boolean v4, Lcom/github/tvbox/osc/util/NetworkResilience;->observing:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    .end local v1    # "app":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "context":Landroid/content/Context;
    .end local v3    # "manager":Landroid/net/ConnectivityManager;
    goto :goto_1

    .line 41
    .restart local v1    # "app":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "context":Landroid/content/Context;
    :cond_3
    :goto_0
    monitor-exit v0

    return-void

    .line 49
    .end local v1    # "app":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "context":Landroid/content/Context;
    :catch_0
    move-exception v1

    .line 52
    :goto_1
    monitor-exit v0

    return-void

    .line 36
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static replayable(Lokhttp3/Request;)Z
    .locals 6
    .param p0, "request"    # Lokhttp3/Request;

    .line 55
    invoke-virtual {p0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "method":Ljava/lang/String;
    const-string v1, "GET"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "HEAD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return v2

    .line 57
    :cond_0
    invoke-virtual {p0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "path":Ljava/lang/String;
    const-string v3, "/proxy"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "/action"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "/callback"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 59
    const-string v3, "/oauth"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "/logout"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "/register"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 60
    const-string v3, "/delete"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_2

    .line 61
    :cond_1
    invoke-virtual {p0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/HttpUrl;->queryParameterNames()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 62
    .local v4, "key":Ljava/lang/String;
    const-string v5, "do"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "go"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 63
    const-string v5, "action"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "code"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 64
    const-string v5, "password"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    .line 65
    .end local v4    # "key":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 64
    .restart local v4    # "key":Ljava/lang/String;
    :cond_3
    :goto_1
    return v2

    .line 66
    .end local v4    # "key":Ljava/lang/String;
    :cond_4
    const/4 v2, 0x1

    return v2

    .line 60
    :cond_5
    :goto_2
    return v2
.end method

.method private static transientDisconnect(Ljava/io/IOException;)Z
    .locals 4
    .param p0, "error"    # Ljava/io/IOException;

    .line 70
    instance-of v0, p0, Ljavax/net/ssl/SSLException;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    if-nez v0, :cond_6

    instance-of v0, p0, Ljava/io/InterruptedIOException;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    instance-of v0, p0, Ljava/io/EOFException;

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 73
    :cond_1
    instance-of v0, p0, Ljava/net/SocketException;

    if-nez v0, :cond_2

    return v1

    .line 74
    :cond_2
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "message":Ljava/lang/String;
    if-nez v0, :cond_3

    return v1

    .line 76
    :cond_3
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 77
    const-string v3, "reset"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "broken pipe"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "closed"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_4
    const/4 v1, 0x1

    :cond_5
    return v1

    .line 71
    .end local v0    # "message":Ljava/lang/String;
    :cond_6
    :goto_0
    return v1
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 5
    .param p1, "chain"    # Lokhttp3/Interceptor$Chain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 83
    .local v0, "request":Lokhttp3/Request;
    :try_start_0
    invoke-interface {p1, v0}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 84
    :catch_0
    move-exception v1

    .line 85
    .local v1, "error":Ljava/io/IOException;
    invoke-static {v0}, Lcom/github/tvbox/osc/util/NetworkResilience;->replayable(Lokhttp3/Request;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/NetworkResilience;->transientDisconnect(Ljava/io/IOException;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->call()Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->isCanceled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 86
    sget-object v2, Lcom/github/tvbox/osc/util/NetworkResilience;->POOL:Lokhttp3/ConnectionPool;

    invoke-virtual {v2}, Lokhttp3/ConnectionPool;->evictAll()V

    .line 87
    const-wide/16 v2, 0xfa

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 91
    nop

    .line 92
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->call()Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->isCanceled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 94
    invoke-interface {p1, v0}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v2

    return-object v2

    .line 92
    :cond_0
    throw v1

    .line 88
    :catch_1
    move-exception v2

    .line 89
    .local v2, "interrupted":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 90
    new-instance v3, Ljava/io/InterruptedIOException;

    const-string v4, "Request interrupted"

    invoke-direct {v3, v4}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 85
    .end local v2    # "interrupted":Ljava/lang/InterruptedException;
    :cond_1
    throw v1
.end method
