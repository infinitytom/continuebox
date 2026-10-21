.class Lcom/github/tvbox/osc/ui/activity/DetailActivity$12;
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

    .line 590
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$12;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

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

    .line 605
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

    .line 593
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$12;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesSelect:Z

    .line 594
    const v0, 0x3f800000    # 1.0f

    invoke-static {p2, v1, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 595
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

    .line 599
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/activity/DetailActivity$12;->this$0:Lcom/github/tvbox/osc/ui/activity/DetailActivity;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/github/tvbox/osc/ui/activity/DetailActivity;->seriesSelect:Z

    .line 600
    const v0, 0x3f800000    # 1.0f

    invoke-static {p2, v1, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    .line 601
    return-void
.end method
