.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/app/AlertDialog;

.field public final synthetic f$3:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$2:Landroid/app/AlertDialog;

    iput-object p4, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$3:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$2:Landroid/app/AlertDialog;

    iget-object v3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda65;->f$3:Lkotlin/jvm/functions/Function0;

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$Qp70XePPSbjRn7uiFdrE2MRm2I4(Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;Lorg/json/JSONObject;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
