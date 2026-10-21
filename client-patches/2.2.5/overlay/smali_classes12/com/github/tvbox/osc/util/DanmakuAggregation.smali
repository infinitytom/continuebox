.class public final Lcom/github/tvbox/osc/util/DanmakuAggregation;
.super Ljava/lang/Object;
.source "DanmakuAggregation.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDanmakuAggregation.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DanmakuAggregation.kt\ncom/github/tvbox/osc/util/DanmakuAggregation\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,151:1\n1617#2,9:152\n1869#2:161\n1870#2:164\n1626#2:165\n1#3:162\n1#3:163\n3829#4:166\n4344#4,2:167\n12532#4,2:169\n*S KotlinDebug\n*F\n+ 1 DanmakuAggregation.kt\ncom/github/tvbox/osc/util/DanmakuAggregation\n*L\n31#1:152,9\n31#1:161\n31#1:164\n31#1:165\n31#1:163\n83#1:166\n83#1:167,2\n94#1:169,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u000b\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\u001fB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0007J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0001H\u0007J$\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00012\u0008\u0010\u0012\u001a\u0004\u0018\u00010\n2\u0008\u0010\u0013\u001a\u0004\u0018\u00010\nH\u0007J\u0008\u0010\u0014\u001a\u00020\u0015H\u0007JP\u0010\u0016\u001a\u00020\u000e2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\n2\u0008\u0010\u0013\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0017\u001a\u00020\u00152\u0006\u0010\u0018\u001a\u00020\u00152\u0008\u0010\u0019\u001a\u0004\u0018\u00010\n2\u0006\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u00152\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u0001H\u0007J\u0012\u0010\u001d\u001a\u00020\n2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\nH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "Lcom/github/tvbox/osc/util/DanmakuAggregation;",
        "",
        "<init>",
        "()V",
        "handler",
        "Landroid/os/Handler;",
        "source",
        "Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;",
        "platforms",
        "",
        "",
        "sourceId",
        "value",
        "capture",
        "",
        "fragment",
        "addSource",
        "builder",
        "title",
        "episode",
        "priority",
        "",
        "search",
        "year",
        "tmdbId",
        "mediaType",
        "season",
        "number",
        "callback",
        "cleanXml",
        "input",
        "Source",
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
.field public static final INSTANCE:Lcom/github/tvbox/osc/util/DanmakuAggregation;

.field private static final handler:Landroid/os/Handler;

.field private static final platforms:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile source:Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;


# direct methods
.method public static synthetic $r8$lambda$_Xv6TRp1MX2HLByOnlAhdNY6uaQ([ZILjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 0

    invoke-static/range {p0 .. p7}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive$lambda$9([ZILjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic $r8$lambda$gbw22fMtYaJVmncY0-mx0EqqbMU(I[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-static/range {p0 .. p9}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$proxy$lambda$10(I[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$iA8S_TRoj4Aof8s_eS1pObPKbJM(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$lambda$7(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tHsGg7TAkFx1_H6PUSPQPDqxTmc(B)Ljava/lang/CharSequence;
    .locals 0

    invoke-static {p0}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->sourceId$lambda$2(B)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/DanmakuAggregation;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->INSTANCE:Lcom/github/tvbox/osc/util/DanmakuAggregation;

    .line 18
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->handler:Landroid/os/Handler;

    .line 21
    const-string v6, "www.mgtv.com"

    const-string v7, "v.youku.com"

    const-string v2, "www.bilibili.com"

    const-string v3, "m.bilibili.com"

    const-string v4, "v.qq.com"

    const-string v5, "www.iqiyi.com"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->platforms:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final addSource(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p0, "builder"    # Ljava/lang/Object;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "episode"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "builder"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    sget-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->source:Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;

    if-nez v0, :cond_0

    return-void

    .line 58
    .local v0, "current":Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;
    :cond_0
    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;->getEpisode()Ljava/lang/String;

    move-result-object v1

    if-nez p2, :cond_1

    const-string v2, ""

    goto :goto_0

    :cond_1
    move-object v2, p2

    :goto_0
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;->getId()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_3

    goto :goto_3

    .line 59
    :cond_3
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v4, "addQueryParameter"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v3

    aput-object v7, v6, v2

    invoke-virtual {v1, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;->getId()Ljava/lang/String;

    move-result-object v4

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "source_id"

    aput-object v6, v5, v3

    aput-object v4, v5, v2

    invoke-virtual {v1, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 60
    :catch_0
    move-exception v1

    .line 61
    :goto_2
    return-void

    .line 58
    :cond_4
    :goto_3
    return-void
.end method

.method public static final capture(Ljava/lang/Object;)V
    .locals 11
    .param p0, "fragment"    # Ljava/lang/Object;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "fragment"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    const/4 v0, 0x0

    sput-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->source:Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;

    .line 44
    nop

    .line 45
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 46
    .local v1, "cls":Ljava/lang/Class;
    const-string v2, "mVodInfo"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    move-object v3, v2

    .line 162
    .local v3, "$this$capture_u24lambda_u243":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    .line 46
    .local v4, "$i$a$-apply-DanmakuAggregation$capture$vod$1":I
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .end local v3    # "$this$capture_u24lambda_u243":Ljava/lang/reflect/Field;
    .end local v4    # "$i$a$-apply-DanmakuAggregation$capture$vod$1":I
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    .line 47
    .local v2, "vod":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 48
    .local v3, "vc":Ljava/lang/Class;
    const-string v4, "getCurrentSeries"

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Class;

    const-class v8, Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v5

    invoke-virtual {v1, v4, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 49
    move-object v7, v4

    .line 162
    .local v7, "$this$capture_u24lambda_u244":Ljava/lang/reflect/Method;
    const/4 v8, 0x0

    .line 49
    .local v8, "$i$a$-apply-DanmakuAggregation$capture$series$1":I
    invoke-virtual {v7, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .end local v7    # "$this$capture_u24lambda_u244":Ljava/lang/reflect/Method;
    .end local v8    # "$i$a$-apply-DanmakuAggregation$capture$series$1":I
    const-string v7, "playFlag"

    invoke-virtual {v3, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "playIndex"

    invoke-virtual {v3, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v7, v6, v9

    aput-object v8, v6, v5

    invoke-virtual {v4, p0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 48
    if-nez v4, :cond_1

    .line 49
    return-void

    .line 50
    .local v4, "series":Ljava/lang/Object;
    :cond_1
    const-string v6, "displayEpisodeName"

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    new-array v8, v5, [Ljava/lang/Class;

    aput-object v7, v8, v9

    invoke-virtual {v1, v6, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    move-object v7, v6

    .line 162
    .local v7, "$this$capture_u24lambda_u245":Ljava/lang/reflect/Method;
    const/4 v8, 0x0

    .line 50
    .local v8, "$i$a$-apply-DanmakuAggregation$capture$episode$1":I
    invoke-virtual {v7, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .end local v7    # "$this$capture_u24lambda_u245":Ljava/lang/reflect/Method;
    .end local v8    # "$i$a$-apply-DanmakuAggregation$capture$episode$1":I
    new-array v5, v5, [Ljava/lang/Object;

    aput-object v4, v5, v9

    invoke-virtual {v6, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v6, ""

    if-eqz v5, :cond_2

    :try_start_1
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3

    :cond_2
    move-object v5, v6

    .line 51
    .local v5, "episode":Ljava/lang/String;
    :cond_3
    new-instance v7, Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;

    const-string v8, "name"

    invoke-virtual {v3, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_5

    :cond_4
    move-object v8, v6

    .line 52
    :cond_5
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "url"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_7

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_6

    goto :goto_0

    :cond_6
    move-object v6, v9

    :cond_7
    :goto_0
    invoke-static {v6}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->sourceId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 51
    invoke-direct {v7, v8, v5, v6}, Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v7, Lcom/github/tvbox/osc/util/DanmakuAggregation;->source:Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1    # "cls":Ljava/lang/Class;
    .end local v2    # "vod":Ljava/lang/Object;
    .end local v3    # "vc":Ljava/lang/Class;
    .end local v4    # "series":Ljava/lang/Object;
    .end local v5    # "episode":Ljava/lang/String;
    goto :goto_1

    .line 53
    :catch_0
    move-exception v1

    .local v1, "<unused var>":Ljava/lang/Exception;
    sput-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->source:Lcom/github/tvbox/osc/util/DanmakuAggregation$Source;

    .line 54
    .end local v1    # "<unused var>":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public static final cleanXml(Ljava/lang/String;)Ljava/lang/String;
    .locals 30
    .param p0, "input"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 125
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    move-object/from16 v1, p0

    .line 126
    .local v1, "xml":Ljava/lang/String;
    move-object v2, v1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->trimStart(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "<"

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    invoke-static {v2, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    .line 127
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/high16 v3, 0x800000

    const-string v7, "<i></i>"

    if-gt v2, v3, :cond_12

    new-instance v2, Lkotlin/text/Regex;

    const-string v3, "<!\\s*(DOCTYPE|ENTITY)"

    sget-object v8, Lkotlin/text/RegexOption;->IGNORE_CASE:Lkotlin/text/RegexOption;

    invoke-direct {v2, v3, v8}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V

    move-object v3, v1

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Lkotlin/text/Regex;->containsMatchIn(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_5

    .line 128
    :cond_2
    nop

    .line 129
    :try_start_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 130
    .local v2, "parser":Lorg/xmlpull/v1/XmlPullParser;
    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    check-cast v3, Ljava/io/Reader;

    invoke-interface {v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 131
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v8, "<i>"

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .local v3, "result":Ljava/lang/StringBuilder;
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 133
    .local v8, "seen":Ljava/util/HashSet;
    :goto_0
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v9

    const/4 v10, 0x1

    if-eq v9, v10, :cond_11

    invoke-virtual {v8}, Ljava/util/HashSet;->size()I

    move-result v9

    const/16 v11, 0x7530

    if-ge v9, v11, :cond_11

    .line 134
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v9

    if-ne v9, v5, :cond_10

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v11, "d"

    invoke-static {v9, v11}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    goto :goto_0

    .line 135
    :cond_3
    const-string v9, "p"

    invoke-interface {v2, v6, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_4

    move-object v9, v0

    :cond_4
    move-object v11, v9

    check-cast v11, Ljava/lang/CharSequence;

    new-array v12, v10, [C

    const/16 v9, 0x2c

    aput-char v9, v12, v4

    const/4 v15, 0x6

    const/16 v16, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static/range {v11 .. v16}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v11

    .line 136
    .local v11, "fields":Ljava/util/List;
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v12

    const-string v13, "nextText(...)"

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v12, Ljava/lang/CharSequence;

    new-instance v13, Lkotlin/text/Regex;

    const-string v14, "[\\x00-\\x08\\x0b\\x0c\\x0e-\\x1f]"

    invoke-direct {v13, v14}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v12, v0}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    check-cast v12, Ljava/lang/CharSequence;

    invoke-static {v12}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x1f4

    invoke-static {v12, v13}, Lkotlin/text/StringsKt;->take(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v12

    .line 137
    .local v12, "message":Ljava/lang/String;
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v13

    const/4 v14, 0x4

    if-lt v13, v14, :cond_f

    move-object v13, v12

    check-cast v13, Ljava/lang/CharSequence;

    invoke-interface {v13}, Ljava/lang/CharSequence;->length()I

    move-result v13

    if-nez v13, :cond_5

    const/4 v13, 0x1

    goto :goto_1

    :cond_5
    const/4 v13, 0x0

    :goto_1
    if-eqz v13, :cond_6

    goto :goto_0

    .line 138
    :cond_6
    invoke-interface {v11, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/text/StringsKt;->toDoubleOrNull(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v13

    if-eqz v13, :cond_e

    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v15

    move-wide/from16 v19, v15

    .line 139
    .local v19, "time":D
    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_d

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    move v15, v13

    .line 140
    .local v15, "mode":I
    const/4 v13, 0x3

    invoke-interface {v11, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v16

    if-eqz v16, :cond_c

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move/from16 v21, v16

    .line 141
    .local v21, "color":I
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    const-wide v22, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpg-double v18, v16, v22

    if-gtz v18, :cond_7

    const/16 v16, 0x1

    goto :goto_2

    :cond_7
    const/16 v16, 0x0

    :goto_2
    if-eqz v16, :cond_b

    const-wide/16 v16, 0x0

    cmpg-double v18, v19, v16

    if-ltz v18, :cond_b

    const-wide v16, 0x40f5180000000000L    # 86400.0

    cmpl-double v18, v19, v16

    if-gtz v18, :cond_b

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v17, 0x5

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    new-array v13, v13, [Ljava/lang/Integer;

    aput-object v16, v13, v4

    aput-object v14, v13, v10

    aput-object v17, v13, v5

    invoke-static {v13}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b

    move/from16 v14, v21

    .end local v21    # "color":I
    .local v14, "color":I
    if-ltz v14, :cond_8

    const/high16 v13, 0x1000000

    if-ge v14, v13, :cond_8

    const/4 v13, 0x1

    goto :goto_3

    :cond_8
    const/4 v13, 0x0

    :goto_3
    if-nez v13, :cond_9

    goto/16 :goto_0

    .line 142
    :cond_9
    sget-object v13, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%.2f"

    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v16

    new-array v6, v10, [Ljava/lang/Object;

    aput-object v16, v6, v4

    invoke-static {v6, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v6

    invoke-static {v13, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "format(...)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    .local v5, "stamp":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v10, 0x7c

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 144
    const-string v6, "&"

    const-string v10, "&amp;"

    const/16 v17, 0x4

    const/16 v18, 0x0

    const/16 v16, 0x0

    move-object v13, v12

    move v4, v14

    .end local v14    # "color":I
    .local v4, "color":I
    move-object v14, v6

    move v6, v15

    .end local v15    # "mode":I
    .local v6, "mode":I
    move-object v15, v10

    invoke-static/range {v13 .. v18}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    const-string v25, "<"

    const-string v26, "&lt;"

    const/16 v28, 0x4

    const/16 v29, 0x0

    const/16 v27, 0x0

    invoke-static/range {v24 .. v29}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const-string v14, ">"

    const-string v15, "&gt;"

    const/16 v17, 0x4

    const/16 v18, 0x0

    const/16 v16, 0x0

    invoke-static/range {v13 .. v18}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 145
    .local v10, "escaped":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "<d p=\""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v13, ",25,"

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v13, "\">"

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v13, "</d>"

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 143
    .end local v4    # "color":I
    .end local v6    # "mode":I
    .end local v10    # "escaped":Ljava/lang/String;
    .restart local v14    # "color":I
    .restart local v15    # "mode":I
    :cond_a
    move v4, v14

    move v6, v15

    .end local v14    # "color":I
    .end local v15    # "mode":I
    .restart local v4    # "color":I
    .restart local v6    # "mode":I
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 141
    .end local v4    # "color":I
    .end local v5    # "stamp":Ljava/lang/String;
    .end local v6    # "mode":I
    .restart local v15    # "mode":I
    .restart local v21    # "color":I
    :cond_b
    move v6, v15

    move/from16 v4, v21

    .end local v15    # "mode":I
    .end local v21    # "color":I
    .restart local v4    # "color":I
    .restart local v6    # "mode":I
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 140
    .end local v4    # "color":I
    .end local v6    # "mode":I
    .restart local v15    # "mode":I
    :cond_c
    move v6, v15

    .end local v15    # "mode":I
    .restart local v6    # "mode":I
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 139
    .end local v6    # "mode":I
    :cond_d
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 138
    .end local v19    # "time":D
    :cond_e
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 137
    :cond_f
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 134
    .end local v11    # "fields":Ljava/util/List;
    .end local v12    # "message":Ljava/lang/String;
    :cond_10
    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 147
    :cond_11
    const-string v0, "</i>"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
    .end local v2    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v3    # "result":Ljava/lang/StringBuilder;
    .end local v8    # "seen":Ljava/util/HashSet;
    nop

    .line 145
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v7, v0

    goto :goto_4

    .line 148
    :catch_0
    move-exception v0

    .line 128
    :goto_4
    return-object v7

    .line 127
    :cond_12
    :goto_5
    return-object v7
.end method

.method public static final priority()I
    .locals 13
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 64
    const-string v0, "com.orhanobut.hawk.Hawk"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 65
    .local v0, "hawk":Ljava/lang/Class;
    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/Object;

    const/4 v5, 0x1

    .line 67
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 65
    aput-object v3, v2, v5

    const-string v3, "get"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 66
    .local v2, "get":Ljava/lang/reflect/Method;
    new-array v3, v1, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v3, v4

    const-class v7, Ljava/lang/Object;

    aput-object v7, v3, v5

    const-string v7, "put"

    invoke-virtual {v0, v7, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 67
    .local v3, "put":Ljava/lang/reflect/Method;
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    new-array v8, v1, [Ljava/lang/Object;

    const-string v9, "danmu_aggregate_221"

    aput-object v9, v8, v4

    aput-object v7, v8, v5

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    const-string v10, "danmu_source_priority"

    const/4 v11, 0x4

    .line 71
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 67
    if-nez v8, :cond_0

    .line 68
    new-array v8, v1, [Ljava/lang/Object;

    aput-object v10, v8, v4

    aput-object v12, v8, v5

    invoke-virtual {v3, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-array v8, v1, [Ljava/lang/Object;

    aput-object v9, v8, v4

    aput-object v6, v8, v5

    invoke-virtual {v3, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    :cond_0
    new-array v1, v1, [Ljava/lang/Object;

    aput-object v10, v1, v4

    aput-object v12, v1, v5

    invoke-virtual {v2, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v5, v1, Ljava/lang/Number;

    if-eqz v5, :cond_1

    move-object v7, v1

    check-cast v7, Ljava/lang/Number;

    :cond_1
    if-eqz v7, :cond_2

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v1

    goto :goto_0

    :cond_2
    const/4 v1, 0x4

    :goto_0
    invoke-static {v1, v4, v11}, Lkotlin/ranges/RangesKt;->coerceIn(III)I

    move-result v1

    return v1
.end method

.method public static final search(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;IILjava/lang/Object;)V
    .locals 31
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "episode"    # Ljava/lang/String;
    .param p2, "year"    # I
    .param p3, "tmdbId"    # I
    .param p4, "mediaType"    # Ljava/lang/String;
    .param p5, "season"    # I
    .param p6, "number"    # I
    .param p7, "callback"    # Ljava/lang/Object;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 75
    move-object/from16 v11, p7

    if-nez v11, :cond_0

    return-void

    .line 76
    :cond_0
    const-string v0, "com.github.tvbox.osc.api.DanmakuApi"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    .line 77
    .local v12, "api":Ljava/lang/Class;
    const-string v0, "com.github.tvbox.osc.api.DanmakuApi$SearchCallback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    .line 78
    .local v13, "cb":Ljava/lang/Class;
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v14, 0x0

    invoke-direct {v0, v14}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    move-object v15, v0

    .line 79
    .local v15, "complete":Ljava/util/concurrent/atomic/AtomicBoolean;
    const-string v10, ""

    filled-new-array {v10, v10}, [Ljava/lang/String;

    move-result-object v0

    move-object v9, v0

    .line 80
    .local v9, "values":[Ljava/lang/String;
    const/4 v8, 0x2

    new-array v2, v8, [Z

    fill-array-data v2, :array_0

    .line 87
    .local v2, "done":[Z
    new-instance v0, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda0;

    invoke-direct {v0, v15, v9, v13, v11}, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda0;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    move-object v7, v0

    .line 88
    .local v7, "deadline":Ljava/lang/Runnable;
    sget-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->handler:Landroid/os/Handler;

    const-wide/16 v3, 0x5dc0

    invoke-virtual {v0, v7, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 108
    nop

    .line 109
    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x1

    :try_start_0
    const-string v0, "com.github.tvbox.osc.sync.IntegrationClient"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "enabled"

    new-array v3, v14, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v14, [Ljava/lang/Object;

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_b

    .line 110
    .local v0, "enabled":Z
    if-eqz v0, :cond_4

    :try_start_1
    const-string v1, "searchIntegration"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8

    .line 111
    nop

    .line 110
    nop

    .line 111
    nop

    .line 110
    nop

    .line 111
    nop

    .line 110
    nop

    .line 111
    nop

    .line 110
    nop

    .line 112
    nop

    .line 110
    nop

    .line 112
    nop

    .line 110
    nop

    .line 112
    const/16 v3, 0x9

    :try_start_2
    new-array v5, v3, [Ljava/lang/Class;

    const-class v17, Ljava/lang/String;

    aput-object v17, v5, v14

    aput-object v17, v5, v4

    sget-object v18, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v18, v5, v8

    aput-object v18, v5, v6

    const/16 v19, 0x4

    aput-object v17, v5, v19

    const/16 v17, 0x5

    aput-object v18, v5, v17

    const/16 v20, 0x6

    aput-object v18, v5, v20

    const/16 v18, 0x7

    aput-object v13, v5, v18

    sget-object v21, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v22, 0x8

    aput-object v21, v5, v22
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    .line 110
    :try_start_3
    invoke-virtual {v12, v1, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 112
    move-object v1, v5

    .line 162
    .local v1, "$this$search_u24lambda_u2411":Ljava/lang/reflect/Method;
    const/16 v21, 0x0

    .line 112
    .local v21, "$i$a$-apply-DanmakuAggregation$search$1":I
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 113
    .end local v1    # "$this$search_u24lambda_u2411":Ljava/lang/reflect/Method;
    .end local v21    # "$i$a$-apply-DanmakuAggregation$search$1":I
    if-nez p0, :cond_1

    move-object/from16 v21, v10

    goto :goto_0

    :cond_1
    move-object/from16 v21, p0

    :goto_0
    if-nez p1, :cond_2

    move-object/from16 v23, v10

    goto :goto_1

    :cond_2
    move-object/from16 v23, p1

    :goto_1
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    if-nez p4, :cond_3

    move-object/from16 v26, v10

    goto :goto_2

    :cond_3
    move-object/from16 v26, p4

    :goto_2
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    const/16 v29, 0x0

    move-object v1, v13

    const/16 v8, 0x9

    move-object v3, v15

    move-object v4, v9

    move-object/from16 v30, v5

    move-object v5, v7

    move-object/from16 v6, p7

    move-object/from16 v16, v7

    .end local v7    # "deadline":Ljava/lang/Runnable;
    .local v16, "deadline":Ljava/lang/Runnable;
    move/from16 v7, v29

    :try_start_4
    invoke-static/range {v1 .. v7}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$proxy(Ljava/lang/Class;[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    :try_start_5
    new-array v4, v8, [Ljava/lang/Object;

    aput-object v21, v4, v14
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    const/4 v8, 0x1

    :try_start_6
    aput-object v23, v4, v8
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    const/16 v21, 0x2

    :try_start_7
    aput-object v24, v4, v21
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    const/4 v7, 0x3

    :try_start_8
    aput-object v25, v4, v7

    aput-object v26, v4, v19

    aput-object v27, v4, v17

    aput-object v28, v4, v20

    aput-object v1, v4, v18

    aput-object v3, v4, v22
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    move-object/from16 v1, v30

    const/4 v6, 0x0

    :try_start_9
    invoke-virtual {v1, v6, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    move-object/from16 v19, v9

    move-object/from16 v17, v10

    const/16 v18, 0x2

    goto/16 :goto_7

    .line 115
    .end local v0    # "enabled":Z
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    const/4 v6, 0x0

    goto :goto_4

    :catch_2
    move-exception v0

    const/4 v6, 0x0

    const/4 v7, 0x3

    goto :goto_4

    :catch_3
    move-exception v0

    const/4 v6, 0x0

    const/4 v7, 0x3

    goto :goto_3

    :catch_4
    move-exception v0

    const/4 v6, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x1

    goto :goto_3

    :catch_5
    move-exception v0

    const/4 v6, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x1

    :goto_3
    const/16 v21, 0x2

    goto :goto_4

    .end local v16    # "deadline":Ljava/lang/Runnable;
    .restart local v7    # "deadline":Ljava/lang/Runnable;
    :catch_6
    move-exception v0

    move-object/from16 v16, v7

    const/4 v6, 0x0

    goto :goto_5

    :catch_7
    move-exception v0

    move-object/from16 v16, v7

    const/4 v6, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/16 v21, 0x2

    .end local v7    # "deadline":Ljava/lang/Runnable;
    .restart local v16    # "deadline":Ljava/lang/Runnable;
    :goto_4
    move-object/from16 v19, v9

    move-object/from16 v17, v10

    const/16 v18, 0x2

    goto :goto_6

    .end local v16    # "deadline":Ljava/lang/Runnable;
    .restart local v7    # "deadline":Ljava/lang/Runnable;
    :catch_8
    move-exception v0

    move-object v6, v5

    move-object/from16 v16, v7

    :goto_5
    const/4 v7, 0x3

    const/4 v8, 0x1

    const/16 v21, 0x2

    move-object/from16 v19, v9

    move-object/from16 v17, v10

    const/16 v18, 0x2

    .end local v7    # "deadline":Ljava/lang/Runnable;
    .restart local v16    # "deadline":Ljava/lang/Runnable;
    goto :goto_6

    .line 114
    .end local v16    # "deadline":Ljava/lang/Runnable;
    .restart local v0    # "enabled":Z
    .restart local v7    # "deadline":Ljava/lang/Runnable;
    :cond_4
    move-object v6, v5

    move-object/from16 v16, v7

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/16 v21, 0x2

    .end local v7    # "deadline":Ljava/lang/Runnable;
    .restart local v16    # "deadline":Ljava/lang/Runnable;
    :try_start_a
    const-string v1, ""
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_a

    const/16 v17, 0x0

    move-object v3, v2

    move-object v4, v15

    move-object v5, v9

    move-object/from16 v6, v16

    move-object v7, v13

    const/16 v18, 0x2

    move-object/from16 v8, p7

    move-object/from16 v19, v9

    .end local v9    # "values":[Ljava/lang/String;
    .local v19, "values":[Ljava/lang/String;
    move/from16 v9, v17

    move-object/from16 v17, v10

    move-object v10, v1

    :try_start_b
    invoke-static/range {v3 .. v10}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    .end local v0    # "enabled":Z
    goto :goto_7

    .line 115
    :catch_9
    move-exception v0

    goto :goto_6

    .end local v19    # "values":[Ljava/lang/String;
    .restart local v9    # "values":[Ljava/lang/String;
    :catch_a
    move-exception v0

    move-object/from16 v19, v9

    move-object/from16 v17, v10

    const/16 v18, 0x2

    .end local v9    # "values":[Ljava/lang/String;
    .restart local v19    # "values":[Ljava/lang/String;
    goto :goto_6

    .end local v16    # "deadline":Ljava/lang/Runnable;
    .end local v19    # "values":[Ljava/lang/String;
    .restart local v7    # "deadline":Ljava/lang/Runnable;
    .restart local v9    # "values":[Ljava/lang/String;
    :catch_b
    move-exception v0

    move-object/from16 v16, v7

    move-object/from16 v19, v9

    move-object/from16 v17, v10

    const/16 v18, 0x2

    .end local v7    # "deadline":Ljava/lang/Runnable;
    .end local v9    # "values":[Ljava/lang/String;
    .local v0, "<unused var>":Ljava/lang/Exception;
    .restart local v16    # "deadline":Ljava/lang/Runnable;
    .restart local v19    # "values":[Ljava/lang/String;
    :goto_6
    const/4 v9, 0x0

    const-string v10, ""

    move-object v3, v2

    move-object v4, v15

    move-object/from16 v5, v19

    move-object/from16 v6, v16

    move-object v7, v13

    move-object/from16 v8, p7

    invoke-static/range {v3 .. v10}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V

    .line 116
    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_7
    nop

    .line 117
    :try_start_c
    const-string v0, "getApiUrl"

    new-array v1, v14, [Ljava/lang/Class;

    invoke-virtual {v12, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    move-object v1, v0

    .line 162
    .local v1, "$this$search_u24lambda_u2412":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 117
    .local v3, "$i$a$-apply-DanmakuAggregation$search$configured$1":I
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .end local v1    # "$this$search_u24lambda_u2412":Ljava/lang/reflect/Method;
    .end local v3    # "$i$a$-apply-DanmakuAggregation$search$configured$1":I
    new-array v1, v14, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v0, v9, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    :cond_5
    move-object v0, v9

    :goto_8
    if-nez v0, :cond_6

    move-object/from16 v0, v17

    .line 118
    .local v0, "configured":Ljava/lang/String;
    :cond_6
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_7

    const/4 v4, 0x1

    goto :goto_9

    :cond_7
    const/4 v4, 0x0

    :goto_9
    if-eqz v4, :cond_a

    const-string v1, "searchLegacy"

    const/4 v8, 0x3

    new-array v3, v8, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    aput-object v4, v3, v14

    aput-object v4, v3, v10

    aput-object v13, v3, v18

    invoke-virtual {v12, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 119
    move-object v3, v1

    .line 162
    .local v3, "$this$search_u24lambda_u2413":Ljava/lang/reflect/Method;
    const/4 v4, 0x0

    .line 119
    .local v4, "$i$a$-apply-DanmakuAggregation$search$3":I
    invoke-virtual {v3, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .end local v3    # "$this$search_u24lambda_u2413":Ljava/lang/reflect/Method;
    .end local v4    # "$i$a$-apply-DanmakuAggregation$search$3":I
    if-nez p0, :cond_8

    move-object/from16 v20, v17

    goto :goto_a

    :cond_8
    move-object/from16 v20, p0

    :goto_a
    if-nez p1, :cond_9

    goto :goto_b

    :cond_9
    move-object/from16 v17, p1

    :goto_b
    const/16 v21, 0x1

    move-object v3, v13

    move-object v4, v2

    move-object v5, v15

    move-object/from16 v6, v19

    move-object/from16 v7, v16

    const/4 v10, 0x3

    move-object/from16 v8, p7

    move/from16 v9, v21

    invoke-static/range {v3 .. v9}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$proxy(Ljava/lang/Class;[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    new-array v4, v10, [Ljava/lang/Object;

    aput-object v20, v4, v14

    const/4 v5, 0x1

    aput-object v17, v4, v5

    aput-object v3, v4, v18

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c

    .line 120
    :cond_a
    const-string v10, ""

    const/4 v9, 0x1

    move-object v3, v2

    move-object v4, v15

    move-object/from16 v5, v19

    move-object/from16 v6, v16

    move-object v7, v13

    move-object/from16 v8, p7

    invoke-static/range {v3 .. v10}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_c

    .end local v0    # "configured":Ljava/lang/String;
    goto :goto_c

    .line 121
    :catch_c
    move-exception v0

    .local v0, "<unused var>":Ljava/lang/Exception;
    const/4 v9, 0x1

    const-string v10, ""

    move-object v3, v2

    move-object v4, v15

    move-object/from16 v5, v19

    move-object/from16 v6, v16

    move-object v7, v13

    move-object/from16 v8, p7

    invoke-static/range {v3 .. v10}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V

    .line 122
    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_c
    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data
.end method

.method private static final search$deliver(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 16
    .param p0, "complete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "cb"    # Ljava/lang/Class;
    .param p3, "$callback"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 82
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object/from16 v4, p0

    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v5

    if-nez v5, :cond_0

    return-void

    .line 83
    :cond_0
    move-object/from16 v5, p1

    .local v5, "$this$filter$iv":[Ljava/lang/Object;
    const/4 v6, 0x0

    .line 166
    .local v6, "$i$f$filter":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/Collection;

    .local v7, "destination$iv$iv":Ljava/util/Collection;
    move-object v8, v5

    .local v8, "$this$filterTo$iv$iv":[Ljava/lang/Object;
    const/4 v9, 0x0

    .line 167
    .local v9, "$i$f$filterTo":I
    array-length v10, v8

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v10, :cond_2

    aget-object v12, v8, v11

    .local v12, "element$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    .local v13, "it":Ljava/lang/String;
    const/4 v14, 0x0

    .line 83
    .local v14, "$i$a$-filter-DanmakuAggregation$search$deliver$merged$1":I
    move-object v15, v13

    check-cast v15, Ljava/lang/CharSequence;

    invoke-static {v15}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v15

    xor-int/2addr v15, v3

    .line 167
    .end local v13    # "it":Ljava/lang/String;
    .end local v14    # "$i$a$-filter-DanmakuAggregation$search$deliver$merged$1":I
    if-eqz v15, :cond_1

    invoke-interface {v7, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v12    # "element$iv$iv":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 168
    :cond_2
    nop

    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .end local v8    # "$this$filterTo$iv$iv":[Ljava/lang/Object;
    .end local v9    # "$i$f$filterTo":I
    check-cast v7, Ljava/util/List;

    .line 166
    nop

    .end local v5    # "$this$filter$iv":[Ljava/lang/Object;
    .end local v6    # "$i$f$filter":I
    check-cast v7, Ljava/lang/Iterable;

    .line 83
    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->distinct(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    const-string v5, "\n<!-- continuebox:danmaku-source -->\n"

    move-object v7, v5

    check-cast v7, Ljava/lang/CharSequence;

    const/16 v13, 0x3e

    const/4 v14, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v6 .. v14}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 84
    .local v5, "merged":Ljava/lang/String;
    move-object v6, v5

    check-cast v6, Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-nez v6, :cond_3

    const/4 v6, 0x1

    goto :goto_1

    :cond_3
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_4

    const-string v3, "onNotFound"

    new-array v6, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 85
    :cond_4
    new-array v6, v3, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v2

    const-string v7, "onFound"

    invoke-virtual {v0, v7, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v5, v3, v2

    invoke-virtual {v6, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    :goto_2
    return-void
.end method

.method private static final search$lambda$7(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 0
    .param p0, "$complete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p1, "$values"    # [Ljava/lang/String;
    .param p2, "$cb"    # Ljava/lang/Class;
    .param p3, "$callback"    # Ljava/lang/Object;

    .line 87
    invoke-static {p0, p1, p2, p3}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$deliver(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method private static final search$proxy(Ljava/lang/Class;[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 11
    .param p0, "cb"    # Ljava/lang/Class;
    .param p1, "done"    # [Z
    .param p2, "complete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p3, "values"    # [Ljava/lang/String;
    .param p4, "deadline"    # Ljava/lang/Runnable;
    .param p5, "$callback"    # Ljava/lang/Object;
    .param p6, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[Z",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Object;",
            "I)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 98
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    new-instance v2, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda2;

    move-object v3, v2

    move/from16 v4, p6

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    move-object v9, p0

    move-object/from16 v10, p5

    invoke-direct/range {v3 .. v10}, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda2;-><init>(I[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "newProxyInstance(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    return-object v0
.end method

.method private static final search$proxy$lambda$10(I[ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "$index"    # I
    .param p1, "$done"    # [Z
    .param p2, "$complete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p3, "$values"    # [Ljava/lang/String;
    .param p4, "$deadline"    # Ljava/lang/Runnable;
    .param p5, "$cb"    # Ljava/lang/Class;
    .param p6, "$callback"    # Ljava/lang/Object;
    .param p7, "obj"    # Ljava/lang/Object;
    .param p8, "method"    # Ljava/lang/reflect/Method;
    .param p9, "args"    # [Ljava/lang/Object;

    .line 99
    move-object/from16 v0, p9

    invoke-virtual/range {p8 .. p8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x0

    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_2

    :sswitch_0
    const-string v3, "hashCode"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    invoke-static/range {p7 .. p7}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, p7

    goto/16 :goto_4

    .line 99
    :sswitch_1
    const-string v3, "onNotFound"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 101
    :cond_1
    const-string v10, ""

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move v9, p0

    invoke-static/range {v3 .. v10}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V

    move-object/from16 v3, p7

    goto :goto_4

    .line 99
    :sswitch_2
    const-string v3, "equals"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :goto_0
    move-object/from16 v3, p7

    goto :goto_3

    .line 103
    :cond_2
    if-eqz v0, :cond_3

    invoke-static {v0, v4}, Lkotlin/collections/ArraysKt;->getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    :cond_3
    move-object/from16 v3, p7

    if-ne v3, v2, :cond_4

    const/4 v4, 0x1

    :cond_4
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_4

    .line 99
    :sswitch_3
    move-object/from16 v3, p7

    const-string v5, "onFound"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_1

    .line 100
    :cond_5
    if-eqz v0, :cond_6

    invoke-static {v0, v4}, Lkotlin/collections/ArraysKt;->getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_7

    :cond_6
    const-string v1, ""

    :cond_7
    move-object v11, v1

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move v10, p0

    invoke-static/range {v4 .. v11}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V

    goto :goto_4

    .line 99
    :sswitch_4
    move-object/from16 v3, p7

    const-string v4, "toString"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    :goto_1
    goto :goto_3

    .line 104
    :cond_8
    const-string v2, "ContinueBoxDanmakuCallback"

    goto :goto_4

    .line 99
    :cond_9
    :goto_2
    move-object/from16 v3, p7

    .line 105
    :goto_3
    nop

    .line 106
    :goto_4
    return-object v2

    :sswitch_data_0
    .sparse-switch
        -0x69e9ad94 -> :sswitch_4
        -0x5068931d -> :sswitch_3
        -0x4d378041 -> :sswitch_2
        0x1afeb6e -> :sswitch_1
        0x8cdac1b -> :sswitch_0
    .end sparse-switch
.end method

.method private static final search$receive([ZLjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;ILjava/lang/String;)V
    .locals 11
    .param p0, "done"    # [Z
    .param p1, "complete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p2, "values"    # [Ljava/lang/String;
    .param p3, "deadline"    # Ljava/lang/Runnable;
    .param p4, "cb"    # Ljava/lang/Class;
    .param p5, "$callback"    # Ljava/lang/Object;
    .param p6, "index"    # I
    .param p7, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([Z",
            "Ljava/util/concurrent/atomic/AtomicBoolean;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 90
    sget-object v0, Lcom/github/tvbox/osc/util/DanmakuAggregation;->handler:Landroid/os/Handler;

    new-instance v10, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda3;

    move-object v1, v10

    move-object v2, p0

    move/from16 v3, p6

    move-object v4, p1

    move-object v5, p2

    move-object/from16 v6, p7

    move-object v7, p3

    move-object v8, p4

    move-object/from16 v9, p5

    invoke-direct/range {v1 .. v9}, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda3;-><init>([ZILjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-virtual {v0, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 97
    return-void
.end method

.method private static final search$receive$lambda$9([ZILjava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 10
    .param p0, "$done"    # [Z
    .param p1, "$index"    # I
    .param p2, "$complete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p3, "$values"    # [Ljava/lang/String;
    .param p4, "$value"    # Ljava/lang/String;
    .param p5, "$deadline"    # Ljava/lang/Runnable;
    .param p6, "$cb"    # Ljava/lang/Class;
    .param p7, "$callback"    # Ljava/lang/Object;

    .line 91
    move-object v0, p3

    aget-boolean v1, p0, p1

    if-nez v1, :cond_3

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_3

    .line 92
    const/4 v1, 0x1

    aput-boolean v1, p0, p1

    .line 93
    aput-object p4, v0, p1

    .line 94
    move-object v2, p0

    .local v2, "$this$all$iv":[Z
    const/4 v3, 0x0

    .line 169
    .local v3, "$i$f$all":I
    array-length v4, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_1

    aget-boolean v7, v2, v6

    .local v7, "element$iv":Z
    move v8, v7

    .local v8, "it":Z
    const/4 v9, 0x0

    .line 94
    .local v9, "$i$a$-all-DanmakuAggregation$search$receive$1$1":I
    nop

    .line 169
    .end local v8    # "it":Z
    .end local v9    # "$i$a$-all-DanmakuAggregation$search$receive$1$1":I
    if-nez v8, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .end local v7    # "element$iv":Z
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 170
    :cond_1
    nop

    .line 94
    .end local v2    # "$this$all$iv":[Z
    .end local v3    # "$i$f$all":I
    :goto_1
    if-eqz v1, :cond_2

    sget-object v1, Lcom/github/tvbox/osc/util/DanmakuAggregation;->handler:Landroid/os/Handler;

    move-object v2, p5

    invoke-virtual {v1, p5}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    move-object v1, p2

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    invoke-static {p2, p3, v3, v4}, Lcom/github/tvbox/osc/util/DanmakuAggregation;->search$deliver(Ljava/util/concurrent/atomic/AtomicBoolean;[Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    goto :goto_2

    :cond_2
    move-object v1, p2

    move-object v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    goto :goto_2

    .line 91
    :cond_3
    move-object v1, p2

    move-object v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    .line 96
    :goto_2
    return-void
.end method

.method public static final sourceId(Ljava/lang/String;)Ljava/lang/String;
    .locals 28
    .param p0, "value"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object/from16 v1, p0

    const-string v0, "UTF-8"

    const-string v2, "value"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    move-object v2, v1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, ""

    if-nez v2, :cond_e

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v4, 0x2000

    if-le v2, v4, :cond_0

    goto/16 :goto_9

    .line 25
    :cond_0
    nop

    .line 26
    :try_start_0
    new-instance v2, Ljava/net/URI;

    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 27
    .local v2, "uri":Ljava/net/URI;
    const-string v4, "http"

    const-string v5, "https"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    return-object v3

    .line 28
    :cond_1
    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_d

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v6, "ROOT"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "toLowerCase(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez v4, :cond_2

    goto/16 :goto_7

    .line 29
    .local v4, "host":Ljava/lang/String;
    :cond_2
    sget-object v5, Lcom/github/tvbox/osc/util/DanmakuAggregation;->platforms:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-virtual {v2}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_c

    invoke-virtual {v2}, Ljava/net/URI;->getPort()I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_c

    .line 30
    invoke-virtual {v2}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3

    move-object v5, v3

    :cond_3
    check-cast v5, Ljava/lang/CharSequence;

    new-instance v6, Lkotlin/text/Regex;

    const-string v7, "/[a-zA-Z0-9_./~-]{1,300}"

    invoke-direct {v6, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 31
    invoke-virtual {v2}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4

    move-object v5, v3

    :cond_4
    move-object v6, v5

    check-cast v6, Ljava/lang/CharSequence;

    const/4 v5, 0x1

    new-array v7, v5, [C

    const/4 v12, 0x0

    const/16 v8, 0x26

    aput-char v8, v7, v12

    const/4 v10, 0x6

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 152
    .local v7, "$i$f$mapNotNull":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    check-cast v8, Ljava/util/Collection;

    .local v8, "destination$iv$iv":Ljava/util/Collection;
    move-object v9, v6

    .local v9, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 160
    .local v10, "$i$f$mapNotNullTo":I
    move-object v11, v9

    .local v11, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 161
    .local v13, "$i$f$forEach":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_9

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .local v15, "element$iv$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    .local v16, "element$iv$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 160
    .local v17, "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    move-object/from16 v18, v16

    check-cast v18, Ljava/lang/String;

    .local v18, "it":Ljava/lang/String;
    const/16 v19, 0x0

    .line 32
    .local v19, "$i$a$-mapNotNull-DanmakuAggregation$sourceId$query$1":I
    move-object/from16 v20, v18

    check-cast v20, Ljava/lang/CharSequence;

    new-array v12, v5, [C

    const/16 v5, 0x3d

    const/16 v21, 0x0

    aput-char v5, v12, v21

    const/16 v24, 0x2

    const/16 v25, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x2

    move-object/from16 v21, v12

    invoke-static/range {v20 .. v25}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v12

    .line 33
    .local v12, "pair":Ljava/util/List;
    const/4 v5, 0x0

    invoke-interface {v12, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v5, v21

    check-cast v5, Ljava/lang/String;

    invoke-static {v5, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 34
    .local v5, "k":Ljava/lang/String;
    move-object/from16 v21, v6

    .end local v6    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .local v21, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v6

    move/from16 v22, v7

    const/4 v7, 0x1

    .end local v7    # "$i$f$mapNotNull":I
    .local v22, "$i$f$mapNotNull":I
    if-ge v7, v6, :cond_5

    const/4 v6, 0x1

    goto :goto_1

    :cond_5
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_6

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    goto :goto_2

    :cond_6
    move v6, v7

    .line 162
    .local v6, "it":I
    const/16 v23, 0x0

    .line 34
    .local v23, "$i$a$-getOrElse-DanmakuAggregation$sourceId$query$1$v$1":I
    move-object v6, v3

    .end local v6    # "it":I
    .end local v23    # "$i$a$-getOrElse-DanmakuAggregation$sourceId$query$1$v$1":I
    :goto_2
    check-cast v6, Ljava/lang/String;

    invoke-static {v6, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 35
    .local v6, "v":Ljava/lang/String;
    const-string v7, "id"

    move-object/from16 v23, v0

    const-string v0, "vid"

    move-object/from16 v24, v9

    .end local v9    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .local v24, "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    const-string v9, "aid"

    move/from16 v25, v10

    .end local v10    # "$i$f$mapNotNullTo":I
    .local v25, "$i$f$mapNotNullTo":I
    const-string v10, "cid"

    move-object/from16 v27, v11

    .end local v11    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .local v27, "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    const-string v11, "p"

    filled-new-array {v7, v0, v9, v10, v11}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v0, v6

    check-cast v0, Ljava/lang/CharSequence;

    new-instance v7, Lkotlin/text/Regex;

    const-string v9, "[a-zA-Z0-9_-]{1,64}"

    invoke-direct {v7, v9}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Lkotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v7, 0x3d

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_7
    const/4 v0, 0x0

    .line 160
    .end local v5    # "k":Ljava/lang/String;
    .end local v6    # "v":Ljava/lang/String;
    .end local v12    # "pair":Ljava/util/List;
    .end local v18    # "it":Ljava/lang/String;
    .end local v19    # "$i$a$-mapNotNull-DanmakuAggregation$sourceId$query$1":I
    :goto_3
    if-eqz v0, :cond_8

    .line 163
    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 160
    .local v5, "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    invoke-interface {v8, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 161
    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .end local v5    # "$i$a$-let-CollectionsKt___CollectionsKt$mapNotNullTo$1$1$iv$iv":I
    .end local v16    # "element$iv$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-forEach-CollectionsKt___CollectionsKt$mapNotNullTo$1$iv$iv":I
    :cond_8
    move-object/from16 v6, v21

    move/from16 v7, v22

    move-object/from16 v0, v23

    move-object/from16 v9, v24

    move/from16 v10, v25

    move-object/from16 v11, v27

    const/4 v5, 0x1

    const/4 v12, 0x0

    .end local v15    # "element$iv$iv$iv":Ljava/lang/Object;
    goto/16 :goto_0

    .line 164
    .end local v21    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v22    # "$i$f$mapNotNull":I
    .end local v24    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v25    # "$i$f$mapNotNullTo":I
    .end local v27    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .local v6, "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v7    # "$i$f$mapNotNull":I
    .restart local v9    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v10    # "$i$f$mapNotNullTo":I
    .restart local v11    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    :cond_9
    move-object/from16 v21, v6

    move/from16 v22, v7

    move-object/from16 v24, v9

    move/from16 v25, v10

    move-object/from16 v27, v11

    .line 165
    .end local v6    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapNotNull":I
    .end local v9    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v10    # "$i$f$mapNotNullTo":I
    .end local v11    # "$this$forEach$iv$iv$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$forEach":I
    .restart local v21    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .restart local v22    # "$i$f$mapNotNull":I
    .restart local v24    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .restart local v25    # "$i$f$mapNotNullTo":I
    nop

    .end local v8    # "destination$iv$iv":Ljava/util/Collection;
    .end local v24    # "$this$mapNotNullTo$iv$iv":Ljava/lang/Iterable;
    .end local v25    # "$i$f$mapNotNullTo":I
    move-object v0, v8

    check-cast v0, Ljava/util/List;

    .line 152
    nop

    .end local v21    # "$this$mapNotNull$iv":Ljava/lang/Iterable;
    .end local v22    # "$i$f$mapNotNull":I
    move-object v5, v0

    check-cast v5, Ljava/lang/Iterable;

    .line 36
    const-string v0, "&"

    move-object v6, v0

    check-cast v6, Ljava/lang/CharSequence;

    const/16 v12, 0x3e

    const/4 v13, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v5 .. v13}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 31
    nop

    .line 37
    .local v0, "query":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "https://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v6, v0

    check-cast v6, Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-nez v6, :cond_a

    const/16 v26, 0x1

    goto :goto_4

    :cond_a
    const/16 v26, 0x0

    :goto_4
    if-eqz v26, :cond_b

    move-object v6, v3

    goto :goto_5

    :cond_b
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v7, 0x3f

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_5
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v0    # "query":Ljava/lang/String;
    goto :goto_6

    .line 38
    :cond_c
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    sget-object v5, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    const-string v6, "getBytes(...)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v7

    const-string v0, "digest(...)"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v8, v3

    check-cast v8, Ljava/lang/CharSequence;

    new-instance v13, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda1;

    invoke-direct {v13}, Lcom/github/tvbox/osc/util/DanmakuAggregation$$ExternalSyntheticLambda1;-><init>()V

    const/16 v14, 0x1e

    const/4 v15, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v7 .. v15}, Lkotlin/collections/ArraysKt;->joinToString$default([BLjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v0

    .end local v2    # "uri":Ljava/net/URI;
    .end local v4    # "host":Ljava/lang/String;
    :goto_6
    goto :goto_8

    .line 28
    .restart local v2    # "uri":Ljava/net/URI;
    :cond_d
    :goto_7
    return-object v3

    .line 39
    .end local v2    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 25
    :goto_8
    return-object v3

    .line 24
    :cond_e
    :goto_9
    return-object v3
.end method

.method private static final sourceId$lambda$2(B)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "it"    # B

    .line 38
    and-int/lit16 v0, p0, 0xff

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%02x"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "format(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method
