.class public final Lcom/github/tvbox/osc/util/PlayerChoice;
.super Ljava/lang/Object;
.source "PlayerChoice.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPlayerChoice.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PlayerChoice.kt\ncom/github/tvbox/osc/util/PlayerChoice\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,90:1\n1#2:91\n1563#3:92\n1634#3,3:93\n37#4:96\n36#4,3:97\n*S KotlinDebug\n*F\n+ 1 PlayerChoice.kt\ncom/github/tvbox/osc/util/PlayerChoice\n*L\n54#1:92\n54#1:93,3\n57#1:96\n57#1:97,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u000b\u001a\u00020\u000cH\u0007J\u0008\u0010\r\u001a\u00020\u000eH\u0007J\u0010\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u0011H\u0007J\u0010\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u0001H\u0007J\u0018\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u00012\u0006\u0010\u0015\u001a\u00020\u000cH\u0002R\u001e\u0010\u0004\u001a\u0012\u0012\u0002\u0008\u0003 \u0006*\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0007\u001a\n \u0006*\u0004\u0018\u00010\u00080\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\n \u0006*\u0004\u0018\u00010\u00080\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\n\u001a\u0012\u0012\u0002\u0008\u0003 \u0006*\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/github/tvbox/osc/util/PlayerChoice;",
        "",
        "<init>",
        "()V",
        "hawk",
        "Ljava/lang/Class;",
        "kotlin.jvm.PlatformType",
        "get",
        "Ljava/lang/reflect/Method;",
        "put",
        "helper",
        "configuredType",
        "",
        "markExplicit",
        "",
        "applyConfigured",
        "config",
        "Lorg/json/JSONObject;",
        "begin",
        "fragment",
        "resume",
        "type",
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
.field public static final INSTANCE:Lcom/github/tvbox/osc/util/PlayerChoice;

.field private static final get:Ljava/lang/reflect/Method;

.field private static final hawk:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final helper:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final put:Ljava/lang/reflect/Method;


# direct methods
.method public static synthetic $r8$lambda$FWs8QY6CNpxc3EJnzeoYLBj8drA(Ljava/util/List;Landroid/widget/CheckBox;Landroid/app/Activity;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/github/tvbox/osc/util/PlayerChoice;->begin$lambda$3(Ljava/util/List;Landroid/widget/CheckBox;Landroid/app/Activity;Ljava/lang/Object;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/github/tvbox/osc/util/PlayerChoice;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlayerChoice;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->INSTANCE:Lcom/github/tvbox/osc/util/PlayerChoice;

    .line 12
    const-string v0, "com.orhanobut.hawk.Hawk"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->hawk:Ljava/lang/Class;

    .line 13
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->hawk:Ljava/lang/Class;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/Object;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "get"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->get:Ljava/lang/reflect/Method;

    .line 14
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->hawk:Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    aput-object v2, v1, v4

    const-class v2, Ljava/lang/Object;

    aput-object v2, v1, v5

    const-string v2, "put"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->put:Ljava/lang/reflect/Method;

    .line 15
    const-string v0, "com.github.tvbox.osc.util.PlayerHelper"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->helper:Ljava/lang/Class;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final applyConfigured(Lorg/json/JSONObject;)V
    .locals 6
    .param p0, "config"    # Lorg/json/JSONObject;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "config"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerChoice;->configuredType()I

    move-result v0

    .line 30
    .local v0, "type":I
    if-ltz v0, :cond_0

    .line 31
    const-string v1, "pl"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 32
    sget-object v1, Lcom/github/tvbox/osc/util/PlayerChoice;->get:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "play_type_version"

    aput-object v5, v4, v2

    const/4 v2, 0x1

    aput-object v3, v4, v2

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "plv"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    :cond_0
    return-void
.end method

.method public static final begin(Ljava/lang/Object;)V
    .locals 19
    .param p0, "fragment"    # Ljava/lang/Object;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object/from16 v0, p0

    const-string v1, "fragment"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    const-string v4, "requireActivity"

    invoke-virtual {v1, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "null cannot be cast to non-null type android.app.Activity"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroid/app/Activity;

    .line 39
    .local v1, "activity":Landroid/app/Activity;
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_2

    .line 40
    :cond_0
    sget-object v3, Lcom/github/tvbox/osc/util/PlayerChoice;->helper:Ljava/lang/Class;

    const-string v4, "mPlayersExistInfo"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    move-object v4, v3

    .line 91
    .local v4, "$this$begin_u24lambda_u240":Ljava/lang/reflect/Field;
    const/4 v5, 0x0

    .line 40
    .local v5, "$i$a$-apply-PlayerChoice$begin$1":I
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .end local v4    # "$this$begin_u24lambda_u240":Ljava/lang/reflect/Field;
    .end local v5    # "$i$a$-apply-PlayerChoice$begin$1":I
    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    sget-object v3, Lcom/github/tvbox/osc/util/PlayerChoice;->helper:Ljava/lang/Class;

    const-string v5, "getExistPlayerTypes"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v5, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Int>"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/util/List;

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->sorted(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    .line 41
    nop

    .line 43
    .local v3, "types":Ljava/util/List;
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerChoice;->configuredType()I

    move-result v5

    .line 44
    .local v5, "selected":I
    if-ltz v5, :cond_1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 45
    sget-object v2, Lcom/github/tvbox/osc/util/PlayerChoice;->INSTANCE:Lcom/github/tvbox/osc/util/PlayerChoice;

    invoke-direct {v2, v0, v5}, Lcom/github/tvbox/osc/util/PlayerChoice;->resume(Ljava/lang/Object;I)V

    .line 46
    return-void

    .line 48
    :cond_1
    new-instance v7, Landroid/widget/CheckBox;

    move-object v8, v1

    check-cast v8, Landroid/content/Context;

    invoke-direct {v7, v8}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    move-object v8, v7

    .local v8, "$this$begin_u24lambda_u241":Landroid/widget/CheckBox;
    const/4 v9, 0x0

    .line 49
    .local v9, "$i$a$-apply-PlayerChoice$begin$remember$1":I
    const-string v10, "\u8bb0\u4f4f\u9009\u62e9\uff0c\u4f5c\u4e3a\u8bbe\u7f6e\u4e2d\u7684\u9ed8\u8ba4\u64ad\u653e\u5668"

    check-cast v10, Ljava/lang/CharSequence;

    invoke-virtual {v8, v10}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 50
    const/16 v10, 0xc4

    const/16 v11, 0xd0

    const/16 v12, 0xca

    invoke-static {v12, v10, v11}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    invoke-virtual {v8, v10}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 51
    invoke-virtual {v8, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 52
    const/16 v10, 0x18

    const/16 v11, 0xc

    invoke-virtual {v8, v10, v11, v10, v11}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 53
    nop

    .line 48
    .end local v8    # "$this$begin_u24lambda_u241":Landroid/widget/CheckBox;
    .end local v9    # "$i$a$-apply-PlayerChoice$begin$remember$1":I
    nop

    .line 54
    .local v7, "remember":Landroid/widget/CheckBox;
    move-object v8, v3

    check-cast v8, Ljava/lang/Iterable;

    .local v8, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 92
    .local v9, "$i$f$map":I
    new-instance v10, Ljava/util/ArrayList;

    const/16 v11, 0xa

    invoke-static {v8, v11}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v10, Ljava/util/Collection;

    .local v10, "destination$iv$iv":Ljava/util/Collection;
    move-object v11, v8

    .local v11, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 93
    .local v12, "$i$f$mapTo":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .line 94
    .local v14, "item$iv$iv":Ljava/lang/Object;
    move-object v15, v14

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    move-result v15

    .local v15, "it":I
    const/16 v16, 0x0

    .line 54
    .local v16, "$i$a$-map-PlayerChoice$begin$labels$1":I
    sget-object v4, Lcom/github/tvbox/osc/util/PlayerChoice;->helper:Ljava/lang/Class;

    move-object/from16 v17, v8

    .end local v8    # "$this$map$iv":Ljava/lang/Iterable;
    .local v17, "$this$map$iv":Ljava/lang/Iterable;
    new-array v8, v6, [Ljava/lang/Class;

    sget-object v18, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v18, v8, v2

    const-string v2, "getPlayerName"

    invoke-virtual {v4, v2, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v8, v6, [Ljava/lang/Object;

    const/16 v18, 0x0

    aput-object v4, v8, v18

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 94
    .end local v15    # "it":I
    .end local v16    # "$i$a$-map-PlayerChoice$begin$labels$1":I
    invoke-interface {v10, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v8, v17

    const/4 v2, 0x0

    const/4 v4, 0x0

    goto :goto_0

    .line 95
    .end local v14    # "item$iv$iv":Ljava/lang/Object;
    .end local v17    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v8    # "$this$map$iv":Ljava/lang/Iterable;
    :cond_2
    move-object/from16 v17, v8

    .end local v8    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v10    # "destination$iv$iv":Ljava/util/Collection;
    .end local v11    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$mapTo":I
    .restart local v17    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v2, v10

    check-cast v2, Ljava/util/List;

    .line 92
    nop

    .line 54
    .end local v9    # "$i$f$map":I
    .end local v17    # "$this$map$iv":Ljava/lang/Iterable;
    nop

    .line 55
    .local v2, "labels":Ljava/util/List;
    new-instance v4, Landroid/app/AlertDialog$Builder;

    move-object v6, v1

    check-cast v6, Landroid/content/Context;

    invoke-direct {v4, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 56
    if-ltz v5, :cond_3

    const-string v6, "\u539f\u9009\u62e9\u4e0d\u53ef\u7528\uff0c\u8bf7\u9009\u62e9\u64ad\u653e\u5668"

    goto :goto_1

    :cond_3
    const-string v6, "\u9009\u62e9\u672c\u6b21\u64ad\u653e\u5668"

    :goto_1
    check-cast v6, Ljava/lang/CharSequence;

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 57
    move-object v6, v2

    check-cast v6, Ljava/util/Collection;

    .local v6, "$this$toTypedArray$iv":Ljava/util/Collection;
    const/4 v8, 0x0

    .line 96
    .local v8, "$i$f$toTypedArray":I
    nop

    .line 97
    move-object v9, v6

    .line 99
    .local v9, "thisCollection$iv":Ljava/util/Collection;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "$this$toTypedArray$iv":Ljava/util/Collection;
    .end local v8    # "$i$f$toTypedArray":I
    .end local v9    # "thisCollection$iv":Ljava/util/Collection;
    check-cast v6, [Ljava/lang/CharSequence;

    .line 57
    new-instance v8, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;

    invoke-direct {v8, v3, v7, v1, v0}, Lcom/github/tvbox/osc/util/PlayerChoice$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;Landroid/widget/CheckBox;Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {v4, v6, v8}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 66
    move-object v6, v7

    check-cast v6, Landroid/view/View;

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 67
    const-string v6, "\u53d6\u6d88"

    check-cast v6, Ljava/lang/CharSequence;

    const/4 v8, 0x0

    invoke-virtual {v4, v6, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 68
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 55
    nop

    .line 69
    .local v4, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 70
    return-void

    .line 39
    .end local v2    # "labels":Ljava/util/List;
    .end local v3    # "types":Ljava/util/List;
    .end local v4    # "dialog":Landroid/app/AlertDialog;
    .end local v5    # "selected":I
    .end local v7    # "remember":Landroid/widget/CheckBox;
    :cond_4
    :goto_2
    return-void
.end method

.method private static final begin$lambda$3(Ljava/util/List;Landroid/widget/CheckBox;Landroid/app/Activity;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
    .locals 9
    .param p0, "$types"    # Ljava/util/List;
    .param p1, "$remember"    # Landroid/widget/CheckBox;
    .param p2, "$activity"    # Landroid/app/Activity;
    .param p3, "$fragment"    # Ljava/lang/Object;
    .param p5, "index"    # I

    .line 58
    invoke-interface {p0, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Number;

    invoke-virtual {p4}, Ljava/lang/Number;->intValue()I

    move-result p4

    .line 59
    .local p4, "chosen":I
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->put:Ljava/lang/reflect/Method;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "play_type"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object v1, v3, v4

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->put:Ljava/lang/reflect/Method;

    sget-object v3, Lcom/github/tvbox/osc/util/PlayerChoice;->get:Ljava/lang/reflect/Method;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "play_type_version"

    aput-object v8, v7, v5

    aput-object v6, v7, v4

    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v6, "null cannot be cast to non-null type kotlin.Number"

    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    add-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v8, v2, v5

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerChoice;->markExplicit()V

    .line 64
    :cond_0
    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->INSTANCE:Lcom/github/tvbox/osc/util/PlayerChoice;

    invoke-direct {v0, p3, p4}, Lcom/github/tvbox/osc/util/PlayerChoice;->resume(Ljava/lang/Object;I)V

    .line 65
    :cond_1
    return-void
.end method

.method public static final configuredType()I
    .locals 9
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 19
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->get:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "player_choice_user_v1"

    aput-object v5, v4, v1

    const/4 v5, 0x1

    aput-object v2, v4, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-string v4, "null cannot be cast to non-null type kotlin.Number"

    if-nez v0, :cond_1

    .line 20
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->get:Ljava/lang/reflect/Method;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v7, v3, [Ljava/lang/Object;

    const-string v8, "play_type_version"

    aput-object v8, v7, v1

    aput-object v6, v7, v5

    invoke-virtual {v0, v2, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 19
    :goto_1
    nop

    .line 21
    .local v0, "explicit":Z
    const/4 v6, -0x1

    if-eqz v0, :cond_2

    sget-object v7, Lcom/github/tvbox/osc/util/PlayerChoice;->get:Ljava/lang/reflect/Method;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    const-string v8, "play_type"

    aput-object v8, v3, v1

    aput-object v6, v3, v5

    invoke-virtual {v7, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v6

    :cond_2
    return v6
.end method

.method public static final markExplicit()V
    .locals 6
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 25
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerChoice;->put:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "player_choice_user_v1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    aput-object v2, v3, v1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private final resume(Ljava/lang/Object;I)V
    .locals 9
    .param p1, "fragment"    # Ljava/lang/Object;
    .param p2, "type"    # I

    .line 73
    nop

    .line 74
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 75
    .local v2, "cls":Ljava/lang/Class;
    const-string v3, "initPlayerCfg"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    move-object v4, v3

    .line 91
    .local v4, "$this$resume_u24lambda_u244":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    .line 75
    .local v5, "$i$a$-apply-PlayerChoice$resume$1":I
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .end local v4    # "$this$resume_u24lambda_u244":Ljava/lang/reflect/Method;
    .end local v5    # "$i$a$-apply-PlayerChoice$resume$1":I
    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v3, "mVodPlayerCfg"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    move-object v4, v3

    .line 91
    .local v4, "$this$resume_u24lambda_u245":Ljava/lang/reflect/Field;
    const/4 v5, 0x0

    .line 76
    .local v5, "$i$a$-apply-PlayerChoice$resume$config$1":I
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .end local v4    # "$this$resume_u24lambda_u245":Ljava/lang/reflect/Field;
    .end local v5    # "$i$a$-apply-PlayerChoice$resume$config$1":I
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "null cannot be cast to non-null type org.json.JSONObject"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Lorg/json/JSONObject;

    .line 77
    .local v3, "config":Lorg/json/JSONObject;
    const-string v4, "pl"

    invoke-virtual {v3, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 78
    const-string v4, "mController"

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    move-object v5, v4

    .line 91
    .local v5, "$this$resume_u24lambda_u246":Ljava/lang/reflect/Field;
    const/4 v6, 0x0

    .line 78
    .local v6, "$i$a$-apply-PlayerChoice$resume$controller$1":I
    invoke-virtual {v5, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .end local v5    # "$this$resume_u24lambda_u246":Ljava/lang/reflect/Field;
    .end local v6    # "$i$a$-apply-PlayerChoice$resume$controller$1":I
    invoke-virtual {v4, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 80
    .local v4, "controller":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "setPlayerConfig"

    new-array v7, v0, [Ljava/lang/Class;

    const-class v8, Lorg/json/JSONObject;

    aput-object v8, v7, v1

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v0, [Ljava/lang/Object;

    aput-object v3, v6, v1

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    const-string v5, "triedLineFlags"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    move-object v6, v5

    .line 91
    .local v6, "$this$resume_u24lambda_u247":Ljava/lang/reflect/Field;
    const/4 v7, 0x0

    .line 81
    .local v7, "$i$a$-apply-PlayerChoice$resume$2":I
    invoke-virtual {v6, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .end local v6    # "$this$resume_u24lambda_u247":Ljava/lang/reflect/Field;
    .end local v7    # "$i$a$-apply-PlayerChoice$resume$2":I
    invoke-virtual {v5, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 91
    .local v5, "it":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 81
    .local v6, "$i$a$-let-PlayerChoice$resume$3":I
    const-string v7, "null cannot be cast to non-null type kotlin.collections.MutableSet<*>"

    invoke-static {v5, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5}, Lkotlin/jvm/internal/TypeIntrinsics;->asMutableSet(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->clear()V

    .line 82
    .end local v5    # "it":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-PlayerChoice$resume$3":I
    const-string v5, "play"

    new-array v6, v0, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v1

    invoke-virtual {v2, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    new-array v7, v0, [Ljava/lang/Object;

    aput-object v6, v7, v1

    invoke-virtual {v5, p1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .end local v2    # "cls":Ljava/lang/Class;
    .end local v3    # "config":Lorg/json/JSONObject;
    .end local v4    # "controller":Ljava/lang/Object;
    goto :goto_0

    .line 78
    .restart local v2    # "cls":Ljava/lang/Class;
    .restart local v3    # "config":Lorg/json/JSONObject;
    :cond_0
    new-instance v4, Ljava/lang/IllegalStateException;

    .line 79
    const-string v5, "Player controller is unavailable"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "fragment":Ljava/lang/Object;
    .end local p2    # "type":I
    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .end local v2    # "cls":Ljava/lang/Class;
    .end local v3    # "config":Lorg/json/JSONObject;
    .restart local p1    # "fragment":Ljava/lang/Object;
    .restart local p2    # "type":I
    :catchall_0
    move-exception v2

    .line 84
    .local v2, "error":Ljava/lang/Throwable;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "requireActivity"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v3, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "null cannot be cast to non-null type android.app.Activity"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroid/app/Activity;

    .line 85
    .local v1, "activity":Landroid/app/Activity;
    move-object v3, v1

    check-cast v3, Landroid/content/Context;

    const-string v4, "\u64ad\u653e\u5668\u542f\u52a8\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u9009\u62e9"

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v3, v4, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 86
    const-string v0, "ContinueBox"

    const-string v3, "Selected player could not start"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    .end local v1    # "activity":Landroid/app/Activity;
    .end local v2    # "error":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method
