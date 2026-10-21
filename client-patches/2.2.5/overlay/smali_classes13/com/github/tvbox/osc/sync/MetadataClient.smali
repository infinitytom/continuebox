.class public final Lcom/github/tvbox/osc/sync/MetadataClient;
.super Ljava/lang/Object;
.source "MetadataClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/sync/MetadataClient$Result;,
        Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;,
        Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;,
        Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationMetadata;,
        Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;,
        Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationSearchResult;,
        Lcom/github/tvbox/osc/sync/MetadataClient$Work;,
        Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;,
        Lcom/github/tvbox/osc/sync/MetadataClient$Organization;
    }
.end annotation


# static fields
.field private static final GSON:Lcom/google/gson/Gson;

.field private static final HTTP:Lokhttp3/OkHttpClient;

.field private static final MAIN:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 24
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    .line 25
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    const-wide/16 v2, 0x4

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1e

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/util/NetworkResilience;->install(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->HTTP:Lokhttp3/OkHttpClient;

    .line 27
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->GSON:Lcom/google/gson/Gson;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/os/Handler;
    .locals 1

    .line 23
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100()Lcom/google/gson/Gson;
    .locals 1

    .line 23
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->GSON:Lcom/google/gson/Gson;

    return-object v0
.end method

.method public static available()Z
    .locals 2

    .line 106
    const-string v0, "sync_endpoint"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    const-string v0, "sync_token"

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 106
    :goto_0
    return v0
.end method

.method private static base()Ljava/lang/String;
    .locals 3

    .line 192
    const-string v0, "sync_endpoint"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "endpoint":Ljava/lang/String;
    :goto_0
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 194
    :cond_0
    return-object v0
.end method

.method private static cleanCloudTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 146
    if-nez p0, :cond_0

    const-string v0, ""

    return-object v0

    .line 147
    :cond_0
    const/16 v0, 0x5f

    const/16 v1, 0x20

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2e

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "value":Ljava/lang/String;
    const-string v1, "(?i)[\\[\u3010(\uff08][^\\]\u3011)\uff09]*(2160p|1080p|720p|4k|hdr|dv|web[- .]?dl|bluray|x26[45]|hevc)[^\\]\u3011)\uff09]*[\\]\u3011)\uff09]"

    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 149
    const-string v1, "(?i)(^|\\s)(2160p|1080p|720p|4k|hdr10?[+]?|dolby[ .]?vision|dv|web[- .]?dl|bluray|bdrip|x26[45]|h26[45]|hevc|avc)(?=\\s|$)"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 150
    const-string v1, "(?i)\\s+S\\d{1,2}(E\\d{1,3})?\\s*$"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 151
    const-string v1, "\\s+"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static get(Ljava/lang/String;Ljava/lang/Class;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 4
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "url",
            "type",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "TT;>;)V"
        }
    .end annotation

    .line 198
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<TT;>;"
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    const-string v2, "sync_token"

    const-string v3, ""

    invoke-static {v2, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Authorization"

    invoke-virtual {v0, v2, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 200
    const-string v1, "Accept"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 201
    .local v0, "request":Lokhttp3/Request;
    sget-object v1, Lcom/github/tvbox/osc/sync/MetadataClient;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/sync/MetadataClient$1;

    invoke-direct {v2, p2, p1}, Lcom/github/tvbox/osc/sync/MetadataClient$1;-><init>(Lcom/github/tvbox/osc/sync/MetadataClient$Result;Ljava/lang/Class;)V

    invoke-interface {v1, v2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 222
    return-void
.end method

.method static synthetic lambda$organization$3(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$Result;

    .line 164
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/github/tvbox/osc/sync/MetadataClient$Result;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$organizationSearch$5(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$Result;

    .line 183
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/github/tvbox/osc/sync/MetadataClient$Result;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$person$2(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$Result;

    .line 156
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/github/tvbox/osc/sync/MetadataClient$Result;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$personSearch$4(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$Result;

    .line 173
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/github/tvbox/osc/sync/MetadataClient$Result;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$title$0(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$Result;

    .line 120
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/github/tvbox/osc/sync/MetadataClient$Result;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$title$1(Ljava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$Result;
    .param p2, "year"    # I
    .param p3, "season"    # I
    .param p4, "mediaType"    # Ljava/lang/String;
    .param p5, "first"    # Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;

    .line 124
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/MetadataClient;->cleanCloudTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "cleaned":Ljava/lang/String;
    if-nez p5, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 128
    :cond_0
    invoke-static {v0, p2, p3, p4, p1}, Lcom/github/tvbox/osc/sync/MetadataClient;->requestTitle(Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    goto :goto_1

    .line 126
    :cond_1
    :goto_0
    invoke-interface {p1, p5}, Lcom/github/tvbox/osc/sync/MetadataClient$Result;->onResult(Ljava/lang/Object;)V

    .line 130
    :goto_1
    return-void
.end method

.method public static organization(Ljava/lang/String;ILcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 2
    .param p0, "kind"    # Ljava/lang/String;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "kind",
            "id",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationMetadata;",
            ">;)V"
        }
    .end annotation

    .line 163
    .local p2, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationMetadata;>;"
    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v0

    if-eqz v0, :cond_1

    if-lez p1, :cond_1

    const-string v0, "company"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "network"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 167
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->base()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v1/meta/organization/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-class v1, Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationMetadata;

    invoke-static {v0, v1, p2}, Lcom/github/tvbox/osc/sync/MetadataClient;->get(Ljava/lang/String;Ljava/lang/Class;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 169
    return-void

    .line 164
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda1;

    invoke-direct {v1, p2}, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 165
    return-void
.end method

.method public static organizationSearch(Ljava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationSearchResult;",
            ">;)V"
        }
    .end annotation

    .line 182
    .local p1, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationSearchResult;>;"
    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->base()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v1/meta/organization/search"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 187
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 188
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/github/tvbox/osc/sync/MetadataClient$OrganizationSearchResult;

    invoke-static {v1, v2, p1}, Lcom/github/tvbox/osc/sync/MetadataClient;->get(Ljava/lang/String;Ljava/lang/Class;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 189
    return-void

    .line 183
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda2;-><init>(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 184
    return-void
.end method

.method public static person(ILcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 2
    .param p0, "id"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "id",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;",
            ">;)V"
        }
    .end annotation

    .line 155
    .local p1, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;>;"
    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v0

    if-eqz v0, :cond_1

    if-gtz p0, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->base()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v1/meta/person/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-class v1, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;

    invoke-static {v0, v1, p1}, Lcom/github/tvbox/osc/sync/MetadataClient;->get(Ljava/lang/String;Ljava/lang/Class;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 160
    return-void

    .line 156
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1}, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda3;-><init>(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 157
    return-void
.end method

.method public static personSearch(Ljava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;",
            ">;)V"
        }
    .end annotation

    .line 172
    .local p1, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;>;"
    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->base()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v1/meta/person/search"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 177
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 178
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;

    invoke-static {v1, v2, p1}, Lcom/github/tvbox/osc/sync/MetadataClient;->get(Ljava/lang/String;Ljava/lang/Class;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 179
    return-void

    .line 173
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1}, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda4;-><init>(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 174
    return-void
.end method

.method private static requestTitle(Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "year"    # I
    .param p2, "season"    # I
    .param p3, "mediaType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "year",
            "season",
            "mediaType",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;",
            ">;)V"
        }
    .end annotation

    .line 134
    .local p4, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->base()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/api/v1/meta/title"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 135
    const-string v1, "name"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 136
    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "year"

    invoke-virtual {v0, v3, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 137
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "season"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 138
    .local v0, "builder":Landroid/net/Uri$Builder;
    const-string v1, "movie"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "tv"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 139
    :cond_0
    const-string v1, "media_type"

    invoke-virtual {v0, v1, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 141
    :cond_1
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;

    invoke-static {v1, v2, p4}, Lcom/github/tvbox/osc/sync/MetadataClient;->get(Ljava/lang/String;Ljava/lang/Class;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 142
    return-void
.end method

.method public static title(Ljava/lang/String;IILcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "year"    # I
    .param p2, "season"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "year",
            "season",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;",
            ">;)V"
        }
    .end annotation

    .line 115
    .local p3, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;>;"
    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p3}, Lcom/github/tvbox/osc/sync/MetadataClient;->title(Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 116
    return-void
.end method

.method public static title(Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "year"    # I
    .param p2, "season"    # I
    .param p3, "mediaType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "year",
            "season",
            "mediaType",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;",
            ">;)V"
        }
    .end annotation

    .line 119
    .local p4, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;>;"
    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    new-instance v7, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda0;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p4

    move v4, p1

    move v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;IILjava/lang/String;)V

    invoke-static {v0, p1, p2, p3, v7}, Lcom/github/tvbox/osc/sync/MetadataClient;->requestTitle(Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 131
    return-void

    .line 120
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/tvbox/osc/sync/MetadataClient;->MAIN:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda5;

    invoke-direct {v1, p4}, Lcom/github/tvbox/osc/sync/MetadataClient$$ExternalSyntheticLambda5;-><init>(Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 121
    return-void
.end method

.method public static title(Ljava/lang/String;ILcom/github/tvbox/osc/sync/MetadataClient$Result;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "year"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "year",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Result<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;",
            ">;)V"
        }
    .end annotation

    .line 111
    .local p2, "result":Lcom/github/tvbox/osc/sync/MetadataClient$Result;, "Lcom/github/tvbox/osc/sync/MetadataClient$Result<Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;>;"
    const/4 v0, 0x1

    invoke-static {p0, p1, v0, p2}, Lcom/github/tvbox/osc/sync/MetadataClient;->title(Ljava/lang/String;IILcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 112
    return-void
.end method
