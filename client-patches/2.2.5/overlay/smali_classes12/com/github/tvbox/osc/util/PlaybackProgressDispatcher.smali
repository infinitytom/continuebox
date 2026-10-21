.class public final Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;
.super Ljava/lang/Object;
.source "PlaybackProgressDispatcher.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPlaybackProgressDispatcher.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PlaybackProgressDispatcher.kt\ncom/github/tvbox/osc/util/PlaybackProgressDispatcher\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,99:1\n3829#2:100\n4344#2,2:101\n1869#3,2:103\n1#4:105\n*S KotlinDebug\n*F\n+ 1 PlaybackProgressDispatcher.kt\ncom/github/tvbox/osc/util/PlaybackProgressDispatcher\n*L\n87#1:100\n87#1:101,2\n87#1:103,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0008\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001 B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0013\u001a\u00020\u0006H\u0002J\u0018\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0006H\u0002J\u001a\u0010\u0016\u001a\u00020\u00172\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0018\u001a\u00020\u0019H\u0007J\u0010\u0010\u001a\u001a\u00020\u00172\u0006\u0010\u0014\u001a\u00020\u0006H\u0002J\u0014\u0010\u001b\u001a\u0004\u0018\u00010\u00012\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0006H\u0007J\u0010\u0010\u001c\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u0006H\u0007J\u0012\u0010\u001e\u001a\u00020\u00172\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u0007R\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0008\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\n\u001a\u0012\u0012\u0002\u0008\u0003 \u000c*\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u000b0\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\r\u001a\n \u000c*\u0004\u0018\u00010\u000e0\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000f\u001a\n \u000c*\u0004\u0018\u00010\u000e0\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0010\u001a\n \u000c*\u0004\u0018\u00010\u000e0\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;",
        "",
        "<init>",
        "()V",
        "pending",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "",
        "Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;",
        "scheduled",
        "",
        "sync",
        "Ljava/lang/Class;",
        "kotlin.jvm.PlatformType",
        "scope",
        "Ljava/lang/reflect/Method;",
        "allowed",
        "persist",
        "executor",
        "Ljava/util/concurrent/ExecutorService;",
        "account",
        "id",
        "key",
        "enqueue",
        "",
        "position",
        "",
        "schedule",
        "pendingPosition",
        "dispatch",
        "action",
        "enqueueRecord",
        "record",
        "Snapshot",
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
.field public static final INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

.field private static final allowed:Ljava/lang/reflect/Method;

.field private static final executor:Ljava/util/concurrent/ExecutorService;

.field private static final pending:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;",
            ">;"
        }
    .end annotation
.end field

.field private static final persist:Ljava/lang/reflect/Method;

.field private static final scheduled:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final scope:Ljava/lang/reflect/Method;

.field private static final sync:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$PQbDMQTX3-CF4t99lepSNMLmFZY(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->dispatch$lambda$3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$faT5MkpSnlJPEUs-2_O4iWMChxs(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->schedule$lambda$2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$myXBlDYBJqdAmQYb5-t-9aNImwk(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->enqueueRecord$lambda$6(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    .line 13
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    .line 14
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scheduled:Ljava/util/concurrent/ConcurrentHashMap;

    .line 15
    const-string v0, "com.github.tvbox.osc.sync.TvboxSyncClient"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->sync:Ljava/lang/Class;

    .line 16
    const-string v0, "com.github.tvbox.osc.sync.AccountScope"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "current"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scope:Ljava/lang/reflect/Method;

    .line 17
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->sync:Ljava/lang/Class;

    const-string v2, "canReportPlayback"

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    move-object v2, v0

    .line 105
    .local v2, "$this$allowed_u24lambda_u240":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 17
    .local v3, "$i$a$-apply-PlaybackProgressDispatcher$allowed$1":I
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .end local v2    # "$this$allowed_u24lambda_u240":Ljava/lang/reflect/Method;
    .end local v3    # "$i$a$-apply-PlaybackProgressDispatcher$allowed$1":I
    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->allowed:Ljava/lang/reflect/Method;

    .line 18
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->sync:Ljava/lang/Class;

    .line 19
    nop

    .line 18
    nop

    .line 19
    nop

    .line 18
    nop

    .line 19
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v1

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v1, v2, v4

    const/4 v5, 0x2

    aput-object v3, v2, v5

    const/4 v3, 0x3

    aput-object v1, v2, v3

    .line 18
    const-string v1, "persistProgressSnapshot"

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->persist:Ljava/lang/reflect/Method;

    .line 20
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->sync:Ljava/lang/Class;

    const-string v1, "PROGRESS_EXECUTOR"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 21
    move-object v1, v0

    .line 105
    .local v1, "$this$executor_u24lambda_u241":Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .line 21
    .local v2, "$i$a$-apply-PlaybackProgressDispatcher$executor$1":I
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .end local v1    # "$this$executor_u24lambda_u241":Ljava/lang/reflect/Field;
    .end local v2    # "$i$a$-apply-PlaybackProgressDispatcher$executor$1":I
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 20
    const-string v1, "null cannot be cast to non-null type java.util.concurrent.ExecutorService"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    sput-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->executor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final account()Ljava/lang/String;
    .locals 3

    .line 23
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scope:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type kotlin.String"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static final dispatch(Ljava/lang/String;)V
    .locals 3
    .param p0, "action"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "action"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "account":Ljava/lang/String;
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 79
    return-void
.end method

.method private static final dispatch$lambda$3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "$account"    # Ljava/lang/String;
    .param p1, "$action"    # Ljava/lang/String;

    .line 73
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 74
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    :try_start_0
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->sync:Ljava/lang/Class;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Worker"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 76
    :catchall_0
    move-exception v0

    .local v0, "error":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Background sync action failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ContinueBox"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    .end local v0    # "error":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-void
.end method

.method public static final enqueue(Ljava/lang/String;J)V
    .locals 11
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "position"    # J
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 28
    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-nez v0, :cond_5

    const-wide/16 v3, 0x0

    cmp-long v0, p1, v3

    if-ltz v0, :cond_5

    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->allowed:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_3

    .line 29
    :cond_2
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "account":Ljava/lang/String;
    sget-object v3, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v3, v0, p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->id(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 31
    .local v10, "id":Ljava/lang/String;
    sget-object v3, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v10}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getPosition()J

    move-result-wide v3

    cmp-long v5, v3, p1

    if-nez v5, :cond_3

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    if-eqz v1, :cond_4

    .line 32
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v1, v10}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->schedule(Ljava/lang/String;)V

    .line 33
    return-void

    .line 35
    :cond_4
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v1, Ljava/util/Map;

    new-instance v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    move-object v3, v2

    move-object v4, p0

    move-wide v5, p1

    move-object v7, v0

    invoke-direct/range {v3 .. v9}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;-><init>(Ljava/lang/String;JLjava/lang/String;J)V

    invoke-interface {v1, v10, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v1, v10}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->schedule(Ljava/lang/String;)V

    .line 37
    return-void

    .line 28
    .end local v0    # "account":Ljava/lang/String;
    .end local v10    # "id":Ljava/lang/String;
    :cond_5
    :goto_3
    return-void
.end method

.method public static final enqueueRecord(Ljava/lang/Object;)V
    .locals 14
    .param p0, "record"    # Ljava/lang/Object;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 83
    if-nez p0, :cond_0

    return-void

    .line 84
    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "account":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 86
    .local v1, "cls":Ljava/lang/Class;
    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 87
    .local v3, "snapshot":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    const-string v5, "getFields(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, [Ljava/lang/Object;

    .local v4, "$this$filter$iv":[Ljava/lang/Object;
    const/4 v5, 0x0

    .line 100
    .local v5, "$i$f$filter":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    check-cast v6, Ljava/util/Collection;

    .local v6, "destination$iv$iv":Ljava/util/Collection;
    move-object v7, v4

    .local v7, "$this$filterTo$iv$iv":[Ljava/lang/Object;
    const/4 v8, 0x0

    .line 101
    .local v8, "$i$f$filterTo":I
    array-length v9, v7

    :goto_0
    if-ge v2, v9, :cond_2

    aget-object v10, v7, v2

    .local v10, "element$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    check-cast v11, Ljava/lang/reflect/Field;

    .local v11, "it":Ljava/lang/reflect/Field;
    const/4 v12, 0x0

    .line 87
    .local v12, "$i$a$-filter-PlaybackProgressDispatcher$enqueueRecord$1":I
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v13

    invoke-static {v13}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v13

    .line 101
    .end local v11    # "it":Ljava/lang/reflect/Field;
    .end local v12    # "$i$a$-filter-PlaybackProgressDispatcher$enqueueRecord$1":I
    xor-int/lit8 v11, v13, 0x1

    if-eqz v11, :cond_1

    invoke-interface {v6, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v10    # "element$iv$iv":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 102
    :cond_2
    nop

    .end local v6    # "destination$iv$iv":Ljava/util/Collection;
    .end local v7    # "$this$filterTo$iv$iv":[Ljava/lang/Object;
    .end local v8    # "$i$f$filterTo":I
    move-object v2, v6

    check-cast v2, Ljava/util/List;

    .line 100
    nop

    .end local v4    # "$this$filter$iv":[Ljava/lang/Object;
    .end local v5    # "$i$f$filter":I
    check-cast v2, Ljava/lang/Iterable;

    .line 87
    nop

    .local v2, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 103
    .local v4, "$i$f$forEach":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Ljava/lang/reflect/Field;

    .local v7, "it":Ljava/lang/reflect/Field;
    const/4 v8, 0x0

    .line 88
    .local v8, "$i$a$-forEach-PlaybackProgressDispatcher$enqueueRecord$2":I
    invoke-virtual {v7, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v7, v3, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    nop

    .line 103
    .end local v7    # "it":Ljava/lang/reflect/Field;
    .end local v8    # "$i$a$-forEach-PlaybackProgressDispatcher$enqueueRecord$2":I
    nop

    .end local v6    # "element$iv":Ljava/lang/Object;
    goto :goto_1

    .line 104
    :cond_3
    nop

    .line 90
    .end local v2    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$forEach":I
    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$$ExternalSyntheticLambda0;

    invoke-direct {v4, v0, v1, v3}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-interface {v2, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 97
    return-void
.end method

.method private static final enqueueRecord$lambda$6(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 5
    .param p0, "$account"    # Ljava/lang/String;
    .param p1, "$cls"    # Ljava/lang/Class;
    .param p2, "$snapshot"    # Ljava/lang/Object;

    .line 91
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 92
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    :try_start_0
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->sync:Ljava/lang/Class;

    const-string v1, "pushRecordWorker"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p2, v1, v4

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 94
    :catchall_0
    move-exception v0

    .local v0, "error":Ljava/lang/Throwable;
    const-string v1, "ContinueBox"

    const-string v2, "Background history upload preparation failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    .end local v0    # "error":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-void
.end method

.method private final id(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final pendingPosition(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 65
    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    return-object v1

    .line 66
    :cond_2
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    sget-object v3, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v3}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->id(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getPosition()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :cond_3
    return-object v1
.end method

.method private final schedule(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .line 40
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scheduled:Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    .line 41
    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 61
    return-void
.end method

.method private static final schedule$lambda$2(Ljava/lang/String;)V
    .locals 9
    .param p0, "$id"    # Ljava/lang/String;

    .line 42
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 43
    const/4 v0, 0x1

    .line 44
    .local v0, "succeeded":Z
    nop

    .line 45
    :cond_0
    nop

    .line 46
    :try_start_0
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    if-nez v1, :cond_1

    goto :goto_0

    .line 47
    .local v1, "snapshot":Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;
    :cond_1
    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v2}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->account()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getAccount()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 48
    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->persist:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getPosition()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getAccount()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->getSampledAt()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v3, 0x1

    aput-object v4, v7, v3

    const/4 v3, 0x2

    aput-object v5, v7, v3

    const/4 v3, 0x3

    aput-object v6, v7, v3

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_2
    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 57
    .end local v1    # "snapshot":Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;
    :goto_0
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scheduled:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->schedule(Ljava/lang/String;)V

    goto :goto_1

    .line 52
    :catchall_0
    move-exception v1

    .line 53
    .local v1, "error":Ljava/lang/Throwable;
    const/4 v0, 0x0

    .line 55
    :try_start_1
    const-string v2, "ContinueBox"

    const-string v3, "Background progress persistence failed"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    nop

    .end local v1    # "error":Ljava/lang/Throwable;
    sget-object v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scheduled:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    nop

    .line 59
    :cond_3
    :goto_1
    nop

    .line 60
    return-void

    .line 57
    :catchall_1
    move-exception v1

    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->scheduled:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    if-eqz v0, :cond_4

    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->pending:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v2, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->INSTANCE:Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;->schedule(Ljava/lang/String;)V

    :cond_4
    throw v1
.end method
