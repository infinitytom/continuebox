.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/TextView;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Landroid/app/AlertDialog;

.field public final synthetic f$6:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/content/Context;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$1:Landroid/content/Context;

    iput-object p3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$2:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$4:Ljava/lang/String;

    iput-object p6, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$5:Landroid/app/AlertDialog;

    iput-object p7, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$6:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$1:Landroid/content/Context;

    iget-object v2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$2:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$4:Ljava/lang/String;

    iget-object v5, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$5:Landroid/app/AlertDialog;

    iget-object v6, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda9;->f$6:Lkotlin/jvm/functions/Function0;

    move-object v7, p1

    check-cast v7, Lorg/json/JSONObject;

    invoke-static/range {v0 .. v7}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$DAERL8dSeHHQK2vz77NlVzFTVpk(Landroid/widget/LinearLayout;Landroid/content/Context;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;Lkotlin/jvm/functions/Function0;Lorg/json/JSONObject;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
