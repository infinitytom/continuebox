.class Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;
.super Ljava/lang/Object;
.source "PlayFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->goPlayUrl(Ljava/lang/String;Ljava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

.field final synthetic val$finalUrl:Ljava/lang/String;

.field final synthetic val$headers:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "this$0"    # Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$finalUrl",
            "val$headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 760
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    iput-object p2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$finalUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$headers:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 763
    const-string v0, "\u8c03\u7528\u5916\u90e8\u64ad\u653e\u5668"

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->stopParse()V

    .line 764
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 765
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/player/MyVideoView;->release()V

    .line 766
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$finalUrl:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 767
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$finalUrl:Ljava/lang/String;

    .line 769
    .local v1, "url":Ljava/lang/String;
    const/4 v10, 0x1

    :try_start_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "pl"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    move v11, v2

    .line 770
    .local v11, "playerType":I
    const/16 v2, 0xa

    if-lt v11, v2, :cond_2

    .line 771
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$1600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$1600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v3

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$1600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v3

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-object v12, v2

    .line 772
    .local v12, "vs":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$1600(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v3

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v3, v12}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$1900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 773
    .local v5, "playTitle":Ljava/lang/String;
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v11}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayerName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\u8fdb\u884c\u64ad\u653e"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v13, 0x0

    invoke-virtual {v2, v3, v10, v13}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V

    .line 774
    const/4 v14, 0x0

    .line 775
    .local v14, "callResult":Z
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v8

    .line 776
    .local v8, "progress":J
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$3900(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$headers:Ljava/util/HashMap;

    move v2, v11

    move-object v4, v1

    invoke-static/range {v2 .. v9}, Lcom/github/tvbox/osc/util/PlayerHelper;->runExternalPlayer(ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;J)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 777
    .end local v14    # "callResult":Z
    .local v2, "callResult":Z
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v11}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayerName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_0

    const-string v0, "\u6210\u529f"

    goto :goto_0

    :cond_0
    const-string v0, "\u5931\u8d25"

    :goto_0
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez v2, :cond_1

    const/4 v13, 0x1

    :cond_1
    invoke-virtual {v3, v0, v2, v13}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setTip(Ljava/lang/String;ZZ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 778
    return-void

    .line 782
    .end local v2    # "callResult":Z
    .end local v5    # "playTitle":Ljava/lang/String;
    .end local v8    # "progress":J
    .end local v11    # "playerType":I
    .end local v12    # "vs":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_2
    goto :goto_1

    .line 780
    :catch_0
    move-exception v0

    .line 781
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 783
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->hideTip()V

    .line 784
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->getSavedProgress(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$4002(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;J)J

    .line 785
    const-string v0, "data:application/dash+xml;base64,"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_3

    .line 786
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/github/tvbox/osc/util/PlayerHelper;->updateCfg(Lxyz/doikki/videoplayer/player/VideoView;Lorg/json/JSONObject;)V

    .line 787
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v0

    const-string v2, "base64,"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v10

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/base/App;->setDashData(Ljava/lang/String;)V

    .line 788
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v2

    invoke-virtual {v2, v10}, Lcom/github/tvbox/osc/server/ControlManager;->getAddress(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "dash/proxy.mpd"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 789
    :cond_3
    const-string v0, ".mpd"

    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "type=mpd"

    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    .line 792
    :cond_4
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/util/PlayerHelper;->updateCfg(Lxyz/doikki/videoplayer/player/VideoView;Lorg/json/JSONObject;)V

    goto :goto_3

    .line 790
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2800(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/github/tvbox/osc/util/PlayerHelper;->updateCfg(Lxyz/doikki/videoplayer/player/VideoView;Lorg/json/JSONObject;)V

    .line 794
    :goto_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$3300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/controller/VodController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/controller/VodController;->hidePauseRoot()V

    .line 795
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$2100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/player/MyVideoView;->setProgressKey(Ljava/lang/String;)V

    .line 796
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$headers:Ljava/util/HashMap;

    if-eqz v0, :cond_6

    .line 797
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->val$headers:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Lcom/github/tvbox/osc/player/MyVideoView;->setUrl(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_4

    .line 799
    :cond_6
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/player/MyVideoView;->setUrl(Ljava/lang/String;)V

    .line 801
    :goto_4
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->startSwitchLinePlayTimeout()V

    .line 802
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$100(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/MyVideoView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/MyVideoView;->start()V

    .line 803
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment$17;->this$0:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->access$3300(Lcom/github/tvbox/osc/ui/fragment/PlayFragment;)Lcom/github/tvbox/osc/player/controller/VodController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/controller/VodController;->resetSpeed()V

    .line 806
    .end local v1    # "url":Ljava/lang/String;
    :cond_7
    return-void
.end method
