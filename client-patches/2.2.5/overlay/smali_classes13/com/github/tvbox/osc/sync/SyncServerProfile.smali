.class public Lcom/github/tvbox/osc/sync/SyncServerProfile;
.super Ljava/lang/Object;
.source "SyncServerProfile.java"


# static fields
.field private static final PROFILES:Ljava/lang/String; = "sync_server_profiles"


# instance fields
.field public endpoint:Ljava/lang/String;

.field public lastUsed:J

.field public name:Ljava/lang/String;

.field public token:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "n",
            "e",
            "t"
        }
    .end annotation

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->endpoint:Ljava/lang/String;

    iput-object p3, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->token:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->lastUsed:J

    return-void
.end method

.method public static declared-synchronized activate(Lcom/github/tvbox/osc/sync/SyncServerProfile;)V
    .locals 5
    .param p0, "p"    # Lcom/github/tvbox/osc/sync/SyncServerProfile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "p"
        }
    .end annotation

    const-class v0, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    monitor-enter v0

    .line 35
    :try_start_0
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->isValid(Lcom/github/tvbox/osc/sync/SyncServerProfile;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    .line 36
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->lastUsed:J

    .line 37
    iget-object v1, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->endpoint:Ljava/lang/String;

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "/+$"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "endpoint":Ljava/lang/String;
    iget-object v2, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 43
    .local v2, "name":Ljava/lang/String;
    const-string v3, "sync_endpoint"

    invoke-static {v3, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 44
    const-string v3, "sync_token"

    iget-object v4, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->token:Ljava/lang/String;

    invoke-static {v4}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 45
    const-string v3, "sync_account_name"

    invoke-static {v3, v2}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 46
    const-string v3, "sync_active_scope_v2"

    invoke-static {v1, v2}, Lcom/github/tvbox/osc/sync/AccountScope;->scopeFor(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 47
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->save(Lcom/github/tvbox/osc/sync/SyncServerProfile;)V
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;
    move-result-object v1
    new-instance v2, Lcom/github/tvbox/osc/event/RefreshEvent;
    const/4 v3, 0x1
    invoke-direct {v2, v3}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(I)V
    invoke-virtual {v1, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    monitor-exit v0

    return-void

    .line 34
    .end local v1    # "endpoint":Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/String;
    .end local p0    # "p":Lcom/github/tvbox/osc/sync/SyncServerProfile;
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static all()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/sync/SyncServerProfile;",
            ">;"
        }
    .end annotation

    .line 13
    const-string v0, "[]"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .local v1, "valid":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/sync/SyncServerProfile;>;"
    :try_start_0
    const-string v2, "sync_server_profiles"

    invoke-static {v2, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 16
    .local v2, "stored":Ljava/lang/Object;
    new-instance v3, Lcom/google/gson/Gson;

    invoke-direct {v3}, Lcom/google/gson/Gson;-><init>()V

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v4, Lcom/github/tvbox/osc/sync/SyncServerProfile$1;

    invoke-direct {v4}, Lcom/github/tvbox/osc/sync/SyncServerProfile$1;-><init>()V

    .line 17
    invoke-virtual {v4}, Lcom/github/tvbox/osc/sync/SyncServerProfile$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 16
    invoke-virtual {v3, v0, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 18
    .local v0, "parsed":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/sync/SyncServerProfile;>;"
    if-eqz v0, :cond_2

    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    .local v4, "profile":Lcom/github/tvbox/osc/sync/SyncServerProfile;
    invoke-static {v4}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->isValid(Lcom/github/tvbox/osc/sync/SyncServerProfile;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 24
    .end local v0    # "parsed":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/sync/SyncServerProfile;>;"
    .end local v2    # "stored":Ljava/lang/Object;
    .end local v4    # "profile":Lcom/github/tvbox/osc/sync/SyncServerProfile;
    :cond_2
    goto :goto_2

    .line 21
    :catchall_0
    move-exception v0

    .line 25
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 26
    const-string v0, "sync_endpoint"

    const-string v2, ""

    invoke-static {v0, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 27
    .local v0, "endpoint":Ljava/lang/String;
    const-string v3, "sync_token"

    invoke-static {v3, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 28
    .local v3, "token":Ljava/lang/String;
    const-string v4, "sync_account_name"

    invoke-static {v4, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 29
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    invoke-direct {v4, v2, v0, v3}, Lcom/github/tvbox/osc/sync/SyncServerProfile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .end local v0    # "endpoint":Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "token":Ljava/lang/String;
    :cond_3
    return-object v1
.end method

.method private static isValid(Lcom/github/tvbox/osc/sync/SyncServerProfile;)Z
    .locals 1
    .param p0, "profile"    # Lcom/github/tvbox/osc/sync/SyncServerProfile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "profile"
        }
    .end annotation

    .line 54
    if-eqz p0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->endpoint:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->token:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

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

.method private static safe(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 56
    if-nez p0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private static sameAccount(Lcom/github/tvbox/osc/sync/SyncServerProfile;Lcom/github/tvbox/osc/sync/SyncServerProfile;)Z
    .locals 2
    .param p0, "a"    # Lcom/github/tvbox/osc/sync/SyncServerProfile;
    .param p1, "b"    # Lcom/github/tvbox/osc/sync/SyncServerProfile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 50
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->endpoint:Ljava/lang/String;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lcom/github/tvbox/osc/sync/SyncServerProfile;->endpoint:Ljava/lang/String;

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/sync/SyncServerProfile;->name:Ljava/lang/String;

    .line 51
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lcom/github/tvbox/osc/sync/SyncServerProfile;->name:Ljava/lang/String;

    invoke-static {v1}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 50
    :goto_0
    return v0
.end method

.method public static save(Lcom/github/tvbox/osc/sync/SyncServerProfile;)V
    .locals 3
    .param p0, "p"    # Lcom/github/tvbox/osc/sync/SyncServerProfile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "p"
        }
    .end annotation

    .line 33
    invoke-static {p0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->isValid(Lcom/github/tvbox/osc/sync/SyncServerProfile;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->all()Ljava/util/List;

    move-result-object v0

    .local v0, "x":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/sync/SyncServerProfile;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    invoke-static {v2, p0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->sameAccount(Lcom/github/tvbox/osc/sync/SyncServerProfile;Lcom/github/tvbox/osc/sync/SyncServerProfile;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_2
    const/4 v1, 0x0

    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0xa

    if-le v1, v2, :cond_3

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v1, v0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "sync_server_profiles"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    return-void
.end method
