.class public Lcom/github/tvbox/osc/player/IjkMediaPlayer;
.super Lxyz/doikki/videoplayer/ijk/IjkPlayer;
.source "IjkMediaPlayer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final CACHE_VIDEO:I = 0x2

.field private static final DEFAULT_ACCEPT:Ljava/lang/String; = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/json;q=0.9"

.field private static final DEFAULT_USER_AGENT:Ljava/lang/String; = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36"

.field private static final ITV_TARGET_DOMAIN:Ljava/lang/String; = "gslbserv.itv.cmvideo.cn"

.field private static final M3U8:I = 0x3

.field private static final OTHER:I = 0x0

.field private static final RTSP_UDP_RTP:I = 0x1

.field private static memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;


# instance fields
.field private codec:Lcom/github/tvbox/osc/bean/IJKCode;

.field protected currentPlayPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/github/tvbox/osc/bean/IJKCode;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "codec"    # Lcom/github/tvbox/osc/bean/IJKCode;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "codec"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1}, Lxyz/doikki/videoplayer/ijk/IjkPlayer;-><init>(Landroid/content/Context;)V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->codec:Lcom/github/tvbox/osc/bean/IJKCode;

    .line 39
    iput-object p2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->codec:Lcom/github/tvbox/osc/bean/IJKCode;

    .line 40
    invoke-static {p1}, Lcom/github/tvbox/osc/util/AudioTrackMemory;->getInstance(Landroid/content/Context;)Lcom/github/tvbox/osc/util/AudioTrackMemory;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;

    .line 41
    return-void
.end method

.method private buildDisplayName(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "number"    # I
    .param p3, "language"    # Ljava/lang/String;
    .param p4, "detail"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "prefix",
            "number",
            "language",
            "detail"
        }
    .end annotation

    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 290
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 291
    const-string v2, " - "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 294
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getFriendlyLanguage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "language"    # Ljava/lang/String;
    .param p2, "rawInfo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "language",
            "rawInfo"
        }
    .end annotation

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    if-nez p1, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    move-object v2, p1

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p2, :cond_1

    move-object v2, v1

    goto :goto_1

    :cond_1
    move-object v2, p2

    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "text":Ljava/lang/String;
    const-string v2, "yue"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    const-string v2, "cantonese"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    const-string v2, "\u7ca4"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    const-string v2, "\u5e7f\u4e1c"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_7

    .line 268
    :cond_2
    const-string v2, "zh"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, "\u56fd\u8bed"

    if-nez v2, :cond_c

    const-string v2, "chi"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "zho"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "chs"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 269
    const-string v2, "cht"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "cmn"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "\u4e2d"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 270
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "\u666e\u901a\u8bdd"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto/16 :goto_6

    .line 273
    :cond_3
    const-string v2, "en"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    const-string v2, "eng"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    const-string v2, "english"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    const-string v2, "\u82f1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_5

    .line 276
    :cond_4
    const-string v2, "ja"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    const-string v2, "jpn"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    const-string v2, "japanese"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    const-string v2, "\u65e5"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_4

    .line 279
    :cond_5
    const-string v2, "ko"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "kor"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "korean"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v2, "\u97e9"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_3

    .line 282
    :cond_6
    const-string v2, "tha"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "thai"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "th"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_2

    .line 285
    :cond_7
    return-object v1

    .line 283
    :cond_8
    :goto_2
    const-string v1, "\u6cf0\u8bed"

    return-object v1

    .line 280
    :cond_9
    :goto_3
    const-string v1, "\u97e9\u8bed"

    return-object v1

    .line 277
    :cond_a
    :goto_4
    const-string v1, "\u65e5\u8bed"

    return-object v1

    .line 274
    :cond_b
    :goto_5
    const-string v1, "\u82f1\u8bed"

    return-object v1

    .line 271
    :cond_c
    :goto_6
    return-object v3

    .line 266
    :cond_d
    :goto_7
    const-string v1, "\u7ca4\u8bed"

    return-object v1
.end method

.method private getStreamType(Ljava/lang/String;)I
    .locals 4
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "path"
        }
    .end annotation

    .line 151
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 152
    return v1

    .line 155
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, "lowerPath":Ljava/lang/String;
    const-string v2, "rtsp://"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "udp://"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "rtp://"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 159
    :cond_1
    const-string v2, "\\?"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v1

    .line 160
    .local v2, "cleanUrl":Ljava/lang/String;
    const-string v3, ".m3u8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 161
    const/4 v1, 0x3

    return v1

    .line 163
    :cond_2
    const-string v3, ".mp4"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, ".mkv"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, ".avi"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_0

    .line 166
    :cond_3
    return v1

    .line 164
    :cond_4
    :goto_0
    const/4 v1, 0x2

    return v1

    .line 157
    .end local v2    # "cleanUrl":Ljava/lang/String;
    :cond_5
    :goto_1
    const/4 v1, 0x1

    return v1
.end method

.method private processAudioName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "rawName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rawName"
        }
    .end annotation

    .line 255
    const-string v0, ""

    if-nez p1, :cond_0

    return-object v0

    .line 256
    :cond_0
    const-string v1, "AUDIO,"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 257
    const-string v2, "N/A,"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 258
    const-string v2, " "

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 259
    const-string v2, "^,+|,+$"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 260
    const-string v1, ","

    const-string v2, " / "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 256
    return-object v0
.end method

.method private setDataSourceHeader(Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 170
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 171
    .local v0, "playHeaders":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 172
    .local v1, "userAgent":Ljava/lang/String;
    const/4 v2, 0x0

    .line 173
    .local v2, "hasAccept":Z
    const-string v3, "Accept"

    if-eqz p1, :cond_5

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    .line 174
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 175
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 176
    .local v6, "key":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 177
    .local v7, "value":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 178
    goto :goto_0

    .line 180
    :cond_1
    const-string v8, "TVBox-Format"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 181
    goto :goto_0

    .line 183
    :cond_2
    const-string v8, "User-Agent"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 184
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 186
    :cond_3
    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 187
    const/4 v2, 0x1

    .line 189
    :cond_4
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v6, v8}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .line 193
    :cond_5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 194
    const-string v1, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36"

    .line 196
    :cond_6
    if-nez v2, :cond_7

    .line 197
    const-string v4, "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/json;q=0.9"

    invoke-virtual {v0, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    :cond_7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_8

    .line 200
    iget-object v3, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v5, "user_agent"

    invoke-virtual {v3, v4, v5, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 202
    :cond_8
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v3

    if-lez v3, :cond_a

    .line 203
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .local v3, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 205
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    const-string v7, ": "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    const-string v7, "\r\n"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_2

    .line 210
    :cond_9
    iget-object v5, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "headers"

    invoke-virtual {v5, v4, v7, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 212
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    :cond_a
    return-void
.end method


# virtual methods
.method public getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;
    .locals 16

    .line 215
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getTrackInfo()[Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;

    move-result-object v1

    .line 216
    .local v1, "trackInfo":[Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;
    if-nez v1, :cond_0

    const/4 v2, 0x0

    return-object v2

    .line 217
    :cond_0
    new-instance v2, Lcom/github/tvbox/osc/player/TrackInfo;

    invoke-direct {v2}, Lcom/github/tvbox/osc/player/TrackInfo;-><init>()V

    .line 218
    .local v2, "data":Lcom/github/tvbox/osc/player/TrackInfo;
    iget-object v3, v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getSelectedTrack(I)I

    move-result v3

    .line 219
    .local v3, "subtitleSelected":I
    iget-object v5, v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getSelectedTrack(I)I

    move-result v5

    .line 220
    .local v5, "audioSelected":I
    const/4 v7, 0x0

    .line 221
    .local v7, "index":I
    array-length v8, v1

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v8, :cond_6

    aget-object v11, v1, v10

    .line 222
    .local v11, "info":Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;
    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getTrackType()I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v6, :cond_3

    .line 223
    new-instance v12, Lcom/github/tvbox/osc/player/TrackInfoBean;

    invoke-direct {v12}, Lcom/github/tvbox/osc/player/TrackInfoBean;-><init>()V

    .line 224
    .local v12, "a":Lcom/github/tvbox/osc/player/TrackInfoBean;
    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getInfoInline()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v0, v14}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->processAudioName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 225
    .local v14, "name":Ljava/lang/String;
    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getLanguage()Ljava/lang/String;

    move-result-object v15

    iput-object v15, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    .line 226
    const-string v15, "aac"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_1

    const-string v15, "\u4e2d\u6587"

    iput-object v15, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    .line 227
    :cond_1
    iput-object v14, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->name:Ljava/lang/String;

    .line 228
    iget-object v15, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getInfoInline()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v15, v6}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getFriendlyLanguage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 229
    .local v6, "language":Ljava/lang/String;
    iput-object v6, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    .line 230
    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v15

    add-int/2addr v15, v13

    const-string v9, "\u97f3\u8f68"

    invoke-direct {v0, v9, v15, v6, v14}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->buildDisplayName(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->name:Ljava/lang/String;

    .line 231
    iput v7, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    .line 232
    iput v7, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->index:I

    .line 233
    if-ne v7, v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v13, 0x0

    :goto_1
    iput-boolean v13, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->selected:Z

    .line 235
    invoke-virtual {v2, v12}, Lcom/github/tvbox/osc/player/TrackInfo;->addAudio(Lcom/github/tvbox/osc/player/TrackInfoBean;)V

    .line 236
    .end local v6    # "language":Ljava/lang/String;
    .end local v12    # "a":Lcom/github/tvbox/osc/player/TrackInfoBean;
    .end local v14    # "name":Ljava/lang/String;
    goto :goto_3

    .line 237
    :cond_3
    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getTrackType()I

    move-result v6

    if-ne v6, v4, :cond_5

    .line 238
    new-instance v6, Lcom/github/tvbox/osc/player/TrackInfoBean;

    invoke-direct {v6}, Lcom/github/tvbox/osc/player/TrackInfoBean;-><init>()V

    .line 239
    .local v6, "t":Lcom/github/tvbox/osc/player/TrackInfoBean;
    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getInfoInline()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->name:Ljava/lang/String;

    .line 240
    invoke-virtual {v11}, Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;->getLanguage()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    .line 241
    iget-object v9, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    iget-object v12, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->name:Ljava/lang/String;

    invoke-direct {v0, v9, v12}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getFriendlyLanguage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 242
    .local v9, "language":Ljava/lang/String;
    iput-object v9, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    .line 243
    invoke-virtual {v2}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitle()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/2addr v12, v13

    const-string v14, "\u5b57\u5e55"

    const-string v15, ""

    invoke-direct {v0, v14, v12, v9, v15}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->buildDisplayName(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->name:Ljava/lang/String;

    .line 244
    iput v7, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    .line 245
    iput v7, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->index:I

    .line 246
    if-ne v7, v3, :cond_4

    goto :goto_2

    :cond_4
    const/4 v13, 0x0

    :goto_2
    iput-boolean v13, v6, Lcom/github/tvbox/osc/player/TrackInfoBean;->selected:Z

    .line 247
    invoke-virtual {v2, v6}, Lcom/github/tvbox/osc/player/TrackInfo;->addSubtitle(Lcom/github/tvbox/osc/player/TrackInfoBean;)V

    .line 249
    .end local v6    # "t":Lcom/github/tvbox/osc/player/TrackInfoBean;
    .end local v9    # "language":Ljava/lang/String;
    :cond_5
    :goto_3
    nop

    .end local v11    # "info":Ltv/danmaku/ijk/media/player/misc/IjkTrackInfo;
    add-int/lit8 v7, v7, 0x1

    .line 221
    add-int/lit8 v10, v10, 0x1

    const/4 v6, 0x2

    goto/16 :goto_0

    .line 251
    :cond_6
    return-object v2
.end method

.method public loadDefaultTrack(Lcom/github/tvbox/osc/player/TrackInfo;Ljava/lang/String;)V
    .locals 3
    .param p1, "trackInfo"    # Lcom/github/tvbox/osc/player/TrackInfo;
    .param p2, "playKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "trackInfo",
            "playKey"
        }
    .end annotation

    .line 321
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 322
    sget-object v0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;

    invoke-virtual {v0, p2}, Lcom/github/tvbox/osc/util/AudioTrackMemory;->ijkLoad(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 323
    .local v0, "trackIndex":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 324
    invoke-virtual {p1}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/tvbox/osc/player/TrackInfoBean;

    iget v1, v1, Lcom/github/tvbox/osc/player/TrackInfoBean;->index:I

    .line 325
    .local v1, "firsIndex":I
    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setTrack(I)V

    .line 326
    return-void

    .line 328
    .end local v1    # "firsIndex":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setTrack(I)V

    .line 330
    .end local v0    # "trackIndex":Ljava/lang/Integer;
    :cond_1
    return-void
.end method

.method public setDataSource(Ljava/lang/String;Ljava/util/Map;)V
    .locals 10
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "path",
            "headers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 94
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->getStreamType(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    const-wide/16 v3, 0x1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_0

    .line 123
    :pswitch_0
    const-string v1, "player_is_live"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 124
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 125
    .local v1, "uri":Ljava/net/URI;
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 126
    .local v2, "host":Ljava/lang/String;
    const-string v3, "gslbserv.itv.cmvideo.cn"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/server/ControlManager;->get()Lcom/github/tvbox/osc/server/ControlManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/github/tvbox/osc/server/ControlManager;->getAddress(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "proxy?go=live&type=m3u8&url="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "UTF-8"

    invoke-static {p1, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object p1, v3

    .line 127
    .end local v1    # "uri":Ljava/net/URI;
    .end local v2    # "host":Ljava/lang/String;
    :cond_0
    goto/16 :goto_0

    .line 104
    :pswitch_1
    const-string v1, "ijk_cache_play"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/github/tvbox/osc/util/FileUtils;->getCachePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/ijkcaches/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "cachePath":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 107
    .local v2, "cacheFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 108
    :cond_1
    invoke-static {p1}, Lcom/github/tvbox/osc/util/MD5;->string2MD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 109
    .local v5, "tmpMd5":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ".file"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 110
    .local v6, "cacheFilePath":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".map"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 112
    .local v7, "cacheMapPath":Ljava/lang/String;
    iget-object v8, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v9, "cache_file_path"

    invoke-virtual {v8, v0, v9, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 113
    iget-object v8, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v9, "cache_map_path"

    invoke-virtual {v8, v0, v9, v7}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 114
    iget-object v8, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v9, "parse_cache_map"

    invoke-virtual {v8, v0, v9, v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 115
    iget-object v8, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v9, "auto_save_map"

    invoke-virtual {v8, v0, v9, v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 116
    iget-object v3, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v4, "cache_max_capacity"

    const-wide/32 v8, 0x3c00000

    invoke-virtual {v3, v0, v4, v8, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 117
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ijkio:cache:ffio:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object p1, v3

    .line 118
    .end local v1    # "cachePath":Ljava/lang/String;
    .end local v2    # "cacheFile":Ljava/io/File;
    .end local v5    # "tmpMd5":Ljava/lang/String;
    .end local v6    # "cacheFilePath":Ljava/lang/String;
    .end local v7    # "cacheMapPath":Ljava/lang/String;
    goto :goto_0

    .line 96
    :pswitch_2
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v2, "infbuf"

    invoke-virtual {v1, v0, v2, v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 97
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v2, "rtsp_transport"

    const-string v3, "tcp"

    invoke-virtual {v1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 98
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v2, "rtsp_flags"

    const-string v3, "prefer_tcp"

    invoke-virtual {v1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 99
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v2, "probesize"

    const-wide/32 v3, 0x7d000

    invoke-virtual {v1, v0, v2, v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 100
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v2, "analyzeduration"

    const-wide/32 v3, 0x1e8480

    invoke-virtual {v1, v0, v2, v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    nop

    .line 135
    :cond_2
    :goto_0
    goto :goto_1

    .line 133
    :catch_0
    move-exception v1

    .line 134
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 136
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    invoke-direct {p0, p2}, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->setDataSourceHeader(Ljava/util/Map;)V

    .line 137
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v2, "protocol_whitelist"

    const-string v3, "ijkio,ffio,async,cache,crypto,file,dash,http,https,ijkhttphook,ijkinject,ijklivehook,ijklongurl,ijksegment,ijktcphook,pipe,rtp,tcp,tls,udp,ijkurlhook,data"

    invoke-virtual {v1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 138
    iput-object p1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->currentPlayPath:Ljava/lang/String;

    .line 139
    const/4 v0, 0x0

    invoke-super {p0, p1, v0}, Lxyz/doikki/videoplayer/ijk/IjkPlayer;->setDataSource(Ljava/lang/String;Ljava/util/Map;)V

    .line 140
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setOnTimedTextListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V
    .locals 1
    .param p1, "listener"    # Ltv/danmaku/ijk/media/player/IMediaPlayer$OnTimedTextListener;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 317
    iget-object v0, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOnTimedTextListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V

    .line 318
    return-void
.end method

.method public setOptions()V
    .locals 13

    .line 45
    invoke-super {p0}, Lxyz/doikki/videoplayer/ijk/IjkPlayer;->setOptions()V

    .line 46
    iget-object v0, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->codec:Lcom/github/tvbox/osc/bean/IJKCode;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getCurrentIJKCode()Lcom/github/tvbox/osc/bean/IJKCode;

    move-result-object v0

    .line 47
    .local v0, "codecTmp":Lcom/github/tvbox/osc/bean/IJKCode;
    :cond_0
    invoke-virtual {v0}, Lcom/github/tvbox/osc/bean/IJKCode;->getOption()Ljava/util/LinkedHashMap;

    move-result-object v1

    .line 48
    .local v1, "options":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    .line 49
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 50
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 51
    .local v6, "value":Ljava/lang/String;
    const-string v7, "\\|"

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 52
    .local v7, "opt":[Ljava/lang/String;
    aget-object v8, v7, v2

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 53
    .local v8, "category":I
    aget-object v9, v7, v3

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 55
    .local v9, "name":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 56
    :try_start_0
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 57
    .local v10, "valLong":J
    iget-object v12, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v12, v8, v9, v10, v11}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 60
    .end local v10    # "valLong":J
    goto :goto_2

    .line 58
    :catch_0
    move-exception v10

    goto :goto_1

    .line 55
    :cond_1
    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "codecTmp":Lcom/github/tvbox/osc/bean/IJKCode;
    .end local v1    # "options":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .end local v7    # "opt":[Ljava/lang/String;
    .end local v8    # "category":I
    .end local v9    # "name":Ljava/lang/String;
    throw v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .restart local v0    # "codecTmp":Lcom/github/tvbox/osc/bean/IJKCode;
    .restart local v1    # "options":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v6    # "value":Ljava/lang/String;
    .restart local v7    # "opt":[Ljava/lang/String;
    .restart local v8    # "category":I
    .restart local v9    # "name":Ljava/lang/String;
    .local v10, "e":Ljava/lang/Exception;
    :goto_1
    iget-object v11, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v11, v8, v9, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 61
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .end local v7    # "opt":[Ljava/lang/String;
    .end local v8    # "category":I
    .end local v9    # "name":Ljava/lang/String;
    .end local v10    # "e":Ljava/lang/Exception;
    :goto_2
    goto :goto_0

    .line 63
    :cond_2
    iget-object v4, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-wide/16 v5, 0x3c

    const/4 v7, 0x4

    const-string v8, "max-fps"

    invoke-virtual {v4, v7, v8, v5, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 69
    iget-object v4, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v5, "subtitle"

    const-wide/16 v8, 0x1

    invoke-virtual {v4, v7, v5, v8, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 70
    iget-object v4, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v5, "dns_cache_clear"

    invoke-virtual {v4, v3, v5, v8, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 71
    iget-object v4, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-wide/16 v5, -0x1

    const-string v10, "dns_cache_timeout"

    invoke-virtual {v4, v3, v10, v5, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 72
    iget-object v4, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v5, "safe"

    const-wide/16 v10, 0x0

    invoke-virtual {v4, v3, v5, v10, v11}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 74
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v4, "player_is_live"

    invoke-static {v4, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const-string v4, "threads"

    const/4 v5, 0x2

    const-string v6, "max_cached_duration"

    if-eqz v2, :cond_3

    .line 75
    const-string v2, "echo-type-\u76f4\u64ad"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 76
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-wide/16 v10, 0x12c

    invoke-virtual {v2, v7, v6, v10, v11}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 77
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v6, "flush_packets"

    invoke-virtual {v2, v3, v6, v8, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 78
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v3, "min-frames"

    invoke-virtual {v2, v7, v3, v8, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 79
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v3, "1"

    invoke-virtual {v2, v5, v4, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 81
    :cond_3
    const-string v2, "echo-type-\u70b9\u64ad"

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 83
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-wide/16 v8, 0xbb8

    invoke-virtual {v2, v7, v6, v8, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 84
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v6, "infbuf"

    invoke-virtual {v2, v3, v6, v10, v11}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 85
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const-string v3, "2"

    invoke-virtual {v2, v5, v4, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 88
    :goto_3
    return-void
.end method

.method public setTrack(I)V
    .locals 3
    .param p1, "trackIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "trackIndex"
        }
    .end annotation

    .line 300
    iget-object v0, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getSelectedTrack(I)I

    move-result v0

    .line 301
    .local v0, "audioSelected":I
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getSelectedTrack(I)I

    move-result v1

    .line 302
    .local v1, "subtitleSelected":I
    if-eq p1, v0, :cond_0

    if-eq p1, v1, :cond_0

    .line 303
    iget-object v2, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v2, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->selectTrack(I)V

    .line 305
    :cond_0
    return-void
.end method

.method public setTrack(ILjava/lang/String;)V
    .locals 2
    .param p1, "trackIndex"    # I
    .param p2, "playKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "trackIndex",
            "playKey"
        }
    .end annotation

    .line 307
    iget-object v0, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getSelectedTrack(I)I

    move-result v0

    .line 308
    .local v0, "audioSelected":I
    if-eq p1, v0, :cond_1

    .line 309
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 310
    sget-object v1, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;

    invoke-virtual {v1, p2, p1}, Lcom/github/tvbox/osc/util/AudioTrackMemory;->save(Ljava/lang/String;I)V

    .line 312
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/player/IjkMediaPlayer;->mMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->selectTrack(I)V

    .line 314
    :cond_1
    return-void
.end method
