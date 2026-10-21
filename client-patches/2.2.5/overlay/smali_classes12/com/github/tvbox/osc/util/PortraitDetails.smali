.class public final Lcom/github/tvbox/osc/util/PortraitDetails;
.super Ljava/lang/Object;
.source "PortraitDetails.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPortraitDetails.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PortraitDetails.kt\ncom/github/tvbox/osc/util/PortraitDetails\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,76:1\n9389#2,2:77\n9539#2,4:79\n1#3:83\n*S KotlinDebug\n*F\n+ 1 PortraitDetails.kt\ncom/github/tvbox/osc/util/PortraitDetails\n*L\n28#1:77,2\n28#1:79,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/github/tvbox/osc/util/PortraitDetails;",
        "",
        "<init>",
        "()V",
        "apply",
        "",
        "activity",
        "Landroid/app/Activity;",
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
.field public static final INSTANCE:Lcom/github/tvbox/osc/util/PortraitDetails;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/github/tvbox/osc/util/PortraitDetails;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PortraitDetails;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/PortraitDetails;->INSTANCE:Lcom/github/tvbox/osc/util/PortraitDetails;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final apply(Landroid/app/Activity;)V
    .locals 36
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object/from16 v0, p0

    const-string v1, "activity"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    const-string v1, "topLayout"

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/widget/LinearLayout;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_1

    return-void

    .line 21
    .local v1, "top":Landroid/widget/LinearLayout;
    :cond_1
    const-string v2, "detailLowerContent"

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    instance-of v4, v2, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_2

    check-cast v2, Landroid/widget/LinearLayout;

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-nez v2, :cond_3

    return-void

    .line 22
    .local v2, "lower":Landroid/widget/LinearLayout;
    :cond_3
    const-string v4, "thumbContainer"

    invoke-static {v0, v4}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    if-nez v4, :cond_4

    return-void

    .line 23
    .local v4, "thumb":Landroid/view/View;
    :cond_4
    const-string v5, "tvName"

    invoke-static {v0, v5}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    instance-of v6, v5, Landroid/widget/TextView;

    if-eqz v6, :cond_5

    check-cast v5, Landroid/widget/TextView;

    goto :goto_2

    :cond_5
    const/4 v5, 0x0

    :goto_2
    if-nez v5, :cond_6

    return-void

    .line 24
    .local v5, "title":Landroid/widget/TextView;
    :cond_6
    invoke-virtual {v5}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    instance-of v7, v6, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_7

    check-cast v6, Landroid/widget/LinearLayout;

    goto :goto_3

    :cond_7
    const/4 v6, 0x0

    :goto_3
    if-nez v6, :cond_8

    return-void

    .line 25
    .local v6, "info":Landroid/widget/LinearLayout;
    :cond_8
    const-string v7, "tvPlay"

    invoke-static {v0, v7}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v8

    instance-of v9, v8, Landroid/widget/TextView;

    if-eqz v9, :cond_9

    check-cast v8, Landroid/widget/TextView;

    goto :goto_4

    :cond_9
    const/4 v8, 0x0

    :goto_4
    if-nez v8, :cond_a

    return-void

    .line 26
    .local v8, "play":Landroid/widget/TextView;
    :cond_a
    invoke-virtual {v8}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    instance-of v10, v9, Landroid/widget/LinearLayout;

    if-eqz v10, :cond_b

    check-cast v9, Landroid/widget/LinearLayout;

    goto :goto_5

    :cond_b
    const/4 v9, 0x0

    :goto_5
    if-nez v9, :cond_c

    return-void

    .line 27
    .local v9, "actions":Landroid/widget/LinearLayout;
    :cond_c
    const-string v10, "tvCollect"

    const-string v11, "tvQuickSearch"

    const-string v12, "tvDesc"

    const-string v13, "tvReviews"

    filled-new-array {v7, v10, v11, v12, v13}, [Ljava/lang/String;

    move-result-object v14

    .line 28
    nop

    .local v14, "$this$associateWith$iv":[Ljava/lang/Object;
    const/4 v15, 0x0

    .line 77
    .local v15, "$i$f$associateWith":I
    new-instance v3, Ljava/util/LinkedHashMap;

    move-object/from16 v16, v8

    .end local v8    # "play":Landroid/widget/TextView;
    .local v16, "play":Landroid/widget/TextView;
    array-length v8, v14

    invoke-static {v8}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v8

    move/from16 v17, v15

    .end local v15    # "$i$f$associateWith":I
    .local v17, "$i$f$associateWith":I
    const/16 v15, 0x10

    invoke-static {v8, v15}, Lkotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v8

    invoke-direct {v3, v8}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 78
    .local v3, "result$iv":Ljava/util/LinkedHashMap;
    move-object v8, v14

    .local v8, "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    const/16 v18, 0x0

    .line 79
    .local v18, "$i$f$associateWithTo":I
    array-length v15, v8

    move-object/from16 v20, v14

    .end local v14    # "$this$associateWith$iv":[Ljava/lang/Object;
    .local v20, "$this$associateWith$iv":[Ljava/lang/Object;
    const/4 v14, 0x0

    :goto_6
    if-ge v14, v15, :cond_e

    move/from16 v22, v15

    aget-object v15, v8, v14

    .line 80
    .local v15, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v23, v8

    .end local v8    # "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    .local v23, "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    move-object v8, v3

    check-cast v8, Ljava/util/Map;

    move-object/from16 v24, v15

    .local v24, "it":Ljava/lang/String;
    const/16 v25, 0x0

    .line 28
    .local v25, "$i$a$-associateWith-PortraitDetails$apply$buttons$1":I
    move-object/from16 v26, v11

    move-object/from16 v11, v24

    move-object/from16 v24, v12

    .end local v24    # "it":Ljava/lang/String;
    .local v11, "it":Ljava/lang/String;
    invoke-static {v0, v11}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v12

    move-object/from16 v27, v11

    .end local v11    # "it":Ljava/lang/String;
    .local v27, "it":Ljava/lang/String;
    instance-of v11, v12, Landroid/widget/TextView;

    if-eqz v11, :cond_d

    check-cast v12, Landroid/widget/TextView;

    goto :goto_7

    :cond_d
    const/4 v12, 0x0

    .line 80
    .end local v25    # "$i$a$-associateWith-PortraitDetails$apply$buttons$1":I
    .end local v27    # "it":Ljava/lang/String;
    :goto_7
    invoke-interface {v8, v15, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .end local v15    # "element$iv$iv":Ljava/lang/Object;
    add-int/lit8 v14, v14, 0x1

    move/from16 v15, v22

    move-object/from16 v8, v23

    move-object/from16 v12, v24

    move-object/from16 v11, v26

    goto :goto_6

    .line 82
    .end local v23    # "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    .restart local v8    # "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    :cond_e
    move-object/from16 v23, v8

    move-object/from16 v26, v11

    move-object/from16 v24, v12

    .end local v8    # "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    .restart local v23    # "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    move-object v8, v3

    check-cast v8, Ljava/util/Map;

    .line 78
    .end local v18    # "$i$f$associateWithTo":I
    .end local v23    # "$this$associateWithTo$iv$iv":[Ljava/lang/Object;
    nop

    .line 28
    .end local v3    # "result$iv":Ljava/util/LinkedHashMap;
    .end local v17    # "$i$f$associateWith":I
    .end local v20    # "$this$associateWith$iv":[Ljava/lang/Object;
    nop

    .line 27
    move-object v3, v8

    .line 29
    .local v3, "buttons":Ljava/util/Map;
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v8, v8

    const/high16 v11, 0x43c30000    # 390.0f

    div-float/2addr v8, v11

    .line 31
    .local v8, "unit":F
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    instance-of v12, v11, Landroid/view/ViewGroup;

    if-eqz v12, :cond_f

    check-cast v11, Landroid/view/ViewGroup;

    goto :goto_8

    :cond_f
    const/4 v11, 0x0

    :goto_8
    if-eqz v11, :cond_10

    move-object v12, v1

    check-cast v12, Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    :cond_10
    move-object v11, v1

    check-cast v11, Landroid/view/View;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x1

    const/4 v15, -0x2

    invoke-direct {v12, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    check-cast v12, Landroid/view/ViewGroup$LayoutParams;

    const/4 v14, 0x0

    invoke-virtual {v2, v11, v14, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 33
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    const/16 v12, 0x10

    invoke-static {v8, v12}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v14

    const/16 v11, 0xc

    invoke-static {v8, v11}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v15

    invoke-static {v8, v12}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v11

    invoke-static {v8, v12}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v12

    invoke-virtual {v1, v14, v15, v11, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 35
    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    instance-of v12, v11, Landroid/view/ViewGroup;

    if-eqz v12, :cond_11

    check-cast v11, Landroid/view/ViewGroup;

    goto :goto_9

    :cond_11
    const/4 v11, 0x0

    :goto_9
    if-eqz v11, :cond_12

    move-object v12, v9

    check-cast v12, Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 36
    :cond_12
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    instance-of v12, v11, Landroid/view/ViewGroup;

    if-eqz v12, :cond_13

    check-cast v11, Landroid/view/ViewGroup;

    goto :goto_a

    :cond_13
    const/4 v11, 0x0

    :goto_a
    if-eqz v11, :cond_14

    invoke-virtual {v11, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 37
    :cond_14
    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    instance-of v12, v11, Landroid/view/ViewGroup;

    if-eqz v12, :cond_15

    check-cast v11, Landroid/view/ViewGroup;

    goto :goto_b

    :cond_15
    const/4 v11, 0x0

    :goto_b
    if-eqz v11, :cond_16

    move-object v12, v6

    check-cast v12, Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 38
    :cond_16
    new-instance v11, Landroid/widget/LinearLayout;

    move-object v12, v0

    check-cast v12, Landroid/content/Context;

    invoke-direct {v11, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v12, v11

    .line 83
    .local v12, "$this$apply_u24lambda_u241":Landroid/widget/LinearLayout;
    const/4 v14, 0x0

    .line 38
    .local v14, "$i$a$-apply-PortraitDetails$apply$hero$1":I
    const/4 v15, 0x0

    invoke-virtual {v12, v15}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 39
    .end local v12    # "$this$apply_u24lambda_u241":Landroid/widget/LinearLayout;
    .end local v14    # "$i$a$-apply-PortraitDetails$apply$hero$1":I
    .local v11, "hero":Landroid/widget/LinearLayout;
    move-object v12, v11

    check-cast v12, Landroid/view/View;

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    move-object/from16 v22, v2

    const/4 v2, -0x1

    const/4 v15, -0x2

    .end local v2    # "lower":Landroid/widget/LinearLayout;
    .local v22, "lower":Landroid/widget/LinearLayout;
    invoke-direct {v14, v2, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    check-cast v14, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, 0x0

    invoke-virtual {v1, v12, v2, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 40
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x6c

    invoke-static {v8, v12}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v12

    const/16 v14, 0x9a

    invoke-static {v8, v14}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v14

    invoke-direct {v2, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    check-cast v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v11, v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    move-object v2, v6

    check-cast v2, Landroid/view/View;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v14, 0xb8

    invoke-static {v8, v14}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v14

    const/high16 v15, 0x3f800000    # 1.0f

    move-object/from16 v23, v4

    const/4 v4, 0x0

    .end local v4    # "thumb":Landroid/view/View;
    .local v23, "thumb":Landroid/view/View;
    invoke-direct {v12, v4, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 83
    move-object v4, v12

    .local v4, "$this$apply_u24lambda_u242":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, 0x0

    .line 41
    .local v14, "$i$a$-apply-PortraitDetails$apply$1":I
    move/from16 v27, v14

    const/16 v15, 0xc

    .end local v14    # "$i$a$-apply-PortraitDetails$apply$1":I
    .local v27, "$i$a$-apply-PortraitDetails$apply$1":I
    invoke-static {v8, v15}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v14

    iput v14, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .end local v4    # "$this$apply_u24lambda_u242":Landroid/widget/LinearLayout$LayoutParams;
    .end local v27    # "$i$a$-apply-PortraitDetails$apply$1":I
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast v12, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v11, v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    const/16 v2, 0xa

    invoke-static {v8, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v4

    const/16 v12, 0x8

    invoke-static {v8, v12}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v14

    invoke-static {v8, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v2

    invoke-static {v8, v12}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v15

    invoke-virtual {v6, v4, v14, v2, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 43
    const-string v2, "ivThumb"

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    instance-of v4, v2, Landroid/widget/ImageView;

    if-eqz v4, :cond_17

    check-cast v2, Landroid/widget/ImageView;

    goto :goto_c

    :cond_17
    const/4 v2, 0x0

    :goto_c
    if-eqz v2, :cond_18

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v14, -0x1

    invoke-direct {v4, v14, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    check-cast v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    :cond_18
    const/4 v2, 0x0

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 45
    const/4 v4, 0x2

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 46
    const/16 v14, 0x14

    invoke-static {v8, v14}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v14

    int-to-float v14, v14

    invoke-virtual {v5, v2, v14}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 47
    const-string v33, "tvLang"

    const-string v34, "tvPlayUrl"

    const-string v27, "tvActor"

    const-string v28, "tvDirector"

    const-string v29, "tvDes"

    const-string v30, "tvSite"

    const-string v31, "tvYear"

    const-string v32, "tvArea"

    filled-new-array/range {v27 .. v34}, [Ljava/lang/String;

    move-result-object v2

    const/4 v14, 0x0

    :goto_d
    if-ge v14, v12, :cond_1b

    aget-object v15, v2, v14

    .line 48
    .local v15, "name":Ljava/lang/String;
    invoke-static {v0, v15}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v12

    instance-of v4, v12, Landroid/widget/TextView;

    if-eqz v4, :cond_19

    check-cast v12, Landroid/widget/TextView;

    goto :goto_e

    :cond_19
    const/4 v12, 0x0

    :goto_e
    if-eqz v12, :cond_1a

    move-object v4, v12

    .line 83
    .local v4, "$this$apply_u24lambda_u243":Landroid/widget/TextView;
    const/4 v12, 0x0

    .line 48
    .local v12, "$i$a$-apply-PortraitDetails$apply$2":I
    move-object/from16 v29, v2

    const/4 v2, 0x2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    move-object/from16 v20, v5

    const/16 v2, 0xc

    .end local v5    # "title":Landroid/widget/TextView;
    .local v20, "title":Landroid/widget/TextView;
    invoke-static {v8, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v5

    int-to-float v5, v5

    const/4 v2, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .end local v4    # "$this$apply_u24lambda_u243":Landroid/widget/TextView;
    .end local v12    # "$i$a$-apply-PortraitDetails$apply$2":I
    goto :goto_f

    .end local v20    # "title":Landroid/widget/TextView;
    .restart local v5    # "title":Landroid/widget/TextView;
    :cond_1a
    move-object/from16 v29, v2

    move-object/from16 v20, v5

    .line 47
    .end local v5    # "title":Landroid/widget/TextView;
    .end local v15    # "name":Ljava/lang/String;
    .restart local v20    # "title":Landroid/widget/TextView;
    :goto_f
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v5, v20

    move-object/from16 v2, v29

    const/4 v4, 0x2

    const/16 v12, 0x8

    goto :goto_d

    .line 50
    .end local v20    # "title":Landroid/widget/TextView;
    .restart local v5    # "title":Landroid/widget/TextView;
    :cond_1b
    move-object/from16 v20, v5

    .end local v5    # "title":Landroid/widget/TextView;
    .restart local v20    # "title":Landroid/widget/TextView;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    :goto_10
    if-ge v2, v4, :cond_1e

    .line 51
    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v12, v5, Landroid/widget/ScrollView;

    if-eqz v12, :cond_1c

    check-cast v5, Landroid/widget/ScrollView;

    goto :goto_11

    :cond_1c
    const/4 v5, 0x0

    :goto_11
    if-eqz v5, :cond_1d

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    move/from16 v29, v4

    const/4 v4, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v15, -0x1

    invoke-direct {v12, v15, v4, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    check-cast v12, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v5, v12}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_12

    :cond_1d
    move/from16 v29, v4

    .line 50
    :goto_12
    add-int/lit8 v2, v2, 0x1

    move/from16 v4, v29

    goto :goto_10

    .line 53
    .end local v2    # "i":I
    :cond_1e
    invoke-virtual {v9}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 54
    const/4 v2, 0x1

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 55
    move-object v2, v9

    check-cast v2, Landroid/view/View;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v12, -0x1

    invoke-direct {v4, v12, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 83
    move-object v5, v4

    .local v5, "$this$apply_u24lambda_u244":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v12, 0x0

    .line 55
    .local v12, "$i$a$-apply-PortraitDetails$apply$3":I
    const/16 v14, 0xe

    invoke-static {v8, v14}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v15

    iput v15, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .end local v5    # "$this$apply_u24lambda_u244":Landroid/widget/LinearLayout$LayoutParams;
    .end local v12    # "$i$a$-apply-PortraitDetails$apply$3":I
    sget-object v5, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    const/4 v2, 0x2

    new-array v4, v2, [[Ljava/lang/String;

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    move-object/from16 v2, v24

    move-object/from16 v5, v26

    filled-new-array {v5, v2, v13}, [Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    aput-object v2, v4, v5

    move-object v2, v4

    check-cast v2, [Ljava/lang/Object;

    array-length v2, v2

    const/4 v5, 0x0

    :goto_13
    if-ge v5, v2, :cond_23

    aget-object v10, v4, v5

    .line 57
    .local v10, "names":[Ljava/lang/String;
    new-instance v12, Landroid/widget/LinearLayout;

    move-object v13, v0

    check-cast v13, Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v13, v12

    .line 83
    .local v13, "$this$apply_u24lambda_u245":Landroid/widget/LinearLayout;
    const/4 v15, 0x0

    .line 57
    .local v15, "$i$a$-apply-PortraitDetails$apply$row$1":I
    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 58
    .end local v13    # "$this$apply_u24lambda_u245":Landroid/widget/LinearLayout;
    .end local v15    # "$i$a$-apply-PortraitDetails$apply$row$1":I
    .local v12, "row":Landroid/widget/LinearLayout;
    move-object v13, v12

    check-cast v13, Landroid/view/View;

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v15, -0x2

    invoke-direct {v14, v7, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 83
    move-object/from16 v19, v14

    .local v19, "$this$apply_u24lambda_u246":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v26, 0x0

    .line 58
    .local v26, "$i$a$-apply-PortraitDetails$apply$4":I
    const/16 v7, 0x8

    invoke-static {v8, v7}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v15

    move-object/from16 v7, v19

    .end local v19    # "$this$apply_u24lambda_u246":Landroid/widget/LinearLayout$LayoutParams;
    .local v7, "$this$apply_u24lambda_u246":Landroid/widget/LinearLayout$LayoutParams;
    iput v15, v7, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .end local v7    # "$this$apply_u24lambda_u246":Landroid/widget/LinearLayout$LayoutParams;
    .end local v26    # "$i$a$-apply-PortraitDetails$apply$4":I
    sget-object v7, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast v14, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v9, v13, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    array-length v7, v10

    const/4 v14, 0x0

    :goto_14
    if-ge v14, v7, :cond_22

    aget-object v13, v10, v14

    .line 60
    .local v13, "name":Ljava/lang/String;
    invoke-interface {v3, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    if-nez v15, :cond_1f

    move/from16 v19, v2

    move-object/from16 v26, v3

    move-object/from16 v31, v4

    move-object/from16 v32, v6

    move/from16 v25, v7

    move-object/from16 v34, v9

    move-object/from16 v35, v10

    const/16 v2, 0xe

    goto :goto_16

    .line 61
    .local v15, "button":Landroid/widget/TextView;
    :cond_1f
    move/from16 v19, v2

    invoke-virtual {v15}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    move-object/from16 v26, v3

    .end local v3    # "buttons":Ljava/util/Map;
    .local v26, "buttons":Ljava/util/Map;
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_20

    check-cast v2, Landroid/view/ViewGroup;

    goto :goto_15

    :cond_20
    const/4 v2, 0x0

    :goto_15
    if-eqz v2, :cond_21

    move-object v3, v15

    check-cast v3, Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 62
    :cond_21
    move-object v2, v15

    check-cast v2, Landroid/view/View;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    move-object/from16 v31, v4

    const/16 v4, 0x2c

    invoke-static {v8, v4}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v4

    move-object/from16 v32, v6

    move/from16 v25, v7

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    .end local v6    # "info":Landroid/widget/LinearLayout;
    .local v32, "info":Landroid/widget/LinearLayout;
    invoke-direct {v3, v7, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 83
    move-object v4, v3

    .local v4, "$this$apply_u24lambda_u247":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v21, 0x0

    .line 62
    .local v21, "$i$a$-apply-PortraitDetails$apply$5":I
    move-object/from16 v34, v9

    const/4 v6, 0x3

    .end local v9    # "actions":Landroid/widget/LinearLayout;
    .local v34, "actions":Landroid/widget/LinearLayout;
    invoke-static {v8, v6}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v9

    move-object/from16 v35, v10

    .end local v10    # "names":[Ljava/lang/String;
    .local v35, "names":[Ljava/lang/String;
    invoke-static {v8, v6}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v10

    invoke-virtual {v4, v9, v7, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .end local v4    # "$this$apply_u24lambda_u247":Landroid/widget/LinearLayout$LayoutParams;
    .end local v21    # "$i$a$-apply-PortraitDetails$apply$5":I
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    check-cast v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v12, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    const/16 v2, 0x11

    invoke-virtual {v15, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 64
    const/16 v2, 0xe

    invoke-static {v8, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v15, v7, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 65
    const v3, -0xb0f08

    invoke-virtual {v15, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .end local v13    # "name":Ljava/lang/String;
    .end local v15    # "button":Landroid/widget/TextView;
    :goto_16
    add-int/lit8 v14, v14, 0x1

    move/from16 v2, v19

    move/from16 v7, v25

    move-object/from16 v3, v26

    move-object/from16 v4, v31

    move-object/from16 v6, v32

    move-object/from16 v9, v34

    move-object/from16 v10, v35

    goto/16 :goto_14

    .end local v26    # "buttons":Ljava/util/Map;
    .end local v32    # "info":Landroid/widget/LinearLayout;
    .end local v34    # "actions":Landroid/widget/LinearLayout;
    .end local v35    # "names":[Ljava/lang/String;
    .restart local v3    # "buttons":Ljava/util/Map;
    .restart local v6    # "info":Landroid/widget/LinearLayout;
    .restart local v9    # "actions":Landroid/widget/LinearLayout;
    .restart local v10    # "names":[Ljava/lang/String;
    :cond_22
    move/from16 v19, v2

    move-object/from16 v26, v3

    move-object/from16 v31, v4

    move-object/from16 v32, v6

    move-object/from16 v34, v9

    move-object/from16 v35, v10

    const/16 v2, 0xe

    .line 56
    .end local v3    # "buttons":Ljava/util/Map;
    .end local v6    # "info":Landroid/widget/LinearLayout;
    .end local v9    # "actions":Landroid/widget/LinearLayout;
    .end local v10    # "names":[Ljava/lang/String;
    .end local v12    # "row":Landroid/widget/LinearLayout;
    .restart local v26    # "buttons":Ljava/util/Map;
    .restart local v32    # "info":Landroid/widget/LinearLayout;
    .restart local v34    # "actions":Landroid/widget/LinearLayout;
    add-int/lit8 v5, v5, 0x1

    move/from16 v2, v19

    const/16 v14, 0xe

    goto/16 :goto_13

    .line 68
    .end local v26    # "buttons":Ljava/util/Map;
    .end local v32    # "info":Landroid/widget/LinearLayout;
    .end local v34    # "actions":Landroid/widget/LinearLayout;
    .restart local v3    # "buttons":Ljava/util/Map;
    .restart local v6    # "info":Landroid/widget/LinearLayout;
    .restart local v9    # "actions":Landroid/widget/LinearLayout;
    :cond_23
    move-object/from16 v26, v3

    move-object/from16 v32, v6

    move-object/from16 v34, v9

    .end local v3    # "buttons":Ljava/util/Map;
    .end local v6    # "info":Landroid/widget/LinearLayout;
    .end local v9    # "actions":Landroid/widget/LinearLayout;
    .restart local v26    # "buttons":Ljava/util/Map;
    .restart local v32    # "info":Landroid/widget/LinearLayout;
    .restart local v34    # "actions":Landroid/widget/LinearLayout;
    const/4 v2, 0x3

    new-array v3, v2, [Lkotlin/Pair;

    const/16 v2, 0xdc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v4, "mGridView"

    invoke-static {v4, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v4, 0x0

    aput-object v2, v3, v4

    const/16 v2, 0xb4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v5, "mPeopleView"

    invoke-static {v5, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v5, 0x1

    aput-object v2, v3, v5

    const/16 v2, 0xd2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v5, "mRecommendView"

    invoke-static {v5, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v3, v5

    const/4 v14, 0x0

    :goto_17
    const/4 v2, 0x3

    if-ge v14, v2, :cond_25

    aget-object v4, v3, v14

    invoke-virtual {v4}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v4}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 69
    .local v4, "height":I
    invoke-static {v0, v5}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_24

    .line 83
    .local v6, "it":Landroid/view/View;
    const/4 v7, 0x0

    .line 69
    .local v7, "$i$a$-let-PortraitDetails$apply$6":I
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    .line 83
    move-object v10, v9

    .local v10, "$this$apply_u24lambda_u249_u24lambda_u248":Landroid/view/ViewGroup$LayoutParams;
    const/4 v12, 0x0

    .line 69
    .local v12, "$i$a$-apply-PortraitDetails$apply$6$1":I
    invoke-static {v8, v4}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$px(FI)I

    move-result v13

    iput v13, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .end local v10    # "$this$apply_u24lambda_u249_u24lambda_u248":Landroid/view/ViewGroup$LayoutParams;
    .end local v12    # "$i$a$-apply-PortraitDetails$apply$6$1":I
    invoke-virtual {v6, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .end local v4    # "height":I
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "it":Landroid/view/View;
    .end local v7    # "$i$a$-let-PortraitDetails$apply$6":I
    :cond_24
    add-int/lit8 v14, v14, 0x1

    goto :goto_17

    .line 71
    :cond_25
    const-string v2, "episodeDetailScroll"

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_26

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 72
    :cond_26
    const-string v2, "ivBackdrop"

    invoke-static {v0, v2}, Lcom/github/tvbox/osc/util/PortraitDetails;->apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_27

    const v3, 0x3df5c28f    # 0.12f

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 73
    :cond_27
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 74
    return-void
.end method

.method private static final apply$px(FI)I
    .locals 1
    .param p0, "unit"    # F
    .param p1, "value"    # I

    .line 30
    int-to-float v0, p1

    mul-float v0, v0, p0

    invoke-static {v0}, Lkotlin/math/MathKt;->roundToInt(F)I

    move-result v0

    return v0
.end method

.method private static final apply$view(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .locals 3
    .param p0, "$activity"    # Landroid/app/Activity;
    .param p1, "name"    # Ljava/lang/String;

    .line 18
    nop

    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 19
    return-object v0
.end method
