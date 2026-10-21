.class final Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;
.super Ljava/lang/Object;
.source "PlaybackProgressDispatcher.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Snapshot"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0010\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0082\u0008\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0013\u001a\u00020\u0005H\u00c6\u0003J1\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0005H\u00c6\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0018\u001a\u00020\u0019H\u00d6\u0001J\t\u0010\u001a\u001a\u00020\u0003H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000bR\u0011\u0010\u0007\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\r\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;",
        "",
        "key",
        "",
        "position",
        "",
        "account",
        "sampledAt",
        "<init>",
        "(Ljava/lang/String;JLjava/lang/String;J)V",
        "getKey",
        "()Ljava/lang/String;",
        "getPosition",
        "()J",
        "getAccount",
        "getSampledAt",
        "component1",
        "component2",
        "component3",
        "component4",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
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


# instance fields
.field private final account:Ljava/lang/String;

.field private final key:Ljava/lang/String;

.field private final position:J

.field private final sampledAt:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;J)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "position"    # J
    .param p4, "account"    # Ljava/lang/String;
    .param p5, "sampledAt"    # J

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "account"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    iput-wide p2, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    iput-object p4, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    iput-wide p5, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    return-void
.end method

.method public static synthetic copy$default(Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;Ljava/lang/String;JLjava/lang/String;JILjava/lang/Object;)Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;
    .locals 4

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-object p1, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget-wide p2, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    :cond_1
    move-wide v0, p2

    and-int/lit8 p2, p7, 0x4

    if-eqz p2, :cond_2

    iget-object p4, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    :cond_2
    move-object p8, p4

    and-int/lit8 p2, p7, 0x8

    if-eqz p2, :cond_3

    iget-wide p5, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    :cond_3
    move-wide v2, p5

    move-object p2, p0

    move-object p3, p1

    move-wide p4, v0

    move-object p6, p8

    move-wide p7, v2

    invoke-virtual/range {p2 .. p8}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->copy(Ljava/lang/String;JLjava/lang/String;J)Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()J
    .locals 2

    iget-wide v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    return-wide v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()J
    .locals 2

    iget-wide v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    return-wide v0
.end method

.method public final copy(Ljava/lang/String;JLjava/lang/String;J)Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;
    .locals 8

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "account"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    move-object v1, v0

    move-object v2, p1

    move-wide v3, p2

    move-object v5, p4

    move-wide v6, p5

    invoke-direct/range {v1 .. v7}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;-><init>(Ljava/lang/String;JLjava/lang/String;J)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;

    iget-object v3, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    iget-object v4, v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-wide v3, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    iget-wide v5, v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    cmp-long v7, v3, v5

    if-eqz v7, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    iget-object v4, v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-wide v3, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    iget-wide v5, v1, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final getAccount()Ljava/lang/String;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    return-object v0
.end method

.method public final getKey()Ljava/lang/String;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    return-object v0
.end method

.method public final getPosition()J
    .locals 2

    .line 12
    iget-wide v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    return-wide v0
.end method

.method public final getSampledAt()J
    .locals 2

    .line 12
    iget-wide v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    iget-object v0, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    invoke-static {v2, v3}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot$$ExternalSyntheticBackport0;->m(J)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    invoke-static {v2, v3}, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot$$ExternalSyntheticBackport0;->m(J)I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Snapshot(key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->position:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", account="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->account:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sampledAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/github/tvbox/osc/util/PlaybackProgressDispatcher$Snapshot;->sampledAt:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
