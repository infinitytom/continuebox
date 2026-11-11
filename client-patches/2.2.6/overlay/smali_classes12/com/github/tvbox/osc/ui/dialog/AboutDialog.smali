.class public Lcom/github/tvbox/osc/ui/dialog/AboutDialog;
.super Lcom/github/tvbox/osc/ui/dialog/BaseDialog;
.source "AboutDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 14
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/dialog/BaseDialog;-><init>(Landroid/content/Context;)V

    .line 15
    const v0, 0x7f0d0033

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/dialog/AboutDialog;->setContentView(I)V

    .line 16
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/util/UpdateChecker;->attach(Landroid/app/Dialog;Landroid/content/Context;)V

    return-void
.end method
