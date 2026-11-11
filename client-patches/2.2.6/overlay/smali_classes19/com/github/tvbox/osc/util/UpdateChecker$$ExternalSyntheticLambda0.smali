.class public final synthetic Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:[Ljava/lang/String;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;[Ljava/lang/String;ZZ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$1:[Ljava/lang/String;

    iput-boolean p3, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$2:Z

    iput-boolean p4, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$1:[Ljava/lang/String;

    iget-boolean v2, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$2:Z

    iget-boolean v3, p0, Lcom/github/tvbox/osc/util/UpdateChecker$$ExternalSyntheticLambda0;->f$3:Z

    invoke-static {v0, v1, v2, v3}, Lcom/github/tvbox/osc/util/UpdateChecker;->lambda$check$1(Landroid/app/Activity;[Ljava/lang/String;ZZ)V

    return-void
.end method
