.class public Lcom/github/tvbox/osc/util/PlayerHelper;
.super Ljava/lang/Object;
.source "PlayerHelper.java"


# static fields
.field private static mPlayersExistInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static mPlayersInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 166
    const/4 v0, 0x0

    sput-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersInfo:Ljava/util/HashMap;

    .line 183
    sput-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersExistInfo:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDisplaySpeed(JZ)Ljava/lang/String;
    .locals 6
    .param p0, "speed"    # J
    .param p2, "show"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "speed",
            "show"
        }
    .end annotation

    .line 285
    const-wide/32 v0, 0x100000

    cmp-long v2, p0, v0

    if-lez v2, :cond_0

    .line 286
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "#.00"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-double v2, p0

    const-wide/high16 v4, 0x4130000000000000L    # 1048576.0

    div-double/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Mb/s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 287
    :cond_0
    const-wide/16 v0, 0x400

    cmp-long v2, p0, v0

    if-lez v2, :cond_1

    .line 288
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    div-long v0, p0, v0

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "Kb/s"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 290
    :cond_1
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "B/s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_3

    const-string v0, "0B/s"

    goto :goto_0

    :cond_3
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public static getDisplaySpeedBps(JZ)Ljava/lang/String;
    .locals 8
    .param p0, "speed"    # J
    .param p2, "show"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "speed",
            "show"
        }
    .end annotation

    .line 293
    const-wide/16 v0, 0x8

    mul-long v0, v0, p0

    .line 294
    .local v0, "bitSpeed":J
    const-wide/32 v2, 0x3b9aca00

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    .line 295
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v3, Ljava/text/DecimalFormat;

    const-string v4, "0.00"

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-double v4, v0

    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Gbps"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 296
    :cond_0
    const-wide/32 v2, 0xf4240

    const-string v4, "0.0"

    cmp-long v5, v0, v2

    if-ltz v5, :cond_1

    .line 297
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v3, Ljava/text/DecimalFormat;

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-double v4, v0

    const-wide v6, 0x412e848000000000L    # 1000000.0

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Mbps"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 298
    :cond_1
    const-wide/16 v2, 0x3e8

    cmp-long v5, v0, v2

    if-ltz v5, :cond_2

    .line 299
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v3, Ljava/text/DecimalFormat;

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-double v4, v0

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Kbps"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 301
    :cond_2
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "bps"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_3
    if-eqz p2, :cond_4

    const-string v2, "0bps"

    goto :goto_0

    :cond_4
    const-string v2, ""

    :goto_0
    return-object v2
.end method

.method public static getExistPlayerTypes()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 210
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayersExistInfo()Ljava/util/HashMap;

    move-result-object v0

    .line 211
    .local v0, "playersExistInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Boolean;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 212
    .local v1, "existPlayers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 213
    .local v3, "playerType":Ljava/lang/Integer;
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 214
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    .end local v3    # "playerType":Ljava/lang/Integer;
    :cond_0
    goto :goto_0

    .line 217
    :cond_1
    return-object v1
.end method

.method public static getPlayerExist(I)Ljava/lang/Boolean;
    .locals 2
    .param p0, "playType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "playType"
        }
    .end annotation

    .line 201
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayersExistInfo()Ljava/util/HashMap;

    move-result-object v0

    .line 202
    .local v0, "playersExistInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Boolean;>;"
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 203
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    return-object v1

    .line 205
    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method public static getPlayerName(I)Ljava/lang/String;
    .locals 2
    const/4 v0, -0x1
    if-ne p0, v0, :normal_name
    const-string v0, "每次询问"
    return-object v0
    :normal_name
    .param p0, "playType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "playType"
        }
    .end annotation

    .line 158
    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayersInfo()Ljava/util/HashMap;

    move-result-object v0

    .line 159
    .local v0, "playersInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 160
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 162
    :cond_0
    const-string v1, "\u7cfb\u7edf\u64ad\u653e\u5668"

    return-object v1
.end method

.method public static getPlayersExistInfo()Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 185
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersExistInfo:Ljava/util/HashMap;

    if-nez v0, :cond_5

    .line 186
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 187
    .local v0, "playersExist":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Boolean;>;"
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {}, Lcom/github/tvbox/osc/player/thirdparty/MXPlayer;->getPackageInfo()Lcom/github/tvbox/osc/player/thirdparty/MXPlayer$MXPackageInfo;

    move-result-object v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {}, Lcom/github/tvbox/osc/player/thirdparty/ReexPlayer;->getPackageInfo()Lcom/github/tvbox/osc/player/thirdparty/ReexPlayer$ReexPackageInfo;

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const/16 v2, 0xc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {}, Lcom/github/tvbox/osc/player/thirdparty/Kodi;->getPackageInfo()Lcom/github/tvbox/osc/player/thirdparty/Kodi$KodiPackageInfo;

    move-result-object v4

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    :goto_2
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {}, Lcom/github/tvbox/osc/player/thirdparty/RemoteTVBox;->getAvalible()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    :goto_3
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {}, Lcom/github/tvbox/osc/player/thirdparty/VlcPlayer;->getPackageInfo()Lcom/github/tvbox/osc/player/thirdparty/VlcPlayer$VlcPackageInfo;

    move-result-object v4

    if-eqz v4, :cond_4

    const/4 v1, 0x1

    :cond_4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sput-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersExistInfo:Ljava/util/HashMap;

    .line 197
    .end local v0    # "playersExist":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Boolean;>;"
    :cond_5
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersExistInfo:Ljava/util/HashMap;

    return-object v0
.end method

.method public static getPlayersInfo()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 168
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersInfo:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 169
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 170
    .local v0, "playersInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u7cfb\u7edf\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "IJK\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "EXO\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "MX\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reex\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Kodi\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u9644\u8fd1TVBox"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "VLC\u64ad\u653e\u5668"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sput-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersInfo:Ljava/util/HashMap;

    .line 180
    .end local v0    # "playersInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_0
    sget-object v0, Lcom/github/tvbox/osc/util/PlayerHelper;->mPlayersInfo:Ljava/util/HashMap;

    return-object v0
.end method

.method public static getRenderName(I)Ljava/lang/String;
    .locals 1
    .param p0, "renderType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "renderType"
        }
    .end annotation

    .line 252
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    .line 253
    const-string v0, "SurfaceView"

    return-object v0

    .line 255
    :cond_0
    const-string v0, "TextureView"

    return-object v0
.end method

.method public static getScaleName(I)Ljava/lang/String;
    .locals 1
    .param p0, "screenScaleType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "screenScaleType"
        }
    .end annotation

    .line 260
    const-string v0, "\u9ed8\u8ba4"

    .line 261
    .local v0, "scaleText":Ljava/lang/String;
    packed-switch p0, :pswitch_data_0

    goto :goto_0

    .line 278
    :pswitch_0
    const-string v0, "\u88c1\u526a"

    goto :goto_0

    .line 275
    :pswitch_1
    const-string v0, "\u539f\u59cb"

    .line 276
    goto :goto_0

    .line 272
    :pswitch_2
    const-string v0, "\u586b\u5145"

    .line 273
    goto :goto_0

    .line 269
    :pswitch_3
    const-string v0, "4:3"

    .line 270
    goto :goto_0

    .line 266
    :pswitch_4
    const-string v0, "16:9"

    .line 267
    goto :goto_0

    .line 263
    :pswitch_5
    const-string v0, "\u9ed8\u8ba4"

    .line 264
    nop

    .line 281
    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static init()V
    .locals 1

    .line 142
    :try_start_0
    new-instance v0, Lcom/github/tvbox/osc/util/PlayerHelper$5;

    invoke-direct {v0}, Lcom/github/tvbox/osc/util/PlayerHelper$5;-><init>()V

    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    goto :goto_0

    .line 152
    :catchall_0
    move-exception v0

    .line 153
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 155
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method

.method public static runExternalPlayer(ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "playerType"    # I
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "subtitle"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "playerType",
            "activity",
            "url",
            "title",
            "subtitle",
            "headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .line 221
    .local p5, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static/range {p0 .. p5}, Lcom/github/tvbox/osc/util/PlayerHelper;->runExternalPlayer(ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static runExternalPlayer(ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;J)Ljava/lang/Boolean;
    .locals 7
    .param p0, "playerType"    # I
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "subtitle"    # Ljava/lang/String;
    .param p6, "progress"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "playerType",
            "activity",
            "url",
            "title",
            "subtitle",
            "headers",
            "progress"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .line 225
    .local p5, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 226
    .local v0, "callResult":Z
    packed-switch p0, :pswitch_data_0

    goto :goto_0

    .line 244
    :pswitch_0
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-wide v5, p6

    invoke-static/range {v1 .. v6}, Lcom/github/tvbox/osc/player/thirdparty/VlcPlayer;->run(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z

    move-result v0

    goto :goto_0

    .line 240
    :pswitch_1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/github/tvbox/osc/player/thirdparty/RemoteTVBox;->run(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v0

    .line 241
    goto :goto_0

    .line 236
    :pswitch_2
    invoke-static {p1, p2, p3, p4, p5}, Lcom/github/tvbox/osc/player/thirdparty/Kodi;->run(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v0

    .line 237
    goto :goto_0

    .line 232
    :pswitch_3
    invoke-static {p1, p2, p3, p4, p5}, Lcom/github/tvbox/osc/player/thirdparty/ReexPlayer;->run(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v0

    .line 233
    goto :goto_0

    .line 228
    :pswitch_4
    invoke-static {p1, p2, p3, p4, p5}, Lcom/github/tvbox/osc/player/thirdparty/MXPlayer;->run(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v0

    .line 229
    nop

    .line 248
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static updateCfg(Lxyz/doikki/videoplayer/player/VideoView;)V
    .locals 4
    .param p0, "videoView"    # Lxyz/doikki/videoplayer/player/VideoView;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "videoView"
        }
    .end annotation

    .line 96
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "play_type"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 98
    .local v1, "playType":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 99
    new-instance v2, Lcom/github/tvbox/osc/util/PlayerHelper$3;

    invoke-direct {v2}, Lcom/github/tvbox/osc/util/PlayerHelper$3;-><init>()V

    .line 106
    .local v2, "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :try_start_0
    new-instance v3, Lcom/github/tvbox/osc/util/PlayerHelper$4;

    invoke-direct {v3}, Lcom/github/tvbox/osc/util/PlayerHelper$4;-><init>()V

    invoke-static {v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 116
    :catchall_0
    move-exception v3

    .line 117
    .local v3, "th":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 118
    .end local v3    # "th":Ljava/lang/Throwable;
    :goto_0
    goto :goto_1

    .line 119
    .end local v2    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :cond_0
    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 120
    invoke-static {}, Lcom/github/tvbox/osc/player/ExoMediaPlayerFactory;->create()Lcom/github/tvbox/osc/player/ExoMediaPlayerFactory;

    move-result-object v2

    .restart local v2    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    goto :goto_1

    .line 122
    .end local v2    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :cond_1
    invoke-static {}, Lxyz/doikki/videoplayer/player/AndroidMediaPlayerFactory;->create()Lxyz/doikki/videoplayer/player/AndroidMediaPlayerFactory;

    move-result-object v2

    .line 124
    .restart local v2    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :goto_1
    const-string v3, "play_render"

    invoke-static {v3, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 125
    .local v0, "renderType":I
    const/4 v3, 0x0

    .line 126
    .local v3, "renderViewFactory":Lxyz/doikki/videoplayer/render/RenderViewFactory;
    packed-switch v0, :pswitch_data_0

    .line 129
    invoke-static {}, Lxyz/doikki/videoplayer/render/TextureRenderViewFactory;->create()Lxyz/doikki/videoplayer/render/TextureRenderViewFactory;

    move-result-object v3

    .line 130
    goto :goto_2

    .line 132
    :pswitch_0
    invoke-static {}, Lcom/github/tvbox/osc/player/render/SurfaceRenderViewFactory;->create()Lcom/github/tvbox/osc/player/render/SurfaceRenderViewFactory;

    move-result-object v3

    .line 135
    :goto_2
    invoke-virtual {p0, v2}, Lxyz/doikki/videoplayer/player/VideoView;->setPlayerFactory(Lxyz/doikki/videoplayer/player/PlayerFactory;)V

    .line 136
    invoke-virtual {p0, v3}, Lxyz/doikki/videoplayer/player/VideoView;->setRenderViewFactory(Lxyz/doikki/videoplayer/render/RenderViewFactory;)V

    .line 137
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static updateCfg(Lxyz/doikki/videoplayer/player/VideoView;Lorg/json/JSONObject;)V
    .locals 1
    .param p0, "videoView"    # Lxyz/doikki/videoplayer/player/VideoView;
    .param p1, "playerCfg"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "videoView",
            "playerCfg"
        }
    .end annotation

    .line 34
    const/4 v0, -0x1

    invoke-static {p0, p1, v0}, Lcom/github/tvbox/osc/util/PlayerHelper;->updateCfg(Lxyz/doikki/videoplayer/player/VideoView;Lorg/json/JSONObject;I)V

    .line 35
    return-void
.end method

.method public static updateCfg(Lxyz/doikki/videoplayer/player/VideoView;Lorg/json/JSONObject;I)V
    .locals 7
    .param p0, "videoView"    # Lxyz/doikki/videoplayer/player/VideoView;
    .param p1, "playerCfg"    # Lorg/json/JSONObject;
    .param p2, "forcePlayerType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "videoView",
            "playerCfg",
            "forcePlayerType"
        }
    .end annotation

    .line 37
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "play_type"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 38
    .local v1, "playerType":I
    const-string v2, "play_render"

    invoke-static {v2, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 39
    .local v2, "renderType":I
    const-string v3, "ijk_codec"

    const-string v4, "\u786c\u89e3\u7801"

    invoke-static {v3, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 40
    .local v3, "ijkCode":Ljava/lang/String;
    const-string v4, "play_scale"

    invoke-static {v4, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 42
    .local v0, "scale":I
    :try_start_0
    const-string v4, "pl"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    move v1, v4

    .line 43
    const-string v4, "pr"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    move v2, v4

    .line 44
    const-string v4, "ijk"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    .line 45
    const-string v4, "sc"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v4

    .line 48
    goto :goto_0

    .line 46
    :catch_0
    move-exception v4

    .line 47
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 49
    .end local v4    # "e":Lorg/json/JSONException;
    :goto_0
    if-ltz p2, :cond_0

    move v1, p2

    .line 50
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/github/tvbox/osc/api/ApiConfig;->getIJKCodec(Ljava/lang/String;)Lcom/github/tvbox/osc/bean/IJKCode;

    move-result-object v4

    .line 52
    .local v4, "codec":Lcom/github/tvbox/osc/bean/IJKCode;
    const/4 v5, 0x1

    if-ne v1, v5, :cond_1

    .line 53
    new-instance v5, Lcom/github/tvbox/osc/util/PlayerHelper$1;

    invoke-direct {v5, v4}, Lcom/github/tvbox/osc/util/PlayerHelper$1;-><init>(Lcom/github/tvbox/osc/bean/IJKCode;)V

    .line 60
    .local v5, "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :try_start_1
    new-instance v6, Lcom/github/tvbox/osc/util/PlayerHelper$2;

    invoke-direct {v6}, Lcom/github/tvbox/osc/util/PlayerHelper$2;-><init>()V

    invoke-static {v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 70
    :catchall_0
    move-exception v6

    .line 71
    .local v6, "th":Ljava/lang/Throwable;
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 72
    .end local v6    # "th":Ljava/lang/Throwable;
    :goto_1
    goto :goto_2

    .line 73
    .end local v5    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :cond_1
    const/4 v5, 0x2

    if-ne v1, v5, :cond_2

    .line 74
    invoke-static {}, Lcom/github/tvbox/osc/player/ExoMediaPlayerFactory;->create()Lcom/github/tvbox/osc/player/ExoMediaPlayerFactory;

    move-result-object v5

    .restart local v5    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    goto :goto_2

    .line 76
    .end local v5    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :cond_2
    invoke-static {}, Lxyz/doikki/videoplayer/player/AndroidMediaPlayerFactory;->create()Lxyz/doikki/videoplayer/player/AndroidMediaPlayerFactory;

    move-result-object v5

    .line 78
    .restart local v5    # "playerFactory":Lxyz/doikki/videoplayer/player/PlayerFactory;
    :goto_2
    const/4 v6, 0x0

    .line 79
    .local v6, "renderViewFactory":Lxyz/doikki/videoplayer/render/RenderViewFactory;
    packed-switch v2, :pswitch_data_0

    .line 82
    invoke-static {}, Lxyz/doikki/videoplayer/render/TextureRenderViewFactory;->create()Lxyz/doikki/videoplayer/render/TextureRenderViewFactory;

    move-result-object v6

    .line 83
    goto :goto_3

    .line 85
    :pswitch_0
    invoke-static {}, Lcom/github/tvbox/osc/player/render/SurfaceRenderViewFactory;->create()Lcom/github/tvbox/osc/player/render/SurfaceRenderViewFactory;

    move-result-object v6

    .line 88
    :goto_3
    if-eqz p0, :cond_3

    .line 89
    invoke-virtual {p0, v5}, Lxyz/doikki/videoplayer/player/VideoView;->setPlayerFactory(Lxyz/doikki/videoplayer/player/PlayerFactory;)V

    .line 90
    invoke-virtual {p0, v6}, Lxyz/doikki/videoplayer/player/VideoView;->setRenderViewFactory(Lxyz/doikki/videoplayer/render/RenderViewFactory;)V

    .line 91
    invoke-virtual {p0, v0}, Lxyz/doikki/videoplayer/player/VideoView;->setScreenScaleType(I)V

    .line 93
    :cond_3
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
