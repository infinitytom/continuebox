.class public Lcom/github/tvbox/osc/util/OkGoHelper;
.super Ljava/lang/Object;
.source "OkGoHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;
    }
.end annotation


# static fields
.field public static final DEFAULT_MILLISECONDS:J = 0x2710L

.field static ItvClient:Lokhttp3/OkHttpClient; = null

.field static defaultClient:Lokhttp3/OkHttpClient; = null

.field private static final dnsConfigJson:Ljava/lang/String; = "[{\"name\": \"\u817e\u8baf\", \"url\": \"https://doh.pub/dns-query\"},{\"name\": \"\u963f\u91cc\", \"url\": \"https://dns.alidns.com/dns-query\"},{\"name\": \"360\", \"url\": \"https://doh.360.cn/dns-query\"}]"

.field public static dnsHttpsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static dnsOverHttps:Lokhttp3/dnsoverhttps/DnsOverHttps;

.field public static is_doh:Z

.field public static myHosts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static noRedirectClient:Lokhttp3/OkHttpClient;

.field private static proxyAuthenticator:Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

.field private static proxySelector:Lcom/github/tvbox/osc/util/net/OkProxySelector;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    const/4 v0, 0x0

    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->ItvClient:Lokhttp3/OkHttpClient;

    .line 64
    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector:Lcom/github/tvbox/osc/util/net/OkProxySelector;

    .line 65
    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator:Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    .line 117
    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsOverHttps:Lokhttp3/dnsoverhttps/DnsOverHttps;

    .line 119
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    .line 121
    const/4 v1, 0x0

    sput-boolean v1, Lcom/github/tvbox/osc/util/OkGoHelper;->is_doh:Z

    .line 122
    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->myHosts:Ljava/util/Map;

    .line 296
    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->defaultClient:Lokhttp3/OkHttpClient;

    .line 297
    sput-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->noRedirectClient:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static DohIps(Lcom/google/gson/JsonArray;)Ljava/util/List;
    .locals 3
    .param p0, "ips"    # Lcom/google/gson/JsonArray;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ips"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/JsonArray;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .line 151
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .local v0, "inetAddresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    if-eqz p0, :cond_0

    .line 153
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {p0}, Lcom/google/gson/JsonArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 155
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 156
    .local v2, "inetAddress":Ljava/net/InetAddress;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    nop

    .end local v2    # "inetAddress":Ljava/net/InetAddress;
    goto :goto_1

    .line 157
    :catch_0
    move-exception v2

    .line 158
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 153
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 162
    .end local v1    # "j":I
    :cond_0
    return-object v0
.end method

.method public static getDefaultClient()Lokhttp3/OkHttpClient;
    .locals 1

    .line 300
    sget-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->defaultClient:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method public static getDohUrl(I)Ljava/lang/String;
    .locals 4
    .param p0, "type"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .line 125
    const-string v0, "doh_json"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 126
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v0, "[{\"name\": \"\u817e\u8baf\", \"url\": \"https://doh.pub/dns-query\"},{\"name\": \"\u963f\u91cc\", \"url\": \"https://dns.alidns.com/dns-query\"},{\"name\": \"360\", \"url\": \"https://doh.360.cn/dns-query\"}]"

    .line 127
    :cond_0
    invoke-static {v0}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v2

    .line 128
    .local v2, "jsonArray":Lcom/google/gson/JsonArray;
    const/4 v3, 0x1

    if-lt p0, v3, :cond_1

    sget-object v3, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge p0, v3, :cond_1

    .line 129
    add-int/lit8 v1, p0, -0x1

    invoke-virtual {v2, v1}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v1

    .line 130
    .local v1, "dnsConfig":Lcom/google/gson/JsonObject;
    const-string v3, "url"

    invoke-virtual {v1, v3}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 132
    .end local v1    # "dnsConfig":Lcom/google/gson/JsonObject;
    :cond_1
    return-object v1
.end method

.method public static getItvClient()Lokhttp3/OkHttpClient;
    .locals 1

    .line 308
    sget-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->ItvClient:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method public static getNoRedirectClient()Lokhttp3/OkHttpClient;
    .locals 1

    .line 304
    sget-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->noRedirectClient:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method public static init()V
    .locals 6

    .line 312
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->initDnsOverHttps()V

    .line 314
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 315
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    new-instance v1, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;

    const-string v2, "OkGo"

    invoke-direct {v1, v2}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;-><init>(Ljava/lang/String;)V

    .line 317
    .local v1, "loggingInterceptor":Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "debug_open"

    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 318
    sget-object v3, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->BODY:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v1, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 319
    sget-object v3, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v1, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    goto :goto_0

    .line 321
    :cond_0
    sget-object v3, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->NONE:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v1, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 322
    sget-object v3, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-virtual {v1, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    .line 327
    :goto_0
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 329
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x2710

    invoke-virtual {v0, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 330
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 331
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 333
    new-instance v3, Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;

    invoke-direct {v3}, Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;-><init>()V

    invoke-virtual {v0, v3}, Lokhttp3/OkHttpClient$Builder;->dns(Lokhttp3/Dns;)Lokhttp3/OkHttpClient$Builder;

    .line 334
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v3

    invoke-virtual {v0, v3}, Lokhttp3/OkHttpClient$Builder;->proxySelector(Ljava/net/ProxySelector;)Lokhttp3/OkHttpClient$Builder;

    .line 335
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator()Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    move-result-object v3

    invoke-virtual {v0, v3}, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;

    .line 337
    :try_start_0
    invoke-static {v0}, Lcom/github/tvbox/osc/util/OkGoHelper;->setOkHttpSsl(Lokhttp3/OkHttpClient$Builder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    goto :goto_1

    .line 338
    :catchall_0
    move-exception v3

    .line 339
    .local v3, "th":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 342
    .end local v3    # "th":Ljava/lang/Throwable;
    :goto_1
    invoke-static {}, Lokhttp3/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lzy/okgo/model/HttpHeaders;->setUserAgent(Ljava/lang/String;)V

    .line 344
    invoke-static {v0}, Lcom/github/tvbox/osc/util/NetworkResilience;->install(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v3

    .line 345
    .local v3, "okHttpClient":Lokhttp3/OkHttpClient;
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/lzy/okgo/OkGo;->setOkHttpClient(Lokhttp3/OkHttpClient;)Lcom/lzy/okgo/OkGo;

    .line 347
    sput-object v3, Lcom/github/tvbox/osc/util/OkGoHelper;->defaultClient:Lokhttp3/OkHttpClient;

    .line 349
    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 350
    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 351
    invoke-static {v0}, Lcom/github/tvbox/osc/util/NetworkResilience;->install(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v2

    sput-object v2, Lcom/github/tvbox/osc/util/OkGoHelper;->noRedirectClient:Lokhttp3/OkHttpClient;

    .line 353
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->initExoOkHttpClient()V

    .line 354
    invoke-static {v3}, Lcom/github/tvbox/osc/util/OkGoHelper;->initPicasso(Lokhttp3/OkHttpClient;)V

    .line 355
    return-void
.end method

.method static initDnsOverHttps()V
    .locals 15

    .line 166
    const-string v0, "ips"

    const-string v1, "name"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "doh_url"

    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 167
    .local v5, "dohSelector":Ljava/lang/Integer;
    const/4 v6, 0x0

    .line 169
    .local v6, "ips":Lcom/google/gson/JsonArray;
    const/4 v7, 0x0

    :try_start_0
    sget-object v8, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 170
    sget-object v8, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    const-string v9, "\u5173\u95ed"

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    const-string v8, "doh_json"

    const-string v9, ""

    invoke-static {v8, v9}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 172
    .local v8, "json":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, "[{\"name\": \"\u817e\u8baf\", \"url\": \"https://doh.pub/dns-query\"},{\"name\": \"\u963f\u91cc\", \"url\": \"https://dns.alidns.com/dns-query\"},{\"name\": \"360\", \"url\": \"https://doh.360.cn/dns-query\"}]"

    move-object v8, v9

    .line 173
    :cond_0
    invoke-static {v8}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v9

    .line 174
    .local v9, "jsonArray":Lcom/google/gson/JsonArray;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {v9}, Lcom/google/gson/JsonArray;->size()I

    move-result v11

    if-le v10, v11, :cond_1

    .line 175
    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 176
    move-object v5, v3

    .line 178
    :cond_1
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-virtual {v9}, Lcom/google/gson/JsonArray;->size()I

    move-result v11

    if-ge v10, v11, :cond_5

    .line 179
    invoke-virtual {v9, v10}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v11

    .line 180
    .local v11, "dnsConfig":Lcom/google/gson/JsonObject;
    invoke-virtual {v11, v1}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v11, v1}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v12

    goto :goto_1

    :cond_2
    const-string v12, "Unknown Name"

    .line 181
    .local v12, "name":Ljava/lang/String;
    :goto_1
    sget-object v13, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v13

    add-int/lit8 v14, v10, 0x1

    if-ne v13, v14, :cond_4

    invoke-virtual {v11, v0}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-virtual {v11, v0}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_3
    move-object v13, v7

    :goto_2
    move-object v6, v13

    .line 178
    .end local v11    # "dnsConfig":Lcom/google/gson/JsonObject;
    .end local v12    # "name":Ljava/lang/String;
    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 186
    .end local v8    # "json":Ljava/lang/String;
    .end local v9    # "jsonArray":Lcom/google/gson/JsonArray;
    .end local v10    # "i":I
    :cond_5
    goto :goto_3

    .line 184
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 188
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 189
    .local v0, "builder":Lokhttp3/OkHttpClient$Builder;
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->proxySelector(Ljava/net/ProxySelector;)Lokhttp3/OkHttpClient$Builder;

    .line 190
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator()Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;

    .line 191
    new-instance v1, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;

    const-string v8, "OkExoPlayer"

    invoke-direct {v1, v8}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;-><init>(Ljava/lang/String;)V

    .line 192
    .local v1, "loggingInterceptor":Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v8, "debug_open"

    invoke-static {v8, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 193
    sget-object v2, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->BODY:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v1, v2}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 194
    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    goto :goto_4

    .line 196
    :cond_6
    sget-object v2, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->NONE:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v1, v2}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 197
    sget-object v2, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    .line 199
    :goto_4
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 201
    :try_start_1
    invoke-static {v0}, Lcom/github/tvbox/osc/util/OkGoHelper;->setOkHttpSsl(Lokhttp3/OkHttpClient$Builder;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    goto :goto_5

    .line 202
    :catchall_0
    move-exception v2

    .line 203
    .local v2, "th":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 205
    .end local v2    # "th":Ljava/lang/Throwable;
    :goto_5
    new-instance v2, Lokhttp3/Cache;

    new-instance v8, Ljava/io/File;

    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v9

    invoke-virtual {v9}, Lcom/github/tvbox/osc/base/App;->getCacheDir()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    const-string v10, "dohcache"

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/32 v9, 0x6400000

    invoke-direct {v2, v8, v9, v10}, Lokhttp3/Cache;-><init>(Ljava/io/File;J)V

    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient$Builder;->cache(Lokhttp3/Cache;)Lokhttp3/OkHttpClient$Builder;

    .line 206
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v2

    .line 207
    .local v2, "dohClient":Lokhttp3/OkHttpClient;
    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/github/tvbox/osc/util/OkGoHelper;->getDohUrl(I)Ljava/lang/String;

    move-result-object v3

    .line 211
    .local v3, "dohUrl":Ljava/lang/String;
    new-instance v4, Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;

    invoke-direct {v4}, Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;-><init>()V

    invoke-virtual {v4, v2}, Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;->client(Lokhttp3/OkHttpClient;)Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_7

    move-object v8, v7

    goto :goto_6

    :cond_7
    invoke-static {v3}, Lokhttp3/HttpUrl;->get(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v8

    :goto_6
    invoke-virtual {v4, v8}, Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;

    move-result-object v4

    if-eqz v6, :cond_8

    const-string v8, "https://doh.pub/dns-query"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    invoke-static {v6}, Lcom/github/tvbox/osc/util/OkGoHelper;->DohIps(Lcom/google/gson/JsonArray;)Ljava/util/List;

    move-result-object v7

    :cond_8
    invoke-virtual {v4, v7}, Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;->bootstrapDnsHosts(Ljava/util/List;)Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/dnsoverhttps/DnsOverHttps$Builder;->build()Lokhttp3/dnsoverhttps/DnsOverHttps;

    move-result-object v4

    sput-object v4, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsOverHttps:Lokhttp3/dnsoverhttps/DnsOverHttps;

    .line 212
    return-void
.end method

.method static initExoOkHttpClient()V
    .locals 5

    .line 84
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    .line 85
    .local v0, "base":Lokhttp3/OkHttpClient;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v1, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v1}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 86
    .local v1, "builder":Lokhttp3/OkHttpClient$Builder;
    :goto_0
    new-instance v2, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;

    const-string v3, "OkExoPlayer"

    invoke-direct {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;-><init>(Ljava/lang/String;)V

    .line 88
    .local v2, "loggingInterceptor":Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "debug_open"

    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 89
    sget-object v3, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->BODY:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 90
    sget-object v3, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    goto :goto_1

    .line 92
    :cond_1
    sget-object v3, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->NONE:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 93
    sget-object v3, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    .line 95
    :goto_1
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 97
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    .line 98
    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 99
    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 100
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v3

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->proxySelector(Ljava/net/ProxySelector;)Lokhttp3/OkHttpClient$Builder;

    .line 101
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator()Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    move-result-object v3

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;

    .line 105
    :try_start_0
    invoke-static {v1}, Lcom/github/tvbox/osc/util/OkGoHelper;->setOkHttpSsl(Lokhttp3/OkHttpClient$Builder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    goto :goto_2

    .line 106
    :catchall_0
    move-exception v3

    .line 107
    .local v3, "th":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 111
    .end local v3    # "th":Ljava/lang/Throwable;
    :goto_2
    new-instance v3, Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;

    invoke-direct {v3}, Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;-><init>()V

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->dns(Lokhttp3/Dns;)Lokhttp3/OkHttpClient$Builder;

    .line 112
    invoke-static {v1}, Lcom/github/tvbox/osc/util/NetworkResilience;->install(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v3

    sput-object v3, Lcom/github/tvbox/osc/util/OkGoHelper;->ItvClient:Lokhttp3/OkHttpClient;

    .line 114
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v3

    invoke-static {v3}, Lxyz/doikki/videoplayer/exo/ExoMediaSourceHelper;->getInstance(Landroid/content/Context;)Lxyz/doikki/videoplayer/exo/ExoMediaSourceHelper;

    move-result-object v3

    sget-object v4, Lcom/github/tvbox/osc/util/OkGoHelper;->ItvClient:Lokhttp3/OkHttpClient;

    invoke-virtual {v3, v4}, Lxyz/doikki/videoplayer/exo/ExoMediaSourceHelper;->setOkClient(Lokhttp3/OkHttpClient;)V

    .line 115
    return-void
.end method

.method static initPicasso(Lokhttp3/OkHttpClient;)V
    .locals 3
    .param p0, "client"    # Lokhttp3/OkHttpClient;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "client"
        }
    .end annotation

    .line 403
    invoke-virtual {p0}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lokhttp3/Dispatcher;->setMaxRequestsPerHost(I)V

    .line 404
    new-instance v0, Lcom/github/tvbox/osc/picasso/MyOkhttpDownLoader;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/picasso/MyOkhttpDownLoader;-><init>(Lokhttp3/OkHttpClient;)V

    .line 405
    .local v0, "downloader":Lcom/github/tvbox/osc/picasso/MyOkhttpDownLoader;
    new-instance v1, Lcom/squareup/picasso/Picasso$Builder;

    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/squareup/picasso/Picasso$Builder;-><init>(Landroid/content/Context;)V

    .line 406
    invoke-virtual {v1, v0}, Lcom/squareup/picasso/Picasso$Builder;->downloader(Lcom/squareup/picasso/Downloader;)Lcom/squareup/picasso/Picasso$Builder;

    move-result-object v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 407
    invoke-virtual {v1, v2}, Lcom/squareup/picasso/Picasso$Builder;->defaultBitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/squareup/picasso/Picasso$Builder;

    move-result-object v1

    .line 408
    invoke-virtual {v1}, Lcom/squareup/picasso/Picasso$Builder;->build()Lcom/squareup/picasso/Picasso;

    move-result-object v1

    .line 409
    .local v1, "picasso":Lcom/squareup/picasso/Picasso;
    invoke-static {v1}, Lcom/squareup/picasso/Picasso;->setSingletonInstance(Lcom/squareup/picasso/Picasso;)V

    .line 410
    return-void
.end method

.method public static declared-synchronized proxyAuthenticator()Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;
    .locals 3

    const-class v0, Lcom/github/tvbox/osc/util/OkGoHelper;

    monitor-enter v0

    .line 73
    :try_start_0
    sget-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator:Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    if-nez v1, :cond_0

    new-instance v1, Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;-><init>(Lcom/github/tvbox/osc/util/net/OkProxySelector;)V

    sput-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator:Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    .line 74
    :cond_0
    sget-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator:Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 72
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;
    .locals 2

    const-class v0, Lcom/github/tvbox/osc/util/OkGoHelper;

    monitor-enter v0

    .line 68
    :try_start_0
    sget-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector:Lcom/github/tvbox/osc/util/net/OkProxySelector;

    if-nez v1, :cond_0

    new-instance v1, Lcom/github/tvbox/osc/util/net/OkProxySelector;

    invoke-direct {v1}, Lcom/github/tvbox/osc/util/net/OkProxySelector;-><init>()V

    sput-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector:Lcom/github/tvbox/osc/util/net/OkProxySelector;

    .line 69
    :cond_0
    sget-object v1, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector:Lcom/github/tvbox/osc/util/net/OkProxySelector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 67
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized reloadDns()V
    .locals 7

    const-class v0, Lcom/github/tvbox/osc/util/OkGoHelper;

    monitor-enter v0

    .line 358
    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->initDnsOverHttps()V

    .line 360
    new-instance v1, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v1}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 361
    .local v1, "builder":Lokhttp3/OkHttpClient$Builder;
    new-instance v2, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;

    const-string v3, "OkGo"

    invoke-direct {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;-><init>(Ljava/lang/String;)V

    .line 363
    .local v2, "loggingInterceptor":Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;
    const-string v3, "debug_open"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 364
    sget-object v3, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->BODY:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 365
    sget-object v3, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    goto :goto_0

    .line 367
    :cond_0
    sget-object v3, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;->NONE:Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setPrintLevel(Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor$Level;)V

    .line 368
    sget-object v3, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;->setColorLevel(Ljava/util/logging/Level;)V

    .line 371
    :goto_0
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    .line 373
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v5, 0x2710

    invoke-virtual {v1, v5, v6, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 374
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v5, v6, v3}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 375
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v5, v6, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    .line 377
    new-instance v3, Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;

    invoke-direct {v3}, Lcom/github/tvbox/osc/util/OkGoHelper$CustomDns;-><init>()V

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->dns(Lokhttp3/Dns;)Lokhttp3/OkHttpClient$Builder;

    .line 378
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v3

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->proxySelector(Ljava/net/ProxySelector;)Lokhttp3/OkHttpClient$Builder;

    .line 379
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxyAuthenticator()Lcom/github/tvbox/osc/util/net/ProxyAuthenticator;

    move-result-object v3

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 381
    :try_start_1
    invoke-static {v1}, Lcom/github/tvbox/osc/util/OkGoHelper;->setOkHttpSsl(Lokhttp3/OkHttpClient$Builder;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 384
    goto :goto_1

    .line 382
    :catchall_0
    move-exception v3

    .line 383
    .local v3, "th":Ljava/lang/Throwable;
    :try_start_2
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 386
    .end local v3    # "th":Ljava/lang/Throwable;
    :goto_1
    invoke-static {}, Lokhttp3/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lzy/okgo/model/HttpHeaders;->setUserAgent(Ljava/lang/String;)V

    .line 388
    invoke-static {v1}, Lcom/github/tvbox/osc/util/NetworkResilience;->install(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v3

    .line 389
    .local v3, "okHttpClient":Lokhttp3/OkHttpClient;
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/lzy/okgo/OkGo;->setOkHttpClient(Lokhttp3/OkHttpClient;)Lcom/lzy/okgo/OkGo;

    .line 391
    sput-object v3, Lcom/github/tvbox/osc/util/OkGoHelper;->defaultClient:Lokhttp3/OkHttpClient;

    .line 393
    invoke-virtual {v1, v4}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 394
    invoke-virtual {v1, v4}, Lokhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    .line 395
    invoke-static {v1}, Lcom/github/tvbox/osc/util/NetworkResilience;->install(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v4

    sput-object v4, Lcom/github/tvbox/osc/util/OkGoHelper;->noRedirectClient:Lokhttp3/OkHttpClient;

    .line 397
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->initExoOkHttpClient()V

    .line 398
    invoke-static {}, Lcom/github/tvbox/osc/player/danmu/Parser;->resetHttpClient()V

    .line 399
    invoke-static {}, Lcom/github/catvod/net/OkHttp;->resetClient()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 400
    monitor-exit v0

    return-void

    .line 357
    .end local v1    # "builder":Lokhttp3/OkHttpClient$Builder;
    .end local v2    # "loggingInterceptor":Lcom/lzy/okgo/interceptor/HttpLoggingInterceptor;
    .end local v3    # "okHttpClient":Lokhttp3/OkHttpClient;
    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static setDnsList()V
    .locals 6

    .line 136
    sget-object v0, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 137
    const-string v0, "doh_json"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 138
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "[{\"name\": \"\u817e\u8baf\", \"url\": \"https://doh.pub/dns-query\"},{\"name\": \"\u963f\u91cc\", \"url\": \"https://dns.alidns.com/dns-query\"},{\"name\": \"360\", \"url\": \"https://doh.360.cn/dns-query\"}]"

    .line 139
    :cond_0
    invoke-static {v0}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->getAsJsonArray()Lcom/google/gson/JsonArray;

    move-result-object v1

    .line 140
    .local v1, "jsonArray":Lcom/google/gson/JsonArray;
    sget-object v2, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    const-string v3, "\u5173\u95ed"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/google/gson/JsonArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 142
    invoke-virtual {v1, v2}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v3

    .line 143
    .local v3, "dnsConfig":Lcom/google/gson/JsonObject;
    const-string v4, "name"

    invoke-virtual {v3, v4}, Lcom/google/gson/JsonObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3, v4}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_1
    const-string v4, "Unknown Name"

    .line 144
    .local v4, "name":Ljava/lang/String;
    :goto_1
    sget-object v5, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .end local v3    # "dnsConfig":Lcom/google/gson/JsonObject;
    .end local v4    # "name":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 146
    .end local v2    # "i":I
    :cond_2
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "doh_url"

    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    sget-object v5, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-le v3, v5, :cond_3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 147
    :cond_3
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getMyHost()Ljava/util/Map;

    move-result-object v2

    sput-object v2, Lcom/github/tvbox/osc/util/OkGoHelper;->myHosts:Ljava/util/Map;

    .line 148
    return-void
.end method

.method private static declared-synchronized setOkHttpSsl(Lokhttp3/OkHttpClient$Builder;)V
    .locals 4
    .param p0, "builder"    # Lokhttp3/OkHttpClient$Builder;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    const-class v0, Lcom/github/tvbox/osc/util/OkGoHelper;

    monitor-enter v0

    .line 415
    :try_start_0
    new-instance v1, Lcom/github/tvbox/osc/util/OkGoHelper$1;

    invoke-direct {v1}, Lcom/github/tvbox/osc/util/OkGoHelper$1;-><init>()V

    .line 430
    .local v1, "trustAllCert":Ljavax/net/ssl/X509TrustManager;
    new-instance v2, Lcom/github/tvbox/osc/util/SSL/SSLSocketFactoryCompat;

    invoke-direct {v2, v1}, Lcom/github/tvbox/osc/util/SSL/SSLSocketFactoryCompat;-><init>(Ljavax/net/ssl/X509TrustManager;)V

    .line 431
    .local v2, "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual {p0, v2, v1}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    .line 432
    sget-object v3, Lcom/lzy/okgo/https/HttpsUtils;->UnSafeHostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {p0, v3}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 435
    .end local v1    # "trustAllCert":Ljavax/net/ssl/X509TrustManager;
    .end local v2    # "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    nop

    .line 436
    monitor-exit v0

    return-void

    .line 414
    .end local p0    # "builder":Lokhttp3/OkHttpClient$Builder;
    :catchall_0
    move-exception p0

    goto :goto_0

    .line 433
    .restart local p0    # "builder":Lokhttp3/OkHttpClient$Builder;
    :catch_0
    move-exception v1

    .line 434
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 414
    .end local v1    # "e":Ljava/lang/Exception;
    .end local p0    # "builder":Lokhttp3/OkHttpClient$Builder;
    :goto_0
    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized setProxyList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "proxyRules"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/ProxyRule;",
            ">;)V"
        }
    .end annotation

    .local p0, "proxyRules":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/ProxyRule;>;"
    const-class v0, Lcom/github/tvbox/osc/util/OkGoHelper;

    monitor-enter v0

    .line 78
    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/util/net/OkProxySelector;->clear()V

    .line 79
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/util/OkGoHelper;->proxySelector()Lcom/github/tvbox/osc/util/net/OkProxySelector;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/github/tvbox/osc/util/net/OkProxySelector;->addAll(Ljava/util/List;)V

    .line 80
    :cond_0
    invoke-static {}, Lcom/github/catvod/net/OkHttp;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit v0

    return-void

    .line 77
    .end local p0    # "proxyRules":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/ProxyRule;>;"
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
