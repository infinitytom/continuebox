.class public Lcom/github/tvbox/osc/ui/activity/DetailActivity;
.super Lcom/github/tvbox/osc/base/BaseActivity;
.source "DetailActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/ui/activity/DetailActivity$ViewParentCompat;
    }
.end annotation


# static fields
.field private static final REVIEW_COLOR_FAIL:I = -0x1fa5a6

.field private static final REVIEW_COLOR_MUTED:I = -0x817666

.field private static final REVIEW_COLOR_OK:I = -0x573806

.field private static final REVIEW_COLOR_TEXT:I = -0x383126


# instance fields
.field private GroupCount:I

.field private currentSeriesGroupView:Landroid/view/View;

.field private detailLowerScroll:Landroidx/core/widget/NestedScrollView;

.field private final detailRelayout:Ljava/lang/Runnable;

.field private discoverySection:Landroid/view/View;

.field private episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

.field private firstReverse:Z

.field public firstsourceKey:Ljava/lang/String;

.field fullWindows:Z

.field private hadQuickStart:Z

.field private isFirstLoad:Z

.field private isReverse:Z

.field private ivBackdrop:Landroid/widget/ImageView;

.field private ivThumb:Landroid/widget/ImageView;

.field private llLayout:Landroid/widget/LinearLayout;

.field private llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

.field private llPlayerFragmentContainerBlock:Landroid/view/View;

.field private llPlayerPlace:Landroid/view/View;

.field private mCheckSources:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mEmptyPlayList:Landroid/widget/LinearLayout;

.field private mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

.field private mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private mSeriesGroupView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

.field private mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

.field private metadataOrganizations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$Organization;",
            ">;"
        }
    .end annotation
.end field

.field private metadataOverview:Ljava/lang/String;

.field private metadataRequestGeneration:I

.field private pauseRunnable:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private peopleSection:Landroid/view/View;

.field private personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

.field private playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

.field private portraitMode:Z

.field private preFlag:Ljava/lang/String;

.field previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

.field private final quickSearchData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/Movie$Video;",
            ">;"
        }
    .end annotation
.end field

.field private final quickSearchWord:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private recommendSection:Landroid/view/View;

.field private recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

.field private recreateDetailAfterPreviewExit:Z

.field private searchExecutorService:Ljava/util/concurrent/ExecutorService;

.field private searchTitle:Ljava/lang/String;

.field private seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

.field private seriesFlagAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

.field private seriesFlagFocus:Landroid/view/View;

.field private seriesGroupAdapter:Lcom/chad/library/adapter/base/BaseQuickAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/chad/library/adapter/base/BaseQuickAdapter<",
            "Ljava/lang/String;",
            "Lcom/chad/library/adapter/base/BaseViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final seriesGroupOptions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field seriesSelect:Z

.field showPreview:Z

.field private smoothScroller:Landroidx/recyclerview/widget/LinearSmoothScroller;

.field public sourceKey:Ljava/lang/String;

.field private sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

.field private thumbContainer:Landroid/view/View;

.field private tvActor:Landroid/widget/TextView;

.field private tvArea:Landroid/widget/TextView;

.field private tvCollect:Landroid/widget/TextView;

.field private tvDes:Landroid/widget/TextView;

.field private tvDesc:Landroid/widget/TextView;

.field private tvDirector:Landroid/widget/TextView;

.field private tvEpisodeDetailMeta:Landroid/widget/TextView;

.field private tvEpisodeDetailOverview:Landroid/widget/TextView;

.field private tvEpisodeDetailTitle:Landroid/widget/TextView;

.field private tvLang:Landroid/widget/TextView;

.field private tvName:Landroid/widget/TextView;

.field private tvOrganizations:Landroid/widget/TextView;

.field private tvPlay:Landroid/widget/TextView;

.field private tvPlayUrl:Landroid/widget/TextView;

.field private tvQuickSearch:Landroid/widget/TextView;

.field private tvReviews:Landroid/widget/TextView;

.field private tvSeriesGroup:Landroid/widget/LinearLayout;

.field private tvSeriesSort:Landroid/widget/TextView;

.field private tvSite:Landroid/widget/TextView;

.field private tvType:Landroid/widget/TextView;

.field private tvYear:Landroid/widget/TextView;

.field public vodId:Ljava/lang/String;

.field private vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

.field private vod_name:Ljava/lang/String;

.field private vod_picture:Ljava/lang/String;

.field windowsFull:Landroid/view/ViewGroup$LayoutParams;

.field windowsPreview:Landroid/view/ViewGroup$LayoutParams;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 103
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;-><init>()V

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 148
    const-string v1, ""

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOverview:Ljava/lang/String;

    .line 149
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    .line 157
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesSelect:Z

    .line 158
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagFocus:Landroid/view/View;

    .line 160
    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->preFlag:Ljava/lang/String;

    .line 162
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    .line 163
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mCheckSources:Ljava/util/HashMap;

    .line 164
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    .line 167
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "show_preview"

    invoke-static {v5, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iput-boolean v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    .line 178
    new-instance v4, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda19;

    invoke-direct {v4, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda19;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    iput-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailRelayout:Ljava/lang/Runnable;

    .line 1406
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->pauseRunnable:Ljava/util/List;

    .line 1882
    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_picture:Ljava/lang/String;

    .line 1883
    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_name:Ljava/lang/String;

    .line 1920
    iput-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFirstLoad:Z

    .line 1972
    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchTitle:Ljava/lang/String;

    .line 1973
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->hadQuickStart:Z

    .line 1974
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchData:Ljava/util/List;

    .line 1975
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchWord:Ljava/util/List;

    .line 1976
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 2323
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    .line 2324
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    .line 2325
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsPreview:Landroid/view/ViewGroup$LayoutParams;

    .line 2326
    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsFull:Landroid/view/ViewGroup$LayoutParams;

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .line 103
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->loadBackdrop(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/ExecutorService;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Ljava/util/concurrent/ExecutorService;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvCollect:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Lcom/github/tvbox/osc/bean/VodInfo;)Lcom/github/tvbox/osc/bean/VodInfo;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/VodInfo;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlayUrl:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isReverse:Z

    return v0
.end method

.method static synthetic access$1502(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Z

    .line 103
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isReverse:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesSort:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setSeriesGroupOptions()V

    return-void
.end method

.method static synthetic access$1800(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->currentSeriesGroupView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1902(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Landroid/view/View;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->currentSeriesGroupView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOverview:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOverview:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/Movie$Video;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    return-object v0
.end method

.method static synthetic access$2202(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Lcom/github/tvbox/osc/bean/Movie$Video;)Lcom/github/tvbox/osc/bean/Movie$Video;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/Movie$Video;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 103
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->removeHtmlTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .param p2, "x2"    # Ljava/util/List;
    .param p3, "x3"    # I

    .line 103
    invoke-direct {p0, p1, p2, p3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findSameEpisodeIndex(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I

    move-result v0

    return v0
.end method

.method static synthetic access$2602(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Landroid/view/View;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagFocus:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$2700(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->preFlag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/github/tvbox/osc/ui/activity/DetailActivity;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # I

    .line 103
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isCurrentPreviewPlaying(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/fragment/PlayFragment;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/ui/activity/DetailActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # I

    .line 103
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showEpisodeDetailDialog(I)V

    return-void
.end method

.method static synthetic access$3000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    return v0
.end method

.method static synthetic access$3200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showSuccess()V

    return-void
.end method

.method static synthetic access$3500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showEmpty()V

    return-void
.end method

.method static synthetic access$3600(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_picture:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvName:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSite:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstReverse:Z

    return v0
.end method

.method static synthetic access$4000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Landroid/widget/TextView;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .line 103
    invoke-direct {p0, p1, p2, p3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$402(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Z

    .line 103
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstReverse:Z

    return p1
.end method

.method static synthetic access$4100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvYear:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvArea:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4300(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvLang:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvType:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvActor:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4600(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDirector:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDes:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4800(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->loadRichMetadata()V

    return-void
.end method

.method static synthetic access$4900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ivThumb:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->jumpToPlay()V

    return-void
.end method

.method static synthetic access$5000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    return-object v0
.end method

.method static synthetic access$5500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlay:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$5600(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mEmptyPlayList:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$5700(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroidx/fragment/app/FragmentContainerView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$600(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->startQuickSearch()V

    return-void
.end method

.method static synthetic access$6000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showEmpty()V

    return-void
.end method

.method static synthetic access$6100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/viewmodel/SourceViewModel;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    return-object v0
.end method

.method static synthetic access$700(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchData:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$800(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchWord:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    .line 103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->pauseRunnable:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$902(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .param p1, "x1"    # Ljava/util/List;

    .line 103
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->pauseRunnable:Ljava/util/List;

    return-object p1
.end method

.method private applyEpisodeMetadata(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "episodes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;",
            ">;)V"
        }
    .end annotation

    .line 1003
    .local p1, "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;>;"
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_6

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_6

    if-eqz p1, :cond_6

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1004
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1005
    .local v0, "byNumber":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;

    .line 1006
    .local v2, "episode":Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;
    if-eqz v2, :cond_1

    iget v3, v2, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->number:I

    if-lez v3, :cond_1

    iget v3, v2, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->number:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1007
    .end local v2    # "episode":Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;
    :cond_1
    goto :goto_0

    .line 1008
    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {p0, v1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->applyEpisodeMetadataTo(Lcom/github/tvbox/osc/bean/VodInfo;Ljava/util/HashMap;)V

    .line 1009
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_3

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eq v1, v2, :cond_3

    .line 1010
    invoke-direct {p0, v1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->applyEpisodeMetadataTo(Lcom/github/tvbox/osc/bean/VodInfo;Ljava/util/HashMap;)V

    .line 1012
    :cond_3
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->notifyDataSetChanged()V

    .line 1013
    :cond_4
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v1, :cond_5

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setPlayTitle(Z)V

    .line 1014
    :cond_5
    return-void

    .line 1003
    .end local v0    # "byNumber":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;>;"
    :cond_6
    :goto_1
    return-void
.end method

.method private applyEpisodeMetadataTo(Lcom/github/tvbox/osc/bean/VodInfo;Ljava/util/HashMap;)V
    .locals 9
    .param p1, "target"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "target",
            "byNumber"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/tvbox/osc/bean/VodInfo;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;",
            ">;)V"
        }
    .end annotation

    .line 1018
    .local p2, "byNumber":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;>;"
    if-eqz p1, :cond_9

    iget-object v0, p1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    goto/16 :goto_5

    .line 1019
    :cond_0
    iget-object v0, p1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1020
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-nez v1, :cond_1

    goto :goto_0

    .line 1021
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_7

    .line 1022
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 1023
    .local v3, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-nez v3, :cond_2

    const-string v4, ""

    goto :goto_2

    :cond_2
    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    :goto_2
    invoke-direct {p0, v4, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeNumber(Ljava/lang/String;I)I

    move-result v4

    .line 1024
    .local v4, "number":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;

    .line 1025
    .local v5, "episode":Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;
    if-eqz v3, :cond_6

    if-nez v5, :cond_3

    goto :goto_4

    .line 1026
    :cond_3
    iget-object v6, v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->title:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 1027
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u7b2c"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "\u96c6"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1028
    .local v6, "prefix":Ljava/lang/String;
    iget-object v7, v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->title:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1029
    iget-object v7, v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->title:Ljava/lang/String;

    goto :goto_3

    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " \u00b7 "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_3
    iput-object v7, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->displayName:Ljava/lang/String;

    .line 1031
    .end local v6    # "prefix":Ljava/lang/String;
    :cond_5
    iget-object v6, v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->overview:Ljava/lang/String;

    iput-object v6, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->detailOverview:Ljava/lang/String;

    .line 1032
    iget-object v6, v5, Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;->air_date:Ljava/lang/String;

    iput-object v6, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->detailAirDate:Ljava/lang/String;

    .line 1021
    .end local v3    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v4    # "number":I
    .end local v5    # "episode":Lcom/github/tvbox/osc/sync/MetadataClient$EpisodeMetadata;
    :cond_6
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1034
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .end local v2    # "i":I
    :cond_7
    goto/16 :goto_0

    .line 1035
    :cond_8
    return-void

    .line 1018
    :cond_9
    :goto_5
    return-void
.end method

.method private applyPortraitDetailLayout()V
    .locals 0
    invoke-static {p0}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply(Landroid/app/Activity;)V
    return-void
.end method

.method private applyPreviewRoundCorners()V
    .locals 4

    .line 1541
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 1542
    return-void

    .line 1544
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700b5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    .line 1545
    .local v0, "radius":F
    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$18;

    invoke-direct {v1, p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$18;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;F)V

    .line 1551
    .local v1, "provider":Landroid/view/ViewOutlineProvider;
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/fragment/app/FragmentContainerView;->setClipToOutline(Z)V

    .line 1552
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    invoke-virtual {v2, v1}, Landroidx/fragment/app/FragmentContainerView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 1553
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setClipToOutline(Z)V

    .line 1554
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 1555
    return-void
.end method

.method private applyThumbPreviewStyle()V
    .locals 4

    .line 1558
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->thumbContainer:Landroid/view/View;

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1559
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerPlace:Landroid/view/View;

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1560
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ivThumb:Landroid/widget/ImageView;

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-nez v1, :cond_2

    const/4 v2, 0x0

    :cond_2
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1561
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->thumbContainer:Landroid/view/View;

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v1, :cond_3

    const v1, 0x7f080149

    goto :goto_2

    :cond_3
    const v1, 0x7f08014a

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1562
    return-void
.end method

.method private bindPersonSearch(Landroid/widget/TextView;Z)V
    .locals 1
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "actor"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "actor"
        }
    .end annotation

    .line 777
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 778
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setClickable(Z)V

    .line 779
    new-instance v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda3;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Z)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 780
    return-void
.end method

.method private detectMetadataMediaType()Ljava/lang/String;
    .locals 6

    .line 980
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    const-string v2, ""

    if-eqz v1, :cond_1

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/Movie$Video;->type:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/Movie$Video;->type:Ljava/lang/String;

    goto :goto_1

    :cond_1
    :goto_0
    move-object v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 981
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_3

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->type:Ljava/lang/String;

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->type:Ljava/lang/String;

    goto :goto_3

    :cond_3
    :goto_2
    move-object v1, v2

    :goto_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 982
    .local v0, "type":Ljava/lang/String;
    const-string v1, "\u7535\u5f71"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v3, "movie"

    if-nez v1, :cond_8

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_5

    .line 983
    :cond_4
    const-string v1, "\u7535\u89c6\u5267"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v3, "tv"

    if-nez v1, :cond_7

    const-string v1, "\u8fde\u7eed\u5267"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "\u52a8\u6f2b"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 984
    const-string v1, "\u7efc\u827a"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "series"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_4

    .line 985
    :cond_5
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_6

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 986
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 987
    .local v1, "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v1, :cond_6

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_6

    return-object v3

    .line 989
    .end local v1    # "episodes":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_6
    return-object v2

    .line 984
    :cond_7
    :goto_4
    return-object v3

    .line 982
    :cond_8
    :goto_5
    return-object v3
.end method

.method private detectSeasonNumber()I
    .locals 5

    .line 993
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    const-string v2, ""

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    iget-object v1, v1, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 994
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_2

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    :cond_2
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 995
    .local v0, "value":Ljava/lang/String;
    const-string v1, "(?i)(?:S|Season\\s*|\\u7b2c\\s*)(\\d{1,2})(?:\\s*\\u5b63)?"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 996
    .local v1, "season":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    .line 997
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    move-exception v2

    .line 999
    :cond_3
    return v3
.end method

.method private episodeNumber(Ljava/lang/String;I)I
    .locals 5
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "label",
            "index"
        }
    .end annotation

    .line 1038
    if-eqz p1, :cond_2

    .line 1039
    const-string v0, "(?i)S\\d{1,2}E(\\d{1,3})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1040
    .local v0, "se":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 1041
    :cond_0
    const-string v1, "\\u7b2c\\s*(\\d{1,3})\\s*[\\u96c6\\u8bdd]"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 1042
    .local v1, "cn":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    return v2

    .line 1043
    :cond_1
    const-string v3, "(?i)(?:EP?|Episode)\\s*0*(\\d{1,3})"

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 1044
    .local v3, "ep":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    return v2

    .line 1046
    .end local v0    # "se":Ljava/util/regex/Matcher;
    .end local v1    # "cn":Ljava/util/regex/Matcher;
    .end local v3    # "ep":Ljava/util/regex/Matcher;
    :cond_2
    add-int/lit8 v0, p2, 0x1

    return v0
.end method

.method private extractEpisodeNumber(Ljava/lang/String;)I
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 2211
    const/4 v0, -0x1

    if-nez p1, :cond_0

    .line 2212
    return v0

    .line 2214
    :cond_0
    const-string v1, "(?:\u7b2c)?(\\d+)(?:\u96c6|\u8bdd|\u671f|$)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 2215
    .local v1, "episodeMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2217
    const/4 v2, 0x1

    :try_start_0
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 2218
    :catch_0
    move-exception v2

    .line 2221
    :cond_1
    const-string v2, "\\d+"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 2222
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2224
    :try_start_1
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    return v0

    .line 2225
    :catch_1
    move-exception v3

    .line 2228
    :cond_2
    return v0
.end method

.method private fillMissingPeopleText(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "people"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/MetadataPerson;",
            ">;)V"
        }
    .end annotation

    .line 1050
    .local p1, "people":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/MetadataPerson;>;"
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    if-eqz v0, :cond_c

    if-eqz p1, :cond_c

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 1051
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1052
    .local v0, "actors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1053
    .local v1, "directors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/MetadataPerson;

    .line 1054
    .local v3, "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_0

    .line 1055
    :cond_2
    iget-object v4, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->department:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const-string v5, "\u5bfc\u6f14"

    if-nez v4, :cond_3

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->department:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    :cond_3
    iget-object v4, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->role:Ljava/lang/String;

    .line 1056
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->role:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    :cond_4
    const/4 v4, 0x1

    goto :goto_1

    :cond_5
    const/4 v4, 0x0

    .line 1057
    .local v4, "director":Z
    :goto_1
    if-eqz v4, :cond_6

    move-object v5, v1

    goto :goto_2

    :cond_6
    move-object v5, v0

    .line 1058
    .local v5, "target":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_2
    if-eqz v4, :cond_7

    const/4 v6, 0x3

    goto :goto_3

    :cond_7
    const/16 v6, 0x8

    .line 1059
    .local v6, "limit":I
    :goto_3
    iget-object v7, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v7, v6, :cond_8

    iget-object v7, v3, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1060
    .end local v3    # "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    .end local v4    # "director":Z
    .end local v5    # "target":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "limit":I
    :cond_8
    goto :goto_0

    .line 1061
    :cond_9
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->actor:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, " / "

    if-eqz v2, :cond_a

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_a

    .line 1062
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    invoke-static {v3, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->actor:Ljava/lang/String;

    .line 1063
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvActor:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->actor:Ljava/lang/String;

    const-string v5, "\u6f14\u5458\uff1a"

    invoke-direct {p0, v2, v5, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 1065
    :cond_a
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->director:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b

    .line 1066
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    invoke-static {v3, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->director:Ljava/lang/String;

    .line 1067
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDirector:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/Movie$Video;->director:Ljava/lang/String;

    const-string v4, "\u5bfc\u6f14\uff1a"

    invoke-direct {p0, v2, v4, v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 1069
    :cond_b
    return-void

    .line 1050
    .end local v0    # "actors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "directors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_c
    :goto_4
    return-void
.end method

.method private findSameEpisodeIndex(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I
    .locals 6
    .param p1, "currentSeries"    # Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .param p3, "fallbackIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "currentSeries",
            "targetList",
            "fallbackIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;",
            ">;I)I"
        }
    .end annotation

    .line 2173
    .local p2, "targetList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    const/4 v0, 0x0

    if-eqz p2, :cond_5

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 2176
    :cond_0
    if-eqz p1, :cond_4

    iget-object v1, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 2177
    iget-object v1, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->normalizeEpisodeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2178
    .local v1, "currentName":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 2179
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 2180
    .local v3, "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->normalizeEpisodeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2181
    return v2

    .line 2178
    .end local v3    # "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2184
    .end local v2    # "i":I
    :cond_2
    iget-object v2, p1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->extractEpisodeNumber(Ljava/lang/String;)I

    move-result v2

    .line 2185
    .local v2, "currentEpisode":I
    if-ltz v2, :cond_4

    .line 2186
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 2187
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 2188
    .local v4, "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v4, :cond_3

    iget-object v5, v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->extractEpisodeNumber(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v2, :cond_3

    .line 2189
    return v3

    .line 2186
    .end local v4    # "targetSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2194
    .end local v1    # "currentName":Ljava/lang/String;
    .end local v2    # "currentEpisode":I
    .end local v3    # "i":I
    :cond_4
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0

    .line 2174
    :cond_5
    :goto_2
    return v0
.end method

.method private getHtml(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "label",
            "content"
        }
    .end annotation

    .line 1876
    if-nez p2, :cond_0

    .line 1877
    const-string p2, ""

    .line 1879
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<font color=\"#FFFFFF\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</font>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPlayingSeries(Lcom/github/tvbox/osc/bean/VodInfo;Ljava/lang/String;)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .locals 4
    .param p1, "playingVodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .param p2, "flag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "playingVodInfo",
            "flag"
        }
    .end annotation

    .line 2145
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    iget-object v1, p1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_3

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 2148
    :cond_0
    iget-object v1, p1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 2149
    .local v1, "playingList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 2152
    :cond_1
    const/4 v0, 0x0

    iget v2, p1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2153
    .local v0, "safeIndex":I
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    return-object v2

    .line 2150
    .end local v0    # "safeIndex":I
    :cond_2
    :goto_0
    return-object v0

    .line 2146
    .end local v1    # "playingList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_3
    :goto_1
    return-object v0
.end method

.method private initCheckedSourcesForSearch()V
    .locals 1

    .line 1403
    invoke-static {}, Lcom/github/tvbox/osc/util/SearchHelper;->getSourcesForSearch()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mCheckSources:Ljava/util/HashMap;

    .line 1404
    return-void
.end method

.method private initData()V
    .locals 5

    .line 1885
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 1886
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1887
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 1888
    .local v1, "bundle":Landroid/os/Bundle;
    const-string v2, "title"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_name:Ljava/lang/String;

    .line 1889
    const-string v2, "picture"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_picture:Ljava/lang/String;

    .line 1890
    const/4 v2, 0x0

    const-string v4, "id"

    invoke-virtual {v1, v4, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "sourceKey"

    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->loadDetail(Ljava/lang/String;Ljava/lang/String;)V

    .line 1892
    .end local v1    # "bundle":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method private initView()V
    .locals 10

    .line 246
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->portraitMode:Z

    .line 249
    if-eqz v0, :cond_1

    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    .line 250
    :cond_1
    const v0, 0x7f0a0161

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llLayout:Landroid/widget/LinearLayout;

    .line 251
    const v0, 0x7f0a00a8

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    .line 252
    const v0, 0x7f0a01d5

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerPlace:Landroid/view/View;

    .line 253
    const v0, 0x7f0a01d3

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/FragmentContainerView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    .line 254
    const v0, 0x7f0a01d4

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    .line 255
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->applyPreviewRoundCorners()V

    .line 256
    const v0, 0x7f0a025a

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->thumbContainer:Landroid/view/View;

    .line 257
    const v0, 0x7f0a0132

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ivThumb:Landroid/widget/ImageView;

    .line 258
    const v0, 0x7f0a012c

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ivBackdrop:Landroid/widget/ImageView;

    .line 259
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->applyThumbPreviewStyle()V

    .line 260
    const v0, 0x7f0a02a7

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvName:Landroid/widget/TextView;

    .line 261
    const v0, 0x7f0a02d7

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvYear:Landroid/widget/TextView;

    .line 262
    const v0, 0x7f0a02cc

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSite:Landroid/widget/TextView;

    .line 263
    const v0, 0x7f0a0272

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvArea:Landroid/widget/TextView;

    .line 264
    const v0, 0x7f0a02a1

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvLang:Landroid/widget/TextView;

    .line 265
    const v0, 0x7f0a02d3

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvType:Landroid/widget/TextView;

    .line 266
    const v0, 0x7f0a026e

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvActor:Landroid/widget/TextView;

    .line 267
    const v0, 0x7f0a0281

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDirector:Landroid/widget/TextView;

    .line 268
    const v0, 0x7f0a02ab

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    .line 269
    const v0, 0x7f0a02b5

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlayUrl:Landroid/widget/TextView;

    .line 270
    const v0, 0x7f0a027f

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDes:Landroid/widget/TextView;

    .line 271
    const v0, 0x7f0a02b4

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlay:Landroid/widget/TextView;

    .line 273
    const v0, 0x7f0a0280

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDesc:Landroid/widget/TextView;

    .line 274
    const v0, 0x7f0a0191

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesSort:Landroid/widget/TextView;

    .line 275
    const v0, 0x7f0a0279

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvCollect:Landroid/widget/TextView;

    .line 276
    const v0, 0x7f0a02b7

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvQuickSearch:Landroid/widget/TextView;

    .line 277
    const v0, 0x7f0a02bd

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvReviews:Landroid/widget/TextView;

    .line 278
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvActor:Landroid/widget/TextView;

    invoke-direct {p0, v0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->bindPersonSearch(Landroid/widget/TextView;Z)V

    .line 279
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDirector:Landroid/widget/TextView;

    invoke-direct {p0, v0, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->bindPersonSearch(Landroid/widget/TextView;Z)V

    .line 280
    sget-object v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda6;->INSTANCE:Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda6;

    .line 282
    .local v0, "detailActionFocus":Landroid/view/View$OnFocusChangeListener;
    const/16 v3, 0x8

    new-array v4, v3, [Landroid/view/View;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlay:Landroid/widget/TextView;

    aput-object v5, v4, v2

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvQuickSearch:Landroid/widget/TextView;

    aput-object v5, v4, v1

    const/4 v5, 0x2

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDesc:Landroid/widget/TextView;

    aput-object v6, v4, v5

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvReviews:Landroid/widget/TextView;

    const/4 v6, 0x3

    aput-object v5, v4, v6

    const/4 v5, 0x4

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvCollect:Landroid/widget/TextView;

    aput-object v7, v4, v5

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvActor:Landroid/widget/TextView;

    const/4 v7, 0x5

    aput-object v5, v4, v7

    const/4 v5, 0x6

    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDirector:Landroid/widget/TextView;

    aput-object v8, v4, v5

    const/4 v5, 0x7

    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    aput-object v8, v4, v5

    .line 283
    .local v4, "detailActions":[Landroid/view/View;
    array-length v5, v4

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v5, :cond_2

    aget-object v9, v4, v8

    .line 284
    .local v9, "action":Landroid/view/View;
    invoke-virtual {v9, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 283
    .end local v9    # "action":Landroid/view/View;
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 286
    :cond_2
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvReviews:Landroid/widget/TextView;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda32;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda32;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda33;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda33;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    const v5, 0x7f0a01b7

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    .line 289
    const v5, 0x7f0a00af

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    .line 290
    const v5, 0x7f0a01dd

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    .line 291
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    instance-of v8, v5, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    if-eqz v8, :cond_3

    .line 292
    check-cast v5, Landroid/widget/LinearLayout;

    .line 293
    .local v5, "discovery":Landroid/widget/LinearLayout;
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 294
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    invoke-virtual {v5, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 295
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 296
    .local v8, "params":Landroid/widget/LinearLayout$LayoutParams;
    iput v2, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 297
    iget-object v9, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    invoke-virtual {v9, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    .end local v5    # "discovery":Landroid/widget/LinearLayout;
    .end local v8    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_3
    const v5, 0x7f0a0189

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 300
    invoke-virtual {v5, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 301
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v8, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v9, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v8, v9, v2, v2}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v5, v8}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 302
    new-instance v5, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    invoke-direct {v5}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;-><init>()V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    .line 303
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v8, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 304
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda8;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda8;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemClickListener;)V

    .line 308
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$1;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$1;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 322
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda17;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda17;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnInBorderKeyEventListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnInBorderKeyEventListener;)V

    .line 335
    const v5, 0x7f0a018a

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 336
    invoke-virtual {v5, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 337
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v8, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v9, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v8, v9, v2, v2}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v5, v8}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 338
    new-instance v5, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    invoke-direct {v5}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;-><init>()V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    .line 339
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v8, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 340
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda9;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda9;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemClickListener;)V

    .line 344
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$2;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$2;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 363
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v8, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda18;

    invoke-direct {v8, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda18;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v8}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnInBorderKeyEventListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnInBorderKeyEventListener;)V

    .line 375
    const v5, 0x7f0a017e

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mEmptyPlayList:Landroid/widget/LinearLayout;

    .line 376
    const v5, 0x7f0a0182

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 377
    const v5, 0x7f0a00c7

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/core/widget/NestedScrollView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    .line 378
    const v5, 0x7f0a0292

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvEpisodeDetailTitle:Landroid/widget/TextView;

    .line 379
    const v5, 0x7f0a0290

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvEpisodeDetailMeta:Landroid/widget/TextView;

    .line 380
    const v5, 0x7f0a0291

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvEpisodeDetailOverview:Landroid/widget/TextView;

    .line 382
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v5, v3}, Landroidx/core/widget/NestedScrollView;->setVisibility(I)V

    .line 383
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    new-instance v5, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda7;

    invoke-direct {v5, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda7;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v3, v5}, Landroidx/core/widget/NestedScrollView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 403
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v3, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 404
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    if-ne v3, v1, :cond_4

    const/4 v3, 0x1

    goto :goto_2

    :cond_4
    const/4 v3, 0x0

    .line 406
    .local v3, "portrait":Z
    :goto_2
    new-instance v5, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_5

    goto :goto_3

    :cond_5
    const/4 v6, 0x5

    :goto_3
    invoke-direct {v5, v8, v6}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;-><init>(Landroid/content/Context;I)V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    .line 407
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v6, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 410
    new-instance v5, Lcom/github/tvbox/osc/ui/activity/DetailActivity$3;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v5, p0, v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$3;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/content/Context;)V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->smoothScroller:Landroidx/recyclerview/widget/LinearSmoothScroller;

    .line 421
    new-instance v5, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    invoke-direct {v5, v6}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;-><init>(Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;)V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    .line 422
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v6, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 423
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    new-instance v6, Lcom/github/tvbox/osc/ui/activity/DetailActivity$4;

    invoke-direct {v6, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$4;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v6}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->setOnItemLongClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemLongClickListener;)V

    .line 430
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v6, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda16;

    invoke-direct {v6, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda16;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v5, v6}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnInBorderKeyEventListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnInBorderKeyEventListener;)V

    .line 432
    const v5, 0x7f0a0184

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 433
    invoke-virtual {v5, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 434
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v6, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7, v2, v2}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v5, v6}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 435
    new-instance v5, Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    invoke-direct {v5}, Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;-><init>()V

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    .line 436
    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v6, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 437
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isReverse:Z

    .line 438
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstReverse:Z

    .line 439
    const-string v5, ""

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->preFlag:Ljava/lang/String;

    .line 440
    iget-boolean v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v5, :cond_6

    .line 441
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ensurePlayFragment()V

    .line 442
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlay:Landroid/widget/TextView;

    const-string v6, "\u5168\u5c4f"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 444
    :cond_6
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    iget-boolean v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    invoke-virtual {v5, v6}, Landroid/view/View;->setFocusable(Z)V

    .line 445
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    sget-object v6, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda5;->INSTANCE:Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda5;

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 448
    const v5, 0x7f0a0190

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mSeriesGroupView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 449
    const v5, 0x7f0a018f

    invoke-virtual {p0, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    .line 450
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mSeriesGroupView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v5, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 451
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mSeriesGroupView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v5, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v5, v6, v2, v2}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v1, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 452
    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$5;

    const v2, 0x7f0d007e

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    invoke-direct {v1, p0, v2, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$5;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;ILjava/util/List;)V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupAdapter:Lcom/chad/library/adapter/base/BaseQuickAdapter;

    .line 465
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mSeriesGroupView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 466
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->portraitMode:Z

    if-eqz v1, :cond_7

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->applyPortraitDetailLayout()V

    .line 468
    :cond_7
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda31;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda31;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 476
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlay:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$6;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$6;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 492
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvQuickSearch:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$7;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$7;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 523
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvCollect:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$8;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$8;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 540
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlayUrl:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$9;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$9;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 552
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesSort:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$10;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$10;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 574
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDesc:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$11;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$11;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 590
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$12;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$12;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 607
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 665
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$14;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$14;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemClickListener;)V

    .line 707
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mSeriesGroupView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 733
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesSort:Landroid/widget/TextView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda4;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 748
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupAdapter:Lcom/chad/library/adapter/base/BaseQuickAdapter;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$16;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$16;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemClickListener;)V

    .line 768
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v1, :cond_8

    .line 769
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    goto :goto_4

    .line 771
    :cond_8
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlay:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->requestFocus()Z

    .line 773
    :goto_4
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setLoadSir(Landroid/view/View;)V

    .line 774
    return-void
.end method

.method private initViewModel()V
    .locals 2

    .line 1761
    new-instance v0, Landroidx/lifecycle/ViewModelProvider;

    invoke-direct {v0, p0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v1, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    .line 1762
    iget-object v0, v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->detailResult:Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$19;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$19;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v0, p0, v1}, Landroidx/lifecycle/MutableLiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 1873
    return-void
.end method

.method private insertVod(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 3
    .param p1, "sourceKey"    # Ljava/lang/String;
    .param p2, "vodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceKey",
            "vodInfo"
        }
    .end annotation

    .line 2233
    :try_start_0
    iget-object v0, p2, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, p2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iget v1, p2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    iput-object v0, p2, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2236
    goto :goto_0

    .line 2234
    :catchall_0
    move-exception v0

    .line 2235
    .local v0, "th":Ljava/lang/Throwable;
    const-string v1, ""

    iput-object v1, p2, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    .line 2237
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    invoke-static {p1, p2}, Lcom/github/tvbox/osc/cache/RoomDataManger;->insertVodRecord(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V

    .line 2238
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/event/RefreshEvent;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 2239
    return-void
.end method

.method private isCurrentPreviewPlaying(I)Z
    .locals 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 2157
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_6

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 2160
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    if-eq v0, p1, :cond_1

    goto :goto_1

    .line 2163
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 2164
    .local v0, "currentList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v0, :cond_4

    if-ltz p1, :cond_4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lt p1, v2, :cond_2

    goto :goto_0

    .line 2167
    :cond_2
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 2168
    .local v2, "currentSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getPlayingSeries(Lcom/github/tvbox/osc/bean/VodInfo;Ljava/lang/String;)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v3

    .line 2169
    .local v3, "previewSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    if-eqz v2, :cond_3

    if-eqz v3, :cond_3

    iget-object v4, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    .line 2165
    .end local v2    # "currentSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v3    # "previewSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    :cond_4
    :goto_0
    return v1

    .line 2161
    .end local v0    # "currentList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_5
    :goto_1
    return v1

    .line 2158
    :cond_6
    :goto_2
    return v1
.end method

.method private jumpToPlay()V
    .locals 6

    .line 1409
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 1410
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->preFlag:Ljava/lang/String;

    .line 1412
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlayUrl:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    const-string v2, "\u64ad\u653e\u5730\u5740\uff1a"

    invoke-direct {p0, v0, v2, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 1413
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1415
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstsourceKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->insertVod(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V

    .line 1417
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceKey:Ljava/lang/String;

    const-string v2, "sourceKey"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1419
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/base/App;->setVodInfo(Lcom/github/tvbox/osc/bean/VodInfo;)V

    .line 1420
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v1, :cond_2

    .line 1421
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ensurePlayFragment()V

    .line 1422
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v1, :cond_0

    .line 1424
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1425
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1426
    .local v2, "oos":Ljava/io/ObjectOutputStream;
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-virtual {v2, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1427
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 1428
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    .line 1429
    new-instance v3, Ljava/io/ObjectInputStream;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v3, v4}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1430
    .local v3, "ois":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo;

    iput-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1433
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_0

    .line 1431
    :catch_0
    move-exception v1

    .line 1432
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1435
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_1

    .line 1436
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    iput-object v2, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    .line 1437
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    iput-object v2, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 1438
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    iput v2, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 1439
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iput-object v2, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    .line 1441
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->getInstance()Lcom/github/tvbox/osc/base/App;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->previewVodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/base/App;->setVodInfo(Lcom/github/tvbox/osc/bean/VodInfo;)V

    .line 1443
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v1, :cond_4

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setData(Landroid/os/Bundle;)V

    goto :goto_1

    .line 1445
    :cond_2
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ensurePlayFragment()V

    .line 1446
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v1, :cond_3

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setData(Landroid/os/Bundle;)V

    .line 1447
    :cond_3
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->enterFullPreview()V

    .line 1450
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_4
    :goto_1
    return-void
.end method

.method static synthetic lambda$init$1()V
    .locals 0

    .line 209
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull()V

    return-void
.end method

.method static synthetic lambda$initView$12(Landroid/view/View;Z)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "hasFocus"    # Z

    .line 446
    const v0, 0x3f828f5c    # 1.02f

    invoke-static {p0, p1, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    return-void
.end method

.method static synthetic lambda$initView$3(Landroid/view/View;Z)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "hasFocus"    # Z

    .line 281
    const v0, 0x3f847ae1    # 1.035f

    invoke-static {p0, p1, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    return-void
.end method

.method static synthetic lambda$requestFirstItemFocus$26(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;)V
    .locals 2
    .param p0, "target"    # Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 1359
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelection(I)V

    .line 1360
    invoke-virtual {p0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 1361
    :cond_0
    invoke-virtual {p0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    :goto_0
    nop

    .line 1362
    .local v0, "first":Landroid/view/View;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->isFocusable()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    goto :goto_1

    .line 1363
    :cond_1
    invoke-virtual {p0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->requestFocus()Z

    .line 1364
    :goto_1
    return-void
.end method

.method private loadBackdrop(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "url",
            "title"
        }
    .end annotation

    .line 875
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ivBackdrop:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 876
    :cond_0
    invoke-static {p1}, Lcom/github/tvbox/osc/util/DefaultConfig;->checkReplaceProxy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->ivBackdrop:Landroid/widget/ImageView;

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    const/high16 v4, 0x44200000    # 640.0f

    .line 877
    invoke-static {v0, v4}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v4

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    const/high16 v5, 0x43b40000    # 360.0f

    invoke-static {v0, v5}, Lme/jessyan/autosize/utils/AutoSizeUtils;->mm2px(Landroid/content/Context;F)I

    move-result v5

    .line 876
    move-object v6, p2

    invoke-static/range {v1 .. v6}, Lcom/github/tvbox/osc/util/ImgUtil;->load(Ljava/lang/String;Landroid/widget/ImageView;IIILjava/lang/String;)V

    .line 878
    return-void

    .line 875
    :cond_1
    :goto_0
    return-void
.end method

.method private loadDetail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "vid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "vid",
            "key"
        }
    .end annotation

    .line 1895
    if-eqz p1, :cond_7

    .line 1896
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    .line 1897
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    .line 1898
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    const/16 v1, 0x8

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1899
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1900
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    if-eqz v0, :cond_2

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1901
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    if-eqz v0, :cond_3

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1902
    :cond_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    if-eqz v0, :cond_4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->setNewData(Ljava/util/List;)V

    .line 1903
    :cond_4
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    if-eqz v0, :cond_5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;->setNewData(Ljava/util/List;)V

    .line 1904
    :cond_5
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestStableDetailLayout()V

    .line 1905
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodId:Ljava/lang/String;

    .line 1906
    iput-object p2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceKey:Ljava/lang/String;

    .line 1907
    iput-object p2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstsourceKey:Ljava/lang/String;

    .line 1908
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showLoading()V

    .line 1909
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->getDetail(Ljava/lang/String;Ljava/lang/String;)V

    .line 1910
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceKey:Ljava/lang/String;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/cache/RoomDataManger;->isVodCollect(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 1911
    .local v0, "isVodCollect":Z
    if-eqz v0, :cond_6

    .line 1912
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvCollect:Landroid/widget/TextView;

    const-string v2, "\u53d6\u6d88\u6536\u85cf"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1914
    :cond_6
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvCollect:Landroid/widget/TextView;

    const-string v2, "\u52a0\u5165\u6536\u85cf"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1917
    .end local v0    # "isVodCollect":Z
    :cond_7
    :goto_0
    return-void
.end method

.method private loadRichMetadata()V
    .locals 6

    .line 881
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    .line 882
    .local v0, "requestGeneration":I
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 889
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    .line 890
    .local v1, "requestedMetadataName":Ljava/lang/String;
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget v2, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->year:I

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detectSeasonNumber()I

    move-result v3

    .line 891
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detectMetadataMediaType()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda14;

    invoke-direct {v5, p0, v0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda14;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;ILjava/lang/String;)V

    .line 890
    invoke-static {v1, v2, v3, v4, v5}, Lcom/github/tvbox/osc/sync/MetadataClient;->title(Ljava/lang/String;IILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 929
    return-void

    .line 883
    .end local v1    # "requestedMetadataName":Ljava/lang/String;
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 884
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 885
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 886
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestStableDetailLayout()V

    .line 887
    return-void
.end method

.method private normalizeEpisodeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 2198
    const-string v0, ""

    if-nez p1, :cond_0

    .line 2199
    return-object v0

    .line 2201
    :cond_0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 2202
    const-string v2, "\\s+"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2203
    const-string v2, "[\\[\\]\u3010\u3011()\uff08\uff09]"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2204
    const-string v2, "\u7b2c"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 2205
    const-string v2, "\u96c6"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 2206
    const-string v2, "\u8bdd"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 2207
    const-string v2, "\u671f"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 2201
    return-object v0
.end method

.method private openOrganizationWorks(Lcom/github/tvbox/osc/sync/MetadataClient$Organization;)V
    .locals 3
    .param p1, "entity"    # Lcom/github/tvbox/osc/sync/MetadataClient$Organization;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entity"
        }
    .end annotation

    .line 962
    if-eqz p1, :cond_1

    iget v0, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->id:I

    if-lez v0, :cond_1

    iget-object v0, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->kind:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 963
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 964
    .local v0, "bundle":Landroid/os/Bundle;
    iget v1, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->id:I

    const-string v2, "organizationId"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 965
    iget-object v1, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->kind:Ljava/lang/String;

    const-string v2, "organizationKind"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 966
    iget-object v1, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->name:Ljava/lang/String;

    const-string v2, "organizationName"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 967
    iget-object v1, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->label:Ljava/lang/String;

    const-string v2, "organizationLabel"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 968
    iget-object v1, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->logo_url:Ljava/lang/String;

    const-string v2, "organizationLogo"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 969
    const-class v1, Lcom/github/tvbox/osc/ui/activity/PersonWorksActivity;

    invoke-virtual {p0, v1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->jumpActivity(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 970
    return-void

    .line 962
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_1
    :goto_0
    return-void
.end method

.method private openPersonByName(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 816
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 817
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    if-eqz v0, :cond_2

    .line 818
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/MetadataPerson;

    .line 819
    .local v1, "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    if-eqz v1, :cond_1

    iget-object v2, v1, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-direct {p0, p1, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->samePersonName(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 820
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openPersonMetadata(Lcom/github/tvbox/osc/bean/MetadataPerson;)V

    .line 821
    return-void

    .line 823
    .end local v1    # "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    :cond_1
    goto :goto_0

    .line 825
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/sync/MetadataClient;->available()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 826
    const-string v0, "\u9700\u8981\u8fde\u63a5\u7eed\u6620\u670d\u52a1\u7aef\u624d\u80fd\u67e5\u8be2\u5f71\u4eba\u4f5c\u54c1"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 827
    return-void

    .line 829
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u6b63\u5728\u5339\u914d\u5f71\u4eba\uff1a"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 830
    new-instance v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda15;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/github/tvbox/osc/sync/MetadataClient;->personSearch(Ljava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 859
    return-void
.end method

.method private openPersonMetadata(Lcom/github/tvbox/osc/bean/MetadataPerson;)V
    .locals 2
    .param p1, "person"    # Lcom/github/tvbox/osc/bean/MetadataPerson;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "person"
        }
    .end annotation

    .line 1072
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6b63\u5728\u8bfb\u53d6 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u7684\u8d44\u6599"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1073
    iget v0, p1, Lcom/github/tvbox/osc/bean/MetadataPerson;->id:I

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda13;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/sync/MetadataClient;->person(ILcom/github/tvbox/osc/sync/MetadataClient$Result;)V

    .line 1082
    return-void
.end method

.method private openRecommendation(Lcom/github/tvbox/osc/sync/MetadataClient$Work;)V
    .locals 3
    .param p1, "work"    # Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "work"
        }
    .end annotation

    .line 869
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 870
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p1, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->title:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 871
    const-class v1, Lcom/github/tvbox/osc/ui/activity/FastSearchActivity;

    invoke-virtual {p0, v1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->jumpActivity(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 872
    return-void
.end method

.method private openWorkSearch(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 810
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 811
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    const-class v1, Lcom/github/tvbox/osc/ui/activity/FastSearchActivity;

    invoke-virtual {p0, v1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->jumpActivity(Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 813
    return-void
.end method

.method private portraitPx(I)I
    .locals 2
    .param p1, "dp"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dp"
        }
    .end annotation

    .line 1334
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private removeHtmlTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "info"
        }
    .end annotation

    .line 1535
    const-string v0, ""

    if-nez p1, :cond_0

    .line 1536
    return-object v0

    .line 1537
    :cond_0
    const-string v1, "\\<.*?\\>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\s"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private requestDiscoveryFocus()Z
    .locals 2

    .line 1195
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1194
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    if-eqz v0, :cond_0

    .line 1195
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1196
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    goto :goto_0

    .line 1198
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 1197
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    if-eqz v0, :cond_1

    .line 1198
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1199
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    nop

    .line 1200
    .local v0, "target":Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    if-nez v0, :cond_2

    const/4 v1, 0x0

    return v1

    .line 1201
    :cond_2
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestFirstItemFocus(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;)V

    .line 1202
    const/4 v1, 0x1

    return v1
.end method

.method private requestEpisodeDetailFocus()Z
    .locals 2

    .line 1206
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/core/widget/NestedScrollView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 1207
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda21;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda21;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->post(Ljava/lang/Runnable;)Z

    .line 1213
    const/4 v0, 0x1

    return v0

    .line 1215
    :cond_0
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestDiscoveryFocus()Z

    move-result v0

    return v0
.end method

.method private requestFirstItemFocus(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;)V
    .locals 1
    .param p1, "target"    # Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 1356
    if-nez p1, :cond_0

    return-void

    .line 1357
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->scrollToPosition(I)V

    .line 1358
    new-instance v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda25;

    invoke-direct {v0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda25;-><init>(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;)V

    invoke-virtual {p1, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 1365
    return-void
.end method

.method private requestSeriesItemFocus(I)V
    .locals 1
    .param p1, "preferredPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "preferredPosition"
        }
    .end annotation

    .line 1382
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(II)V

    .line 1383
    return-void
.end method

.method private requestSeriesItemFocus(II)V
    .locals 6
    .param p1, "preferredPosition"    # I
    .param p2, "retries"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "preferredPosition",
            "retries"
        }
    .end annotation

    .line 1386
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    if-eqz v0, :cond_3

    .line 1387
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1388
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1389
    .local v0, "safePosition":I
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->stopScroll()V

    .line 1390
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelectedPosition(I)V

    .line 1391
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    invoke-virtual {v2, v0}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v2

    .line 1392
    .local v2, "item":Landroid/view/View;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Landroid/view/View;->isFocusable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1393
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    goto :goto_0

    .line 1394
    :cond_1
    if-lez p2, :cond_2

    .line 1395
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    invoke-virtual {v3, v0, v1}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;->scrollToPositionWithOffset(II)V

    .line 1396
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v3, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda23;

    invoke-direct {v3, p0, v0, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda23;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;II)V

    const-wide/16 v4, 0x3c

    invoke-virtual {v1, v3, v4, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 1398
    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->requestFocus()Z

    .line 1400
    :goto_0
    return-void

    .line 1387
    .end local v0    # "safePosition":I
    .end local v2    # "item":Landroid/view/View;
    :cond_3
    :goto_1
    return-void
.end method

.method private requestStableDetailLayout()V
    .locals 4

    .line 973
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    if-nez v0, :cond_0

    return-void

    .line 974
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailRelayout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 975
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailRelayout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->post(Ljava/lang/Runnable;)Z

    .line 976
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailRelayout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x78

    invoke-virtual {v0, v1, v2, v3}, Landroidx/core/widget/NestedScrollView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 977
    return-void
.end method

.method private reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;
    .locals 4
    .param p1, "parent"    # Landroid/widget/LinearLayout;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "color"    # I
    .param p4, "sizeSp"    # I
    .param p5, "bold"    # Z
    .param p6, "topDp"    # I
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
            "parent",
            "text",
            "color",
            "sizeSp",
            "bold",
            "topDp"
        }
    .end annotation

    .line 1649
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1650
    .local v0, "view":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1651
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1652
    int-to-float v1, p4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1653
    if-eqz p5, :cond_0

    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1654
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1656
    .local v1, "params":Landroid/widget/LinearLayout$LayoutParams;
    int-to-float v2, p6

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    mul-float v2, v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1657
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1658
    return-object v0
.end method

.method private reviewSourceColor(Ljava/lang/String;)I
    .locals 2
    .param p1, "source"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .line 1641
    const/4 v0, -0x1

    if-nez p1, :cond_0

    return v0

    .line 1642
    :cond_0
    const-string v1, "TMDB"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const v0, -0xfe4b1c

    return v0

    .line 1643
    :cond_1
    const-string v1, "Trakt"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const v0, -0x12bdbb

    return v0

    .line 1644
    :cond_2
    const-string v1, "NeoDB"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "\u6211"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 1645
    :cond_3
    return v0

    .line 1644
    :cond_4
    :goto_0
    const v0, -0x573806

    return v0
.end method

.method private samePersonName(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p1, "left"    # Ljava/lang/String;
    .param p2, "right"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "left",
            "right"
        }
    .end annotation

    .line 862
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_0

    .line 863
    :cond_0
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "[\\s\u00b7\u30fb._-]+"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 864
    .local v1, "a":Ljava/lang/String;
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 865
    .local v2, "b":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 862
    .end local v1    # "a":Ljava/lang/String;
    .end local v2    # "b":Ljava/lang/String;
    :cond_2
    :goto_0
    return v0
.end method

.method private searchData(Lcom/github/tvbox/osc/bean/AbsXml;)V
    .locals 5
    .param p1, "absXml"    # Lcom/github/tvbox/osc/bean/AbsXml;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "absXml"
        }
    .end annotation

    .line 2072
    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/github/tvbox/osc/bean/AbsXml;->movie:Lcom/github/tvbox/osc/bean/Movie;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/github/tvbox/osc/bean/AbsXml;->movie:Lcom/github/tvbox/osc/bean/Movie;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/Movie;->videoList:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/github/tvbox/osc/bean/AbsXml;->movie:Lcom/github/tvbox/osc/bean/Movie;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/Movie;->videoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 2073
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2074
    .local v0, "data":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    iget-object v1, p1, Lcom/github/tvbox/osc/bean/AbsXml;->movie:Lcom/github/tvbox/osc/bean/Movie;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/Movie;->videoList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/Movie$Video;

    .line 2076
    .local v2, "video":Lcom/github/tvbox/osc/bean/Movie$Video;
    iget-object v3, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->sourceKey:Ljava/lang/String;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->sourceKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, v2, Lcom/github/tvbox/osc/bean/Movie$Video;->id:Ljava/lang/String;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2077
    goto :goto_0

    .line 2078
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2079
    .end local v2    # "video":Lcom/github/tvbox/osc/bean/Movie$Video;
    goto :goto_0

    .line 2080
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchData:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 2081
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/event/RefreshEvent;

    const/4 v3, 0x2

    invoke-direct {v2, v3, v0}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 2083
    .end local v0    # "data":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    :cond_2
    return-void
.end method

.method private searchResult()V
    .locals 7

    .line 2031
    :try_start_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 2032
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 2033
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2037
    :cond_0
    goto :goto_0

    .line 2035
    :catchall_0
    move-exception v0

    .line 2036
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2038
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 2039
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2040
    .local v0, "searchRequestList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/SourceBean;>;"
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getSourceBeanList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 2043
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->embyAvailable()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2044
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    const-string v2, "continuebox_emby"

    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getSource(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v1

    .line 2045
    .local v1, "emby":Lcom/github/tvbox/osc/bean/SourceBean;
    if-eqz v1, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2047
    .end local v1    # "emby":Lcom/github/tvbox/osc/bean/SourceBean;
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v1

    .line 2048
    .local v1, "home":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2049
    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 2051
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2052
    .local v2, "siteKey":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/SourceBean;

    .line 2053
    .local v4, "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    invoke-virtual {v4}, Lcom/github/tvbox/osc/bean/SourceBean;->isSearchable()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v4}, Lcom/github/tvbox/osc/bean/SourceBean;->isQuickSearch()Z

    move-result v5

    if-nez v5, :cond_3

    .line 2054
    goto :goto_1

    .line 2056
    :cond_3
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mCheckSources:Ljava/util/HashMap;

    if-eqz v5, :cond_4

    invoke-virtual {v4}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 2057
    goto :goto_1

    .line 2059
    :cond_4
    invoke-virtual {v4}, Lcom/github/tvbox/osc/bean/SourceBean;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2060
    .end local v4    # "bean":Lcom/github/tvbox/osc/bean/SourceBean;
    goto :goto_1

    .line 2061
    :cond_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 2062
    .local v4, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v6, Lcom/github/tvbox/osc/ui/activity/DetailActivity$20;

    invoke-direct {v6, p0, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$20;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 2068
    .end local v4    # "key":Ljava/lang/String;
    goto :goto_2

    .line 2069
    :cond_6
    return-void
.end method

.method private setPreviewRoundClip(Z)V
    .locals 2
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enable"
        }
    .end annotation

    .line 1565
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 1566
    return-void

    .line 1568
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentContainerView;->setClipToOutline(Z)V

    .line 1569
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 1570
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    if-eqz p1, :cond_1

    const v1, 0x7f080142

    goto :goto_0

    :cond_1
    const v1, 0x106000c

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentContainerView;->setBackgroundResource(I)V

    .line 1571
    return-void
.end method

.method private setSeriesGroupOptions()V
    .locals 13

    .line 1491
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1492
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 1493
    .local v1, "listSize":I
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    invoke-virtual {v2}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;->getSpanCount()I

    move-result v2

    .line 1494
    .local v2, "offset":I
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1495
    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    const/4 v3, 0x6

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/16 v3, 0x14

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v3, 0x1e

    :goto_1
    iput v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    .line 1496
    const/16 v3, 0x64

    const/16 v4, 0x190

    if-le v1, v3, :cond_2

    if-gt v1, v4, :cond_2

    const/16 v3, 0x3c

    iput v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    .line 1497
    :cond_2
    if-le v1, v4, :cond_3

    const/16 v3, 0x78

    iput v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    .line 1498
    :cond_3
    const/4 v3, 0x1

    if-le v1, v3, :cond_8

    .line 1499
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1500
    iget v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    rem-int v6, v1, v4

    .line 1501
    .local v6, "remainedOptionSize":I
    div-int v4, v1, v4

    .line 1503
    .local v4, "optionSize":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    const/4 v8, 0x2

    const-string v9, "%d - %d"

    if-ge v7, v4, :cond_5

    .line 1504
    iget-object v10, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-boolean v10, v10, Lcom/github/tvbox/osc/bean/VodInfo;->reverseSort:Z

    if-eqz v10, :cond_4

    .line 1506
    iget-object v10, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    new-array v8, v8, [Ljava/lang/Object;

    iget v11, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v11, v11, v7

    add-int/2addr v11, v3

    sub-int v11, v1, v11

    add-int/2addr v11, v3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v5

    iget v11, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v12, v7, v11

    add-int/2addr v12, v11

    sub-int v11, v1, v12

    add-int/2addr v11, v3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v3

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1508
    :cond_4
    iget-object v10, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    new-array v8, v8, [Ljava/lang/Object;

    iget v11, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v11, v11, v7

    add-int/2addr v11, v3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v5

    iget v11, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v12, v7, v11

    add-int/2addr v12, v11

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v3

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1503
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1510
    .end local v7    # "i":I
    :cond_5
    if-lez v6, :cond_7

    .line 1511
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-boolean v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->reverseSort:Z

    if-eqz v7, :cond_6

    .line 1513
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    new-array v8, v8, [Ljava/lang/Object;

    iget v10, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v10, v10, v4

    add-int/2addr v10, v3

    sub-int v10, v1, v10

    add-int/2addr v10, v3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v5

    iget v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v5, v5, v4

    add-int/2addr v5, v6

    sub-int v5, v1, v5

    add-int/2addr v5, v3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v8, v3

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 1515
    :cond_6
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupOptions:Ljava/util/ArrayList;

    new-array v8, v8, [Ljava/lang/Object;

    iget v10, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v10, v10, v4

    add-int/2addr v10, v3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v5

    iget v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->GroupCount:I

    mul-int v5, v5, v4

    add-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v8, v3

    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1519
    :cond_7
    :goto_4
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesGroupAdapter:Lcom/chad/library/adapter/base/BaseQuickAdapter;

    invoke-virtual {v3}, Lcom/chad/library/adapter/base/BaseQuickAdapter;->notifyDataSetChanged()V

    .line 1520
    .end local v4    # "optionSize":I
    .end local v6    # "remainedOptionSize":I
    goto :goto_5

    .line 1521
    :cond_8
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1523
    :goto_5
    return-void
.end method

.method private setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "tag",
            "info"
        }
    .end annotation

    .line 1526
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1530
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1531
    invoke-direct {p0, p2, p3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getHtml(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1532
    return-void

    .line 1527
    :cond_1
    :goto_0
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1528
    return-void
.end method

.method private setTvPlayUrl(Ljava/lang/String;)V
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

    .line 2404
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvPlayUrl:Landroid/widget/TextView;

    const-string v1, "\u64ad\u653e\u5730\u5740\uff1a"

    invoke-direct {p0, v0, v1, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 2405
    return-void
.end method

.method private setViewHeight(Landroid/view/View;I)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "dp"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "dp"
        }
    .end annotation

    .line 1338
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1339
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1340
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->portraitPx(I)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1341
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1342
    return-void

    .line 1338
    .end local v0    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_1
    :goto_0
    return-void
.end method

.method private showEpisodeDetailDialog(I)V
    .locals 20
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 1219
    move-object/from16 v10, p0

    iget-object v0, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_7

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_7

    iget-object v0, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 1220
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move/from16 v12, p1

    goto/16 :goto_4

    .line 1221
    :cond_0
    iget-object v0, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Ljava/util/List;

    .line 1222
    .local v11, "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v11, :cond_6

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    move/from16 v12, p1

    goto/16 :goto_3

    .line 1223
    :cond_1
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    move/from16 v12, p1

    invoke-static {v12, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v3, 0x0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 1224
    .local v13, "safe":I
    invoke-interface {v11, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 1225
    .local v14, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iget-object v0, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->displayName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->displayName:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object v0, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    :goto_0
    move-object v15, v0

    .line 1226
    .local v15, "title":Ljava/lang/String;
    iget-object v0, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    invoke-direct {v10, v0, v13}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeNumber(Ljava/lang/String;I)I

    move-result v9

    .line 1227
    .local v9, "number":I
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u7b2c"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\u96c6"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    goto :goto_1

    :cond_3
    move-object v2, v15

    .line 1228
    .local v2, "safeTitle":Ljava/lang/String;
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u7b2c "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " \u96c6"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1229
    .local v0, "meta":Ljava/lang/String;
    iget-object v4, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->detailAirDate:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "   \u00b7   "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->detailAirDate:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_4
    move-object/from16 v16, v0

    .line 1231
    .end local v0    # "meta":Ljava/lang/String;
    .local v16, "meta":Ljava/lang/String;
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v4, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v4}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    move-object v8, v0

    .line 1232
    .local v8, "scroll":Landroid/widget/ScrollView;
    invoke-virtual {v8, v3}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 1233
    invoke-virtual {v8, v1}, Landroid/widget/ScrollView;->setSmoothScrollingEnabled(Z)V

    .line 1234
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v7, v0

    .line 1235
    .local v7, "box":Landroid/widget/LinearLayout;
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1236
    const/high16 v0, 0x41a00000    # 20.0f

    invoke-virtual/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v1, v1, v0

    float-to-int v6, v1

    .line 1237
    .local v6, "pad":I
    invoke-virtual {v7, v6, v6, v6, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1238
    const v0, 0x7f080055

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 1239
    const/4 v3, -0x1

    const/16 v4, 0x14

    const/4 v5, 0x1

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object v1, v7

    move/from16 v18, v6

    .end local v6    # "pad":I
    .local v18, "pad":I
    move/from16 v6, v17

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1240
    const v6, -0x573806

    const/16 v0, 0xd

    const/4 v1, 0x0

    const/16 v17, 0x8

    move-object/from16 v3, p0

    move-object v4, v7

    move-object/from16 v5, v16

    move-object/from16 v19, v7

    .end local v7    # "box":Landroid/widget/LinearLayout;
    .local v19, "box":Landroid/widget/LinearLayout;
    move v7, v0

    move-object v0, v8

    .end local v8    # "scroll":Landroid/widget/ScrollView;
    .local v0, "scroll":Landroid/widget/ScrollView;
    move v8, v1

    move v1, v9

    .end local v9    # "number":I
    .local v1, "number":I
    move/from16 v9, v17

    invoke-direct/range {v3 .. v9}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1241
    iget-object v3, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->detailOverview:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1242
    const-string v3, "\u6682\u65e0\u672c\u96c6\u7b80\u4ecb\uff0c\u64ad\u653e\u4e0d\u53d7\u5f71\u54cd\u3002"

    goto :goto_2

    :cond_5
    iget-object v3, v14, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->detailOverview:Ljava/lang/String;

    :goto_2
    move-object v5, v3

    const v6, -0x383126

    const/16 v7, 0xf

    const/4 v8, 0x0

    const/16 v9, 0xe

    .line 1241
    move-object/from16 v3, p0

    move-object/from16 v4, v19

    invoke-direct/range {v3 .. v9}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1244
    move-object/from16 v3, v19

    .end local v19    # "box":Landroid/widget/LinearLayout;
    .local v3, "box":Landroid/widget/LinearLayout;
    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1245
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1246
    const-string v5, "\u5206\u96c6\u8be6\u60c5"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1247
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/4 v5, 0x0

    .line 1248
    const-string v6, "\u5173\u95ed"

    invoke-virtual {v4, v6, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1249
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 1250
    .local v4, "dialog":Landroid/app/AlertDialog;
    new-instance v5, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda29;

    invoke-direct {v5, v10, v4, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda29;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/app/AlertDialog;Landroid/widget/ScrollView;)V

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 1265
    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 1266
    return-void

    .line 1222
    .end local v0    # "scroll":Landroid/widget/ScrollView;
    .end local v1    # "number":I
    .end local v2    # "safeTitle":Ljava/lang/String;
    .end local v3    # "box":Landroid/widget/LinearLayout;
    .end local v4    # "dialog":Landroid/app/AlertDialog;
    .end local v13    # "safe":I
    .end local v14    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v15    # "title":Ljava/lang/String;
    .end local v16    # "meta":Ljava/lang/String;
    .end local v18    # "pad":I
    :cond_6
    move/from16 v12, p1

    :goto_3
    return-void

    .line 1219
    .end local v11    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_7
    move/from16 v12, p1

    .line 1220
    :goto_4
    return-void
.end method

.method private showOrganizationChoices()V
    .locals 6

    .line 948
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 949
    :cond_0
    const/16 v0, 0xc

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 950
    .local v0, "count":I
    new-array v1, v0, [Ljava/lang/String;

    .line 951
    .local v1, "labels":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 952
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;

    .line 953
    .local v3, "entity":Lcom/github/tvbox/osc/sync/MetadataClient$Organization;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v3, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->label:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "\u5173\u8054\u673a\u6784"

    goto :goto_1

    :cond_1
    iget-object v5, v3, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->label:Ljava/lang/String;

    :goto_1
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " \u00b7 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    .line 951
    .end local v3    # "entity":Lcom/github/tvbox/osc/sync/MetadataClient$Organization;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 956
    .end local v2    # "i":I
    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "\u6309\u673a\u6784\u67e5\u770b\u76f8\u5173\u4f5c\u54c1"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    .line 957
    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    .line 958
    const-string v4, "\u53d6\u6d88"

    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 959
    return-void

    .line 948
    .end local v0    # "count":I
    .end local v1    # "labels":[Ljava/lang/String;
    :cond_3
    :goto_2
    return-void
.end method

.method private showPersonDialog(Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;)V
    .locals 32
    .param p1, "metadata"    # Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metadata"
        }
    .end annotation

    .line 1086
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    invoke-virtual/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v9, v0, Landroid/util/DisplayMetrics;->density:F

    .line 1087
    .local v9, "density":F
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    move-object v10, v0

    .line 1088
    .local v10, "scroll":Landroid/widget/ScrollView;
    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 1089
    const/4 v12, 0x1

    invoke-virtual {v10, v12}, Landroid/widget/ScrollView;->setFocusable(Z)V

    .line 1090
    invoke-virtual {v10, v12}, Landroid/widget/ScrollView;->setSmoothScrollingEnabled(Z)V

    .line 1091
    const/high16 v0, 0x20000

    invoke-virtual {v10, v0}, Landroid/widget/ScrollView;->setDescendantFocusability(I)V

    .line 1092
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v13, v0

    .line 1093
    .local v13, "box":Landroid/widget/LinearLayout;
    invoke-virtual {v13, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1094
    const/high16 v0, 0x41a00000    # 20.0f

    mul-float v0, v0, v9

    float-to-int v14, v0

    .line 1095
    .local v14, "pad":I
    div-int/lit8 v0, v14, 0x2

    div-int/lit8 v1, v14, 0x2

    invoke-virtual {v13, v14, v0, v14, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1096
    invoke-virtual {v10, v13}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1099
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v15, v0

    .line 1100
    .local v15, "head":Landroid/widget/LinearLayout;
    invoke-virtual {v15, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1101
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->profile_url:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/high16 v16, 0x40c00000    # 6.0f

    if-nez v0, :cond_0

    .line 1102
    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 1103
    .local v0, "avatar":Landroid/widget/ImageView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x42a80000    # 84.0f

    mul-float v2, v2, v9

    float-to-int v2, v2

    const/high16 v3, 0x42e00000    # 112.0f

    mul-float v3, v3, v9

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1105
    .local v1, "avatarParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v2, 0x41400000    # 12.0f

    mul-float v2, v2, v9

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 1106
    invoke-virtual {v15, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1107
    iget-object v2, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->profile_url:Ljava/lang/String;

    mul-float v3, v9, v16

    float-to-int v3, v3

    invoke-static {v2, v0, v3}, Lcom/github/tvbox/osc/util/ImgUtil;->load(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 1109
    .end local v0    # "avatar":Landroid/widget/ImageView;
    .end local v1    # "avatarParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v6, v0

    .line 1110
    .local v6, "headText":Landroid/widget/LinearLayout;
    invoke-virtual {v6, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object v5, v0

    .line 1112
    .local v5, "birth":Ljava/lang/StringBuilder;
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->birthday:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->birthday:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1113
    :cond_1
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->place_of_birth:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v4, " \u00b7 "

    if-nez v0, :cond_3

    .line 1114
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1115
    :cond_2
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->place_of_birth:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1117
    :cond_3
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_4

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, -0x817666

    const/16 v17, 0xc

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object v1, v6

    move-object/from16 v20, v4

    move/from16 v4, v17

    move-object/from16 v17, v5

    .end local v5    # "birth":Ljava/lang/StringBuilder;
    .local v17, "birth":Ljava/lang/StringBuilder;
    move/from16 v5, v18

    move-object/from16 v18, v6

    .end local v6    # "headText":Landroid/widget/LinearLayout;
    .local v18, "headText":Landroid/widget/LinearLayout;
    move/from16 v6, v19

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    goto :goto_0

    .end local v17    # "birth":Ljava/lang/StringBuilder;
    .end local v18    # "headText":Landroid/widget/LinearLayout;
    .restart local v5    # "birth":Ljava/lang/StringBuilder;
    .restart local v6    # "headText":Landroid/widget/LinearLayout;
    :cond_4
    move-object/from16 v20, v4

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    .line 1118
    .end local v5    # "birth":Ljava/lang/StringBuilder;
    .end local v6    # "headText":Landroid/widget/LinearLayout;
    .restart local v17    # "birth":Ljava/lang/StringBuilder;
    .restart local v18    # "headText":Landroid/widget/LinearLayout;
    :goto_0
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->biography:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "\u6682\u65e0\u4e2d\u6587\u7b80\u4ecb\u3002"

    goto :goto_1

    :cond_5
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->biography:Ljava/lang/String;

    :goto_1
    move-object v2, v0

    const v3, -0x383126

    const/16 v4, 0xd

    const/4 v5, 0x0

    const/4 v6, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1120
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v0, v11, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    move-object/from16 v4, v18

    .end local v18    # "headText":Landroid/widget/LinearLayout;
    .local v4, "headText":Landroid/widget/LinearLayout;
    invoke-virtual {v15, v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1122
    invoke-virtual {v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5168\u90e8\u4f5c\u54c1\uff08"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->works:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\uff09"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    const/16 v18, 0xe

    const/16 v19, 0x1

    const/16 v21, 0xe

    move-object/from16 v0, p0

    move-object v1, v13

    move-object/from16 v22, v4

    .end local v4    # "headText":Landroid/widget/LinearLayout;
    .local v22, "headText":Landroid/widget/LinearLayout;
    move/from16 v4, v18

    move/from16 v5, v19

    move/from16 v6, v21

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1126
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->works:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    .line 1127
    .local v6, "count":I
    const/4 v0, 0x0

    move v5, v0

    .local v5, "i":I
    :goto_2
    if-ge v5, v6, :cond_d

    .line 1128
    iget-object v0, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->works:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/github/tvbox/osc/sync/MetadataClient$Work;

    .line 1129
    .local v4, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v3, v0

    .line 1130
    .local v3, "row":Landroid/widget/LinearLayout;
    invoke-virtual {v3, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1131
    invoke-virtual {v3, v12}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 1132
    invoke-virtual {v3, v12}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 1133
    const v0, 0x7f080072

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 1134
    const/high16 v0, 0x41000000    # 8.0f

    mul-float v0, v0, v9

    float-to-int v2, v0

    .line 1135
    .local v2, "rowPad":I
    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1136
    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    move-object v1, v0

    .line 1137
    .local v1, "poster":Landroid/widget/ImageView;
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v18, 0x42500000    # 52.0f

    mul-float v11, v9, v18

    float-to-int v11, v11

    const/high16 v18, 0x42940000    # 74.0f

    mul-float v12, v9, v18

    float-to-int v12, v12

    invoke-direct {v0, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object v11, v0

    .line 1139
    .local v11, "posterParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v0, 0x41200000    # 10.0f

    mul-float v0, v0, v9

    float-to-int v0, v0

    iput v0, v11, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 1140
    invoke-virtual {v3, v1, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1141
    iget-object v0, v4, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->poster_url:Ljava/lang/String;

    const/high16 v12, 0x40800000    # 4.0f

    mul-float v12, v12, v9

    float-to-int v12, v12

    invoke-static {v0, v1, v12}, Lcom/github/tvbox/osc/util/ImgUtil;->load(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 1142
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v12, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v12, v0

    .line 1143
    .local v12, "info":Landroid/widget/LinearLayout;
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v18, v1

    .end local v1    # "poster":Landroid/widget/ImageView;
    .local v18, "poster":Landroid/widget/ImageView;
    iget-object v1, v4, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v4, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->year:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, ""

    move/from16 v23, v2

    goto :goto_3

    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v23, v2

    .end local v2    # "rowPad":I
    .local v23, "rowPad":I
    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v4, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->year:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 1145
    .local v24, "title":Ljava/lang/String;
    const/16 v25, -0x1

    const/16 v26, 0xe

    const/16 v27, 0x1

    const/16 v28, 0x0

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move-object v1, v12

    move-object/from16 v2, v24

    move-object/from16 v29, v3

    .end local v3    # "row":Landroid/widget/LinearLayout;
    .local v29, "row":Landroid/widget/LinearLayout;
    move/from16 v3, v25

    move-object/from16 v30, v4

    .end local v4    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v30, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    move/from16 v4, v26

    move/from16 v25, v5

    .end local v5    # "i":I
    .local v25, "i":I
    move/from16 v5, v27

    move/from16 v26, v6

    .end local v6    # "count":I
    .local v26, "count":I
    move/from16 v6, v28

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object v6, v0

    .line 1147
    .local v6, "meta":Ljava/lang/StringBuilder;
    move-object/from16 v5, v30

    .end local v30    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v5, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    iget-object v0, v5, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->character:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string v0, "\u9970 "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v5, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->character:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 1148
    :cond_7
    iget-object v0, v5, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->job:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, v5, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->job:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1149
    :cond_8
    :goto_4
    iget-wide v0, v5, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->vote_average:D

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-lez v4, :cond_a

    .line 1150
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_9

    move-object/from16 v4, v20

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    :cond_9
    move-object/from16 v4, v20

    .line 1151
    :goto_5
    const-string v0, "\u8bc4\u5206 "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, v5, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->vote_average:D

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 1149
    :cond_a
    move-object/from16 v4, v20

    .line 1153
    :goto_6
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_b

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, -0x573806

    const/16 v20, 0xc

    const/16 v27, 0x0

    const/16 v28, 0x2

    move-object/from16 v0, p0

    move-object v1, v12

    move-object/from16 v30, v4

    move/from16 v4, v20

    move-object/from16 v31, v5

    .end local v5    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v31, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    move/from16 v5, v27

    move-object/from16 v20, v6

    .end local v6    # "meta":Ljava/lang/StringBuilder;
    .local v20, "meta":Ljava/lang/StringBuilder;
    move/from16 v6, v28

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    goto :goto_7

    .end local v20    # "meta":Ljava/lang/StringBuilder;
    .end local v31    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .restart local v5    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .restart local v6    # "meta":Ljava/lang/StringBuilder;
    :cond_b
    move-object/from16 v30, v4

    move-object/from16 v31, v5

    move-object/from16 v20, v6

    .line 1154
    .end local v5    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .end local v6    # "meta":Ljava/lang/StringBuilder;
    .restart local v20    # "meta":Ljava/lang/StringBuilder;
    .restart local v31    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    :goto_7
    move-object/from16 v6, v31

    .end local v31    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v6, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    iget-object v0, v6, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->overview:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 1155
    iget-object v2, v6, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->overview:Ljava/lang/String;

    const v3, -0x817666

    const/16 v4, 0xc

    const/4 v5, 0x0

    const/16 v27, 0x2

    move-object/from16 v0, p0

    move-object v1, v12

    move-object/from16 v28, v11

    move-object v11, v6

    .end local v6    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v11, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v28, "posterParams":Landroid/widget/LinearLayout$LayoutParams;
    move/from16 v6, v27

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    goto :goto_8

    .line 1154
    .end local v28    # "posterParams":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v6    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v11, "posterParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_c
    move-object/from16 v28, v11

    move-object v11, v6

    .line 1157
    .end local v6    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .local v11, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .restart local v28    # "posterParams":Landroid/widget/LinearLayout$LayoutParams;
    :goto_8
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, -0x2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    move-object/from16 v4, v29

    .end local v29    # "row":Landroid/widget/LinearLayout;
    .local v4, "row":Landroid/widget/LinearLayout;
    invoke-virtual {v4, v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1159
    iget-object v0, v11, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->title:Ljava/lang/String;

    .line 1160
    .local v0, "workTitle":Ljava/lang/String;
    new-instance v5, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda2;

    invoke-direct {v5, v7, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda2;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1161
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1163
    .local v5, "rowParams":Landroid/widget/LinearLayout$LayoutParams;
    mul-float v6, v9, v16

    float-to-int v6, v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1164
    invoke-virtual {v13, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1127
    .end local v0    # "workTitle":Ljava/lang/String;
    .end local v4    # "row":Landroid/widget/LinearLayout;
    .end local v5    # "rowParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v11    # "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    .end local v12    # "info":Landroid/widget/LinearLayout;
    .end local v18    # "poster":Landroid/widget/ImageView;
    .end local v20    # "meta":Ljava/lang/StringBuilder;
    .end local v23    # "rowPad":I
    .end local v24    # "title":Ljava/lang/String;
    .end local v28    # "posterParams":Landroid/widget/LinearLayout$LayoutParams;
    add-int/lit8 v5, v25, 0x1

    move/from16 v6, v26

    move-object/from16 v20, v30

    const/4 v11, 0x0

    const/4 v12, 0x1

    .end local v25    # "i":I
    .local v5, "i":I
    goto/16 :goto_2

    .line 1166
    .end local v5    # "i":I
    .end local v26    # "count":I
    .local v6, "count":I
    :cond_d
    const v0, 0x7f080055

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 1167
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, v8, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->name:Ljava/lang/String;

    .line 1168
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1169
    invoke-virtual {v0, v10}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 1170
    const-string v2, "\u5173\u95ed"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1171
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1172
    .local v0, "dialog":Landroid/app/AlertDialog;
    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda30;

    invoke-direct {v1, v7, v0, v10}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda30;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/app/AlertDialog;Landroid/widget/ScrollView;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 1190
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1191
    return-void
.end method

.method private showPersonPicker(Z)V
    .locals 6
    .param p1, "actor"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "actor"
        }
    .end annotation

    .line 783
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    if-nez v0, :cond_0

    return-void

    .line 784
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->actor:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->director:Ljava/lang/String;

    .line 785
    .local v0, "raw":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->splitPeople(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 786
    .local v1, "people":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    .line 787
    if-eqz p1, :cond_2

    const-string v2, "\u6682\u65e0\u6f14\u5458\u4fe1\u606f"

    goto :goto_1

    :cond_2
    const-string v2, "\u6682\u65e0\u5bfc\u6f14\u4fe1\u606f"

    :goto_1
    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 788
    return-void

    .line 790
    :cond_3
    new-array v2, v3, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 791
    .local v2, "names":[Ljava/lang/String;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 792
    if-eqz p1, :cond_4

    const-string v4, "\u67e5\u770b\u6f14\u5458\u76f8\u5173\u4f5c\u54c1"

    goto :goto_2

    :cond_4
    const-string v4, "\u67e5\u770b\u5bfc\u6f14\u76f8\u5173\u4f5c\u54c1"

    :goto_2
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda27;

    invoke-direct {v4, p0, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda27;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;[Ljava/lang/String;)V

    .line 793
    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x0

    .line 794
    const-string v5, "\u53d6\u6d88"

    invoke-virtual {v3, v5, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 795
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 796
    return-void
.end method

.method private showReviews()V
    .locals 12

    .line 1575
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 1579
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 1580
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    const-string v1, "\u8bf7\u5148\u767b\u5f55\u7eed\u6620\u8d26\u53f7"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1581
    return-void

    .line 1583
    :cond_1
    const/4 v0, 0x0

    .line 1584
    .local v0, "season":I
    const/4 v3, 0x0

    .line 1586
    .local v3, "episode":I
    :try_start_0
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 1587
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v4, :cond_3

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    if-ltz v5, :cond_3

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 1588
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->name:Ljava/lang/String;

    .line 1589
    .local v5, "label":Ljava/lang/String;
    const-string v6, "(?i)S(\\d+)E(\\d+)"

    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 1590
    .local v6, "se":Ljava/util/regex/Matcher;
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1591
    invoke-virtual {v6, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    move v0, v7

    .line 1592
    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    move v3, v7

    goto :goto_0

    .line 1594
    :cond_2
    const-string v7, "\\d+"

    invoke-static {v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 1595
    .local v7, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v3, v8

    goto :goto_0

    .line 1598
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .end local v5    # "label":Ljava/lang/String;
    .end local v6    # "se":Ljava/util/regex/Matcher;
    .end local v7    # "matcher":Ljava/util/regex/Matcher;
    :catchall_0
    move-exception v4

    :cond_3
    :goto_0
    nop

    .line 1599
    move v4, v0

    .line 1600
    .local v4, "selectedSeason":I
    move v11, v3

    .line 1601
    .local v11, "selectedEpisode":I
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvReviews:Landroid/widget/TextView;

    const-string v6, "\u8bc4\u8bba\u52a0\u8f7d\u4e2d"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1602
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    .line 1603
    if-lez v11, :cond_4

    const-string v7, "episode"

    goto :goto_1

    :cond_4
    const-string v7, "movie"

    :goto_1
    if-lez v11, :cond_5

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v8, v1

    goto :goto_2

    :cond_5
    const/4 v8, 0x0

    :goto_2
    new-instance v10, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda10;

    invoke-direct {v10, p0, v4, v11}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda10;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;II)V

    .line 1602
    move v9, v11

    invoke-static/range {v5 .. v10}, Lcom/github/tvbox/osc/sync/IntegrationClient;->fetchReviews(Ljava/lang/String;ILjava/lang/String;IILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 1612
    return-void

    .line 1576
    .end local v0    # "season":I
    .end local v3    # "episode":I
    .end local v4    # "selectedSeason":I
    .end local v11    # "selectedEpisode":I
    :cond_6
    :goto_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    const-string v2, "\u5f71\u7247\u4fe1\u606f\u5c1a\u672a\u52a0\u8f7d"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1577
    return-void
.end method

.method private showReviewsDialog(Lorg/json/JSONObject;II)V
    .locals 25
    .param p1, "result"    # Lorg/json/JSONObject;
    .param p2, "selectedSeason"    # I
    .param p3, "selectedEpisode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "result",
            "selectedSeason",
            "selectedEpisode"
        }
    .end annotation

    .line 1662
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    move-object v9, v0

    .line 1663
    .local v9, "scroll":Landroid/widget/ScrollView;
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v10, v0

    .line 1664
    .local v10, "box":Landroid/widget/LinearLayout;
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1665
    invoke-virtual/range {p0 .. p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41a00000    # 20.0f

    mul-float v0, v0, v1

    float-to-int v11, v0

    .line 1666
    .local v11, "pad":I
    div-int/lit8 v0, v11, 0x2

    div-int/lit8 v1, v11, 0x2

    invoke-virtual {v10, v11, v0, v11, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1667
    invoke-virtual {v9, v10}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1669
    const-string v0, "notice"

    const-string v1, "\u8bc4\u8bba\u4e0e\u5f39\u5e55\u662f\u4e0d\u540c\u5185\u5bb9\u3002"

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const v3, -0x817666

    const/16 v4, 0xc

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object v1, v10

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1671
    const-string v0, "sources"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 1672
    .local v12, "sources":Lorg/json/JSONArray;
    const-string v13, "source"

    const-string v14, " \u00b7 "

    const-string v15, ""

    if-eqz v12, :cond_8

    .line 1673
    const/4 v0, 0x0

    move v5, v0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v5, v0, :cond_7

    .line 1674
    invoke-virtual {v12, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 1675
    .local v4, "src":Lorg/json/JSONObject;
    if-nez v4, :cond_0

    move/from16 v17, v5

    move/from16 v18, v11

    const/4 v11, 0x0

    goto/16 :goto_5

    .line 1676
    :cond_0
    const-string v0, "\u8bc4\u8bba\u6765\u6e90"

    invoke-virtual {v4, v13, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1677
    .local v3, "name":Ljava/lang/String;
    const-string v0, "available"

    invoke-virtual {v4, v0, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v2, 0x3

    if-eqz v0, :cond_2

    .line 1678
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u2713 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "count"

    invoke-virtual {v4, v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " \u6761"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const v18, -0x573806

    const/16 v19, 0xd

    const/16 v20, 0x0

    .line 1679
    if-nez v5, :cond_1

    const/16 v16, 0xa

    goto :goto_1

    :cond_1
    const/16 v16, 0x3

    .line 1678
    :goto_1
    move-object/from16 v0, p0

    move-object v1, v10

    move-object/from16 v2, v17

    move-object/from16 v21, v3

    .end local v3    # "name":Ljava/lang/String;
    .local v21, "name":Ljava/lang/String;
    move/from16 v3, v18

    move-object/from16 v22, v4

    .end local v4    # "src":Lorg/json/JSONObject;
    .local v22, "src":Lorg/json/JSONObject;
    move/from16 v4, v19

    move/from16 v17, v5

    .end local v5    # "i":I
    .local v17, "i":I
    move/from16 v5, v20

    move/from16 v18, v11

    const/4 v11, 0x0

    .end local v11    # "pad":I
    .local v18, "pad":I
    move/from16 v6, v16

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    goto/16 :goto_5

    .line 1681
    .end local v17    # "i":I
    .end local v18    # "pad":I
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "src":Lorg/json/JSONObject;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v4    # "src":Lorg/json/JSONObject;
    .restart local v5    # "i":I
    .restart local v11    # "pad":I
    :cond_2
    move-object/from16 v21, v3

    move-object/from16 v22, v4

    move/from16 v17, v5

    move/from16 v18, v11

    const/4 v11, 0x0

    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "src":Lorg/json/JSONObject;
    .end local v5    # "i":I
    .end local v11    # "pad":I
    .restart local v17    # "i":I
    .restart local v18    # "pad":I
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "src":Lorg/json/JSONObject;
    const-string v0, "error"

    move-object/from16 v6, v22

    .end local v22    # "src":Lorg/json/JSONObject;
    .local v6, "src":Lorg/json/JSONObject;
    invoke-virtual {v6, v0, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1682
    .local v0, "reason":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1683
    const-string v1, "reason"

    invoke-virtual {v6, v1, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1684
    .local v1, "code":Ljava/lang/String;
    const-string v3, "not_configured"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "\u98de\u725b\u7aef\u672a\u914d\u7f6e\u5bc6\u94a5"

    goto :goto_2

    .line 1685
    :cond_3
    const-string v3, "not_connected"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "\u672a\u7ed1\u5b9a\u8d26\u53f7\uff08\u6211\u7684\u2192\u64ad\u653e\u540c\u6b65\uff09"

    goto :goto_2

    .line 1686
    :cond_4
    const-string v3, "\u4e0d\u53ef\u7528"

    :goto_2
    move-object v0, v3

    move-object v5, v0

    goto :goto_3

    .line 1682
    .end local v1    # "code":Ljava/lang/String;
    :cond_5
    move-object v5, v0

    .line 1688
    .end local v0    # "reason":Ljava/lang/String;
    .local v5, "reason":Ljava/lang/String;
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u2715 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, v21

    .end local v21    # "name":Ljava/lang/String;
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const v19, -0x1fa5a6

    const/16 v20, 0xd

    const/16 v21, 0x0

    .line 1689
    if-nez v17, :cond_6

    const/16 v16, 0xa

    goto :goto_4

    :cond_6
    const/16 v16, 0x3

    .line 1688
    :goto_4
    move-object/from16 v0, p0

    move-object v1, v10

    move-object v2, v3

    move/from16 v3, v19

    move-object/from16 v19, v4

    .end local v4    # "name":Ljava/lang/String;
    .local v19, "name":Ljava/lang/String;
    move/from16 v4, v20

    move-object/from16 v20, v5

    .end local v5    # "reason":Ljava/lang/String;
    .local v20, "reason":Ljava/lang/String;
    move/from16 v5, v21

    move-object/from16 v21, v6

    .end local v6    # "src":Lorg/json/JSONObject;
    .local v21, "src":Lorg/json/JSONObject;
    move/from16 v6, v16

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1673
    .end local v19    # "name":Ljava/lang/String;
    .end local v20    # "reason":Ljava/lang/String;
    .end local v21    # "src":Lorg/json/JSONObject;
    :goto_5
    add-int/lit8 v5, v17, 0x1

    move/from16 v11, v18

    const/4 v6, 0x0

    .end local v17    # "i":I
    .local v5, "i":I
    goto/16 :goto_0

    .end local v18    # "pad":I
    .restart local v11    # "pad":I
    :cond_7
    move/from16 v17, v5

    move/from16 v18, v11

    const/4 v11, 0x0

    .end local v5    # "i":I
    .end local v11    # "pad":I
    .restart local v17    # "i":I
    .restart local v18    # "pad":I
    goto :goto_6

    .line 1672
    .end local v17    # "i":I
    .end local v18    # "pad":I
    .restart local v11    # "pad":I
    :cond_8
    move/from16 v18, v11

    const/4 v11, 0x0

    .line 1693
    .end local v11    # "pad":I
    .restart local v18    # "pad":I
    :goto_6
    const-string v0, "language_summary"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 1694
    .local v6, "languageSummary":Lorg/json/JSONObject;
    if-eqz v6, :cond_9

    .line 1695
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u4e2d\u6587 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "zh"

    invoke-virtual {v6, v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " \u6761\u4f18\u5148\u663e\u793a \u00b7 \u5176\u4ed6\u8bed\u8a00 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1696
    const-string v1, "other"

    invoke-virtual {v6, v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " \u6761\u4fdd\u7559\u539f\u6587"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, -0x817666

    const/16 v4, 0xc

    const/4 v5, 0x0

    const/16 v16, 0x4

    .line 1695
    move-object/from16 v0, p0

    move-object v1, v10

    move-object/from16 v17, v6

    .end local v6    # "languageSummary":Lorg/json/JSONObject;
    .local v17, "languageSummary":Lorg/json/JSONObject;
    move/from16 v6, v16

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    goto :goto_7

    .line 1694
    .end local v17    # "languageSummary":Lorg/json/JSONObject;
    .restart local v6    # "languageSummary":Lorg/json/JSONObject;
    :cond_9
    move-object/from16 v17, v6

    .line 1699
    .end local v6    # "languageSummary":Lorg/json/JSONObject;
    .restart local v17    # "languageSummary":Lorg/json/JSONObject;
    :goto_7
    const-string v0, "items"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 1700
    .local v6, "items":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .line 1701
    .local v0, "shown":I
    if-eqz v6, :cond_e

    .line 1702
    const/4 v1, 0x0

    move/from16 v16, v0

    move v5, v1

    .end local v0    # "shown":I
    .restart local v5    # "i":I
    .local v16, "shown":I
    :goto_8
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v5, v0, :cond_d

    .line 1703
    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 1704
    .local v4, "item":Lorg/json/JSONObject;
    if-nez v4, :cond_a

    move/from16 v21, v5

    move-object/from16 v22, v6

    goto/16 :goto_9

    .line 1705
    :cond_a
    const-string v0, "\u8bc4\u8bba"

    invoke-virtual {v4, v13, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1706
    .local v3, "source":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object v2, v0

    .line 1707
    .local v2, "head":Ljava/lang/StringBuilder;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "author"

    const-string v1, "\u7528\u6237"

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1708
    const-string v0, "rating"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 1709
    const-string v1, " \u00b7 \u8bc4\u5206 "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1711
    :cond_b
    const-string v0, "spoiler"

    invoke-virtual {v4, v0, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, " \u00b7 \u542b\u5267\u900f"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1712
    :cond_c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct {v7, v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewSourceColor(Ljava/lang/String;)I

    move-result v20

    const/16 v21, 0xe

    const/16 v22, 0x1

    const/16 v23, 0xe

    move-object/from16 v0, p0

    move-object v1, v10

    move-object/from16 v24, v2

    .end local v2    # "head":Ljava/lang/StringBuilder;
    .local v24, "head":Ljava/lang/StringBuilder;
    move-object/from16 v2, v19

    move-object/from16 v19, v3

    .end local v3    # "source":Ljava/lang/String;
    .local v19, "source":Ljava/lang/String;
    move/from16 v3, v20

    move-object v11, v4

    .end local v4    # "item":Lorg/json/JSONObject;
    .local v11, "item":Lorg/json/JSONObject;
    move/from16 v4, v21

    move/from16 v21, v5

    .end local v5    # "i":I
    .local v21, "i":I
    move/from16 v5, v22

    move-object/from16 v22, v6

    .end local v6    # "items":Lorg/json/JSONArray;
    .local v22, "items":Lorg/json/JSONArray;
    move/from16 v6, v23

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1713
    const-string v0, "text"

    invoke-virtual {v11, v0, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const v3, -0x383126

    const/16 v4, 0xe

    const/4 v5, 0x0

    const/4 v6, 0x4

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1714
    add-int/lit8 v16, v16, 0x1

    .line 1702
    .end local v11    # "item":Lorg/json/JSONObject;
    .end local v19    # "source":Ljava/lang/String;
    .end local v24    # "head":Ljava/lang/StringBuilder;
    :goto_9
    add-int/lit8 v5, v21, 0x1

    move-object/from16 v6, v22

    const/4 v11, 0x0

    .end local v21    # "i":I
    .restart local v5    # "i":I
    goto/16 :goto_8

    .end local v22    # "items":Lorg/json/JSONArray;
    .restart local v6    # "items":Lorg/json/JSONArray;
    :cond_d
    move/from16 v21, v5

    move-object/from16 v22, v6

    .end local v5    # "i":I
    .end local v6    # "items":Lorg/json/JSONArray;
    .restart local v21    # "i":I
    .restart local v22    # "items":Lorg/json/JSONArray;
    goto :goto_a

    .line 1701
    .end local v16    # "shown":I
    .end local v21    # "i":I
    .end local v22    # "items":Lorg/json/JSONArray;
    .restart local v0    # "shown":I
    .restart local v6    # "items":Lorg/json/JSONArray;
    :cond_e
    move-object/from16 v22, v6

    .end local v6    # "items":Lorg/json/JSONArray;
    .restart local v22    # "items":Lorg/json/JSONArray;
    move/from16 v16, v0

    .line 1717
    .end local v0    # "shown":I
    .restart local v16    # "shown":I
    :goto_a
    if-nez v16, :cond_f

    .line 1718
    const v3, -0x383126

    const/16 v4, 0xe

    const/4 v5, 0x0

    const/16 v6, 0xe

    const-string v2, "\u5f53\u524d\u6765\u6e90\u6682\u65e0\u53ef\u5c55\u793a\u7684\u8bc4\u8bba\u6216\u77ed\u8bc4\u3002"

    move-object/from16 v0, p0

    move-object v1, v10

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->reviewLine(Landroid/widget/LinearLayout;Ljava/lang/String;IIZI)Landroid/widget/TextView;

    .line 1720
    :cond_f
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u8bc4\u8bba / \u8bc4\u4ef7\uff08\u975e\u52a8\u6001\u5f39\u5e55\uff09"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1721
    invoke-virtual {v0, v9}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda11;

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-direct {v1, v7, v2, v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda11;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;II)V

    .line 1722
    const-string v4, "\u5199\u8bc4\u8bba"

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 1723
    const-string v4, "\u5173\u95ed"

    invoke-virtual {v0, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1724
    return-void
.end method

.method private showWriteReviewDialog(II)V
    .locals 12
    .param p1, "season"    # I
    .param p2, "episode"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "season",
            "episode"
        }
    .end annotation

    .line 1727
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1728
    .local v0, "box":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1729
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41c00000    # 24.0f

    mul-float v1, v1, v2

    float-to-int v1, v1

    .line 1730
    .local v1, "padding":I
    div-int/lit8 v2, v1, 0x2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1731
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1732
    .local v2, "note":Landroid/widget/TextView;
    const-string v3, "\u8bc4\u8bba\u53ea\u4fdd\u5b58\u5728\u7eed\u6620\u670d\u52a1\u5668\u4e0a\uff0c\u5411\u540c\u4e00\u670d\u52a1\u5668\u7684\u8d26\u53f7\u5c55\u793a\uff0c\u4e0d\u53d1\u9001\u5230\u7b2c\u4e09\u65b9\u793e\u533a\u3002"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1733
    new-instance v3, Landroid/widget/EditText;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1734
    .local v3, "text":Landroid/widget/EditText;
    const-string v4, "\u5199\u4e0b\u4f60\u7684\u8bc4\u8bba\uff08\u6700\u591a 2000 \u5b57\uff09"

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 1735
    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setMinLines(I)V

    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setMaxLines(I)V

    const v4, 0x20001

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 1736
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1737
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1738
    const-string v5, "\u5199\u670d\u52a1\u5668\u8bc4\u8bba"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1739
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "\u53d6\u6d88"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "\u53d1\u5e03"

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 1740
    .local v4, "dialog":Landroid/app/AlertDialog;
    new-instance v11, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda28;

    move-object v5, v11

    move-object v6, p0

    move-object v7, v4

    move-object v8, v3

    move v9, p2

    move v10, p1

    invoke-direct/range {v5 .. v10}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda28;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;II)V

    invoke-virtual {v4, v11}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 1757
    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 1758
    return-void
.end method

.method private splitPeople(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .param p1, "raw"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "raw"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 799
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 800
    .local v0, "people":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 801
    :cond_0
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u6f14\u5458\uff1a"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u5bfc\u6f14\uff1a"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 802
    .local v1, "cleaned":Ljava/lang/String;
    const-string v2, "[,\uff0c\u3001/|;\uff1b\\n]+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    .line 803
    .local v5, "item":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 804
    .local v6, "name":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-interface {v0, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 802
    .end local v5    # "item":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 806
    :cond_2
    return-object v0
.end method

.method private startQuickSearch()V
    .locals 2

    .line 1986
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->initCheckedSourcesForSearch()V

    .line 1987
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->hadQuickStart:Z

    if-eqz v0, :cond_0

    .line 1988
    return-void

    .line 1989
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->hadQuickStart:Z

    .line 1990
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "quick_search"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 1991
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchWord:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1992
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchTitle:Ljava/lang/String;

    .line 1993
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1994
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchWord:Ljava/util/List;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchTitle:Ljava/lang/String;

    invoke-static {v1}, Lcom/github/tvbox/osc/util/SearchHelper;->splitWords(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 2026
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchResult()V

    .line 2027
    return-void
.end method

.method private switchSearchWord(Ljava/lang/String;)V
    .locals 2
    .param p1, "word"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "word"
        }
    .end annotation

    .line 1979
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "quick_search"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 1980
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->quickSearchData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1981
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchTitle:Ljava/lang/String;

    .line 1982
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchResult()V

    .line 1983
    return-void
.end method

.method private syncPlayingVodInfo(Lcom/github/tvbox/osc/bean/VodInfo;)V
    .locals 9
    .param p1, "playingVodInfo"    # Lcom/github/tvbox/osc/bean/VodInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "playingVodInfo"
        }
    .end annotation

    .line 2086
    if-eqz p1, :cond_e

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_e

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    goto/16 :goto_7

    .line 2089
    :cond_0
    iget-object v0, p1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 2090
    .local v0, "newFlag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_6

    .line 2093
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 2094
    .local v1, "newSeriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v1, :cond_c

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_5

    .line 2098
    :cond_2
    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getPlayingSeries(Lcom/github/tvbox/osc/bean/VodInfo;Ljava/lang/String;)Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    move-result-object v2

    .line 2099
    .local v2, "playingSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iget v3, p1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-direct {p0, v2, v1, v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->findSameEpisodeIndex(Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I

    move-result v3

    .line 2100
    .local v3, "newIndex":I
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iput-object v0, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 2101
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iput v3, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 2102
    iget-object v4, p1, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 2103
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, p1, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    .line 2106
    :cond_3
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;

    .line 2107
    .local v5, "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    iget-object v6, v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    iput-boolean v6, v5, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->selected:Z

    .line 2108
    .end local v5    # "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    goto :goto_0

    .line 2109
    :cond_4
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 2110
    .local v5, "seriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-nez v5, :cond_5

    .line 2111
    goto :goto_1

    .line 2113
    :cond_5
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 2114
    .local v8, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iput-boolean v6, v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 2115
    .end local v8    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    goto :goto_2

    .line 2116
    .end local v5    # "seriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_6
    goto :goto_1

    .line 2117
    :cond_7
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 2119
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    invoke-virtual {v4}, Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;->notifyDataSetChanged()V

    .line 2120
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->refreshList()V

    .line 2121
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->url:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTvPlayUrl(Ljava/lang/String;)V

    .line 2123
    const/4 v4, -0x1

    .line 2124
    .local v4, "flagIndex":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_9

    .line 2125
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 2126
    move v4, v5

    .line 2127
    goto :goto_4

    .line 2124
    :cond_8
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 2130
    .end local v5    # "i":I
    :cond_9
    :goto_4
    if-ltz v4, :cond_a

    .line 2131
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v5, v4}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->scrollToPosition(I)V

    .line 2132
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->hasFocus()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 2133
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v5, v4}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelection(I)V

    .line 2136
    :cond_a
    iget-boolean v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFirstLoad:Z

    if-nez v5, :cond_b

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->hasFocus()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 2137
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v5, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelection(I)V

    .line 2140
    :cond_b
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstsourceKey:Ljava/lang/String;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {p0, v5, v7}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->insertVod(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V

    .line 2141
    iput-boolean v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFirstLoad:Z

    .line 2142
    return-void

    .line 2095
    .end local v2    # "playingSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v3    # "newIndex":I
    .end local v4    # "flagIndex":I
    :cond_c
    :goto_5
    return-void

    .line 2091
    .end local v1    # "newSeriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_d
    :goto_6
    return-void

    .line 2087
    .end local v0    # "newFlag":Ljava/lang/String;
    :cond_e
    :goto_7
    return-void
.end method

.method private unlockOrientationForPhones()V
    .locals 6

    .line 1621
    :try_start_0
    const-string v0, "sensor"

    .line 1622
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 1623
    .local v0, "sensors":Landroid/hardware/SensorManager;
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 1624
    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 1625
    .local v3, "hasAccelerometer":Z
    :goto_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.software.leanback"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1626
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.hardware.type.television"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    const/4 v1, 0x1

    .line 1627
    .local v1, "television":Z
    :cond_2
    if-eqz v3, :cond_3

    if-nez v1, :cond_3

    .line 1630
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setRequestedOrientation(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 1632
    .end local v0    # "sensors":Landroid/hardware/SensorManager;
    .end local v1    # "television":Z
    .end local v3    # "hasAccelerometer":Z
    :catchall_0
    move-exception v0

    :cond_3
    :goto_1
    nop

    .line 1633
    return-void
.end method

.method private updateOrganizationsView()V
    .locals 5

    .line 932
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 933
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 937
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 938
    .local v0, "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;

    .line 939
    .local v2, "entity":Lcom/github/tvbox/osc/sync/MetadataClient$Organization;
    if-eqz v2, :cond_2

    iget-object v3, v2, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->name:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, v2, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 940
    iget-object v3, v2, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 942
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x6

    if-lt v3, v4, :cond_3

    goto :goto_1

    .line 943
    .end local v2    # "entity":Lcom/github/tvbox/osc/sync/MetadataClient$Organization;
    :cond_3
    goto :goto_0

    .line 944
    :cond_4
    :goto_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    const-string v2, " / "

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u5173\u8054\u673a\u6784\uff1a"

    invoke-direct {p0, v1, v3, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 945
    return-void

    .line 934
    .end local v0    # "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvOrganizations:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 935
    return-void
.end method


# virtual methods
.method customSeriesScrollPos(I)V
    .locals 4
    .param p1, "targetPos"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "targetPos"
        }
    .end annotation

    .line 1369
    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    if-eqz v0, :cond_1

    .line 1370
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1371
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1372
    .local v0, "safeTarget":I
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->hasFocus()Z

    move-result v1

    .line 1373
    .local v1, "restoreFocus":Z
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->stopScroll()V

    .line 1374
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;->scrollToPositionWithOffset(II)V

    .line 1375
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v3, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda24;

    invoke-direct {v3, p0, v0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda24;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;IZ)V

    invoke-virtual {v2, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 1379
    return-void

    .line 1370
    .end local v0    # "safeTarget":I
    .end local v1    # "restoreFocus":Z
    :cond_1
    :goto_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 2294
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v1, :cond_0

    .line 2295
    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2296
    const/4 v0, 0x1

    return v0

    .line 2299
    :cond_0
    invoke-super {p0, p1}, Lcom/github/tvbox/osc/base/BaseActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method ensurePlayFragment()V
    .locals 3

    .line 2383
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_0

    return-void

    .line 2384
    :cond_0
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-direct {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;-><init>()V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 2385
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f0a01d3

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitNowAllowingStateLoss()V

    .line 2386
    return-void
.end method

.method enterFullPreview()V
    .locals 1

    .line 2333
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setFullPreview(Z)V

    .line 2334
    return-void
.end method

.method exitFullPreview()V
    .locals 1

    .line 2337
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setFullPreview(Z)V

    .line 2338
    return-void
.end method

.method protected getLayoutResID()I
    .locals 1

    .line 200
    const v0, 0x7f0d001d

    return v0
.end method

.method protected init()V
    .locals 4

    .line 205
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 206
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull()V

    .line 209
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sget-object v1, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda26;->INSTANCE:Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda26;

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 210
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->initView()V

    .line 211
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->initViewModel()V

    .line 212
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->initData()V

    .line 213
    return-void
.end method

.method synthetic lambda$bindPersonSearch$15$com-github-tvbox-osc-ui-activity-DetailActivity(ZLandroid/view/View;)V
    .locals 0
    .param p1, "actor"    # Z
    .param p2, "v"    # Landroid/view/View;

    .line 779
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPersonPicker(Z)V

    return-void
.end method

.method synthetic lambda$customSeriesScrollPos$27$com-github-tvbox-osc-ui-activity-DetailActivity(IZ)V
    .locals 1
    .param p1, "safeTarget"    # I
    .param p2, "restoreFocus"    # Z

    .line 1376
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v0, p1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelectedPosition(I)V

    .line 1377
    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(I)V

    .line 1378
    :cond_0
    return-void
.end method

.method synthetic lambda$initView$10$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 384
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 385
    :cond_0
    const/16 v0, 0x30

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v2}, Landroidx/core/widget/NestedScrollView;->getHeight()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    div-int/lit8 v2, v2, 0x3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 386
    .local v0, "step":I
    const/16 v2, 0x13

    const/4 v3, 0x1

    if-ne p2, v2, :cond_3

    .line 387
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    const/4 v4, -0x1

    invoke-virtual {v2, v4}, Landroidx/core/widget/NestedScrollView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 388
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    neg-int v4, v0

    invoke-virtual {v2, v1, v4}, Landroidx/core/widget/NestedScrollView;->smoothScrollBy(II)V

    goto :goto_1

    .line 390
    :cond_1
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    iget v1, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    :goto_0
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(I)V

    .line 392
    :goto_1
    return v3

    .line 394
    :cond_3
    const/16 v2, 0x14

    if-ne p2, v2, :cond_5

    .line 395
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v2, v3}, Landroidx/core/widget/NestedScrollView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 396
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v2, v1, v0}, Landroidx/core/widget/NestedScrollView;->smoothScrollBy(II)V

    .line 397
    return v3

    .line 399
    :cond_4
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestDiscoveryFocus()Z

    move-result v1

    return v1

    .line 401
    :cond_5
    return v1
.end method

.method synthetic lambda$initView$11$com-github-tvbox-osc-ui-activity-DetailActivity(ILandroid/view/View;)Z
    .locals 1
    .param p1, "direction"    # I
    .param p2, "focused"    # Landroid/view/View;

    .line 431
    const/16 v0, 0x82

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestDiscoveryFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method synthetic lambda$initView$13$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 469
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->enterFullPreview()V

    .line 470
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstReverse:Z

    if-eqz v0, :cond_0

    .line 471
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->jumpToPlay()V

    .line 472
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstReverse:Z

    .line 474
    :cond_0
    return-void
.end method

.method synthetic lambda$initView$14$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/view/View;Z)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .line 734
    const v0, 0x3f833333    # 1.025f

    invoke-static {p1, p2, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 735
    if-eqz p2, :cond_2

    .line 736
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesSort:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060029

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 737
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 738
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->getFirstVisiblePosition()I

    move-result v0

    .line 739
    .local v0, "firstVisible":I
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->getLastVisiblePosition()I

    move-result v1

    .line 740
    .local v1, "lastVisible":I
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    if-lt v2, v0, :cond_0

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    if-le v2, v1, :cond_1

    .line 741
    :cond_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-virtual {p0, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->customSeriesScrollPos(I)V

    .line 743
    .end local v0    # "firstVisible":I
    .end local v1    # "lastVisible":I
    :cond_1
    goto :goto_0

    .line 745
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesSort:Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 747
    :cond_3
    :goto_0
    return-void
.end method

.method synthetic lambda$initView$4$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 286
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showReviews()V

    return-void
.end method

.method synthetic lambda$initView$5$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 287
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showOrganizationChoices()V

    return-void
.end method

.method synthetic lambda$initView$6$com-github-tvbox-osc-ui-activity-DetailActivity(Lcom/chad/library/adapter/base/BaseQuickAdapter;Landroid/view/View;I)V
    .locals 1
    .param p1, "adapter"    # Lcom/chad/library/adapter/base/BaseQuickAdapter;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I

    .line 305
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    invoke-virtual {v0, p3}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/MetadataPerson;

    .line 306
    .local v0, "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openPersonMetadata(Lcom/github/tvbox/osc/bean/MetadataPerson;)V

    .line 307
    :cond_0
    return-void
.end method

.method synthetic lambda$initView$7$com-github-tvbox-osc-ui-activity-DetailActivity(ILandroid/view/View;)Z
    .locals 3
    .param p1, "direction"    # I
    .param p2, "focused"    # Landroid/view/View;

    .line 323
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v2, 0x21

    if-ne p1, v2, :cond_1

    .line 324
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    iget v1, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    :goto_0
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(I)V

    .line 325
    return v0

    .line 327
    :cond_1
    const/16 v2, 0x82

    if-ne p1, v2, :cond_2

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    if-eqz v2, :cond_2

    .line 328
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    if-eqz v2, :cond_2

    .line 329
    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;->getData()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 330
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestFirstItemFocus(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;)V

    .line 331
    return v0

    .line 333
    :cond_2
    return v1
.end method

.method synthetic lambda$initView$8$com-github-tvbox-osc-ui-activity-DetailActivity(Lcom/chad/library/adapter/base/BaseQuickAdapter;Landroid/view/View;I)V
    .locals 2
    .param p1, "adapter"    # Lcom/chad/library/adapter/base/BaseQuickAdapter;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I

    .line 341
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    invoke-virtual {v0, p3}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/sync/MetadataClient$Work;

    .line 342
    .local v0, "work":Lcom/github/tvbox/osc/sync/MetadataClient$Work;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/github/tvbox/osc/sync/MetadataClient$Work;->title:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openRecommendation(Lcom/github/tvbox/osc/sync/MetadataClient$Work;)V

    .line 343
    :cond_0
    return-void
.end method

.method synthetic lambda$initView$9$com-github-tvbox-osc-ui-activity-DetailActivity(ILandroid/view/View;)Z
    .locals 3
    .param p1, "direction"    # I
    .param p2, "focused"    # Landroid/view/View;

    .line 364
    const/4 v0, 0x0

    const/16 v1, 0x21

    if-ne p1, v1, :cond_2

    .line 365
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    if-eqz v1, :cond_0

    .line 366
    invoke-virtual {v1}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->getData()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 367
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestFirstItemFocus(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;)V

    .line 368
    return v2

    .line 370
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget v0, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    :goto_0
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(I)V

    .line 371
    return v2

    .line 373
    :cond_2
    return v0
.end method

.method synthetic lambda$loadRichMetadata$19$com-github-tvbox-osc-ui-activity-DetailActivity(ILjava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;)V
    .locals 6
    .param p1, "requestGeneration"    # I
    .param p2, "requestedMetadataName"    # Ljava/lang/String;
    .param p3, "metadata"    # Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;

    .line 892
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    if-ne p1, v0, :cond_f

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_f

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 893
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_f

    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mVideo:Lcom/github/tvbox/osc/bean/Movie$Video;

    if-eqz v0, :cond_f

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    .line 894
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_5

    .line 895
    :cond_1
    const/16 v0, 0x8

    if-nez p3, :cond_2

    .line 896
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 897
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 898
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 899
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestStableDetailLayout()V

    .line 900
    return-void

    .line 902
    :cond_2
    iget-object v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->backdrop_url:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 903
    iget-object v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->backdrop_url:Ljava/lang/String;

    iget-object v2, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->title:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->loadBackdrop(Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    :cond_3
    iget-object v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->overview:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 906
    iget-object v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->overview:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOverview:Ljava/lang/String;

    .line 907
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvDes:Landroid/widget/TextView;

    const-string v3, "\u5185\u5bb9\u7b80\u4ecb\uff1a"

    invoke-direct {p0, v2, v3, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTextShow(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 909
    :cond_4
    iget v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->tmdb_id:I

    if-lez v1, :cond_5

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_5

    .line 910
    iget v2, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->tmdb_id:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/github/tvbox/osc/bean/VodInfo;->tmdbId:Ljava/lang/String;

    .line 912
    :cond_5
    iget-object v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->people:Ljava/util/List;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_6

    iget-object v1, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->people:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    const/4 v1, 0x1

    goto :goto_0

    :cond_6
    const/4 v1, 0x0

    .line 913
    .local v1, "hasPeople":Z
    :goto_0
    iget-object v4, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->organizations:Ljava/util/List;

    if-nez v4, :cond_7

    .line 914
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    goto :goto_1

    :cond_7
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->organizations:Ljava/util/List;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_1
    iput-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    .line 915
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->updateOrganizationsView()V

    .line 916
    iget-object v4, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->recommendations:Ljava/util/List;

    if-eqz v4, :cond_8

    iget-object v4, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->recommendations:Ljava/util/List;

    .line 917
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8

    goto :goto_2

    :cond_8
    const/4 v2, 0x0

    .line 918
    .local v2, "hasRecommendations":Z
    :goto_2
    if-eqz v1, :cond_9

    .line 919
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->personCreditAdapter:Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;

    iget-object v5, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->people:Ljava/util/List;

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/adapter/PersonCreditAdapter;->setNewData(Ljava/util/List;)V

    .line 920
    iget-object v4, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->people:Ljava/util/List;

    invoke-direct {p0, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fillMissingPeopleText(Ljava/util/List;)V

    .line 922
    :cond_9
    iget-object v4, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->episodes:Ljava/util/List;

    invoke-direct {p0, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->applyEpisodeMetadata(Ljava/util/List;)V

    .line 923
    if-eqz v2, :cond_a

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendationAdapter:Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;

    iget-object v5, p3, Lcom/github/tvbox/osc/sync/MetadataClient$TitleMetadata;->recommendations:Ljava/util/List;

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/adapter/RecommendationAdapter;->setNewData(Ljava/util/List;)V

    .line 924
    :cond_a
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    if-eqz v1, :cond_b

    const/4 v5, 0x0

    goto :goto_3

    :cond_b
    const/16 v5, 0x8

    :goto_3
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 925
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    if-eqz v2, :cond_c

    const/4 v5, 0x0

    goto :goto_4

    :cond_c
    const/16 v5, 0x8

    :goto_4
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 926
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    if-nez v1, :cond_d

    if-eqz v2, :cond_e

    :cond_d
    const/4 v0, 0x0

    :cond_e
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 927
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestStableDetailLayout()V

    .line 928
    return-void

    .line 894
    .end local v1    # "hasPeople":Z
    .end local v2    # "hasRecommendations":Z
    :cond_f
    :goto_5
    return-void
.end method

.method synthetic lambda$new$0$com-github-tvbox-osc-ui-activity-DetailActivity()V
    .locals 5

    .line 179
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0}, Landroidx/core/widget/NestedScrollView;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 182
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 183
    .local v0, "lowerContent":Landroid/view/View;
    :goto_0
    const/16 v2, 0x8

    new-array v2, v2, [Landroid/view/View;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    aput-object v3, v2, v1

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->discoverySection:Landroid/view/View;

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->peopleSection:Landroid/view/View;

    aput-object v4, v2, v3

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mPeopleView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    aput-object v4, v2, v3

    const/4 v3, 0x6

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recommendSection:Landroid/view/View;

    aput-object v4, v2, v3

    const/4 v3, 0x7

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mRecommendView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    aput-object v4, v2, v3

    .line 185
    .local v2, "dynamicViews":[Landroid/view/View;
    array-length v3, v2

    :goto_1
    if-ge v1, v3, :cond_3

    aget-object v4, v2, v1

    .line 186
    .local v4, "view":Landroid/view/View;
    if-eqz v4, :cond_2

    .line 187
    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 188
    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    .line 185
    .end local v4    # "view":Landroid/view/View;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 191
    :cond_3
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 192
    :cond_4
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v1}, Landroidx/core/widget/NestedScrollView;->requestLayout()V

    .line 193
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v1}, Landroidx/core/widget/NestedScrollView;->invalidate()V

    .line 194
    return-void

    .line 180
    .end local v0    # "lowerContent":Landroid/view/View;
    .end local v2    # "dynamicViews":[Landroid/view/View;
    :cond_5
    :goto_2
    return-void
.end method

.method synthetic lambda$onConfigurationChanged$2$com-github-tvbox-osc-ui-activity-DetailActivity()V
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->refreshPlayerLayout()V

    .line 230
    :cond_0
    return-void
.end method

.method synthetic lambda$openPersonByName$17$com-github-tvbox-osc-ui-activity-DetailActivity(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "matches"    # Ljava/util/List;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 855
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/MetadataPerson;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openPersonMetadata(Lcom/github/tvbox/osc/bean/MetadataPerson;)V

    return-void
.end method

.method synthetic lambda$openPersonByName$18$com-github-tvbox-osc-ui-activity-DetailActivity(Ljava/lang/String;Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "result"    # Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;

    .line 831
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 832
    :cond_0
    const/4 v0, 0x0

    if-nez p2, :cond_1

    move-object v1, v0

    goto :goto_0

    :cond_1
    iget-object v1, p2, Lcom/github/tvbox/osc/sync/MetadataClient$PersonSearchResult;->people:Ljava/util/List;

    .line 833
    .local v1, "matches":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/MetadataPerson;>;"
    :goto_0
    const/4 v2, 0x0

    if-eqz v1, :cond_8

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    goto/16 :goto_4

    .line 837
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/MetadataPerson;

    .line 838
    .local v4, "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    iget-object v5, v4, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-direct {p0, p1, v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->samePersonName(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 839
    invoke-direct {p0, v4}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openPersonMetadata(Lcom/github/tvbox/osc/bean/MetadataPerson;)V

    .line 840
    return-void

    .line 842
    .end local v4    # "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    :cond_3
    goto :goto_1

    .line 843
    :cond_4
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_5

    .line 844
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/MetadataPerson;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openPersonMetadata(Lcom/github/tvbox/osc/bean/MetadataPerson;)V

    .line 845
    return-void

    .line 847
    :cond_5
    const/16 v2, 0x8

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    .line 848
    .local v2, "labels":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    array-length v4, v2

    if-ge v3, v4, :cond_7

    .line 849
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/MetadataPerson;

    .line 850
    .restart local v4    # "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v4, Lcom/github/tvbox/osc/bean/MetadataPerson;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v4, Lcom/github/tvbox/osc/bean/MetadataPerson;->department:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 851
    const-string v6, ""

    goto :goto_3

    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " \u00b7 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v4, Lcom/github/tvbox/osc/bean/MetadataPerson;->department:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_3
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 848
    .end local v4    # "person":Lcom/github/tvbox/osc/bean/MetadataPerson;
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 853
    .end local v3    # "i":I
    :cond_7
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 854
    const-string v4, "\u8bf7\u9009\u62e9\u5f71\u4eba"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda22;

    invoke-direct {v4, p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda22;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Ljava/util/List;)V

    .line 855
    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 856
    const-string v4, "\u53d6\u6d88"

    invoke-virtual {v3, v4, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 857
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 858
    return-void

    .line 834
    .end local v2    # "labels":[Ljava/lang/String;
    :cond_8
    :goto_4
    const-string v0, "\u672a\u627e\u5230\u8be5\u5f71\u4eba\u7684\u8d44\u6599"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 835
    return-void
.end method

.method synthetic lambda$openPersonMetadata$21$com-github-tvbox-osc-ui-activity-DetailActivity(Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;)V
    .locals 2
    .param p1, "metadata"    # Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;

    .line 1074
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1075
    :cond_0
    if-nez p1, :cond_1

    .line 1076
    const/4 v0, 0x0

    const-string v1, "\u5f71\u4eba\u8d44\u6599\u6682\u65f6\u4e0d\u53ef\u7528"

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1077
    return-void

    .line 1079
    :cond_1
    iget-object v0, p1, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->works:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p1, Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;->works:Ljava/util/List;

    .line 1080
    :cond_2
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPersonDialog(Lcom/github/tvbox/osc/sync/MetadataClient$PersonMetadata;)V

    .line 1081
    return-void
.end method

.method synthetic lambda$requestEpisodeDetailFocus$24$com-github-tvbox-osc-ui-activity-DetailActivity()V
    .locals 2

    .line 1208
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->setFocusable(Z)V

    .line 1209
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->setFocusableInTouchMode(Z)V

    .line 1210
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0}, Landroidx/core/widget/NestedScrollView;->requestFocus()Z

    .line 1211
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->episodeDetailScroll:Landroidx/core/widget/NestedScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroidx/core/widget/NestedScrollView;->smoothScrollTo(II)V

    .line 1212
    return-void
.end method

.method synthetic lambda$requestSeriesItemFocus$28$com-github-tvbox-osc-ui-activity-DetailActivity(II)V
    .locals 1
    .param p1, "safePosition"    # I
    .param p2, "retries"    # I

    .line 1396
    add-int/lit8 v0, p2, -0x1

    invoke-direct {p0, p1, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(II)V

    return-void
.end method

.method synthetic lambda$showEpisodeDetailDialog$25$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/app/AlertDialog;Landroid/widget/ScrollView;Landroid/content/DialogInterface;)V
    .locals 5
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "scroll"    # Landroid/widget/ScrollView;
    .param p3, "ignored"    # Landroid/content/DialogInterface;

    .line 1251
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1252
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 1253
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1254
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->portraitMode:Z

    if-eqz v3, :cond_0

    const v3, 0x3f6b851f    # 0.92f

    goto :goto_0

    :cond_0
    const v3, 0x3f2e147b    # 0.68f

    :goto_0
    mul-float v2, v2, v3

    float-to-int v2, v2

    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    const v4, 0x3f3851ec    # 0.72f

    mul-float v3, v3, v4

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setLayout(II)V

    .line 1257
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    :cond_1
    nop

    .line 1258
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "alertTitle"

    const-string v2, "id"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 1257
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1259
    .local v0, "dialogTitle":Landroid/widget/TextView;
    if-eqz v0, :cond_2

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1260
    :cond_2
    const/4 v1, -0x2

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1261
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    const v2, -0x383126

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 1263
    :cond_3
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 1264
    return-void
.end method

.method synthetic lambda$showOrganizationChoices$20$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 957
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataOrganizations:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/sync/MetadataClient$Organization;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openOrganizationWorks(Lcom/github/tvbox/osc/sync/MetadataClient$Organization;)V

    return-void
.end method

.method synthetic lambda$showPersonDialog$22$com-github-tvbox-osc-ui-activity-DetailActivity(Ljava/lang/String;Landroid/view/View;)V
    .locals 0
    .param p1, "workTitle"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .line 1160
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openWorkSearch(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$showPersonDialog$23$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/app/AlertDialog;Landroid/widget/ScrollView;Landroid/content/DialogInterface;)V
    .locals 5
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "scroll"    # Landroid/widget/ScrollView;
    .param p3, "ignored"    # Landroid/content/DialogInterface;

    .line 1173
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1174
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 1175
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1176
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const v3, 0x3f570a3d    # 0.84f

    mul-float v2, v2, v3

    float-to-int v2, v2

    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    const v4, 0x3f5c28f6    # 0.86f

    mul-float v3, v3, v4

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setLayout(II)V

    .line 1179
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "alertTitle"

    const-string v2, "id"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1180
    .local v0, "title":Landroid/widget/TextView;
    if-eqz v0, :cond_1

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1181
    :cond_1
    const/4 v1, -0x3

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1182
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    const v2, -0x573806

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 1184
    :cond_2
    const/4 v1, -0x2

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1185
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    const v2, -0x383126

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 1187
    :cond_3
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 1188
    invoke-virtual {p2}, Landroid/widget/ScrollView;->requestFocus()Z

    .line 1189
    return-void
.end method

.method synthetic lambda$showPersonPicker$16$com-github-tvbox-osc-ui-activity-DetailActivity([Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "names"    # [Ljava/lang/String;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 793
    aget-object v0, p1, p3

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->openPersonByName(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$showReviews$29$com-github-tvbox-osc-ui-activity-DetailActivity(IILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "selectedSeason"    # I
    .param p2, "selectedEpisode"    # I
    .param p3, "result"    # Lorg/json/JSONObject;
    .param p4, "error"    # Ljava/lang/String;

    .line 1605
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvReviews:Landroid/widget/TextView;

    const-string v1, "\u8bc4\u8bba"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1606
    if-nez p4, :cond_1

    if-nez p3, :cond_0

    goto :goto_0

    .line 1610
    :cond_0
    invoke-direct {p0, p3, p1, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showReviewsDialog(Lorg/json/JSONObject;II)V

    .line 1611
    return-void

    .line 1607
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    if-nez p4, :cond_2

    const-string v1, "\u8bc4\u8bba\u8bfb\u53d6\u5931\u8d25"

    goto :goto_1

    :cond_2
    move-object v1, p4

    :goto_1
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1608
    return-void
.end method

.method synthetic lambda$showReviewsDialog$30$com-github-tvbox-osc-ui-activity-DetailActivity(IILandroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "selectedSeason"    # I
    .param p2, "selectedEpisode"    # I
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .line 1722
    invoke-direct {p0, p1, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showWriteReviewDialog(II)V

    return-void
.end method

.method synthetic lambda$showWriteReviewDialog$31$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/app/AlertDialog;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "result"    # Lorg/json/JSONObject;
    .param p3, "error"    # Ljava/lang/String;

    .line 1747
    if-eqz p3, :cond_0

    .line 1748
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1749
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    invoke-static {v0, p3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1750
    return-void

    .line 1752
    :cond_0
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 1753
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "\u5df2\u53d1\u5e03\u5230\u7eed\u6620\u670d\u52a1\u5668\uff0c\u6b63\u5728\u5237\u65b0"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1754
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showReviews()V

    .line 1755
    return-void
.end method

.method synthetic lambda$showWriteReviewDialog$32$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/widget/EditText;Landroid/app/AlertDialog;IILandroid/view/View;)V
    .locals 15
    .param p1, "text"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/app/AlertDialog;
    .param p3, "episode"    # I
    .param p4, "season"    # I
    .param p5, "v"    # Landroid/view/View;

    .line 1741
    move-object v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p1 .. p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 1742
    .local v13, "content":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mContext:Landroid/content/Context;

    const-string v4, "\u8bf7\u8f93\u5165\u8bc4\u8bba\u5185\u5bb9"

    invoke-static {v2, v4, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    return-void

    .line 1743
    :cond_0
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1744
    iget-object v2, v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v2, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iget-object v2, v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v5, v2, Lcom/github/tvbox/osc/bean/VodInfo;->year:I

    if-lez p3, :cond_1

    const-string v2, "episode"

    goto :goto_0

    :cond_1
    const-string v2, "movie"

    :goto_0
    move-object v6, v2

    .line 1745
    if-lez p3, :cond_2

    const/4 v2, 0x1

    move/from16 v14, p4

    invoke-static {v2, v14}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v7, v2

    goto :goto_1

    :cond_2
    move/from16 v14, p4

    const/4 v7, 0x0

    :goto_1
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    new-instance v12, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda12;

    invoke-direct {v12, p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda12;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/app/AlertDialog;)V

    .line 1744
    const-string v2, "local"

    move-object v3, v4

    move v4, v5

    move-object v5, v6

    move v6, v7

    move/from16 v7, p3

    move-object v8, v13

    invoke-static/range {v2 .. v12}, Lcom/github/tvbox/osc/sync/IntegrationClient;->postReview(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;IZILcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 1756
    return-void
.end method

.method synthetic lambda$showWriteReviewDialog$33$com-github-tvbox-osc-ui-activity-DetailActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;IILandroid/content/DialogInterface;)V
    .locals 8
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "text"    # Landroid/widget/EditText;
    .param p3, "episode"    # I
    .param p4, "season"    # I
    .param p5, "ignored"    # Landroid/content/DialogInterface;

    .line 1740
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v7, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda1;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p2

    move-object v4, p1

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/widget/EditText;Landroid/app/AlertDialog;II)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 2263
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v0, :cond_1

    .line 2264
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2265
    return-void

    .line 2266
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->exitFullPreview()V

    .line 2267
    return-void

    .line 2269
    :cond_1
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesSelect:Z

    if-eqz v0, :cond_3

    .line 2270
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagFocus:Landroid/view/View;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v0

    if-nez v0, :cond_3

    .line 2272
    :try_start_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagFocus:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2273
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesFlagFocus:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2274
    return-void

    .line 2278
    :cond_2
    goto :goto_0

    .line 2276
    :catchall_0
    move-exception v0

    .line 2277
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2281
    .end local v0    # "th":Ljava/lang/Throwable;
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_4

    .line 2283
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setPlayTitle(Z)V

    .line 2284
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setExitingPreview(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2287
    goto :goto_1

    .line 2285
    :catchall_1
    move-exception v0

    .line 2286
    .restart local v0    # "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2289
    .end local v0    # "th":Ljava/lang/Throwable;
    :cond_4
    :goto_1
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onBackPressed()V

    .line 2290
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newConfig"
        }
    .end annotation

    .line 217
    invoke-super {p0, p1}, Lcom/github/tvbox/osc/base/BaseActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 218
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 220
    .local v0, "newPortrait":Z
    :goto_0
    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->portraitMode:Z

    if-eq v0, v3, :cond_3

    .line 221
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v1, :cond_2

    .line 225
    iput-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recreateDetailAfterPreviewExit:Z

    .line 226
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    if-eqz v1, :cond_1

    .line 227
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentContainerView;->requestLayout()V

    .line 228
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda20;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$$ExternalSyntheticLambda20;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentContainerView;->post(Ljava/lang/Runnable;)Z

    .line 232
    :cond_1
    return-void

    .line 234
    :cond_2
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recreate()V

    .line 235
    return-void

    .line 239
    :cond_3
    iput-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recreateDetailAfterPreviewExit:Z

    .line 240
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    if-eqz v1, :cond_5

    .line 241
    if-eqz v0, :cond_4

    const/4 v2, 0x3

    goto :goto_1

    :cond_4
    const/4 v2, 0x5

    :goto_1
    invoke-virtual {v1, v2}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;->setSpanCount(I)V

    .line 243
    :cond_5
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 2243
    iget v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->metadataRequestGeneration:I

    .line 2244
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailLowerScroll:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->detailRelayout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2245
    :cond_0
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->onDestroy()V

    .line 2247
    :try_start_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_1

    .line 2248
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 2249
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchExecutorService:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2253
    :cond_1
    goto :goto_0

    .line 2251
    :catchall_0
    move-exception v0

    .line 2252
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2254
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "fenci"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 2255
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "detail"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 2256
    invoke-static {}, Lcom/lzy/okgo/OkGo;->getInstance()Lcom/lzy/okgo/OkGo;

    move-result-object v0

    const-string v1, "quick_search"

    invoke-virtual {v0, v1}, Lcom/lzy/okgo/OkGo;->cancelTag(Ljava/lang/Object;)V

    .line 2257
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->releasePlayFragment()V

    .line 2258
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    .line 2259
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyCode",
            "event"
        }
    .end annotation

    .line 2304
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v1, :cond_0

    .line 2305
    invoke-virtual {v0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2306
    const/4 v0, 0x1

    return v0

    .line 2309
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/github/tvbox/osc/base/BaseActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyCode",
            "event"
        }
    .end annotation

    .line 2314
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v1, :cond_0

    .line 2315
    invoke-virtual {v0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2316
    const/4 v0, 0x1

    return v0

    .line 2319
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/github/tvbox/osc/base/BaseActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
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

    .line 1923
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    if-nez v0, :cond_5

    .line 1924
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_9

    .line 1925
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v0, :cond_0

    .line 1926
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->syncPlayingVodInfo(Lcom/github/tvbox/osc/bean/VodInfo;)V

    goto/16 :goto_2

    .line 1927
    :cond_0
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 1928
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1929
    .local v0, "index":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-ge v1, v2, :cond_1

    .line 1930
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->getData()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iput-boolean v3, v2, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 1931
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    invoke-virtual {v2, v1}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->notifyItemChanged(I)V

    .line 1929
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1933
    .end local v1    # "j":I
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->getData()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 1934
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    invoke-virtual {v1, v0}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->notifyItemChanged(I)V

    .line 1935
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFirstLoad:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v1, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setSelection(I)V

    .line 1936
    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iput v0, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 1938
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstsourceKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->insertVod(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V

    .line 1939
    iput-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->isFirstLoad:Z

    .line 1940
    .end local v0    # "index":I
    goto/16 :goto_2

    :cond_3
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_4

    .line 1941
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playerCfg:Ljava/lang/String;

    .line 1943
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->firstsourceKey:Ljava/lang/String;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    invoke-direct {p0, v0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->insertVod(Ljava/lang/String;Lcom/github/tvbox/osc/bean/VodInfo;)V

    goto :goto_2

    .line 1944
    :cond_4
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 1945
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1947
    .local v0, "url":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setTvPlayUrl(Ljava/lang/String;)V

    .line 1948
    .end local v0    # "url":Ljava/lang/String;
    goto :goto_2

    .line 1951
    :cond_5
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_6

    .line 1952
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_9

    .line 1953
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/github/tvbox/osc/bean/Movie$Video;

    .line 1954
    .local v0, "video":Lcom/github/tvbox/osc/bean/Movie$Video;
    iget-object v1, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_name:Ljava/lang/String;

    .line 1955
    iget-object v1, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->pic:Ljava/lang/String;

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vod_picture:Ljava/lang/String;

    .line 1956
    iget-object v1, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->id:Ljava/lang/String;

    iget-object v2, v0, Lcom/github/tvbox/osc/bean/Movie$Video;->sourceKey:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->loadDetail(Ljava/lang/String;Ljava/lang/String;)V

    .line 1957
    .end local v0    # "video":Lcom/github/tvbox/osc/bean/Movie$Video;
    goto :goto_2

    .line 1958
    :cond_6
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_7

    .line 1959
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_9

    .line 1960
    iget-object v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 1961
    .local v0, "word":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->switchSearchWord(Ljava/lang/String;)V

    .line 1962
    .end local v0    # "word":Ljava/lang/String;
    goto :goto_2

    .line 1963
    :cond_7
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_9

    .line 1965
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    if-nez v1, :cond_8

    move-object v1, v0

    goto :goto_1

    :cond_8
    iget-object v1, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/github/tvbox/osc/bean/AbsXml;

    :goto_1
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchData(Lcom/github/tvbox/osc/bean/AbsXml;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1968
    goto :goto_2

    .line 1966
    :catch_0
    move-exception v1

    .line 1967
    .local v1, "e":Ljava/lang/Exception;
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->searchData(Lcom/github/tvbox/osc/bean/AbsXml;)V

    .line 1970
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_9
    :goto_2
    return-void
.end method

.method refreshList()V
    .locals 8

    .line 1454
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    const/4 v2, 0x0

    if-gt v0, v1, :cond_0

    .line 1455
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iput v2, v0, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 1458
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 1459
    const/4 v0, 0x1

    .line 1460
    .local v0, "canSelect":Z
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_0
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 1461
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iget-boolean v4, v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    if-eqz v4, :cond_1

    .line 1462
    const/4 v0, 0x0

    .line 1463
    goto :goto_1

    .line 1460
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1466
    .end local v3    # "j":I
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget v4, v4, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iput-boolean v1, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 1469
    .end local v0    # "canSelect":Z
    :cond_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1470
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    .line 1471
    .local v3, "listSize":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->orientation:I

    if-ne v4, v1, :cond_4

    const/4 v2, 0x1

    :cond_4
    move v1, v2

    .line 1473
    .local v1, "portrait":Z
    if-eqz v1, :cond_5

    const/4 v2, 0x3

    goto :goto_2

    :cond_5
    const/4 v2, 0x5

    .line 1474
    .local v2, "offset":I
    :goto_2
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewLayoutMgr:Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    invoke-virtual {v4, v2}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;->setSpanCount(I)V

    .line 1475
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesAdapter:Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v6, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v6, v6, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/adapter/SeriesAdapter;->setNewData(Ljava/util/List;)V

    .line 1477
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setSeriesGroupOptions()V

    .line 1479
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v5, Lcom/github/tvbox/osc/ui/activity/DetailActivity$17;

    invoke-direct {v5, p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$17;-><init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V

    const-wide/16 v6, 0x64

    invoke-virtual {v4, v5, v6, v7}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1486
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestStableDetailLayout()V

    .line 1487
    return-void
.end method

.method releasePlayFragment()V
    .locals 2

    .line 2389
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-nez v0, :cond_0

    return-void

    .line 2390
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitNowAllowingStateLoss()V

    .line 2391
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    .line 2392
    return-void
.end method

.method setFullPreview(Z)V
    .locals 6
    .param p1, "full"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "full"
        }
    .end annotation

    .line 2341
    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recreateDetailAfterPreviewExit:Z

    if-eqz v1, :cond_0

    .line 2342
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recreateDetailAfterPreviewExit:Z

    .line 2343
    iput-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    .line 2344
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->recreate()V

    .line 2345
    return-void

    .line 2347
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsPreview:Landroid/view/ViewGroup$LayoutParams;

    if-nez v1, :cond_1

    .line 2348
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentContainerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsPreview:Landroid/view/ViewGroup$LayoutParams;

    .line 2350
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsFull:Landroid/view/ViewGroup$LayoutParams;

    if-nez v1, :cond_2

    .line 2351
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsFull:Landroid/view/ViewGroup$LayoutParams;

    .line 2353
    :cond_2
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    .line 2354
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    .line 2359
    invoke-virtual {v1, v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setAutoSwitchLineEnabled(Z)V

    .line 2360
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    xor-int/2addr v3, v2

    invoke-virtual {v1, v3}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->setPreviewMode(Z)V

    .line 2362
    :cond_3
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    const/16 v4, 0x8

    if-nez v3, :cond_5

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v3, :cond_4

    goto :goto_0

    :cond_4
    const/16 v3, 0x8

    goto :goto_1

    :cond_5
    :goto_0
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v1, v3}, Landroidx/fragment/app/FragmentContainerView;->setVisibility(I)V

    .line 2363
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsFull:Landroid/view/ViewGroup$LayoutParams;

    goto :goto_2

    :cond_6
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->windowsPreview:Landroid/view/ViewGroup$LayoutParams;

    :goto_2
    invoke-virtual {v1, v3}, Landroidx/fragment/app/FragmentContainerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2364
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentContainerView;->requestLayout()V

    .line 2365
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainer:Landroidx/fragment/app/FragmentContainerView;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentContainerView;->invalidate()V

    .line 2366
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    xor-int/2addr v1, v2

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setPreviewRoundClip(Z)V

    .line 2367
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->llPlayerFragmentContainerBlock:Landroid/view/View;

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-nez v3, :cond_7

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-eqz v3, :cond_7

    const/4 v3, 0x0

    goto :goto_3

    :cond_7
    const/16 v3, 0x8

    :goto_3
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 2368
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridView:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v3, :cond_8

    const/16 v3, 0x8

    goto :goto_4

    :cond_8
    const/4 v3, 0x0

    :goto_4
    invoke-virtual {v1, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setVisibility(I)V

    .line 2369
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->mGridViewFlag:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    iget-boolean v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v3, :cond_9

    const/16 v3, 0x8

    goto :goto_5

    :cond_9
    const/4 v3, 0x0

    :goto_5
    invoke-virtual {v1, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setVisibility(I)V

    .line 2370
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-eqz v1, :cond_a

    .line 2371
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_9

    .line 2373
    :cond_a
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-eqz v1, :cond_c

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_6

    :cond_b
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    iget-object v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    goto :goto_7

    :cond_c
    :goto_6
    const/4 v1, 0x0

    .line 2374
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :goto_7
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->tvSeriesGroup:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_d

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v2, :cond_d

    const/4 v4, 0x0

    :cond_d
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 2375
    iget-boolean v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->showPreview:Z

    if-nez v2, :cond_e

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v2, :cond_e

    invoke-virtual {v2}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->pauseForHidden()V

    .line 2376
    :cond_e
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->vodInfo:Lcom/github/tvbox/osc/bean/VodInfo;

    if-nez v2, :cond_f

    goto :goto_8

    :cond_f
    iget v0, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    :goto_8
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->requestSeriesItemFocus(I)V

    .line 2378
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :goto_9
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->toggleSubtitleTextSize()V

    .line 2379
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->playFragment:Lcom/github/tvbox/osc/ui/fragment/PlayFragment;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/PlayFragment;->refreshPlayerLayout()V

    .line 2380
    :cond_10
    return-void
.end method

.method toggleFullPreview()V
    .locals 1

    .line 2329
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->setFullPreview(Z)V

    .line 2330
    return-void
.end method

.method toggleSubtitleTextSize()V
    .locals 5

    .line 2395
    invoke-static {p0}, Lcom/github/tvbox/osc/util/SubtitleHelper;->getTextSize(Landroid/app/Activity;)I

    move-result v0

    .line 2396
    .local v0, "subtitleTextSize":I
    iget-boolean v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->fullWindows:Z

    if-nez v1, :cond_0

    .line 2397
    int-to-double v1, v0

    const-wide v3, 0x3fe3333333333333L    # 0.6

    mul-double v1, v1, v3

    double-to-int v0, v1

    .line 2399
    :cond_0
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/event/RefreshEvent;

    const/16 v3, 0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/github/tvbox/osc/event/RefreshEvent;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v2}, Lorg/greenrobot/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 2400
    return-void
.end method
