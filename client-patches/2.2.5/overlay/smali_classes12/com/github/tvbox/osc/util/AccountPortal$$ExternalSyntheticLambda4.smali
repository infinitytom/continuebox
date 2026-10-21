.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Landroid/widget/TextView;Ljava/lang/Exception;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;->f$0:Ljava/util/List;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;->f$2:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;->f$0:Ljava/util/List;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda4;->f$2:Ljava/lang/Exception;

    invoke-static {v0, v1, v2}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$phukS_HYIDG3EX20GKdV829ickE(Ljava/util/List;Landroid/widget/TextView;Ljava/lang/Exception;)V

    return-void
.end method
