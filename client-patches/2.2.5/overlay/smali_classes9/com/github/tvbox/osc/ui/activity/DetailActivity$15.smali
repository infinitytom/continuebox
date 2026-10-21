.class Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;
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

    .line 707
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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

    .line 731
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

    .line 710
    const/4 v0, 0x0

    const v1, 0x3f800000    # 1.0f

    invoke-static {p2, v0, v1}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 711
    const v0, 0x7f0a02c8

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 712
    .local v0, "txtView":Landroid/widget/TextView;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 714
    return-void
.end method

.method public onItemSelected(Lcom/owen/tvrecyclerview/widget/TvRecyclerView;Landroid/view/View;I)V
    .locals 3
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

    .line 718
    const/4 v0, 0x1

    const v1, 0x3f800000    # 1.0f

    invoke-static {p2, v0, v1}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 719
    const v0, 0x7f0a02c8

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 720
    .local v0, "txtView":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$3000(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060029

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 721
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/github/tvbox/osc/bean/VodInfo;->seriesMap:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1200(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Lcom/github/tvbox/osc/bean/VodInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/github/tvbox/osc/bean/VodInfo;->playFlag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 722
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$3100(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)I

    move-result v1

    mul-int v1, v1, p3

    .line 724
    .local v1, "targetPos":I
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-virtual {v2, v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->customSeriesScrollPos(I)V

    .line 726
    .end local v1    # "targetPos":I
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1, p2}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1902(Lcom/github/tvbox/osc/ui/activity/DetailActivity;Landroid/view/View;)Landroid/view/View;

    .line 727
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$15;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->access$1900(Lcom/github/tvbox/osc/ui/activity/DetailActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 728
    return-void
.end method
