.class public final Lcom/github/tvbox/osc/sync/SyncLoginDialog;
.super Ljava/lang/Object;
.source "SyncLoginDialog.java"


# static fields
.field private static final HTTP:Lokhttp3/OkHttpClient;

.field private static final JSON:Lokhttp3/MediaType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 30
    const-string v0, "application/json; charset=utf-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->JSON:Lokhttp3/MediaType;

    .line 31
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 32
    const-wide/16 v2, 0x5

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    const-wide/16 v2, 0x8

    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->HTTP:Lokhttp3/OkHttpClient;

    .line 31
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static auth(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Z)V
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "endpointField"    # Landroid/widget/EditText;
    .param p3, "usernameField"    # Landroid/widget/EditText;
    .param p4, "passwordField"    # Landroid/widget/EditText;
    .param p5, "register"    # Z
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
            "context",
            "dialog",
            "endpointField",
            "usernameField",
            "passwordField",
            "register"
        }
    .end annotation

    .line 67
    move-object v7, p0

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/+$"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 68
    .local v8, "input":Ljava/lang/String;
    const-string v0, "http://"

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "https://"

    invoke-virtual {v8, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 69
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    move-object v1, v8

    .line 70
    .local v1, "base":Ljava/lang/String;
    :goto_1
    invoke-virtual/range {p3 .. p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 71
    .local v9, "username":Ljava/lang/String;
    invoke-virtual/range {p4 .. p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 72
    .local v10, "password":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 75
    :cond_2
    const-string v0, "^[A-Za-z0-9_.-]{3,32}$"

    invoke-virtual {v9, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 76
    const-string v0, "\u7528\u6237\u540d\u53ea\u80fd\u4f7f\u7528 3-32 \u4f4d\u5b57\u6bcd\u3001\u6570\u5b57\u6216 _ . -"

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 78
    :cond_3
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x8

    if-ge v0, v2, :cond_4

    const-string v0, "\u5bc6\u7801\u81f3\u5c11\u9700\u8981 8 \u4f4d"

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 80
    :cond_4
    invoke-static {v1}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    if-nez v0, :cond_5

    const-string v0, "NAS \u5730\u5740\u683c\u5f0f\u4e0d\u6b63\u786e"

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 81
    :cond_5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v11

    new-instance v12, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda5;

    move-object v0, v12

    move-object v2, v9

    move-object v3, v10

    move/from16 v4, p5

    move-object v5, p1

    move-object v6, p0

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/AlertDialog;Landroid/content/Context;)V

    invoke-interface {v11, v12}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 113
    return-void

    .line 73
    :cond_6
    :goto_2
    const-string v0, "\u8bf7\u586b\u5199\u7528\u6237\u540d\u548c\u5bc6\u7801"

    invoke-static {p0, v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$auth$3(Landroid/app/AlertDialog;Landroid/content/Context;Z)V
    .locals 2
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "register"    # Z

    .line 98
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    .line 99
    if-eqz p2, :cond_0

    const-string v0, "\u6ce8\u518c\u6210\u529f\uff0c\u6b63\u5728\u540c\u6b65\u8d26\u53f7\u8d44\u6599"

    goto :goto_0

    :cond_0
    const-string v0, "\u767b\u5f55\u6210\u529f\uff0c\u6b63\u5728\u540c\u6b65\u8d26\u53f7\u8d44\u6599"

    :goto_0
    invoke-static {p1, v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 100
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/event/IntegrationStatusEvent;

    invoke-direct {v1}, Lcom/github/tvbox/osc/event/IntegrationStatusEvent;-><init>()V

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 101
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull()V

    .line 102
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/FavoritesSync;->sync(Lcom/github/tvbox/osc/sync/FavoritesSync$Callback;)V

    .line 103
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->sync(Lcom/github/tvbox/osc/sync/SearchHistorySync$Callback;)V

    .line 104
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->afterLogin()V

    .line 105
    return-void
.end method

.method static synthetic lambda$auth$4(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "visible"    # Ljava/lang/String;

    .line 110
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$auth$5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/app/AlertDialog;Landroid/content/Context;)V
    .locals 8
    .param p0, "base"    # Ljava/lang/String;
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "register"    # Z
    .param p4, "dialog"    # Landroid/app/AlertDialog;
    .param p5, "context"    # Landroid/content/Context;

    .line 83
    :try_start_0
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/health"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 84
    .local v0, "health":Lokhttp3/Request;
    sget-object v1, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->HTTP:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v2

    invoke-interface {v2}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .local v2, "response":Lokhttp3/Response;
    :try_start_1
    invoke-virtual {v2}, Lokhttp3/Response;->isSuccessful()Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v3, :cond_6

    .line 86
    if-eqz v2, :cond_0

    :try_start_2
    invoke-virtual {v2}, Lokhttp3/Response;->close()V

    .line 87
    .end local v2    # "response":Lokhttp3/Response;
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 88
    .local v2, "credentials":Lorg/json/JSONObject;
    const-string v3, "username"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "password"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    if-eqz p3, :cond_1

    const-string v3, "/api/v1/auth/register"

    goto :goto_0

    :cond_1
    const-string v3, "/api/v1/auth/login"

    .line 90
    .local v3, "path":Ljava/lang/String;
    :goto_0
    new-instance v4, Lokhttp3/Request$Builder;

    invoke-direct {v4}, Lokhttp3/Request$Builder;-><init>()V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v4

    sget-object v5, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->JSON:Lokhttp3/MediaType;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v4

    .line 91
    .local v4, "request":Lokhttp3/Request;
    invoke-virtual {v1, v4}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 92
    .local v1, "response":Lokhttp3/Response;
    :try_start_3
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    if-nez v5, :cond_2

    const-string v5, ""

    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    .line 93
    .local v5, "content":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 94
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v7, "token"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 95
    .local v6, "token":Ljava/lang/String;
    new-instance v7, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    invoke-direct {v7, p1, p0, v6}, Lcom/github/tvbox/osc/sync/SyncServerProfile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v7}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->activate(Lcom/github/tvbox/osc/sync/SyncServerProfile;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 96
    .end local v5    # "content":Ljava/lang/String;
    .end local v6    # "token":Ljava/lang/String;
    if-eqz v1, :cond_3

    :try_start_4
    invoke-virtual {v1}, Lokhttp3/Response;->close()V

    .line 97
    .end local v1    # "response":Lokhttp3/Response;
    :cond_3
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v5, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda3;

    invoke-direct {v5, p4, p5, p3}, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda3;-><init>(Landroid/app/AlertDialog;Landroid/content/Context;Z)V

    invoke-virtual {v1, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 111
    nop

    .end local v0    # "health":Lokhttp3/Request;
    .end local v2    # "credentials":Lorg/json/JSONObject;
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "request":Lokhttp3/Request;
    goto :goto_4

    .line 93
    .restart local v0    # "health":Lokhttp3/Request;
    .restart local v1    # "response":Lokhttp3/Response;
    .restart local v2    # "credentials":Lorg/json/JSONObject;
    .restart local v3    # "path":Ljava/lang/String;
    .restart local v4    # "request":Lokhttp3/Request;
    .restart local v5    # "content":Ljava/lang/String;
    :cond_4
    :try_start_5
    new-instance v6, Ljava/lang/Exception;

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v7

    invoke-static {v7, v5}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->serverError(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v0    # "health":Lokhttp3/Request;
    .end local v1    # "response":Lokhttp3/Response;
    .end local v2    # "credentials":Lorg/json/JSONObject;
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "request":Lokhttp3/Request;
    .end local p0    # "base":Ljava/lang/String;
    .end local p1    # "username":Ljava/lang/String;
    .end local p2    # "password":Ljava/lang/String;
    .end local p3    # "register":Z
    .end local p4    # "dialog":Landroid/app/AlertDialog;
    .end local p5    # "context":Landroid/content/Context;
    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 91
    .end local v5    # "content":Ljava/lang/String;
    .restart local v0    # "health":Lokhttp3/Request;
    .restart local v1    # "response":Lokhttp3/Response;
    .restart local v2    # "credentials":Lorg/json/JSONObject;
    .restart local v3    # "path":Ljava/lang/String;
    .restart local v4    # "request":Lokhttp3/Request;
    .restart local p0    # "base":Ljava/lang/String;
    .restart local p1    # "username":Ljava/lang/String;
    .restart local p2    # "password":Ljava/lang/String;
    .restart local p3    # "register":Z
    .restart local p4    # "dialog":Landroid/app/AlertDialog;
    .restart local p5    # "context":Landroid/content/Context;
    :catchall_0
    move-exception v5

    if-eqz v1, :cond_5

    :try_start_6
    invoke-virtual {v1}, Lokhttp3/Response;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v6

    :try_start_7
    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "base":Ljava/lang/String;
    .end local p1    # "username":Ljava/lang/String;
    .end local p2    # "password":Ljava/lang/String;
    .end local p3    # "register":Z
    .end local p4    # "dialog":Landroid/app/AlertDialog;
    .end local p5    # "context":Landroid/content/Context;
    :cond_5
    :goto_2
    throw v5
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 85
    .end local v1    # "response":Lokhttp3/Response;
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "request":Lokhttp3/Request;
    .local v2, "response":Lokhttp3/Response;
    .restart local p0    # "base":Ljava/lang/String;
    .restart local p1    # "username":Ljava/lang/String;
    .restart local p2    # "password":Ljava/lang/String;
    .restart local p3    # "register":Z
    .restart local p4    # "dialog":Landroid/app/AlertDialog;
    .restart local p5    # "context":Landroid/content/Context;
    :cond_6
    :try_start_8
    new-instance v1, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u670d\u52a1\u5668\u5065\u5eb7\u68c0\u67e5\u5931\u8d25\uff08HTTP "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lokhttp3/Response;->code()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "\uff09"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v0    # "health":Lokhttp3/Request;
    .end local v2    # "response":Lokhttp3/Response;
    .end local p0    # "base":Ljava/lang/String;
    .end local p1    # "username":Ljava/lang/String;
    .end local p2    # "password":Ljava/lang/String;
    .end local p3    # "register":Z
    .end local p4    # "dialog":Landroid/app/AlertDialog;
    .end local p5    # "context":Landroid/content/Context;
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 84
    .restart local v0    # "health":Lokhttp3/Request;
    .restart local v2    # "response":Lokhttp3/Response;
    .restart local p0    # "base":Ljava/lang/String;
    .restart local p1    # "username":Ljava/lang/String;
    .restart local p2    # "password":Ljava/lang/String;
    .restart local p3    # "register":Z
    .restart local p4    # "dialog":Landroid/app/AlertDialog;
    .restart local p5    # "context":Landroid/content/Context;
    :catchall_2
    move-exception v1

    if-eqz v2, :cond_7

    :try_start_9
    invoke-virtual {v2}, Lokhttp3/Response;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v3

    :try_start_a
    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "base":Ljava/lang/String;
    .end local p1    # "username":Ljava/lang/String;
    .end local p2    # "password":Ljava/lang/String;
    .end local p3    # "register":Z
    .end local p4    # "dialog":Landroid/app/AlertDialog;
    .end local p5    # "context":Landroid/content/Context;
    :cond_7
    :goto_3
    throw v1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 106
    .end local v0    # "health":Lokhttp3/Request;
    .end local v2    # "response":Lokhttp3/Response;
    .restart local p0    # "base":Ljava/lang/String;
    .restart local p1    # "username":Ljava/lang/String;
    .restart local p2    # "password":Ljava/lang/String;
    .restart local p3    # "register":Z
    .restart local p4    # "dialog":Landroid/app/AlertDialog;
    .restart local p5    # "context":Landroid/content/Context;
    :catch_0
    move-exception v0

    .line 107
    .local v0, "error":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "message":Ljava/lang/String;
    if-eqz v1, :cond_8

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_8
    const-string v1, "\u65e0\u6cd5\u8fde\u63a5\u5230\u670d\u52a1\u5668\uff0c\u8bf7\u68c0\u67e5 NAS \u5730\u5740\u3001\u7aef\u53e3\u548c Tailscale \u7f51\u7edc"

    .line 109
    :cond_9
    move-object v2, v1

    .line 110
    .local v2, "visible":Ljava/lang/String;
    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda4;

    invoke-direct {v4, p5, v2}, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda4;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 112
    .end local v0    # "error":Ljava/lang/Exception;
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "visible":Ljava/lang/String;
    :goto_4
    return-void
.end method

.method static synthetic lambda$show$0(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "endpoint"    # Landroid/widget/EditText;
    .param p3, "username"    # Landroid/widget/EditText;
    .param p4, "password"    # Landroid/widget/EditText;
    .param p5, "v"    # Landroid/view/View;

    .line 59
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->auth(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Z)V

    return-void
.end method

.method static synthetic lambda$show$1(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "endpoint"    # Landroid/widget/EditText;
    .param p3, "username"    # Landroid/widget/EditText;
    .param p4, "password"    # Landroid/widget/EditText;
    .param p5, "v"    # Landroid/view/View;

    .line 60
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->auth(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Z)V

    return-void
.end method

.method static synthetic lambda$show$2(Landroid/app/AlertDialog;Landroid/content/Context;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 8
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "endpoint"    # Landroid/widget/EditText;
    .param p3, "username"    # Landroid/widget/EditText;
    .param p4, "password"    # Landroid/widget/EditText;
    .param p5, "ignored"    # Landroid/content/DialogInterface;

    .line 59
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v7, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda1;

    move-object v1, v7

    move-object v2, p1

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    const/4 v0, -0x3

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v7, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda2;

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/sync/SyncLoginDialog$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    return-void
.end method

.method private static serverError(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "code"    # I
    .param p1, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "code",
            "content"
        }
    .end annotation

    .line 116
    const-string v0, "\u670d\u52a1\u5668\u8fd4\u56de HTTP "

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "detail"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 117
    :catch_0
    move-exception v1

    .local v1, "ignored":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static show(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lcom/github/tvbox/osc/util/AccountPortal;->show(Landroid/content/Context;)V
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "message"
        }
    .end annotation

    .line 121
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 122
    return-void
.end method
