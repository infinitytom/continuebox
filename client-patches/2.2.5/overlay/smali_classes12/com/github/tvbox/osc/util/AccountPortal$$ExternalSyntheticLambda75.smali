.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Lkotlin/jvm/functions/Function0;

.field public final synthetic f$3:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$2:Lkotlin/jvm/functions/Function0;

    iput-object p4, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$3:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$2:Lkotlin/jvm/functions/Function0;

    iget-object v3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda75;->f$3:Landroid/content/Context;

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$2zVmGsnoz6sBYjyJ0upmdNQCzkQ(Landroid/widget/EditText;Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;Landroid/content/Context;Lorg/json/JSONObject;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
