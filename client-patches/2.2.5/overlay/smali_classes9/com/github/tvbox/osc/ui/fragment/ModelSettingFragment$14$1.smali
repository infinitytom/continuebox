.class Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;
.super Ljava/lang/Object;
.source "ModelSettingFragment.java"

# interfaces
.implements Lcom/github/tvbox/osc/ui/adapter/SelectDialogAdapter$SelectDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/github/tvbox/osc/ui/adapter/SelectDialogAdapter$SelectDialogInterface<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;

.field final synthetic val$players:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$1"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$players"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 543
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->this$1:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;

    iput-object p2, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->val$players:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public click(Ljava/lang/Integer;I)V
    .locals 4
    .param p1, "value"    # Ljava/lang/Integer;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "value",
            "pos"
        }
    .end annotation

    .line 546
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->val$players:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 547
    .local v0, "thisPlayerType":Ljava/lang/Integer;
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "play_type"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 548
    .local v3, "oldPlayerType":I
    invoke-static {v2, v0}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerChoice;->markExplicit()V

    .line 549
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v3, v2, :cond_0

    .line 550
    nop

    .line 551
    const-string v2, "play_type_version"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 550
    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 553
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->this$1:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;

    iget-object v1, v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;->this$0:Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    invoke-static {v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->access$2500(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayerName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 554
    nop

    .line 555
    return-void
.end method

.method public bridge synthetic click(Ljava/lang/Object;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "value",
            "pos"
        }
    .end annotation

    .line 543
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->click(Ljava/lang/Integer;I)V

    return-void
.end method

.method public getDisplay(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2
    .param p1, "val"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "val"
        }
    .end annotation

    .line 559
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->val$players:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 560
    .local v0, "playerType":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayerName(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public bridge synthetic getDisplay(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "val"
        }
    .end annotation

    .line 543
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14$1;->getDisplay(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
