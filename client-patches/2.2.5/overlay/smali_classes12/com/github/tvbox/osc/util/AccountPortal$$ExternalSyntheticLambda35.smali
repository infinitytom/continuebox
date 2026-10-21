.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda35;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Landroid/app/AlertDialog;

.field public final synthetic f$1:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda35;->f$0:Landroid/app/AlertDialog;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda35;->f$1:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda35;->f$0:Landroid/app/AlertDialog;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda35;->f$1:Lkotlin/jvm/functions/Function0;

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {v0, v1, p1}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$5PlLo1YCqXHGOscQXlYMlzNySxw(Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;Lorg/json/JSONObject;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
