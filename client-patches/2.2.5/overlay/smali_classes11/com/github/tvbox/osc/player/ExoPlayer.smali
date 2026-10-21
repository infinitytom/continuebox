.class public Lcom/github/tvbox/osc/player/ExoPlayer;
.super Lxyz/doikki/videoplayer/exo/ExoMediaPlayer;
.source "ExoPlayer.java"


# static fields
.field private static final LANG_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/github/tvbox/osc/player/ExoPlayer;->LANG_MAP:Ljava/util/Map;

    .line 190
    const-string v1, "zh"

    const-string v2, "\u56fd\u8bed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v1, "zh-cn"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v1, "cmn"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string v1, "chi"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v1, "zho"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    const-string v1, "chs"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v1, "yue"

    const-string v2, "\u7ca4\u8bed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    const-string v1, "zh-hk"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    const-string v1, "zh-yue"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    const-string v1, "en"

    const-string v2, "\u82f1\u8bed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    const-string v1, "en-us"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string v1, "eng"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    const-string v1, "ja"

    const-string v2, "\u65e5\u8bed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    const-string v1, "jpn"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v1, "ko"

    const-string v2, "\u97e9\u8bed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v1, "kor"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v1, "th"

    const-string v2, "\u6cf0\u8bed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v1, "tha"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1}, Lxyz/doikki/videoplayer/exo/ExoMediaPlayer;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance v0, Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;-><init>()V

    .line 31
    const v1, 0x3a98

    const/16 v2, 0x5dc

    const/16 v3, 0xbb8

    const v4, 0xafc8
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;->setBufferDurationsMs(IIII)Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;

    move-result-object v0

    .line 36
    const v1, 0x2000000
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;->setTargetBufferBytes(I)Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;->setPrioritizeTimeOverSizeThresholds(Z)Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/DefaultLoadControl$Builder;->build()Lcom/google/android/exoplayer2/DefaultLoadControl;

    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/player/ExoPlayer;->setLoadControl(Lcom/google/android/exoplayer2/LoadControl;)V

    .line 37
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/player/ExoPlayer;->buildRenderersFactory(Landroid/content/Context;)Lcom/google/android/exoplayer2/RenderersFactory;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/player/ExoPlayer;->setRenderersFactory(Lcom/google/android/exoplayer2/RenderersFactory;)V

    .line 38
    const-string v0, "echo-exo-low-memory-load-control"

    invoke-static {v0}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 39
    invoke-static {p1}, Lcom/github/tvbox/osc/util/AudioTrackMemory;->getInstance(Landroid/content/Context;)Lcom/github/tvbox/osc/util/AudioTrackMemory;

    move-result-object v0

    sput-object v0, Lcom/github/tvbox/osc/player/ExoPlayer;->memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;

    .line 40
    return-void
.end method

.method private appendPart(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 2
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "builder",
            "value"
        }
    .end annotation

    .line 289
    if-nez p2, :cond_0

    return-void

    .line 290
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "part":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "und"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "\u672a\u77e5"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 292
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 293
    const-string v1, " / "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    return-void

    .line 291
    :cond_3
    :goto_0
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

    .line 278
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 279
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 280
    const-string v2, " - "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 283
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private buildRenderersFactory(Landroid/content/Context;)Lcom/google/android/exoplayer2/RenderersFactory;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/google/android/exoplayer2/DefaultRenderersFactory;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/DefaultRenderersFactory;-><init>(Landroid/content/Context;)V

    .line 44
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/DefaultRenderersFactory;->setEnableDecoderFallback(Z)Lcom/google/android/exoplayer2/DefaultRenderersFactory;

    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/DefaultRenderersFactory;->setExtensionRendererMode(I)Lcom/google/android/exoplayer2/DefaultRenderersFactory;

    move-result-object v0

    .line 50
    .local v0, "factory":Lcom/google/android/exoplayer2/DefaultRenderersFactory;
    const-string v1, "echo-exo-hardware-first-default-async"

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 51
    return-object v0
.end method

.method private findAudioRendererIndex(Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;)I
    .locals 4
    .param p1, "mappedInfo"    # Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mappedInfo"
        }
    .end annotation

    .line 151
    const/4 v0, -0x1

    if-nez p1, :cond_0

    return v0

    .line 152
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 153
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 154
    return v1

    .line 152
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 157
    .end local v1    # "i":I
    :cond_2
    return v0
.end method

.method private getLanguage(Lcom/google/android/exoplayer2/Format;)Ljava/lang/String;
    .locals 5
    .param p1, "fmt"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fmt"
        }
    .end annotation

    .line 211
    iget-object v0, p1, Lcom/google/android/exoplayer2/Format;->language:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/player/ExoPlayer;->matchLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "language":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 213
    return-object v0

    .line 215
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/google/android/exoplayer2/Format;->label:Ljava/lang/String;

    const-string v3, ""

    if-nez v2, :cond_1

    move-object v2, v3

    goto :goto_0

    :cond_1
    iget-object v2, p1, Lcom/google/android/exoplayer2/Format;->label:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    iget-object v4, p1, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    if-nez v4, :cond_2

    move-object v4, v3

    goto :goto_1

    :cond_2
    iget-object v4, p1, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    iget-object v2, p1, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    :goto_2
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 215
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/player/ExoPlayer;->matchLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getName(Lcom/google/android/exoplayer2/Format;)Ljava/lang/String;
    .locals 6
    .param p1, "fmt"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fmt"
        }
    .end annotation

    .line 250
    iget v0, p1, Lcom/google/android/exoplayer2/Format;->channelCount:I

    const/4 v1, 0x1

    if-gtz v0, :cond_0

    .line 251
    const-string v0, ""

    .local v0, "channelLabel":Ljava/lang/String;
    goto :goto_0

    .line 252
    .end local v0    # "channelLabel":Ljava/lang/String;
    :cond_0
    iget v0, p1, Lcom/google/android/exoplayer2/Format;->channelCount:I

    if-ne v0, v1, :cond_1

    .line 253
    const-string v0, "\u5355\u58f0\u9053"

    .restart local v0    # "channelLabel":Ljava/lang/String;
    goto :goto_0

    .line 254
    .end local v0    # "channelLabel":Ljava/lang/String;
    :cond_1
    iget v0, p1, Lcom/google/android/exoplayer2/Format;->channelCount:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 255
    const-string v0, "\u7acb\u4f53\u58f0"

    .restart local v0    # "channelLabel":Ljava/lang/String;
    goto :goto_0

    .line 257
    .end local v0    # "channelLabel":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p1, Lcom/google/android/exoplayer2/Format;->channelCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " \u58f0\u9053"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 260
    .restart local v0    # "channelLabel":Ljava/lang/String;
    :goto_0
    const-string v2, ""

    .line 261
    .local v2, "codec":Ljava/lang/String;
    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 262
    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    .line 264
    :cond_3
    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    if-eqz v3, :cond_4

    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 265
    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    iget-object v4, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 266
    .local v1, "mime":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 267
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    .line 270
    .end local v1    # "mime":Ljava/lang/String;
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .local v1, "builder":Ljava/lang/StringBuilder;
    iget-object v3, p1, Lcom/google/android/exoplayer2/Format;->label:Ljava/lang/String;

    invoke-direct {p0, v1, v3}, Lcom/github/tvbox/osc/player/ExoPlayer;->appendPart(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 272
    invoke-direct {p0, v1, v2}, Lcom/github/tvbox/osc/player/ExoPlayer;->appendPart(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 273
    invoke-direct {p0, v1, v0}, Lcom/github/tvbox/osc/player/ExoPlayer;->appendPart(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 274
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private isCurrentTrackSelected(Lcom/google/android/exoplayer2/Format;I)Z
    .locals 6
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p2, "trackType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "format",
            "trackType"
        }
    .end annotation

    .line 167
    iget-object v0, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->mInternalPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->mInternalPlayer:Lcom/google/android/exoplayer2/SimpleExoPlayer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/SimpleExoPlayer;->getCurrentTracks()Lcom/google/android/exoplayer2/Tracks;

    move-result-object v0

    .line 169
    .local v0, "tracks":Lcom/google/android/exoplayer2/Tracks;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Tracks;->getGroups()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/Tracks$Group;

    .line 170
    .local v3, "group":Lcom/google/android/exoplayer2/Tracks$Group;
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/Tracks$Group;->getType()I

    move-result v4

    if-ne v4, p2, :cond_1

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/Tracks$Group;->isSelected()Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    .line 171
    :cond_2
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    iget v5, v3, Lcom/google/android/exoplayer2/Tracks$Group;->length:I

    if-ge v4, v5, :cond_4

    .line 172
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/Tracks$Group;->isTrackSelected(I)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/Tracks$Group;->getTrackFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v5

    invoke-direct {p0, p1, v5}, Lcom/github/tvbox/osc/player/ExoPlayer;->isSameFormat(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 173
    const/4 v1, 0x1

    return v1

    .line 171
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 176
    .end local v3    # "group":Lcom/google/android/exoplayer2/Tracks$Group;
    .end local v4    # "i":I
    :cond_4
    goto :goto_0

    .line 177
    :cond_5
    return v1
.end method

.method private isSameFormat(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;)Z
    .locals 3
    .param p1, "a"    # Lcom/google/android/exoplayer2/Format;
    .param p2, "b"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 181
    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    return v0

    .line 182
    :cond_0
    if-eqz p1, :cond_3

    if-nez p2, :cond_1

    goto :goto_0

    .line 183
    :cond_1
    iget-object v1, p1, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p2, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p1, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    iget-object v2, p2, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    .line 184
    :cond_2
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/Format;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 182
    :cond_3
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private isTrackIndexValid(Lcom/google/android/exoplayer2/source/TrackGroupArray;II)Z
    .locals 3
    .param p1, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "groupIndex"    # I
    .param p3, "trackIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "groups",
            "groupIndex",
            "trackIndex"
        }
    .end annotation

    .line 161
    const/4 v0, 0x0

    if-ltz p2, :cond_2

    iget v1, p1, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    if-lt p2, v1, :cond_0

    goto :goto_0

    .line 162
    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v1

    .line 163
    .local v1, "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    if-ltz p3, :cond_1

    iget v2, v1, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge p3, v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 161
    .end local v1    # "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    :cond_2
    :goto_0
    return v0
.end method

.method private matchLanguage(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 221
    const-string v0, ""

    if-nez p1, :cond_0

    return-object v0

    .line 222
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "value":Ljava/lang/String;
    sget-object v2, Lcom/github/tvbox/osc/player/ExoPlayer;->LANG_MAP:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 224
    .local v2, "mapped":Ljava/lang/String;
    if-eqz v2, :cond_1

    return-object v2

    .line 225
    :cond_1
    const-string v3, "yue"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_d

    const-string v3, "cantonese"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_d

    const-string v3, "\u7ca4"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_d

    const-string v3, "\u5e7f\u4e1c"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto/16 :goto_5

    .line 228
    :cond_2
    const-string v3, "zh"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    const-string v4, "\u56fd\u8bed"

    if-nez v3, :cond_c

    const-string v3, "chi"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    const-string v3, "zho"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    const-string v3, "chs"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 229
    const-string v3, "cht"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    const-string v3, "cmn"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    const-string v3, "\u4e2d"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 230
    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c

    const-string v3, "\u666e\u901a\u8bdd"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto/16 :goto_4

    .line 233
    :cond_3
    const-string v3, "en"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    const-string v3, "eng"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    const-string v3, "english"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    const-string v3, "\u82f1"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_3

    .line 236
    :cond_4
    const-string v3, "ja"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    const-string v3, "jpn"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    const-string v3, "japanese"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    const-string v3, "\u65e5"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_2

    .line 239
    :cond_5
    const-string v3, "ko"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, "kor"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, "korean"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, "\u97e9"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_1

    .line 242
    :cond_6
    const-string v3, "tha"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    const-string v3, "thai"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    const-string v3, "th"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_0

    .line 245
    :cond_7
    return-object v0

    .line 243
    :cond_8
    :goto_0
    const-string v0, "\u6cf0\u8bed"

    return-object v0

    .line 240
    :cond_9
    :goto_1
    const-string v0, "\u97e9\u8bed"

    return-object v0

    .line 237
    :cond_a
    :goto_2
    const-string v0, "\u65e5\u8bed"

    return-object v0

    .line 234
    :cond_b
    :goto_3
    const-string v0, "\u82f1\u8bed"

    return-object v0

    .line 231
    :cond_c
    :goto_4
    return-object v4

    .line 226
    :cond_d
    :goto_5
    const-string v0, "\u7ca4\u8bed"

    return-object v0
.end method

.method private setTrack(IIILjava/lang/String;)V
    .locals 6
    .param p1, "rendererIndex"    # I
    .param p2, "groupIndex"    # I
    .param p3, "trackIndex"    # I
    .param p4, "playKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rendererIndex",
            "groupIndex",
            "trackIndex",
            "playKey"
        }
    .end annotation

    .line 105
    :try_start_0
    iget-object v0, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->trackSelector:Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getCurrentMappedTrackInfo()Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;

    move-result-object v0

    .line 106
    .local v0, "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    if-nez v0, :cond_0

    .line 107
    const-string v1, "echo-setTrack: MappedTrackInfo is null"

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 108
    return-void

    .line 110
    :cond_0
    const/4 v1, -0x1

    if-eq p1, v1, :cond_4

    if-ltz p1, :cond_4

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v1

    if-lt p1, v1, :cond_1

    goto :goto_0

    .line 115
    :cond_1
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Lcom/google/android/exoplayer2/source/TrackGroupArray;

    move-result-object v1

    .line 116
    .local v1, "groups":Lcom/google/android/exoplayer2/source/TrackGroupArray;
    invoke-direct {p0, v1, p2, p3}, Lcom/github/tvbox/osc/player/ExoPlayer;->isTrackIndexValid(Lcom/google/android/exoplayer2/source/TrackGroupArray;II)Z

    move-result v2

    if-nez v2, :cond_2

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "echo-setTrack: Invalid track index - group:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", track:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 118
    return-void

    .line 121
    :cond_2
    new-instance v2, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$SelectionOverride;

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput p3, v3, v4

    invoke-direct {v2, p2, v3}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$SelectionOverride;-><init>(I[I)V

    .line 123
    .local v2, "override":Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$SelectionOverride;
    iget-object v3, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->trackSelector:Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->buildUponParameters()Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object v3

    .line 124
    .local v3, "builder":Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;
    invoke-virtual {v3, p1, v4}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;->setRendererDisabled(IZ)Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 125
    invoke-virtual {v3, p1}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;->clearSelectionOverrides(I)Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 126
    invoke-virtual {v3, p1, v1, v2}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;->setSelectionOverride(ILcom/google/android/exoplayer2/source/TrackGroupArray;Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$SelectionOverride;)Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 127
    iget-object v4, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->trackSelector:Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;->build()Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->setParameters(Lcom/google/android/exoplayer2/trackselection/TrackSelectionParameters;)V

    .line 129
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 130
    sget-object v4, Lcom/github/tvbox/osc/player/ExoPlayer;->memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;

    invoke-virtual {v4, p4, p2, p3}, Lcom/github/tvbox/osc/util/AudioTrackMemory;->save(Ljava/lang/String;II)V

    .line 134
    .end local v0    # "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    .end local v1    # "groups":Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .end local v2    # "override":Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$SelectionOverride;
    .end local v3    # "builder":Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters$Builder;
    :cond_3
    goto :goto_1

    .line 111
    .restart local v0    # "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    :cond_4
    :goto_0
    const-string v1, "echo-setTrack: No renderer found"

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    return-void

    .line 132
    .end local v0    # "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "echo-setTrack error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/tvbox/osc/util/LOG;->i(Ljava/lang/String;)V

    .line 135
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method


# virtual methods
.method public getTrackInfo()Lcom/github/tvbox/osc/player/TrackInfo;
    .locals 15

    .line 55
    new-instance v0, Lcom/github/tvbox/osc/player/TrackInfo;

    invoke-direct {v0}, Lcom/github/tvbox/osc/player/TrackInfo;-><init>()V

    .line 56
    .local v0, "data":Lcom/github/tvbox/osc/player/TrackInfo;
    iget-object v1, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->trackSelector:Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getCurrentMappedTrackInfo()Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;

    move-result-object v1

    .line 57
    .local v1, "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    if-nez v1, :cond_0

    return-object v0

    .line 59
    :cond_0
    const/4 v2, 0x0

    .local v2, "rendererIndex":I
    :goto_0
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v3

    if-ge v2, v3, :cond_7

    .line 60
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v3

    .line 61
    .local v3, "type":I
    const/4 v4, 0x1

    if-eq v3, v4, :cond_1

    const/4 v5, 0x3

    if-eq v3, v5, :cond_1

    goto :goto_6

    .line 63
    :cond_1
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Lcom/google/android/exoplayer2/source/TrackGroupArray;

    move-result-object v5

    .line 64
    .local v5, "groups":Lcom/google/android/exoplayer2/source/TrackGroupArray;
    const/4 v6, 0x0

    .local v6, "groupIndex":I
    :goto_1
    iget v7, v5, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    if-ge v6, v7, :cond_6

    .line 65
    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v7

    .line 66
    .local v7, "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    const/4 v8, 0x0

    .local v8, "trackIndex":I
    :goto_2
    iget v9, v7, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v8, v9, :cond_5

    .line 67
    invoke-virtual {v7, v8}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v9

    .line 68
    .local v9, "fmt":Lcom/google/android/exoplayer2/Format;
    invoke-direct {p0, v9}, Lcom/github/tvbox/osc/player/ExoPlayer;->getLanguage(Lcom/google/android/exoplayer2/Format;)Ljava/lang/String;

    move-result-object v10

    .line 69
    .local v10, "language":Ljava/lang/String;
    invoke-direct {p0, v9}, Lcom/github/tvbox/osc/player/ExoPlayer;->getName(Lcom/google/android/exoplayer2/Format;)Ljava/lang/String;

    move-result-object v11

    .line 70
    .local v11, "detail":Ljava/lang/String;
    new-instance v12, Lcom/github/tvbox/osc/player/TrackInfoBean;

    invoke-direct {v12}, Lcom/github/tvbox/osc/player/TrackInfoBean;-><init>()V

    .line 71
    .local v12, "bean":Lcom/github/tvbox/osc/player/TrackInfoBean;
    iput-object v10, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->language:Ljava/lang/String;

    .line 72
    if-ne v3, v4, :cond_2

    const-string v13, "\u97f3\u8f68"

    goto :goto_3

    :cond_2
    const-string v13, "\u5b57\u5e55"

    .line 73
    :goto_3
    if-ne v3, v4, :cond_3

    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/TrackInfo;->getAudio()Ljava/util/List;

    move-result-object v14

    goto :goto_4

    :cond_3
    invoke-virtual {v0}, Lcom/github/tvbox/osc/player/TrackInfo;->getSubtitle()Ljava/util/List;

    move-result-object v14

    :goto_4
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    add-int/2addr v14, v4

    .line 72
    invoke-direct {p0, v13, v14, v10, v11}, Lcom/github/tvbox/osc/player/ExoPlayer;->buildDisplayName(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->name:Ljava/lang/String;

    .line 75
    iput v2, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->renderId:I

    .line 76
    iput v6, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackGroupId:I

    .line 77
    iput v8, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    .line 78
    iput v6, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->groupIndex:I

    .line 79
    iput v8, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->index:I

    .line 80
    invoke-direct {p0, v9, v3}, Lcom/github/tvbox/osc/player/ExoPlayer;->isCurrentTrackSelected(Lcom/google/android/exoplayer2/Format;I)Z

    move-result v13

    iput-boolean v13, v12, Lcom/github/tvbox/osc/player/TrackInfoBean;->selected:Z

    .line 82
    if-ne v3, v4, :cond_4

    .line 83
    invoke-virtual {v0, v12}, Lcom/github/tvbox/osc/player/TrackInfo;->addAudio(Lcom/github/tvbox/osc/player/TrackInfoBean;)V

    goto :goto_5

    .line 85
    :cond_4
    invoke-virtual {v0, v12}, Lcom/github/tvbox/osc/player/TrackInfo;->addSubtitle(Lcom/github/tvbox/osc/player/TrackInfoBean;)V

    .line 66
    .end local v9    # "fmt":Lcom/google/android/exoplayer2/Format;
    .end local v10    # "language":Ljava/lang/String;
    .end local v11    # "detail":Ljava/lang/String;
    .end local v12    # "bean":Lcom/github/tvbox/osc/player/TrackInfoBean;
    :goto_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 64
    .end local v7    # "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v8    # "trackIndex":I
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 59
    .end local v3    # "type":I
    .end local v5    # "groups":Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .end local v6    # "groupIndex":I
    :cond_6
    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 90
    .end local v2    # "rendererIndex":I
    :cond_7
    return-object v0
.end method

.method public loadDefaultTrack(Ljava/lang/String;)V
    .locals 6
    .param p1, "playKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "playKey"
        }
    .end annotation

    .line 138
    sget-object v0, Lcom/github/tvbox/osc/player/ExoPlayer;->memory:Lcom/github/tvbox/osc/util/AudioTrackMemory;

    invoke-virtual {v0, p1}, Lcom/github/tvbox/osc/util/AudioTrackMemory;->exoLoad(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v0

    .line 139
    .local v0, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    if-nez v0, :cond_0

    return-void

    .line 141
    :cond_0
    iget-object v1, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->trackSelector:Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getCurrentMappedTrackInfo()Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;

    move-result-object v1

    .line 142
    .local v1, "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    if-nez v1, :cond_1

    return-void

    .line 144
    :cond_1
    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/player/ExoPlayer;->findAudioRendererIndex(Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;)I

    move-result v2

    .line 145
    .local v2, "audioRendererIndex":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    return-void

    .line 147
    :cond_2
    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, ""

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/github/tvbox/osc/player/ExoPlayer;->setTrack(IIILjava/lang/String;)V

    .line 148
    return-void
.end method

.method public setTrack(IILjava/lang/String;)V
    .locals 2
    .param p1, "groupIndex"    # I
    .param p2, "trackIndex"    # I
    .param p3, "playKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "groupIndex",
            "trackIndex",
            "playKey"
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/github/tvbox/osc/player/ExoPlayer;->trackSelector:Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getCurrentMappedTrackInfo()Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;

    move-result-object v0

    .line 95
    .local v0, "mappedInfo":Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/player/ExoPlayer;->findAudioRendererIndex(Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector$MappedTrackInfo;)I

    move-result v1

    invoke-direct {p0, v1, p1, p2, p3}, Lcom/github/tvbox/osc/player/ExoPlayer;->setTrack(IIILjava/lang/String;)V

    .line 96
    return-void
.end method

.method public setTrack(Lcom/github/tvbox/osc/player/TrackInfoBean;Ljava/lang/String;)V
    .locals 3
    .param p1, "track"    # Lcom/github/tvbox/osc/player/TrackInfoBean;
    .param p2, "playKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "track",
            "playKey"
        }
    .end annotation

    .line 99
    if-nez p1, :cond_0

    return-void

    .line 100
    :cond_0
    iget v0, p1, Lcom/github/tvbox/osc/player/TrackInfoBean;->renderId:I

    iget v1, p1, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackGroupId:I

    iget v2, p1, Lcom/github/tvbox/osc/player/TrackInfoBean;->trackId:I

    invoke-direct {p0, v0, v1, v2, p2}, Lcom/github/tvbox/osc/player/ExoPlayer;->setTrack(IIILjava/lang/String;)V

    .line 101
    return-void
.end method
