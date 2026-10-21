.class public Lcom/github/tvbox/osc/ui/activity/HomeActivity;
.super Lcom/github/tvbox/osc/base/BaseActivity;
.source "HomeActivity.java"


# static fields
.field private static final LONG_PRESS_THRESHOLD:J = 0x7d0L


# instance fields
.field private brandSplash:Landroid/view/View;

.field private contentLayout:Landroid/widget/LinearLayout;

.field private currentSelected:I

.field private currentView:Landroid/view/View;

.field private dataInitOk:Z

.field private eventBusRegistered:Z

.field private final fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/base/BaseLazyFragment;",
            ">;"
        }
    .end annotation
.end field

.field private homeSortLoading:Z

.field private isDownOrUp:Z

.field private jarInitOk:Z

.field private loadingSourceKey:Ljava/lang/String;

.field private mConfigErrorDialog:Lcom/github/tvbox/osc/ui/dialog/TipDialog;

.field private final mDataRunnable:Ljava/lang/Runnable;

.field private mExitTime:J

.field private mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private final mHandler:Landroid/os/Handler;

.field private final mRunnable:Ljava/lang/Runnable;

.field private mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/github/tvbox/osc/ui/dialog/SelectDialog<",
            "Lcom/github/tvbox/osc/bean/SourceBean;",
            ">;"
        }
    .end annotation
.end field

.field private mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

.field private menuKeyDownTime:J

.field private pageAdapter:Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

.field private previousHomeName:Ljava/lang/String;

.field private previousHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

.field private refreshHomeRec:Z

.field private final refreshTopInfoTextSizeRunnable:Ljava/lang/Runnable;

.field private searchSpiderWarmStarted:Z

.field private skipNextUpdate:Z

.field private sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

.field private sortChange:Z

.field public sortFocusView:Landroid/view/View;

.field private sortFocused:I

.field private sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

.field topHide:B

.field private topLayout:Landroid/widget/LinearLayout;

.field private tvDate:Landroid/widget/TextView;

.field private tvName:Landroid/widget/TextView;

.field useCacheConfig:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;-><init>()V

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    .line 97
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isDownOrUp:Z

    .line 98
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortChange:Z

    .line 99
    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentSelected:I

    .line 100
    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    .line 101
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocusView:Landroid/view/View;

    .line 105
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->homeSortLoading:Z

    .line 106
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHomeRec:Z

    .line 107
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    .line 108
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mExitTime:J

    .line 109
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->eventBusRegistered:Z

    .line 110
    new-instance v3, Lcom/github/tvbox/osc/ui/activity/HomeActivity$1;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$1;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    iput-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mRunnable:Ljava/lang/Runnable;

    .line 120
    new-instance v3, Lcom/github/tvbox/osc/ui/activity/HomeActivity$2;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$2;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    iput-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshTopInfoTextSizeRunnable:Ljava/lang/Runnable;

    .line 132
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    .line 299
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->skipNextUpdate:Z

    .line 338
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dataInitOk:Z

    .line 339
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jarInitOk:Z

    .line 340
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->searchSpiderWarmStarted:Z

    .line 745
    new-instance v3, Lcom/github/tvbox/osc/ui/activity/HomeActivity$11;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$11;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    iput-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mDataRunnable:Ljava/lang/Runnable;

    .line 765
    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->menuKeyDownTime:J

    .line 787
    iput-byte v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topHide:B

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvDate:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/github/tvbox/osc/ui/activity/HomeActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # I

    .line 84
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showFilterIcon(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mDataRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentSelected:I

    return v0
.end method

.method static synthetic access$1202(Lcom/github/tvbox/osc/ui/activity/HomeActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # I

    .line 84
    iput p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentSelected:I

    return p1
.end method

.method static synthetic access$1300(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHomeSort()V

    return-void
.end method

.method static synthetic access$1500(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dataInitOk:Z

    return v0
.end method

.method static synthetic access$1502(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dataInitOk:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jarInitOk:Z

    return v0
.end method

.method static synthetic access$1602(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jarInitOk:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHome()V

    return-void
.end method

.method static synthetic access$1900(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->skipNextUpdate:Z

    return v0
.end method

.method static synthetic access$1902(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->skipNextUpdate:Z

    return p1
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshTopInfoTextSize()V

    return-void
.end method

.method static synthetic access$2000(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->homeSortLoading:Z

    return v0
.end method

.method static synthetic access$2002(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->homeSortLoading:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadingSourceKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 84
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadingSourceKey:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showSuccess()V

    return-void
.end method

.method static synthetic access$2300(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->clearHomePages()V

    return-void
.end method

.method static synthetic access$2400(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Ljava/util/List;

    .line 84
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->updateSortData(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Lcom/github/tvbox/osc/bean/AbsSortXml;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/AbsSortXml;

    .line 84
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->initViewPager(Lcom/github/tvbox/osc/bean/AbsSortXml;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Lcom/github/tvbox/osc/bean/AbsSortXml;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/AbsSortXml;

    .line 84
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->updateHomeRec(Lcom/github/tvbox/osc/bean/AbsSortXml;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2802(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 84
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2902(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Lcom/github/tvbox/osc/bean/SourceBean;)Lcom/github/tvbox/osc/bean/SourceBean;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/SourceBean;

    .line 84
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

    return-object p1
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->initData()V

    return-void
.end method

.method static synthetic access$3100(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isActivityUnavailable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3200(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Lcom/github/tvbox/osc/ui/dialog/TipDialog;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mConfigErrorDialog:Lcom/github/tvbox/osc/ui/dialog/TipDialog;

    return-object v0
.end method

.method static synthetic access$3202(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Lcom/github/tvbox/osc/ui/dialog/TipDialog;)Lcom/github/tvbox/osc/ui/dialog/TipDialog;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/ui/dialog/TipDialog;

    .line 84
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mConfigErrorDialog:Lcom/github/tvbox/osc/ui/dialog/TipDialog;

    return-object p1
.end method

.method static synthetic access$3300(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dismissConfigErrorDialog()V

    return-void
.end method

.method static synthetic access$3400(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->changeTop(Z)V

    return-void
.end method

.method static synthetic access$3600(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dismissSiteSwitchDialog()V

    return-void
.end method

.method static synthetic access$3700(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHome(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isDownOrUp:Z

    return v0
.end method

.method static synthetic access$402(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isDownOrUp:Z

    return p1
.end method

.method static synthetic access$500(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    return v0
.end method

.method static synthetic access$502(Lcom/github/tvbox/osc/ui/activity/HomeActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # I

    .line 84
    iput p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    return p1
.end method

.method static synthetic access$600(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Landroid/view/View;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Z

    .line 84
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->animateHomeTab(Landroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$702(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Landroid/view/View;

    .line 84
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$800(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortChange:Z

    return v0
.end method

.method static synthetic access$802(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;
    .param p1, "x1"    # Z

    .line 84
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortChange:Z

    return p1
.end method

.method static synthetic access$900(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)Lcom/github/tvbox/osc/ui/adapter/SortAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    .line 84
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    return-object v0
.end method

.method private animateHomeTab(Landroid/view/View;Z)V
    .locals 1
    const/high16 v0, 0x3f800000
    invoke-static {p1, p2, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V
    return-void
.end method

.method private cancelHomeSortLoading()V
    .locals 3

    .line 994
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->homeSortLoading:Z

    .line 995
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadingSourceKey:Ljava/lang/String;

    .line 996
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->clearAnimation()V

    .line 997
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

    if-eqz v1, :cond_0

    .line 998
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/api/ApiConfig;->setSourceBean(Lcom/github/tvbox/osc/bean/SourceBean;)V

    .line 1000
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeName:Ljava/lang/String;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1001
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1003
    :cond_1
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeSource:Lcom/github/tvbox/osc/bean/SourceBean;

    .line 1004
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeName:Ljava/lang/String;

    .line 1005
    return-void
.end method

.method private changeTop(Z)V
    .locals 16
    .param p1, "hide"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hide"
        }
    .end annotation

    .line 790
    move-object/from16 v0, p0

    move/from16 v1, p1

    new-instance v2, Lcom/github/tvbox/osc/ui/tv/widget/ViewObj;

    iget-object v3, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v2, v3, v4}, Lcom/github/tvbox/osc/ui/tv/widget/ViewObj;-><init>(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 791
    .local v2, "viewObj":Lcom/github/tvbox/osc/ui/tv/widget/ViewObj;
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 792
    .local v3, "animatorSet":Landroid/animation/AnimatorSet;
    new-instance v4, Lcom/github/tvbox/osc/ui/activity/HomeActivity$12;

    invoke-direct {v4, v0, v1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$12;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 813
    const-string v6, "alpha"

    const-string v9, "height"

    const/4 v10, 0x0

    const/high16 v11, 0x41200000    # 10.0f

    const-string v12, "marginTop"

    const/4 v13, 0x3

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/4 v4, 0x2

    if-eqz v1, :cond_0

    iget-byte v5, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topHide:B

    if-nez v5, :cond_0

    .line 814
    new-array v5, v13, [Landroid/animation/Animator;

    new-instance v13, Landroid/animation/IntEvaluator;

    invoke-direct {v13}, Landroid/animation/IntEvaluator;-><init>()V

    new-array v7, v4, [Ljava/lang/Object;

    iget-object v8, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 815
    invoke-static {v8, v11}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v14

    iget-object v8, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 816
    invoke-static {v8, v10}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v15

    .line 814
    invoke-static {v2, v12, v13, v7}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v14

    new-instance v7, Landroid/animation/IntEvaluator;

    invoke-direct {v7}, Landroid/animation/IntEvaluator;-><init>()V

    new-array v8, v4, [Ljava/lang/Object;

    iget-object v10, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 818
    const/high16 v11, 0x42480000    # 50.0f

    invoke-static {v10, v11}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v14

    iget-object v10, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 819
    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v10, v11}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v15

    .line 817
    invoke-static {v2, v9, v7, v8}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v15

    iget-object v7, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topLayout:Landroid/widget/LinearLayout;

    new-array v8, v4, [F

    fill-array-data v8, :array_0

    .line 820
    invoke-static {v7, v6, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v4

    .line 814
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 821
    const-wide/16 v4, 0xc8

    invoke-virtual {v3, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 822
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 823
    return-void

    .line 825
    :cond_0
    if-nez v1, :cond_1

    iget-byte v5, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topHide:B

    if-ne v5, v15, :cond_1

    .line 826
    new-array v5, v13, [Landroid/animation/Animator;

    new-instance v7, Landroid/animation/IntEvaluator;

    invoke-direct {v7}, Landroid/animation/IntEvaluator;-><init>()V

    new-array v8, v4, [Ljava/lang/Object;

    iget-object v13, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 827
    invoke-static {v13, v10}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v14

    iget-object v10, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 828
    invoke-static {v10, v11}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v15

    .line 826
    invoke-static {v2, v12, v7, v8}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v14

    new-instance v7, Landroid/animation/IntEvaluator;

    invoke-direct {v7}, Landroid/animation/IntEvaluator;-><init>()V

    new-array v8, v4, [Ljava/lang/Object;

    iget-object v10, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 830
    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v10, v11}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v14

    iget-object v10, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    .line 831
    const/high16 v11, 0x42480000    # 50.0f

    invoke-static {v10, v11}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v15

    .line 829
    invoke-static {v2, v9, v7, v8}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    move-result-object v7

    aput-object v7, v5, v15

    iget-object v7, v0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topLayout:Landroid/widget/LinearLayout;

    new-array v8, v4, [F

    fill-array-data v8, :array_1

    .line 832
    invoke-static {v7, v6, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    aput-object v6, v5, v4

    .line 826
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 833
    const-wide/16 v4, 0xc8

    invoke-virtual {v3, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 834
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 836
    :cond_1
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private clearHomePages()V
    .locals 2

    .line 548
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mDataRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 549
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentSelected:I

    .line 550
    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    .line 551
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortChange:Z

    .line 552
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocusView:Landroid/view/View;

    .line 553
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentView:Landroid/view/View;

    .line 554
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->pageAdapter:Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

    if-eqz v1, :cond_0

    .line 555
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 556
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->pageAdapter:Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;->removeAll()V

    .line 557
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->pageAdapter:Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

    goto :goto_0

    .line 558
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 559
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 561
    :cond_1
    :goto_0
    return-void
.end method

.method private dismissConfigErrorDialog()V
    .locals 1

    .line 965
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mConfigErrorDialog:Lcom/github/tvbox/osc/ui/dialog/TipDialog;

    if-eqz v0, :cond_1

    .line 966
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/dialog/TipDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 967
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mConfigErrorDialog:Lcom/github/tvbox/osc/ui/dialog/TipDialog;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/dialog/TipDialog;->dismiss()V

    .line 969
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mConfigErrorDialog:Lcom/github/tvbox/osc/ui/dialog/TipDialog;

    .line 971
    :cond_1
    return-void
.end method

.method private dismissHomeDialogs()V
    .locals 0

    .line 960
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dismissConfigErrorDialog()V

    .line 961
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dismissSiteSwitchDialog()V

    .line 962
    return-void
.end method

.method private dismissSiteSwitchDialog()V
    .locals 1

    .line 974
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    if-eqz v0, :cond_1

    .line 975
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 976
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->dismiss()V

    .line 978
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    .line 980
    :cond_1
    return-void
.end method

.method private doExit()V
    .locals 5

    .line 641
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mExitTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x7d0

    cmp-long v4, v0, v2

    if-gez v4, :cond_3

    .line 642
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->unregisterEventBus()V

    .line 643
    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/server/ControlManager;->stopServer()V

    .line 644
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2

    .line 645
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 646
    .local v0, "activityManager":Landroid/app/ActivityManager;
    if-eqz v0, :cond_1

    .line 647
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getAppTasks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$AppTask;

    .line 648
    .local v2, "appTask":Landroid/app/ActivityManager$AppTask;
    invoke-virtual {v2}, Landroid/app/ActivityManager$AppTask;->finishAndRemoveTask()V

    .line 649
    .end local v2    # "appTask":Landroid/app/ActivityManager$AppTask;
    goto :goto_0

    :cond_0
    goto :goto_1

    .line 651
    :cond_1
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->finishAndRemoveTask()V

    .line 653
    .end local v0    # "activityManager":Landroid/app/ActivityManager;
    :goto_1
    goto :goto_2

    .line 654
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/util/AppManager;->getInstance()Lcom/github/tvbox/osc/util/AppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/AppManager;->finishAllActivity()V

    .line 655
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->finish()V

    goto :goto_2

    .line 659
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mExitTime:J

    .line 660
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "\u518d\u6309\u4e00\u6b21\u8fd4\u56de\u952e\u9000\u51fa\u5e94\u7528"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 662
    :goto_2
    return-void
.end method

.method private initData()V
    .locals 4

    .line 344
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dataInitOk:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jarInitOk:Z

    if-eqz v0, :cond_3

    .line 345
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadHomeSort(Z)V

    .line 346
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->hasPermission(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 347
    const-string v1, "\u6709"

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 349
    :cond_0
    const-string v1, "\u65e0"

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->e(Ljava/lang/String;)V

    .line 351
    :goto_0
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    if-nez v1, :cond_1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "DEFAULT_LOAD_LIVE"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 352
    const-class v0, Lcom/github/tvbox/osc/ui/activity/LivePlayActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jumpActivity(Ljava/lang/Class;)V

    .line 355
    :cond_1
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->warmSearchSpidersOnce()V

    .line 356
    :cond_2
    return-void

    .line 358
    :cond_3
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvNameAnimation()V

    .line 359
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showLoading()V

    .line 360
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dataInitOk:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jarInitOk:Z

    if-nez v0, :cond_5

    .line 361
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getSpider()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 362
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getSpider()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/github/tvbox/osc/ui/activity/HomeActivity$9;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$9;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->loadJar(ZLjava/lang/String;Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V

    .line 399
    :cond_4
    return-void

    .line 401
    :cond_5
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HomeActivity$10;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$10;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1, v2, p0}, Lcom/github/tvbox/osc/api/ApiConfig;->loadConfig(ZLcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;Landroid/app/Activity;)V

    .line 490
    return-void
.end method

.method private initView()V
    .locals 4

    .line 151
    const v0, 0x7f0a0264

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topLayout:Landroid/widget/LinearLayout;

    .line 152
    const v0, 0x7f0a027a

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvDate:Landroid/widget/TextView;

    .line 153
    const v0, 0x7f0a02a7

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    .line 154
    const v0, 0x7f0a008c

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->contentLayout:Landroid/widget/LinearLayout;

    .line 155
    const v0, 0x7f0a0182

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 156
    const v0, 0x7f0a0195

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    .line 157
    const v0, 0x7f0a006c

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->brandSplash:Landroid/view/View;

    .line 158
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showBrandIntro()V

    .line 159
    new-instance v0, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-direct {v0}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    .line 160
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v1, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v3}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 161
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v1, v2}, Lme/jessyan/autosize/utils/AutoSizeUtils;->dp2px(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v3, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSpacingWithMargins(II)V

    .line 162
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-virtual {v0, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 163
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$3;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$3;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V

    .line 175
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$4;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$4;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 234
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$5;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$5;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnInBorderKeyEventListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnInBorderKeyEventListener;)V

    .line 257
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$6;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$6;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$7;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$7;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 294
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->contentLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->setLoadSir(Landroid/view/View;)V

    .line 296
    return-void
.end method

.method private initViewModel()V
    .locals 2

    .line 302
    new-instance v0, Landroidx/lifecycle/ViewModelProvider;

    invoke-direct {v0, p0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v1, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    .line 303
    iget-object v0, v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->sortResult:Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$8;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$8;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v0, p0, v1}, Landroidx/lifecycle/MutableLiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 336
    return-void
.end method

.method private initViewPager(Lcom/github/tvbox/osc/bean/AbsSortXml;)V
    .locals 5
    .param p1, "absXml"    # Lcom/github/tvbox/osc/bean/AbsSortXml;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "absXml"
        }
    .end annotation

    .line 520
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 521
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/MovieSort$SortData;

    .line 522
    .local v1, "data":Lcom/github/tvbox/osc/bean/MovieSort$SortData;
    iget-object v3, v1, Lcom/github/tvbox/osc/bean/MovieSort$SortData;->id:Ljava/lang/String;

    const-string v4, "my0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 523
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "home_rec"

    invoke-static {v4, v3}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v2, :cond_0

    if-eqz p1, :cond_0

    iget-object v2, p1, Lcom/github/tvbox/osc/bean/AbsSortXml;->videoList:Ljava/util/List;

    if-eqz v2, :cond_0

    iget-object v2, p1, Lcom/github/tvbox/osc/bean/AbsSortXml;->videoList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 524
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    iget-object v3, p1, Lcom/github/tvbox/osc/bean/AbsSortXml;->videoList:Ljava/util/List;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->newInstance(Ljava/util/List;)Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 526
    :cond_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->newInstance(Ljava/util/List;)Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 529
    :cond_1
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/fragment/GridFragment;->newInstance(Lcom/github/tvbox/osc/bean/MovieSort$SortData;)Lcom/github/tvbox/osc/ui/fragment/GridFragment;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 531
    .end local v1    # "data":Lcom/github/tvbox/osc/bean/MovieSort$SortData;
    :goto_1
    goto :goto_0

    .line 532
    :cond_2
    new-instance v0, Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-direct {v0, v1, v3}, Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->pageAdapter:Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

    .line 534
    :try_start_0
    const-class v0, Landroidx/viewpager/widget/ViewPager;

    const-string v1, "mScroller"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 535
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 536
    new-instance v1, Lcom/github/tvbox/osc/ui/tv/widget/FixedSpeedScroller;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-direct {v1, v3, v4}, Lcom/github/tvbox/osc/ui/tv/widget/FixedSpeedScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 537
    .local v1, "scroller":Lcom/github/tvbox/osc/ui/tv/widget/FixedSpeedScroller;
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 538
    const/16 v3, 0x12c

    invoke-virtual {v1, v3}, Lcom/github/tvbox/osc/ui/tv/widget/FixedSpeedScroller;->setmDuration(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    .end local v0    # "field":Ljava/lang/reflect/Field;
    .end local v1    # "scroller":Lcom/github/tvbox/osc/ui/tv/widget/FixedSpeedScroller;
    goto :goto_2

    .line 539
    :catch_0
    move-exception v0

    .line 541
    :goto_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    new-instance v1, Lcom/github/tvbox/osc/ui/tv/widget/DefaultTransformer;

    invoke-direct {v1}, Lcom/github/tvbox/osc/ui/tv/widget/DefaultTransformer;-><init>()V

    invoke-virtual {v0, v2, v1}, Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;->setPageTransformer(ZLandroidx/viewpager/widget/ViewPager$PageTransformer;)V

    .line 542
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->pageAdapter:Lcom/github/tvbox/osc/ui/adapter/HomePageAdapter;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 543
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mViewPager:Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;

    iget v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentSelected:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/github/tvbox/osc/ui/tv/widget/NoScrollViewPager;->setCurrentItem(IZ)V

    .line 545
    :cond_3
    return-void
.end method

.method private isActivityUnavailable()Z
    .locals 2

    .line 956
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private loadHomeSort(Z)V
    .locals 4
    .param p1, "keepCurrentContent"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "keepCurrentContent"
        }
    .end annotation

    .line 499
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    .line 500
    .local v0, "home":Lcom/github/tvbox/osc/bean/SourceBean;
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->homeSortLoading:Z

    .line 501
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 502
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    if-nez v2, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    iput-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->previousHomeName:Ljava/lang/String;

    .line 503
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 505
    :cond_1
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvNameAnimation()V

    .line 506
    if-nez v0, :cond_3

    .line 507
    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadingSourceKey:Ljava/lang/String;

    .line 508
    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showLoading()V

    .line 509
    :cond_2
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    invoke-virtual {v2, v1}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->getSort(Ljava/lang/String;)V

    .line 510
    return-void

    .line 512
    :cond_3
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadingSourceKey:Ljava/lang/String;

    .line 513
    if-nez p1, :cond_4

    .line 514
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showLoading()V

    .line 516
    :cond_4
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadingSourceKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->getSort(Ljava/lang/String;)V

    .line 517
    return-void
.end method

.method private refreshEmpty()V
    .locals 4

    .line 984
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->skipNextUpdate:Z

    .line 985
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showSuccess()V

    .line 986
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->cancelHomeSortLoading()V

    .line 987
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->clearHomePages()V

    .line 988
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v2, v3, v0}, Lcom/github/tvbox/osc/util/DefaultConfig;->adjustSort(Ljava/lang/String;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->setNewData(Ljava/util/List;)V

    .line 989
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->initViewPager(Lcom/github/tvbox/osc/bean/AbsSortXml;)V

    .line 990
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->clearAnimation()V

    .line 991
    return-void
.end method

.method private refreshHome()V
    .locals 1

    .line 905
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHome(Z)V

    .line 906
    return-void
.end method

.method private refreshHome(Z)V
    .locals 4
    .param p1, "restart"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "restart"
        }
    .end annotation

    .line 930
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 931
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/HomeActivity$15;

    invoke-direct {v1, p0, p1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$15;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 937
    return-void

    .line 939
    :cond_0
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isActivityUnavailable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 940
    return-void

    .line 942
    :cond_1
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dismissHomeDialogs()V

    .line 943
    const/4 v0, 0x1

    if-nez p1, :cond_2

    .line 944
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->loadHomeSort(Z)V

    .line 945
    return-void

    .line 947
    :cond_2
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/github/tvbox/osc/ui/activity/HomeActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 948
    .local v1, "intent":Landroid/content/Intent;
    const v2, 0x10008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 949
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 950
    .local v2, "bundle":Landroid/os/Bundle;
    const-string v3, "useCache"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 951
    invoke-virtual {v1, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 952
    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 953
    return-void
.end method

.method private refreshHomeSort()V
    .locals 2

    .line 909
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHomeRec:Z

    .line 910
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    if-eqz v0, :cond_0

    .line 911
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setNewData(Ljava/util/List;)V

    .line 913
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    .line 914
    .local v0, "home":Lcom/github/tvbox/osc/bean/SourceBean;
    if-eqz v0, :cond_1

    .line 915
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->clearSortCache(Ljava/lang/String;)V

    .line 917
    :cond_1
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHome(Z)V

    .line 918
    return-void
.end method

.method private refreshTopInfoTextSize()V
    .locals 4

    .line 682
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvDate:Landroid/widget/TextView;

    if-nez v1, :cond_0

    goto :goto_0

    .line 685
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700cd

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 686
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvDate:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0700cb

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 687
    return-void

    .line 683
    :cond_1
    :goto_0
    return-void
.end method

.method private showBrandIntro()V
    .locals 5

    .line 715
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->brandSplash:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    .line 716
    :cond_0
    const v1, 0x7f0a006d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 717
    .local v0, "mark":Landroid/view/View;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 718
    const v2, 0x3f47ae14    # 0.78f

    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 719
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 720
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const-wide/16 v3, 0x1a4

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 721
    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 722
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->brandSplash:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x28a

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x140

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 723
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/HomeActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    .line 724
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 725
    return-void
.end method

.method private showFilterIcon(I)V
    .locals 5
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "count"
        }
    .end annotation

    .line 709
    const/4 v0, 0x0

    if-lez p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 710
    .local v1, "visible":Z
    :goto_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentView:Landroid/view/View;

    const v3, 0x7f0a0295

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    if-eqz v1, :cond_1

    const/4 v4, 0x0

    goto :goto_1

    :cond_1
    const/16 v4, 0x8

    :goto_1
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 711
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentView:Landroid/view/View;

    const v4, 0x7f0a0294

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v1, :cond_2

    const/16 v0, 0x8

    :cond_2
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 712
    return-void
.end method

.method private tvNameAnimation()V
    .locals 3

    .line 1009
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->clearAnimation()V

    .line 1010
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 1011
    .local v0, "blinkAnimation":Landroid/view/animation/AlphaAnimation;
    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 1012
    const-wide/16 v1, 0x14

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setStartOffset(J)V

    .line 1013
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 1014
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 1015
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->tvName:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1016
    return-void
.end method

.method private unregisterEventBus()V
    .locals 1

    .line 850
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->eventBusRegistered:Z

    if-eqz v0, :cond_0

    .line 851
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    .line 852
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->eventBusRegistered:Z

    .line 854
    :cond_0
    return-void
.end method

.method private updateHomeRec(Lcom/github/tvbox/osc/bean/AbsSortXml;)V
    .locals 3
    .param p1, "absXml"    # Lcom/github/tvbox/osc/bean/AbsSortXml;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "absXml"
        }
    .end annotation

    .line 921
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHomeRec:Z

    if-nez v0, :cond_0

    return-void

    .line 922
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHomeRec:Z

    .line 923
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "home_rec"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v0, :cond_1

    return-void

    .line 924
    :cond_1
    if-eqz p1, :cond_3

    iget-object v0, p1, Lcom/github/tvbox/osc/bean/AbsSortXml;->videoList:Ljava/util/List;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    if-nez v0, :cond_2

    goto :goto_0

    .line 925
    :cond_2
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    iget-object v1, p1, Lcom/github/tvbox/osc/bean/AbsSortXml;->videoList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setNewData(Ljava/util/List;)V

    .line 926
    return-void

    .line 924
    :cond_3
    :goto_0
    return-void
.end method

.method private updateSortData(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newSortData"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/MovieSort$SortData;",
            ">;)V"
        }
    .end annotation

    .line 564
    .local p1, "newSortData":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/MovieSort$SortData;>;"
    if-nez p1, :cond_0

    .line 565
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object p1, v0

    .line 567
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->getData()Ljava/util/List;

    move-result-object v0

    .line 568
    .local v0, "oldSortData":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/MovieSort$SortData;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 569
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 570
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 571
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 572
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/MovieSort$SortData;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/MovieSort$SortData;->id:Ljava/lang/String;

    const-string v3, "my0"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 573
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/MovieSort$SortData;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/MovieSort$SortData;->id:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 577
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    .line 578
    .local v1, "oldTailCount":I
    if-lez v1, :cond_2

    .line 579
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v0, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 580
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-virtual {v3, v2, v1}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->notifyItemRangeRemoved(II)V

    .line 582
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v2, :cond_3

    .line 583
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {p1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 584
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v3, v2, v4}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->notifyItemRangeInserted(II)V

    .line 586
    :cond_3
    return-void

    .line 574
    .end local v1    # "oldTailCount":I
    :cond_4
    :goto_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortAdapter:Lcom/github/tvbox/osc/ui/adapter/SortAdapter;

    invoke-virtual {v1, p1}, Lcom/github/tvbox/osc/ui/adapter/SortAdapter;->setNewData(Ljava/util/List;)V

    .line 575
    return-void
.end method

.method private warmSearchSpidersOnce()V
    .locals 1

    .line 493
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->searchSpiderWarmStarted:Z

    if-eqz v0, :cond_0

    return-void

    .line 494
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->searchSpiderWarmStarted:Z

    .line 495
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->warmSearchSpiders()V

    .line 496
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 769
    iget-byte v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->topHide:B

    if-gez v0, :cond_0

    .line 770
    const/4 v0, 0x0

    return v0

    .line 771
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 772
    .local v0, "keyCode":I
    const/16 v1, 0x52

    if-ne v0, v1, :cond_3

    .line 773
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_1

    .line 774
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->menuKeyDownTime:J

    goto :goto_0

    .line 775
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_3

    .line 776
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->menuKeyDownTime:J

    sub-long/2addr v1, v3

    .line 777
    .local v1, "pressDuration":J
    const-wide/16 v3, 0x7d0

    cmp-long v5, v1, v3

    if-ltz v5, :cond_2

    .line 778
    const-class v3, Lcom/github/tvbox/osc/ui/activity/SettingActivity;

    invoke-virtual {p0, v3}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 780
    :cond_2
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showSiteSwitch()V

    .line 784
    .end local v1    # "pressDuration":J
    :cond_3
    :goto_0
    invoke-super {p0, p1}, Lcom/github/tvbox/osc/base/BaseActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    return v1
.end method

.method protected getLayoutResID()I
    .locals 1

    .line 129
    const v0, 0x7f0d0021

    return v0
.end method

.method protected init()V
    .locals 4

    .line 136
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->eventBusRegistered:Z

    .line 138
    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/server/ControlManager;->startServer()V

    .line 139
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->initView()V

    .line 140
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->initViewModel()V

    .line 141
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    .line 142
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 143
    .local v1, "intent":Landroid/content/Intent;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 144
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 145
    .local v2, "bundle":Landroid/os/Bundle;
    const-string v3, "useCache"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->useCacheConfig:Z

    .line 147
    .end local v2    # "bundle":Landroid/os/Bundle;
    :cond_0
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->initData()V

    .line 148
    return-void
.end method

.method synthetic lambda$showBrandIntro$0$com-github-tvbox-osc-ui-activity-HomeActivity()V
    .locals 2

    .line 724
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->brandSplash:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .line 592
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->homeSortLoading:Z

    if-eqz v0, :cond_0

    .line 593
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->cancelHomeSortLoading()V

    .line 594
    return-void

    .line 596
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 597
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshEmpty()V

    .line 598
    return-void

    .line 601
    :cond_1
    sget-boolean v0, Lcom/github/tvbox/osc/util/HawkConfig;->hotVodDelete:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 602
    sput-boolean v1, Lcom/github/tvbox/osc/util/HawkConfig;->hotVodDelete:Z

    .line 603
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->notifyDataSetChanged()V

    .line 604
    return-void

    .line 608
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_9

    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_9

    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    if-gez v0, :cond_3

    goto :goto_2

    .line 613
    :cond_3
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->fragments:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/base/BaseLazyFragment;

    .line 614
    .local v0, "baseLazyFragment":Lcom/github/tvbox/osc/base/BaseLazyFragment;
    instance-of v2, v0, Lcom/github/tvbox/osc/ui/fragment/GridFragment;

    if-eqz v2, :cond_7

    .line 615
    move-object v2, v0

    check-cast v2, Lcom/github/tvbox/osc/ui/fragment/GridFragment;

    .line 617
    .local v2, "grid":Lcom/github/tvbox/osc/ui/fragment/GridFragment;
    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/fragment/GridFragment;->restoreView()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 618
    return-void

    .line 621
    :cond_4
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocusView:Landroid/view/View;

    if-eqz v3, :cond_5

    invoke-virtual {v3}, Landroid/view/View;->isFocused()Z

    move-result v3

    if-nez v3, :cond_5

    .line 622
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocusView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    goto :goto_0

    .line 625
    :cond_5
    iget v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->sortFocused:I

    if-eqz v3, :cond_6

    .line 626
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v3, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelection(I)V

    goto :goto_0

    .line 628
    :cond_6
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->doExit()V

    .line 630
    .end local v2    # "grid":Lcom/github/tvbox/osc/ui/fragment/GridFragment;
    :goto_0
    goto :goto_1

    :cond_7
    instance-of v2, v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    if-eqz v2, :cond_8

    sget-object v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 632
    sget-object v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->scrollToPosition(I)V

    .line 633
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelection(I)V

    goto :goto_1

    .line 635
    :cond_8
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->doExit()V

    .line 637
    :goto_1
    return-void

    .line 609
    .end local v0    # "baseLazyFragment":Lcom/github/tvbox/osc/base/BaseLazyFragment;
    :cond_9
    :goto_2
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->doExit()V

    .line 610
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 840
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->dismissHomeDialogs()V

    .line 841
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 842
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onDestroy()V

    .line 843
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->unregisterEventBus()V

    .line 844
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 845
    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/server/ControlManager;->stopServer()V

    .line 847
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 676
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onPause()V

    .line 677
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshTopInfoTextSizeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 678
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 679
    return-void
.end method

.method protected onResume()V
    .locals 4

    .line 666
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onResume()V

    .line 667
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshTopInfoTextSize()V

    .line 668
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshTopInfoTextSizeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 669
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshTopInfoTextSizeRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 670
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 671
    return-void
.end method

.method public refresh(Lcom/github/tvbox/osc/event/RefreshEvent;)V
    .locals 4
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

    .line 691
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    .line 692
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    const-string v1, "push_agent"

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 693
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mContext:Landroid/content/Context;

    const-class v3, Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 694
    .local v0, "newIntent":Landroid/content/Intent;
    iget-object v2, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    const-string v3, "id"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 695
    const-string v2, "sourceKey"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 696
    const/high16 v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 697
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 698
    .end local v0    # "newIntent":Landroid/content/Intent;
    goto :goto_0

    .line 699
    :cond_0
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_1

    .line 700
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->currentView:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 701
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->showFilterIcon(I)V

    goto :goto_0

    .line 703
    :cond_1
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/16 v1, 0xf

    if-ne v0, v1, :cond_2

    .line 704
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->refreshHome(Z)V

    .line 706
    :cond_2
    :goto_0
    return-void
.end method

.method showSiteSwitch()V
    .locals 8

    .line 859
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->isActivityUnavailable()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 860
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getSwitchSourceBeanList()Ljava/util/List;

    move-result-object v0

    .line 861
    .local v0, "sites":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/SourceBean;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 862
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 863
    .local v1, "select":I
    if-ltz v1, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lt v1, v2, :cond_3

    :cond_2
    const/4 v1, 0x0

    .line 864
    :cond_3
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    if-nez v2, :cond_4

    .line 865
    new-instance v2, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    .line 866
    const v3, 0x7f0a014c

    invoke-virtual {v2, v3}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 868
    .local v2, "tvRecyclerView":Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    int-to-double v3, v3

    const-wide/high16 v5, 0x4034000000000000L    # 20.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-int v3, v3

    .line 869
    .local v3, "spanCount":I
    const/4 v4, 0x2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 870
    new-instance v4, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    add-int/lit8 v6, v3, 0x1

    invoke-direct {v4, v5, v6}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v2, v4}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 872
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    const v5, 0x7f0a0080

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 873
    .local v4, "cl_root":Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-virtual {v4}, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 874
    .local v5, "clp":Landroid/view/ViewGroup$LayoutParams;
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {v6}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->getContext()Landroid/content/Context;

    move-result-object v6

    mul-int/lit16 v7, v3, 0xc8

    add-int/lit16 v7, v7, 0x17c

    int-to-float v7, v7

    invoke-static {v6, v7}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 875
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    const-string v7, "\u8bf7\u9009\u62e9\u9996\u9875\u6570\u636e\u6e90"

    invoke-virtual {v6, v7}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setTip(Ljava/lang/String;)V

    .line 877
    .end local v2    # "tvRecyclerView":Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .end local v3    # "spanCount":I
    .end local v4    # "cl_root":Landroidx/constraintlayout/widget/ConstraintLayout;
    .end local v5    # "clp":Landroid/view/ViewGroup$LayoutParams;
    :cond_4
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    new-instance v3, Lcom/github/tvbox/osc/ui/activity/HomeActivity$13;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$13;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    new-instance v4, Lcom/github/tvbox/osc/ui/activity/HomeActivity$14;

    invoke-direct {v4, p0}, Lcom/github/tvbox/osc/ui/activity/HomeActivity$14;-><init>(Lcom/github/tvbox/osc/ui/activity/HomeActivity;)V

    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setAdapter(Lcom/github/tvbox/osc/ui/adapter/SelectDialogAdapter$SelectDialogInterface;Landroidx/recyclerview/widget/DiffUtil$ItemCallback;Ljava/util/List;I)V

    .line 899
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_5

    .line 900
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/HomeActivity;->mSiteSwitchDialog:Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->show()V

    .line 901
    :cond_5
    return-void
.end method
