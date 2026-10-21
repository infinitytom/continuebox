.class Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;
.super Ljava/lang/Object;
.source "DetailActivity.java"

# interfaces
.implements Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/tvbox/osc/ui/activity/DetailActivity;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;


# direct methods
.method constructor <init>(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/github/tvbox/osc/ui/activity/DetailActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 607
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private refresh(Landroid/view/View;I)V
    .locals 11
    .param p1, "itemView"    # Landroid/view/View;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "itemView",
            "position"
        }
    .end annotation

    .line 609
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v0}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$2400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;->getData()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;

    iget-object v0, v0, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    .line 610
    .local v0, "newFlag":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 611
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 612
    .local v1, "oldFlag":Ljava/lang/String;
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v2

    iget v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 613
    .local v2, "oldIndex":I
    const/4 v4, 0x0

    .line 614
    .local v4, "currentSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iget-object v5, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v5}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v5

    iget-object v5, v5, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 615
    .local v5, "oldSeriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    const/4 v6, 0x1

    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 616
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v6

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 617
    .local v7, "safeOldIndex":I
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v4, v8

    check-cast v4, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 619
    .end local v7    # "safeOldIndex":I
    :cond_0
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v8}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v8

    iget-object v8, v8, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v7, v8, :cond_2

    .line 620
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v8}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v8

    iget-object v8, v8, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;

    .line 621
    .local v8, "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    iget-object v9, v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->name:Ljava/lang/String;

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 622
    iput-boolean v3, v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->selected:Z

    .line 623
    iget-object v9, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v9}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$2400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;->notifyItemChanged(I)V

    .line 624
    goto :goto_1

    .line 619
    .end local v8    # "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 627
    .end local v7    # "i":I
    :cond_2
    :goto_1
    iget-object v7, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v7}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v7

    iget-object v7, v7, Lcom/github/tvbox/osc/bean/VodInfo;->seriesFlags:Ljava/util/ArrayList;

    invoke-virtual {v7, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;

    .line 628
    .local v7, "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    iput-boolean v6, v7, Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;->selected:Z

    .line 630
    if-eqz v5, :cond_3

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-le v8, v2, :cond_3

    .line 631
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iput-boolean v3, v8, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 633
    :cond_3
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v8}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v8

    iput-object v0, v8, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    .line 634
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v8}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v8

    iget-object v8, v8, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v8, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 635
    .local v8, "newSeriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    if-eqz v8, :cond_5

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_5

    .line 636
    iget-object v9, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v9}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v9

    iget-object v10, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v10, v4, v8, v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$2500(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;Ljava/util/List;I)I

    move-result v10

    iput v10, v9, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    .line 637
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    .line 638
    .local v10, "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    iput-boolean v3, v10, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 639
    .end local v10    # "series":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    goto :goto_2

    .line 640
    :cond_4
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v3

    iget v3, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playIndex:I

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;

    iput-boolean v6, v3, Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;->selected:Z

    .line 642
    :cond_5
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$2400(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/github/tvbox/osc/ui/adapter/SeriesFlagAdapter;->notifyItemChanged(I)V

    .line 643
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-virtual {v3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->refreshList()V

    .line 645
    .end local v1    # "oldFlag":Ljava/lang/String;
    .end local v2    # "oldIndex":I
    .end local v4    # "currentSeries":Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;
    .end local v5    # "oldSeriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    .end local v7    # "flag":Lcom/github/tvbox/osc/bean/VodInfo$VodSeriesFlag;
    .end local v8    # "newSeriesList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo$VodSeries;>;"
    :cond_6
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1, p1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$2602(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/view/View;)Landroid/view/View;

    .line 646
    return-void
.end method


# virtual methods
.method public onItemClick(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;Landroid/view/View;I)V
    .locals 0
    .param p1, "parent"    # Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .param p2, "itemView"    # Landroid/view/View;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "itemView",
            "position"
        }
    .end annotation

    .line 661
    invoke-direct {p0, p2, p3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->refresh(Landroid/view/View;I)V

    .line 663
    return-void
.end method

.method public onItemPreSelected(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;Landroid/view/View;I)V
    .locals 2
    .param p1, "parent"    # Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .param p2, "itemView"    # Landroid/view/View;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "itemView",
            "position"
        }
    .end annotation

    .line 650
    const/4 v0, 0x0

    const v1, 0x3f800000    # 1.0f

    invoke-static {p2, v0, v1}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 651
    return-void
.end method

.method public onItemSelected(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;Landroid/view/View;I)V
    .locals 2
    .param p1, "parent"    # Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    .param p2, "itemView"    # Landroid/view/View;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "itemView",
            "position"
        }
    .end annotation

    .line 655
    const/4 v0, 0x1

    const v1, 0x3f800000    # 1.0f

    invoke-static {p2, v0, v1}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 656
    invoke-direct {p0, p2, p3}, Lcom/github/tvbox/osc/ui/activity/DetailActivity$13;->refresh(Landroid/view/View;I)V

    .line 657
    return-void
.end method
