.class public final Lcom/github/tvbox/osc/util/TvFocusAnimator;
.super Ljava/lang/Object;
.source "TvFocusAnimator.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0007J\"\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0007J\u0008\u0010\u0010\u001a\u00020\u0011H\u0007J\u0010\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u000fH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/github/tvbox/osc/util/TvFocusAnimator;",
        "",
        "<init>",
        "()V",
        "DURATION_MS",
        "",
        "interpolator",
        "Landroid/view/animation/DecelerateInterpolator;",
        "animate",
        "",
        "view",
        "Landroid/view/View;",
        "focused",
        "",
        "focusedScale",
        "",
        "listener",
        "Landroid/view/View$OnFocusChangeListener;",
        "dp",
        "value",
        "cards_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final DURATION_MS:J = 0xa0L

.field public static final INSTANCE:Lcom/github/tvbox/osc/util/TvFocusAnimator;

.field private static final interpolator:Landroid/view/animation/DecelerateInterpolator;


# direct methods
.method public static synthetic $r8$lambda$rOecAMaefegzpz1dsc4k1F8I2og(Landroid/view/View;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->listener$lambda$2(Landroid/view/View;Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/github/tvbox/osc/util/TvFocusAnimator;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/TvFocusAnimator;->INSTANCE:Lcom/github/tvbox/osc/util/TvFocusAnimator;

    .line 13
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const v1, 0x3faccccd    # 1.35f

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    sput-object v0, Lcom/github/tvbox/osc/util/TvFocusAnimator;->interpolator:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final animate(Landroid/view/View;Z)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "focused"    # Z
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 16
    const v0, 0x3f833333    # 1.025f

    invoke-static {p0, p1, v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;ZF)V

    return-void
.end method

.method public static final animate(Landroid/view/View;ZF)V
    .locals 11
    .param p0, "view"    # Landroid/view/View;
    .param p1, "focused"    # Z
    .param p2, "focusedScale"    # F
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 20
    if-nez p0, :cond_0

    return-void

    .line 21
    :cond_0
    const-string v0, "cb_cover"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 22
    .local v0, "cover":Landroid/view/View;
    if-nez v0, :cond_1

    move-object v1, p0

    goto :goto_0

    :cond_1
    move-object v1, v0

    .line 25
    .local v1, "target":Landroid/view/View;
    :goto_0
    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_2

    const v3, 0x3f833333    # 1.025f

    invoke-static {p2, v2, v3}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v3

    goto :goto_1

    :cond_2
    const/high16 v3, 0x3f800000    # 1.0f

    .line 26
    .local v3, "scale":F
    :goto_1
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 27
    invoke-virtual {v1, v4}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 28
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    .local v4, "$this$animate_u24lambda_u240":Landroid/view/ViewPropertyAnimator;
    const/4 v5, 0x0

    .line 29
    .local v5, "$i$a$-apply-TvFocusAnimator$animate$1":I
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 30
    if-eqz p1, :cond_3

    move v6, v3

    goto :goto_2

    :cond_3
    const/high16 v6, 0x3f800000    # 1.0f

    :goto_2
    invoke-virtual {v4, v6}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 31
    if-eqz p1, :cond_4

    move v6, v3

    goto :goto_3

    :cond_4
    const/high16 v6, 0x3f800000    # 1.0f

    :goto_3
    invoke-virtual {v4, v6}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 32
    const/4 v6, 0x0

    if-eqz p1, :cond_5

    if-eqz v0, :cond_5

    sget-object v7, Lcom/github/tvbox/osc/util/TvFocusAnimator;->INSTANCE:Lcom/github/tvbox/osc/util/TvFocusAnimator;

    const/high16 v8, 0x40400000    # 3.0f

    invoke-direct {v7, v8}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->dp(F)F

    move-result v7

    goto :goto_4

    :cond_5
    const/4 v7, 0x0

    :goto_4
    invoke-virtual {v4, v7}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    .line 33
    invoke-virtual {v4, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 34
    const-wide/16 v7, 0xa0

    if-eqz p1, :cond_6

    move-wide v9, v7

    goto :goto_5

    :cond_6
    const-wide/16 v9, 0x78

    :goto_5
    invoke-virtual {v4, v9, v10}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 35
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->getInterpolator()Landroid/animation/TimeInterpolator;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 36
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    nop

    .line 28
    .end local v4    # "$this$animate_u24lambda_u240":Landroid/view/ViewPropertyAnimator;
    .end local v5    # "$i$a$-apply-TvFocusAnimator$animate$1":I
    nop

    .line 38
    const-string v4, "cb_label"

    invoke-virtual {p0, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_7

    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    if-eqz v4, :cond_7

    .local v4, "$this$animate_u24lambda_u241":Landroid/view/ViewPropertyAnimator;
    const/4 v5, 0x0

    .line 39
    .local v5, "$i$a$-apply-TvFocusAnimator$animate$2":I
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 40
    invoke-virtual {v4, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 41
    invoke-virtual {v4, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 42
    invoke-virtual {v4, v7, v8}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 43
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->getInterpolator()Landroid/animation/TimeInterpolator;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 44
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    nop

    .line 38
    .end local v4    # "$this$animate_u24lambda_u241":Landroid/view/ViewPropertyAnimator;
    .end local v5    # "$i$a$-apply-TvFocusAnimator$animate$2":I
    :cond_7
    nop

    .line 46
    return-void
.end method

.method private final dp(F)F
    .locals 1
    .param p1, "value"    # F

    .line 53
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, p1

    return v0
.end method

.method public static final listener()Landroid/view/View$OnFocusChangeListener;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 49
    new-instance v0, Lcom/github/tvbox/osc/util/TvFocusAnimator$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/TvFocusAnimator$$ExternalSyntheticLambda0;-><init>()V

    .line 51
    return-object v0
.end method

.method private static final listener$lambda$2(Landroid/view/View;Z)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
    .param p1, "focused"    # Z

    .line 50
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/util/TvFocusAnimator;->animate(Landroid/view/View;Z)V

    .line 51
    return-void
.end method
