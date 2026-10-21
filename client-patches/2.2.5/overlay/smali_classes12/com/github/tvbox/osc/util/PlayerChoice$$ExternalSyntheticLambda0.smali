.class public final synthetic Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Landroid/widget/CheckBox;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Landroid/widget/CheckBox;Landroid/app/Activity;Ljava/lang/Object;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$0:Ljava/util/List;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$1:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$0:Ljava/util/List;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$1:Landroid/widget/CheckBox;

    iget-object v2, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;->f$3:Ljava/lang/Object;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lcom/github/tvbox/osc/util/PlayerChoice;->$r8$lambda$FWs8QY6CNpxc3EJnzeoYLBj8drA(Ljava/util/List;Landroid/widget/CheckBox;Landroid/app/Activity;Ljava/lang/Object;Landroid/content/DialogInterface;I)V

    return-void
.end method
