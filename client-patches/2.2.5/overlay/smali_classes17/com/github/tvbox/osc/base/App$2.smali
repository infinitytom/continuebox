.class Lcom/github/tvbox/osc/base/App$2;
.super Ljava/lang/Object;
.source "App.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/tvbox/osc/base/App;->startSyncLoop()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/tvbox/osc/base/App;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$lastIdlePull:[J

.field final synthetic val$wasPlaying:[Z


# direct methods
.method constructor <init>(Lcom/github/tvbox/osc/base/App;[Z[JLandroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/github/tvbox/osc/base/App;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$wasPlaying",
            "val$lastIdlePull",
            "val$handler"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 116
    iput-object p1, p0, Lcom/github/tvbox/osc/base/App$2;->this$0:Lcom/github/tvbox/osc/base/App;

    iput-object p2, p0, Lcom/github/tvbox/osc/base/App$2;->val$wasPlaying:[Z

    iput-object p3, p0, Lcom/github/tvbox/osc/base/App$2;->val$lastIdlePull:[J

    iput-object p4, p0, Lcom/github/tvbox/osc/base/App$2;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 119
    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->playbackActive()Z

    move-result v0

    .line 120
    .local v0, "playing":Z
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 125
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->retryPending()V

    goto :goto_0

    .line 126
    :cond_0
    iget-object v2, p0, Lcom/github/tvbox/osc/base/App$2;->val$wasPlaying:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_1

    .line 127
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->syncNow()V

    .line 128
    iget-object v2, p0, Lcom/github/tvbox/osc/base/App$2;->val$lastIdlePull:[J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    aput-wide v3, v2, v1

    goto :goto_0

    .line 129
    :cond_1
    iget-object v2, p0, Lcom/github/tvbox/osc/base/App$2;->this$0:Lcom/github/tvbox/osc/base/App;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/base/App;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 134
    .local v2, "now":J
    iget-object v4, p0, Lcom/github/tvbox/osc/base/App$2;->val$lastIdlePull:[J

    aget-wide v5, v4, v1

    sub-long v5, v2, v5

    const-wide/16 v7, 0x2710

    cmp-long v9, v5, v7

    if-ltz v9, :cond_2

    .line 135
    aput-wide v2, v4, v1

    .line 136
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull()V

    .line 139
    .end local v2    # "now":J
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->periodic()V

    .line 140
    :cond_3
    iget-object v2, p0, Lcom/github/tvbox/osc/base/App$2;->val$wasPlaying:[Z

    aput-boolean v0, v2, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "playing":Z
    goto :goto_1

    .line 141
    :catchall_0
    move-exception v0

    :goto_1
    nop

    .line 142
    iget-object v0, p0, Lcom/github/tvbox/osc/base/App$2;->val$handler:Landroid/os/Handler;

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 143
    return-void
.end method
