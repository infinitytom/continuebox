.class Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;
.super Lxyz/doikki/videoplayer/player/ProgressManager;
.source "PlayFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;


# direct methods
.method constructor <init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 307
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-direct {p0}, Lxyz/doikki/videoplayer/player/ProgressManager;-><init>()V

    return-void
.end method


# virtual methods
.method public getSavedProgress(Ljava/lang/String;)J
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "url"
        }
    .end annotation

    .line 319
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public saveProgress(Ljava/lang/String;J)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "progress"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "url",
            "progress"
        }
    .end annotation

    .line 310
    invoke-static {p1, p2, p3}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->savePlaybackProgress(Ljava/lang/String;J)V

    .line 311
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_0

    .line 312
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->markPlaybackStarted()V

    .line 313
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$4;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hideTipOnUiThread()V

    .line 315
    :cond_0
    return-void
.end method
