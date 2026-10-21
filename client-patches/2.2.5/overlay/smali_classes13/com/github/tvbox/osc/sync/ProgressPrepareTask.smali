.class public final Lcom/github/tvbox/osc/sync/ProgressPrepareTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final progressKey:Ljava/lang/String;
.field private final immediate:Z
.field private final account:Ljava/lang/String;
.field private final record:Lcom/github/tvbox/osc/cache/VodRecord;

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Lcom/github/tvbox/osc/cache/VodRecord;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->progressKey:Ljava/lang/String;
    iput-boolean p2, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->immediate:Z
    iput-object p3, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->account:Ljava/lang/String;
    iput-object p4, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->record:Lcom/github/tvbox/osc/cache/VodRecord;
    return-void
.end method

.method public run()V
    .locals 4
    iget-object v0, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->progressKey:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->immediate:Z
    iget-object v2, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->account:Ljava/lang/String;
    iget-object v3, p0, Lcom/github/tvbox/osc/sync/ProgressPrepareTask;->record:Lcom/github/tvbox/osc/cache/VodRecord;
    invoke-static {v0, v1, v2, v3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->prepareProgress(Ljava/lang/String;ZLjava/lang/String;Lcom/github/tvbox/osc/cache/VodRecord;)V
    return-void
.end method
