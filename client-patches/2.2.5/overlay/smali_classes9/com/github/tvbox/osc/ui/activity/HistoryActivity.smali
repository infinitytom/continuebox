.class public Lcom/github/tvbox/osc/ui/activity/HistoryActivity;
.super Lcom/github/tvbox/osc/base/BaseActivity;
.source "HistoryActivity.java"


# static fields
.field public static historyAdapter:Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;


# instance fields
.field private delMode:Z

.field private mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private tvClear:Landroid/widget/ImageView;

.field private tvDelTip:Landroid/widget/TextView;

.field private tvDelete:Landroid/widget/ImageView;


# direct methods
.method public static synthetic $r8$lambda$vfVSCqGcMXo4I3TX50twiSwm83A(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->initData()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->delMode:Z

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HistoryActivity;

    .line 39
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->toggleDelMode()V

    return-void
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HistoryActivity;

    .line 39
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HistoryActivity;

    .line 39
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvDelete:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HistoryActivity;

    .line 39
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvClear:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HistoryActivity;

    .line 39
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->delMode:Z

    return v0
.end method

.method private initData()V
    .locals 6

    .line 163
    const/16 v0, 0x64

    invoke-static {v0}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getAllVodRecord(I)Ljava/util/List;

    move-result-object v0

    .line 164
    .local v0, "allVodRecord":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .local v1, "vodInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo;

    .line 166
    .local v3, "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u4e0a\u6b21\u770b\u5230"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->note:Ljava/lang/String;

    .line 167
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .end local v3    # "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    goto :goto_0

    .line 169
    :cond_1
    sget-object v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->historyAdapter:Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;

    invoke-virtual {v2, v1}, Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;->setNewData(Ljava/util/List;)V

    .line 170
    return-void
.end method

.method private initView()V
    .locals 5

    .line 69
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 70
    const v0, 0x7f0a027e

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvDelete:Landroid/widget/ImageView;

    .line 71
    const v0, 0x7f0a0277

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvClear:Landroid/widget/ImageView;

    .line 72
    const v0, 0x7f0a027d

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvDelTip:Landroid/widget/TextView;

    .line 73
    const v0, 0x7f0a0182

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 74
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 75
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    move v0, v1

    .line 77
    .local v0, "portrait":Z
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    const/4 v4, 0x2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->isBaseOnWidth()Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x5

    goto :goto_1

    :cond_2
    const/4 v4, 0x6

    :goto_1
    invoke-direct {v2, v3, v4}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 78
    new-instance v1, Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;

    invoke-direct {v1}, Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;-><init>()V

    sput-object v1, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->historyAdapter:Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;

    .line 79
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 80
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvDelete:Landroid/widget/ImageView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$1;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$1;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvClear:Landroid/widget/ImageView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$2;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$2;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$3;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$3;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnInBorderKeyEventListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnInBorderKeyEventListener;)V

    .line 104
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$4;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$4;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 120
    sget-object v1, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->historyAdapter:Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$5;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$5;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemClickListener;)V

    .line 152
    sget-object v1, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->historyAdapter:Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$6;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$6;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;->setOnItemLongClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemLongClickListener;)V

    .line 160
    return-void
.end method

.method private toggleDelMode()V
    .locals 2

    .line 62
    sget-boolean v0, Lcom/github/tvbox/osc/util/HawkConfig;->hotVodDelete:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lcom/github/tvbox/osc/util/HawkConfig;->hotVodDelete:Z

    .line 63
    sget-object v0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->historyAdapter:Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/HistoryAdapter;->notifyDataSetChanged()V

    .line 64
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->delMode:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->delMode:Z

    .line 65
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->tvDelTip:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 66
    return-void
.end method


# virtual methods
.method protected getLayoutResID()I
    .locals 1

    .line 49
    const v0, 0x7f0d0020

    return v0
.end method

.method protected init()V
    .locals 1

    .line 54
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->initView()V

    .line 55
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->initData()V

    .line 56
    return-void
.end method

.method synthetic lambda$init$0$com-github-tvbox-osc-ui-activity-HistoryActivity(Z)V
    .locals 1
    .param p1, "success"    # Z

    .line 57
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 58
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 188
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->delMode:Z

    if-eqz v0, :cond_0

    .line 189
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->toggleDelMode()V

    .line 190
    return-void

    .line 192
    :cond_0
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onBackPressed()V

    .line 193
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 182
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onDestroy()V

    .line 183
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    .line 184
    return-void
.end method

.method public refresh(Lcom/github/tvbox/osc/event/RefreshEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/github/tvbox/osc/event/RefreshEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 175
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 176
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->initData()V

    .line 178
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onResume()V
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;->initData()V
    new-instance v0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/activity/HistoryActivity$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/ui/activity/HistoryActivity;)V

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull(Lcom/github/tvbox/osc/sync/TvboxSyncClient$Callback;)V

    .line 59
    return-void
.end method
