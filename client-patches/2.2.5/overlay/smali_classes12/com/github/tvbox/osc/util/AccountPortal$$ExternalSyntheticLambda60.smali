.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;Landroid/content/Context;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;->f$1:Landroid/content/Context;

    iput-boolean p3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;->f$2:Z

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;->f$1:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda60;->f$2:Z

    invoke-static {v0, v1, v2, p1, p2}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$8j1EfPAh66THPDH2kPDXsCtsNLA(Landroid/widget/Button;Landroid/content/Context;ZLandroid/view/View;Z)V

    return-void
.end method
