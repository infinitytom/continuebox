.class Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;
.super Ljava/lang/Object;
.source "ModelSettingFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;


# direct methods
.method constructor <init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 527
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;->this$0:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 530
    invoke-static {p1}, Lcom/github/tvbox/osc/util/FastClickCheckUtil;->check(Landroid/view/View;)V

    .line 531
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "play_type"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 532
    .local v0, "playerType":I
    const/4 v1, 0x0

    .line 533
    .local v1, "defaultPos":I
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerHelper;->getExistPlayerTypes()Ljava/util/ArrayList;

    move-result-object v2
    const/4 v3, -0x1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    const/4 v4, 0x0
    invoke-virtual {v2, v4, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerChoice;->configuredType()I
    move-result v0

    .line 534
    .local v2, "players":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 535
    .local v3, "renders":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v4, 0x0

    .local v4, "p":I
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 536
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 537
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v5, v0, :cond_0

    .line 538
    move v1, v4

    .line 535
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 541
    .end local v4    # "p":I
    :cond_1
    new-instance v4, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;

    iget-object v5, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;->this$0:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    invoke-static {v5}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->access$2400(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;-><init>(Landroid/content/Context;)V

    .line 542
    .local v4, "dialog":Lcom/github/tvbox/osc/ui/dialog/SelectDialog;, "Lcom/github/tvbox/osc/ui/dialog/SelectDialog<Ljava/lang/Integer;>;"
    const-string v5, "\u8bf7\u9009\u62e9\u9ed8\u8ba4\u64ad\u653e\u5668"

    invoke-virtual {v4, v5}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setTip(Ljava/lang/String;)V

    .line 543
    new-instance v5, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;

    invoke-direct {v5, p0, v2}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;Ljava/util/ArrayList;)V

    new-instance v6, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$2;

    invoke-direct {v6, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$2;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;)V

    invoke-virtual {v4, v5, v6, v3, v1}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->setAdapter(Lcom/github/tvbox/osc/ui/adapter/SelectDialogAdapter$SelectDialogInterface;Landroidx/recyclerview/widget/DiffUtil$ItemCallback;Ljava/util/List;I)V

    .line 573
    invoke-virtual {v4}, Lcom/github/tvbox/osc/ui/dialog/SelectDialog;->show()V

    .line 574
    return-void
.end method
