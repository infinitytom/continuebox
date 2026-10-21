.class public final synthetic Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/github/tvbox/osc/util/AccountPortal$$ExternalSyntheticLambda22;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/github/tvbox/osc/util/AccountPortal;->$r8$lambda$ED1-mojr84UiZsjG-uQgzhJa_eg(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method
