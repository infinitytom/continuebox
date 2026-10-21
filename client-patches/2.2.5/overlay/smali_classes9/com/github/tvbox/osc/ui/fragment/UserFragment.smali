.class public Lcom/github/tvbox/osc/ui/fragment/UserFragment;
.super Lcom/github/tvbox/osc/base/BaseLazyFragment;
.source "UserFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

.field public static tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;


# instance fields
.field private focusChangeListener:Landroid/view/View$OnFocusChangeListener;

.field private homeSourceRec:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/Movie$Video;",
            ">;"
        }
    .end annotation
.end field

.field private sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

.field private final statusHandler:Landroid/os/Handler;

.field private final statusUpdater:Ljava/lang/Runnable;

.field private style:Lcom/github/tvbox/osc/util/ImgUtil$Style;

.field private tvCloudStatus:Landroid/widget/TextView;

.field private tvCollect:Landroid/widget/LinearLayout;

.field private tvEmby:Landroid/widget/LinearLayout;

.field private tvEmbyStatus:Landroid/widget/TextView;

.field private tvHistory:Landroid/widget/LinearLayout;

.field private tvLive:Landroid/widget/LinearLayout;

.field private tvNeoDBStatus:Landroid/widget/TextView;

.field private tvPush:Landroid/widget/LinearLayout;

.field private tvSearch:Landroid/widget/LinearLayout;

.field private tvSetting:Landroid/widget/LinearLayout;

.field private tvSyncLogin:Landroid/view/View;

.field private tvSyncStatus:Landroid/widget/TextView;

.field private tvSyncSwitch:Landroid/view/View;

.field private tvTraktStatus:Landroid/widget/TextView;


# direct methods
.method public static synthetic $r8$lambda$EM1Qx90jYGt8wkbyhXkDT5e5dIQ(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateEmbyStatus()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 80
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;-><init>()V

    .line 95
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusHandler:Landroid/os/Handler;

    .line 96
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment$1;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$1;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusUpdater:Ljava/lang/Runnable;

    .line 598
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment$8;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$8;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateSyncStatus()V

    return-void
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeSourceRec:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/ui/fragment/UserFragment;Lcom/github/tvbox/osc/bean/Movie$Video;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;
    .param p1, "x1"    # Lcom/github/tvbox/osc/bean/Movie$Video;

    .line 80
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpSearch(Lcom/github/tvbox/osc/bean/Movie$Video;)V

    return-void
.end method

.method static synthetic access$500(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Lcom/github/tvbox/osc/viewmodel/SourceViewModel;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    return-object v0
.end method

.method static synthetic access$600(Lcom/github/tvbox/osc/ui/fragment/UserFragment;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 80
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->loadHots(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$800(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateCloudStatus()V

    return-void
.end method

.method static synthetic access$900(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    .line 80
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private initHomeHotVod(Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;)V
    .locals 4
    .param p1, "adapter"    # Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "adapter"
        }
    .end annotation

    .line 517
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "home_rec"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v0, :cond_0

    .line 518
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeSourceRec:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 519
    invoke-virtual {p1, v0}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setNewData(Ljava/util/List;)V

    .line 520
    return-void

    .line 522
    :cond_0
    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 523
    return-void

    .line 525
    :cond_1
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->setDouBanData(Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;)V

    .line 526
    return-void
.end method

.method private jumpSearch(Lcom/github/tvbox/osc/bean/Movie$Video;)V
    .locals 3
    .param p1, "vod"    # Lcom/github/tvbox/osc/bean/Movie$Video;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "vod"
        }
    .end annotation

    .line 183
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "fast_search_mode"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    const-class v2, Lcom/github/tvbox/osc/ui/activity/FastSearchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .local v0, "newIntent":Landroid/content/Intent;
    goto :goto_0

    .line 186
    .end local v0    # "newIntent":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    const-class v2, Lcom/github/tvbox/osc/ui/activity/SearchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 188
    .restart local v0    # "newIntent":Landroid/content/Intent;
    :goto_0
    iget-object v1, p1, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 189
    const/high16 v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 190
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 191
    return-void
.end method

.method static synthetic lambda$onFragmentResume$0()V
    .locals 0

    .line 129
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull()V

    return-void
.end method

.method private loadHots(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "json"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/github/tvbox/osc/bean/Movie$Video;",
            ">;"
        }
    .end annotation

    .line 574
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 576
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    :try_start_0
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    const-class v2, Lcom/google/gson/JsonObject;

    invoke-virtual {v1, p1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/JsonObject;

    .line 577
    .local v1, "infoJson":Lcom/google/gson/JsonObject;
    const-string v2, "data"

    invoke-virtual {v1, v2}, Lcom/google/gson/JsonObject;->getAsJsonArray(Ljava/lang/String;)Lcom/google/gson/JsonArray;

    move-result-object v2

    .line 578
    .local v2, "array":Lcom/google/gson/JsonArray;
    invoke-virtual {v2}, Lcom/google/gson/JsonArray;->size()I

    move-result v3

    const/16 v4, 0x19

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 579
    .local v3, "limit":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 580
    invoke-virtual {v2, v4}, Lcom/google/gson/JsonArray;->get(I)Lcom/google/gson/JsonElement;

    move-result-object v5

    .line 581
    .local v5, "ele":Lcom/google/gson/JsonElement;
    invoke-virtual {v5}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object v6

    .line 582
    .local v6, "obj":Lcom/google/gson/JsonObject;
    new-instance v7, Lcom/github/tvbox/osc/bean/Movie$Video;

    invoke-direct {v7}, Lcom/github/tvbox/osc/bean/Movie$Video;-><init>()V

    .line 583
    .local v7, "vod":Lcom/github/tvbox/osc/bean/Movie$Video;
    const-string v8, "title"

    invoke-virtual {v6, v8}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    .line 584
    const-string v8, "rate"

    invoke-virtual {v6, v8}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/github/tvbox/osc/bean/Movie$Video;->note:Ljava/lang/String;

    .line 585
    iget-object v8, v7, Lcom/github/tvbox/osc/bean/Movie$Video;->note:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v7, Lcom/github/tvbox/osc/bean/Movie$Video;->note:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " \u5206"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/github/tvbox/osc/bean/Movie$Video;->note:Ljava/lang/String;

    .line 586
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cover"

    invoke-virtual {v6, v9}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "@User-Agent="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    invoke-static {}, Lcom/github/tvbox/osc/util/UA;->randomOne()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "@Referer=https://www.douban.com/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/github/tvbox/osc/bean/Movie$Video;->pic:Ljava/lang/String;

    .line 590
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 579
    nop

    .end local v5    # "ele":Lcom/google/gson/JsonElement;
    .end local v6    # "obj":Lcom/google/gson/JsonObject;
    .end local v7    # "vod":Lcom/github/tvbox/osc/bean/Movie$Video;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 594
    .end local v1    # "infoJson":Lcom/google/gson/JsonObject;
    .end local v2    # "array":Lcom/google/gson/JsonArray;
    .end local v3    # "limit":I
    .end local v4    # "i":I
    :cond_1
    goto :goto_1

    .line 592
    :catchall_0
    move-exception v1

    .line 595
    :goto_1
    return-object v0
.end method

.method public static newInstance()Lcom/github/tvbox/osc/ui/fragment/UserFragment;
    .locals 1

    .line 108
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    invoke-direct {v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;-><init>()V

    return-object v0
.end method

.method public static newInstance(Ljava/util/List;)Lcom/github/tvbox/osc/ui/fragment/UserFragment;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "recVod"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/Movie$Video;",
            ">;)",
            "Lcom/github/tvbox/osc/ui/fragment/UserFragment;"
        }
    .end annotation

    .line 112
    .local p0, "recVod":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    invoke-direct {v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;-><init>()V

    invoke-virtual {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->setArguments(Ljava/util/List;)Lcom/github/tvbox/osc/ui/fragment/UserFragment;

    move-result-object v0

    return-object v0
.end method

.method private varargs normalizeStatusIcons([Landroid/widget/TextView;)V
    .locals 10
    .param p1, "views"    # [Landroid/widget/TextView;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "views"
        }
    .end annotation

    .line 340
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700f6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 341
    .local v0, "size":I
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p1, v3

    .line 342
    .local v4, "view":Landroid/widget/TextView;
    if-nez v4, :cond_0

    goto :goto_1

    .line 343
    :cond_0
    invoke-virtual {v4}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 344
    .local v5, "icons":[Landroid/graphics/drawable/Drawable;
    aget-object v6, v5, v2

    .line 345
    .local v6, "left":Landroid/graphics/drawable/Drawable;
    if-eqz v6, :cond_1

    .line 346
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 347
    invoke-virtual {v6, v2, v2, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 348
    const/4 v7, 0x1

    aget-object v7, v5, v7

    const/4 v8, 0x2

    aget-object v8, v5, v8

    const/4 v9, 0x3

    aget-object v9, v5, v9

    invoke-virtual {v4, v6, v7, v8, v9}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 341
    .end local v4    # "view":Landroid/widget/TextView;
    .end local v5    # "icons":[Landroid/graphics/drawable/Drawable;
    .end local v6    # "left":Landroid/graphics/drawable/Drawable;
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 351
    :cond_2
    return-void
.end method

.method private setDouBanData(Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;)V
    .locals 11
    .param p1, "adapter"    # Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "adapter"
        }
    .end annotation

    .line 530
    const-string v0, ""

    :try_start_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 531
    .local v1, "cal":Ljava/util/Calendar;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 532
    .local v3, "year":I
    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v5

    add-int/2addr v5, v2

    .line 533
    .local v5, "month":I
    const/4 v6, 0x5

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 534
    .local v6, "day":I
    const-string v7, "%d%d%d"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v4

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 535
    .local v2, "today":Ljava/lang/String;
    const-string v4, "home_hot_day"

    invoke-static {v4, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 536
    .local v4, "requestDay":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 537
    const-string v7, "home_hot"

    invoke-static {v7, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 538
    .local v0, "json":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 539
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->loadHots(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 540
    .local v7, "hotMovies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 541
    invoke-virtual {p1, v7}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setNewData(Ljava/util/List;)V

    .line 542
    return-void

    .line 546
    .end local v0    # "json":Ljava/lang/String;
    .end local v7    # "hotMovies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "https://movie.douban.com/j/new_search_subjects?sort=U&range=0,10&tags=&playable=1&start=0&year_range="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ","

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 547
    .local v0, "doubanUrl":Ljava/lang/String;
    invoke-static {v0}, Lcom/lzy/okgo/OkGo;->get(Ljava/lang/String;)Lcom/lzy/okgo/request/GetRequest;

    move-result-object v7

    const-string v8, "User-Agent"

    .line 548
    invoke-static {}, Lcom/github/tvbox/osc/util/UA;->randomOne()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/lzy/okgo/request/GetRequest;->headers(Ljava/lang/String;Ljava/lang/String;)Lcom/lzy/okgo/request/base/Request;

    move-result-object v7

    check-cast v7, Lcom/lzy/okgo/request/GetRequest;

    new-instance v8, Lcom/github/tvbox/osc/ui/fragment/UserFragment$7;

    invoke-direct {v8, p0, v2, p1}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$7;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;Ljava/lang/String;Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;)V

    .line 549
    invoke-virtual {v7, v8}, Lcom/lzy/okgo/request/GetRequest;->execute(Lcom/lzy/okgo/callback/Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 570
    .end local v0    # "doubanUrl":Ljava/lang/String;
    .end local v1    # "cal":Ljava/util/Calendar;
    .end local v2    # "today":Ljava/lang/String;
    .end local v3    # "year":I
    .end local v4    # "requestDay":Ljava/lang/String;
    .end local v5    # "month":I
    .end local v6    # "day":I
    goto :goto_0

    .line 568
    :catchall_0
    move-exception v0

    .line 569
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 571
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    return-void
.end method

.method private showCloudDiagnostics()V
    .locals 1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;
    invoke-static {v0, p0}, Lcom/github/tvbox/osc/util/CloudPortal;->show(Landroid/content/Context;Ljava/lang/Object;)V
    return-void
.end method

.method private showSyncDiagnostics()V
    .locals 3

    .line 498
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 499
    const-string v1, "\u64ad\u653e\u8fdb\u5ea6\u540c\u6b65"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 500
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->getSyncStatusDetails()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 501
    const-string v1, "\u5173\u95ed"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda8;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    .line 502
    const-string v2, "\u7acb\u5373\u540c\u6b65"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 513
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 514
    return-void
.end method

.method private showSyncProfiles()V
    .locals 1
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/github/tvbox/osc/util/AccountPortal;->showAccounts(Landroid/content/Context;)V
    return-void
.end method

.method private updateCloudStatus()V
    .locals 3

    .line 373
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 374
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/tvbox/osc/api/ApiConfig;->getJarRuntimeShortText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 375
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->getJarRuntimeState()Ljava/lang/String;

    move-result-object v0

    .line 376
    .local v0, "state":Ljava/lang/String;
    const-string v1, "\u6b63\u5e38"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 377
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    const v2, -0x42071f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 378
    :cond_1
    const-string v1, "\u5f02\u5e38"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 379
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    const/16 v2, -0x2d66

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 381
    :cond_2
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    const v2, -0x383126

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 383
    :goto_0
    return-void
.end method

.method private updateEmbyStatus()V
    .locals 3

    .line 436
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 437
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 438
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5c0f\u96c5 Emby  \u00b7  \u5df2\u76f4\u8fde "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->accountName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "  \u00b7  \u70b9\u51fb\u7ba1\u7406"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 439
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const v1, -0x42071f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 440
    return-void

    .line 442
    :cond_1
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_2

    .line 443
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const-string v1, "\u5c0f\u96c5 Emby  \u00b7  \u70b9\u51fb\u76f4\u8fde"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 444
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const v1, -0x383126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 445
    return-void

    .line 447
    :cond_2
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda2;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    const-string v1, "/api/v1/emby/status"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 460
    return-void
.end method

.method private updateNeoDBStatus()V
    .locals 2

    .line 411
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 412
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 413
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const-string v1, "NeoDB  \u00b7  \u8bf7\u5148\u767b\u5f55\u64ad\u653e\u540c\u6b65"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 414
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const v1, -0x383126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 415
    return-void

    .line 417
    :cond_1
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda3;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    const-string v1, "/api/v1/neodb/status"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 433
    return-void
.end method

.method private updateSyncStatus()V
    .locals 2

    .line 492
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 493
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->getSyncStatusShortText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 494
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->enabled()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, -0x42071f

    goto :goto_0

    :cond_1
    const v1, -0x383126

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 495
    return-void
.end method

.method private updateTraktStatus()V
    .locals 2

    .line 386
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 387
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/IntegrationClient;->enabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 388
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const-string v1, "Trakt  \u00b7  \u8bf7\u5148\u767b\u5f55\u64ad\u653e\u540c\u6b65"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const v1, -0x383126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 390
    return-void

    .line 392
    :cond_1
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda4;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    const-string v1, "/api/v1/trakt/status"

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/sync/IntegrationClient;->get(Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 408
    return-void
.end method


# virtual methods
.method protected getLayoutResID()I
    .locals 1

    .line 169
    const v0, 0x7f0d005d

    return v0
.end method

.method protected init()V
    .locals 6

    .line 195
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

    .line 196
    new-instance v0, Landroidx/lifecycle/ViewModelProvider;

    invoke-direct {v0, p0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v1, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    .line 197
    const v0, 0x7f0a02a3

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvLive:Landroid/widget/LinearLayout;

    .line 198
    const v0, 0x7f0a02c0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSearch:Landroid/widget/LinearLayout;

    .line 199
    const v0, 0x7f0a02c9

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSetting:Landroid/widget/LinearLayout;

    .line 200
    const v0, 0x7f0a0293

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCollect:Landroid/widget/LinearLayout;

    .line 201
    const v0, 0x7f0a0296

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHistory:Landroid/widget/LinearLayout;

    .line 202
    const v0, 0x7f0a02b6

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvPush:Landroid/widget/LinearLayout;

    .line 203
    const v0, 0x7f0a0283

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmby:Landroid/widget/LinearLayout;

    .line 204
    const v0, 0x7f0a02cd

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncLogin:Landroid/view/View;

    .line 205
    const v0, 0x7f0a02cf

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncSwitch:Landroid/view/View;

    .line 206
    const v0, 0x7f0a0278

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    .line 207
    const v0, 0x7f0a02ce

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    .line 208
    const v0, 0x7f0a02d2

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    .line 209
    const v0, 0x7f0a02a8

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    .line 210
    const v0, 0x7f0a028c

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    .line 211
    const/4 v1, 0x5

    new-array v1, v1, [Landroid/widget/TextView;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    const/4 v3, 0x1

    .line 244
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 211
    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const/4 v5, 0x2

    aput-object v2, v1, v5

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const/4 v5, 0x3

    aput-object v2, v1, v5

    const/4 v2, 0x4

    aput-object v0, v1, v2

    invoke-direct {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->normalizeStatusIcons([Landroid/widget/TextView;)V

    .line 212
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvLive:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSearch:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSetting:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHistory:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvPush:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmby:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCollect:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncLogin:Landroid/view/View;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda11;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncSwitch:Landroid/view/View;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda12;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 221
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda13;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda14;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda15;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda16;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvLive:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 227
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSearch:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 228
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSetting:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 229
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHistory:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 230
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvPush:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 231
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmby:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 232
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCollect:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 233
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 234
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 235
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 236
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 237
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 238
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateCloudStatus()V

    .line 239
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateSyncStatus()V

    .line 240
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateTraktStatus()V

    .line 241
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateNeoDBStatus()V

    .line 242
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateEmbyStatus()V

    .line 243
    const v0, 0x7f0a029e

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    sput-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 244
    const-string v0, "home_rec"

    invoke-static {v0, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v3, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeSourceRec:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 245
    invoke-static {}, Lcom/github/tvbox/osc/util/ImgUtil;->initStyle()Lcom/github/tvbox/osc/util/ImgUtil$Style;

    move-result-object v1

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->style:Lcom/github/tvbox/osc/util/ImgUtil$Style;

    .line 247
    :cond_0
    const-string v1, ""

    .line 248
    .local v1, "tvRate":Ljava/lang/String;
    invoke-static {v0, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_1

    .line 249
    const-string v1, "\u8c46\u74e3\u70ed\u64ad"

    goto :goto_1

    .line 250
    :cond_1
    invoke-static {v0, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v3, :cond_3

    .line 251
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeSourceRec:Ljava/util/List;

    if-eqz v0, :cond_2

    const-string v0, "\u7ad9\u70b9\u63a8\u8350"

    goto :goto_0

    :cond_2
    const-string v0, "\u8c46\u74e3\u70ed\u64ad"

    :goto_0
    move-object v1, v0

    .line 253
    :cond_3
    :goto_1
    new-instance v0, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->style:Lcom/github/tvbox/osc/util/ImgUtil$Style;

    invoke-direct {v0, v2, v1}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;-><init>(Lcom/github/tvbox/osc/util/ImgUtil$Style;Ljava/lang/String;)V

    sput-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    .line 254
    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment$2;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$2;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setOnItemClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemClickListener;)V

    .line 290
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment$3;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$3;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v2}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setOnItemLongClickListener(Lcom/chad/library/adapter/base/BaseQuickAdapter$OnItemLongClickListener;)V

    .line 310
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment$4;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$4;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setOnItemListener(Lcom/owen/tvrecyclerview/widget/TvRecyclerView$OnItemListener;)V

    .line 326
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    sget-object v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    invoke-virtual {v0, v2}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 328
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->initHomeHotVod(Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;)V

    .line 329
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->sourceViewModel:Lcom/github/tvbox/osc/viewmodel/SourceViewModel;

    iget-object v0, v0, Lcom/github/tvbox/osc/viewmodel/SourceViewModel;->actionResult:Landroidx/lifecycle/MutableLiveData;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment$5;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$5;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, p0, v2}, Landroidx/lifecycle/MutableLiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 337
    return-void
.end method

.method public integrationStatus(Lcom/github/tvbox/osc/event/IntegrationStatusEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/github/tvbox/osc/event/IntegrationStatusEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 637
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateSyncStatus()V

    .line 638
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateTraktStatus()V

    .line 639
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateNeoDBStatus()V

    .line 640
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateEmbyStatus()V

    .line 641
    return-void
.end method

.method synthetic lambda$init$1$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 219
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->show(Landroid/content/Context;)V

    return-void
.end method

.method synthetic lambda$init$2$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 220
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->showSyncProfiles()V

    return-void
.end method

.method synthetic lambda$init$3$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 221
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->showCloudDiagnostics()V

    return-void
.end method

.method synthetic lambda$init$4$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 222
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->showSyncDiagnostics()V

    return-void
.end method

.method synthetic lambda$init$5$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 223
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/TraktDialog;->show(Landroid/content/Context;)V

    return-void
.end method

.method synthetic lambda$init$6$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 224
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/NeoDBDialog;->show(Landroid/content/Context;)V

    return-void
.end method

.method synthetic lambda$init$7$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 225
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda6;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-static {v0, v1}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog;->show(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$showCloudDiagnostics$13$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 468
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvCloudStatus:Landroid/widget/TextView;

    const-string v1, "\u7f51\u76d8\u7ba1\u7406  \u00b7  \u6b63\u5728\u91cd\u65b0\u52a0\u8f7d\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 469
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$6;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$6;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/api/ApiConfig;->reloadMainJar(Lcom/github/tvbox/osc/api/ApiConfig$LoadConfigCallback;)V

    .line 487
    return-void
.end method

.method synthetic lambda$showSyncDiagnostics$14$com-github-tvbox-osc-ui-fragment-UserFragment()V
    .locals 3

    .line 509
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateSyncStatus()V

    .line 510
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    const-string v1, "\u540c\u6b65\u8bf7\u6c42\u5df2\u53d1\u51fa\uff0c\u8bf7\u67e5\u770b\u72b6\u6001"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 511
    return-void
.end method

.method synthetic lambda$showSyncDiagnostics$15$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 503
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->retryNow()V

    .line 504
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/FavoritesSync;->sync(Lcom/github/tvbox/osc/sync/FavoritesSync$Callback;)V

    .line 505
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->sync(Lcom/github/tvbox/osc/sync/SearchHistorySync$Callback;)V

    .line 506
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->syncNow(Z)V

    .line 507
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvSyncStatus:Landroid/widget/TextView;

    const-string v1, "\u64ad\u653e\u540c\u6b65  \u00b7  \u6b63\u5728\u540c\u6b65\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 508
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda5;-><init>(Lcom/github/tvbox/osc/ui/fragment/UserFragment;)V

    const-wide/16 v2, 0x708

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 512
    return-void
.end method

.method synthetic lambda$showSyncProfiles$8$com-github-tvbox-osc-ui-fragment-UserFragment(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "profiles"    # Ljava/util/List;
    .param p2, "d"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 359
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncServerProfile;->activate(Lcom/github/tvbox/osc/sync/SyncServerProfile;)V

    .line 360
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5df2\u5207\u6362\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/tvbox/osc/sync/SyncServerProfile;

    iget-object v2, v2, Lcom/github/tvbox/osc/sync/SyncServerProfile;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 361
    invoke-static {}, Lcom/github/tvbox/osc/sync/TvboxSyncClient;->pull()V

    .line 362
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/FavoritesSync;->sync(Lcom/github/tvbox/osc/sync/FavoritesSync$Callback;)V

    .line 363
    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SearchHistorySync;->sync(Lcom/github/tvbox/osc/sync/SearchHistorySync$Callback;)V

    .line 364
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateSyncStatus()V

    .line 365
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateTraktStatus()V

    .line 366
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateNeoDBStatus()V

    .line 367
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateEmbyStatus()V

    .line 368
    invoke-static {}, Lcom/github/tvbox/osc/sync/AccountSettingsSync;->afterLogin()V

    .line 369
    return-void
.end method

.method synthetic lambda$showSyncProfiles$9$com-github-tvbox-osc-ui-fragment-UserFragment(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "w"    # I

    .line 369
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/github/tvbox/osc/sync/SyncLoginDialog;->show(Landroid/content/Context;)V

    return-void
.end method

.method synthetic lambda$updateEmbyStatus$12$com-github-tvbox-osc-ui-fragment-UserFragment(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # Lorg/json/JSONObject;
    .param p2, "error"    # Ljava/lang/String;

    .line 448
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 449
    :cond_0
    if-eqz p2, :cond_1

    .line 450
    const-string v1, "\u5c0f\u96c5 Emby  \u00b7  \u72b6\u6001\u6682\u4e0d\u53ef\u7528"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 451
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const/16 v1, -0x2d66

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 452
    :cond_1
    const/4 v0, 0x0

    const-string v1, "connected"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 453
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const-string v1, "\u5c0f\u96c5 Emby  \u00b7  \u5df2\u8fde\u63a5  \u00b7  \u53cc\u5411\u8fdb\u5ea6\u5df2\u542f\u7528"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 454
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const v1, -0x42071f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 456
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const-string v1, "\u5c0f\u96c5 Emby  \u00b7  \u8bf7\u5728\u98de\u725b\u672c\u5730\u914d\u7f6e"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvEmbyStatus:Landroid/widget/TextView;

    const v1, -0x383126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 459
    :goto_0
    return-void
.end method

.method synthetic lambda$updateNeoDBStatus$11$com-github-tvbox-osc-ui-fragment-UserFragment(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Lorg/json/JSONObject;
    .param p2, "error"    # Ljava/lang/String;

    .line 418
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 419
    :cond_0
    const/16 v1, -0x2d66

    if-eqz p2, :cond_1

    .line 420
    const-string v2, "NeoDB  \u00b7  \u72b6\u6001\u6682\u4e0d\u53ef\u7528"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 422
    :cond_1
    const-string v0, "configured"

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    .line 423
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const-string v2, "NeoDB  \u00b7  \u98de\u725b\u5c1a\u672a\u914d\u7f6e"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 424
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 425
    :cond_2
    const-string v0, "connected"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 426
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const-string v1, "NeoDB  \u00b7  \u5df2\u8fde\u63a5  \u00b7  \u70b9\u51fb\u7ba1\u7406"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 427
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const v1, -0x42071f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 429
    :cond_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const-string v1, "NeoDB  \u00b7  \u70b9\u51fb\u7ed1\u5b9a"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 430
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvNeoDBStatus:Landroid/widget/TextView;

    const v1, -0x383126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 432
    :goto_0
    return-void
.end method

.method synthetic lambda$updateTraktStatus$10$com-github-tvbox-osc-ui-fragment-UserFragment(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Lorg/json/JSONObject;
    .param p2, "error"    # Ljava/lang/String;

    .line 393
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 394
    :cond_0
    const/16 v1, -0x2d66

    if-eqz p2, :cond_1

    .line 395
    const-string v2, "Trakt  \u00b7  \u72b6\u6001\u6682\u4e0d\u53ef\u7528"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 397
    :cond_1
    const-string v0, "configured"

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    .line 398
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const-string v2, "Trakt  \u00b7  \u98de\u725b\u5c1a\u672a\u914d\u7f6e"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 399
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 400
    :cond_2
    const-string v0, "connected"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 401
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const-string v1, "Trakt  \u00b7  \u5df2\u8fde\u63a5  \u00b7  \u70b9\u51fb\u7ba1\u7406"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 402
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const v1, -0x42071f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 404
    :cond_3
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const-string v1, "Trakt  \u00b7  \u70b9\u51fb\u7ed1\u5b9a"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 405
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvTraktStatus:Landroid/widget/TextView;

    const v1, -0x383126

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 407
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 609
    const/4 v0, 0x0

    sput-boolean v0, Lcom/github/tvbox/osc/util/HawkConfig;->hotVodDelete:Z

    .line 611
    invoke-static {p1}, Lcom/github/tvbox/osc/util/FastClickCheckUtil;->check(Landroid/view/View;)V

    .line 612
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a02a3

    if-ne v0, v1, :cond_0

    .line 613
    const-class v0, Lcom/github/tvbox/osc/ui/activity/LivePlayActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 614
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a02c0

    if-ne v0, v1, :cond_1

    .line 615
    const-class v0, Lcom/github/tvbox/osc/ui/activity/SearchActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 616
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a02c9

    if-ne v0, v1, :cond_2

    .line 617
    const-class v0, Lcom/github/tvbox/osc/ui/activity/SettingActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 618
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0296

    if-ne v0, v1, :cond_3

    .line 619
    const-class v0, Lcom/github/tvbox/osc/ui/activity/HistoryActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 620
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a02b6

    if-ne v0, v1, :cond_4

    .line 621
    const-class v0, Lcom/github/tvbox/osc/ui/activity/PushActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 622
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0293

    if-ne v0, v1, :cond_5

    .line 623
    const-class v0, Lcom/github/tvbox/osc/ui/activity/CollectActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    goto :goto_0

    .line 624
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0283

    if-ne v0, v1, :cond_6

    .line 625
    const-class v0, Lcom/github/tvbox/osc/ui/activity/EmbyActivity;

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->jumpActivity(Ljava/lang/Class;)V

    .line 627
    :cond_6
    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 645
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 646
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onDestroy()V

    .line 647
    invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->unregister(Ljava/lang/Object;)V

    .line 648
    return-void
.end method

.method protected onFragmentResume()V
    .locals 8

    .line 122
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onFragmentResume()V

    .line 123
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateCloudStatus()V

    .line 124
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateTraktStatus()V

    .line 125
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateNeoDBStatus()V

    .line 126
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->updateEmbyStatus()V

    .line 127
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 128
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->statusUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 129
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sget-object v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda7;->INSTANCE:Lcom/github/tvbox/osc/ui/fragment/UserFragment$$ExternalSyntheticLambda7;

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 130
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "home_rec_style"

    invoke-static {v2, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v2, "home_rec"

    const/4 v3, 0x1

    .line 150
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 130
    const v5, 0x7f0700e7

    const v6, 0x7f0700d1

    if-eqz v1, :cond_1

    .line 131
    sget-object v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v1, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setVisibility(I)V

    .line 132
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v0, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setHasFixedSize(Z)V

    .line 133
    const/4 v0, 0x5

    .line 134
    .local v0, "spanCount":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
    move-result-object v1
    iget v1, v1, Landroid/content/res/Configuration;->orientation:I
    if-ne v1, v3, :cb_land_columns
    const/4 v0, 0x3
    :cb_land_columns

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->style:Lcom/github/tvbox/osc/util/ImgUtil$Style;

    if-eqz v1, :cond_0

    invoke-static {v2, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v3, :cond_0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->style:Lcom/github/tvbox/osc/util/ImgUtil$Style;

    invoke-static {v1, v0}, Lcom/github/tvbox/osc/util/ImgUtil;->spanCountByStyle(Lcom/github/tvbox/osc/util/ImgUtil$Style;I)I

    move-result v0

    .line 135
    :cond_0
    sget-object v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v3, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-direct {v3, v7, v0}, Lcom/owen/tvrecyclerview/widget/V7GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 136
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 137
    .local v1, "paddingLeft":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 138
    .local v3, "paddingTop":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 139
    .local v6, "paddingRight":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 140
    .local v5, "paddingBottom":I
    sget-object v7, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v7, v1, v3, v6, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setPadding(IIII)V

    .line 141
    .end local v0    # "spanCount":I
    .end local v1    # "paddingLeft":I
    .end local v3    # "paddingTop":I
    .end local v5    # "paddingBottom":I
    .end local v6    # "paddingRight":I
    goto :goto_0

    .line 142
    :cond_1
    sget-object v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v1, v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setVisibility(I)V

    .line 143
    sget-object v1, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    new-instance v3, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    invoke-direct {v3, v7, v0, v0}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v1, v3}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 144
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 145
    .local v0, "paddingLeft":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 146
    .local v1, "paddingTop":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 147
    .local v3, "paddingRight":I
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 148
    .restart local v5    # "paddingBottom":I
    sget-object v6, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->tvHotList:Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    invoke-virtual {v6, v0, v1, v3, v5}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setPadding(IIII)V

    .line 150
    .end local v0    # "paddingLeft":I
    .end local v1    # "paddingTop":I
    .end local v3    # "paddingRight":I
    .end local v5    # "paddingBottom":I
    :goto_0
    invoke-static {v2, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 151
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getAllVodRecord(I)Ljava/util/List;

    move-result-object v0

    .line 152
    .local v0, "allVodRecord":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v1, "vodList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo;

    .line 154
    .local v3, "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    new-instance v4, Lcom/github/tvbox/osc/bean/Movie$Video;

    invoke-direct {v4}, Lcom/github/tvbox/osc/bean/Movie$Video;-><init>()V

    .line 155
    .local v4, "vod":Lcom/github/tvbox/osc/bean/Movie$Video;
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->id:Ljava/lang/String;

    .line 156
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->sourceKey:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->sourceKey:Ljava/lang/String;

    .line 157
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    .line 158
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->pic:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->pic:Ljava/lang/String;

    .line 159
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    if-eqz v5, :cond_2

    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 160
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u4e0a\u6b21\u770b\u5230"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->note:Ljava/lang/String;

    .line 161
    :cond_2
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .end local v3    # "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    .end local v4    # "vod":Lcom/github/tvbox/osc/bean/Movie$Video;
    goto :goto_1

    .line 163
    :cond_3
    sget-object v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    invoke-virtual {v2, v1}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setNewData(Ljava/util/List;)V

    .line 165
    .end local v0    # "allVodRecord":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    .end local v1    # "vodList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    :cond_4
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "savedInstanceState"
        }
    .end annotation

    .line 174
    invoke-super {p0, p1, p2}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 175
    const v0, 0x7f0a029e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;

    .line 176
    .local v0, "hotList":Lcom/owen/tvrecyclerview/widget/TvRecyclerView;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    if-nez v1, :cond_0

    .line 177
    new-instance v1, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;

    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v3}, Lcom/owen/tvrecyclerview/widget/V7LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lcom/owen/tvrecyclerview/widget/TvRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 179
    :cond_0
    return-void
.end method

.method public server(Lcom/github/tvbox/osc/event/ServerEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/github/tvbox/osc/event/ServerEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 631
    iget v0, p1, Lcom/github/tvbox/osc/event/ServerEvent;->type:I

    .line 633
    return-void
.end method

.method public setArguments(Ljava/util/List;)Lcom/github/tvbox/osc/ui/fragment/UserFragment;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "recVod"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/github/tvbox/osc/bean/Movie$Video;",
            ">;)",
            "Lcom/github/tvbox/osc/ui/fragment/UserFragment;"
        }
    .end annotation

    .line 116
    .local p1, "recVod":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeSourceRec:Ljava/util/List;

    .line 117
    return-object p0
.end method

.method public refreshHistory(Lcom/github/tvbox/osc/event/RefreshEvent;)V
    .locals 8
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation
    iget v0, p1, Lcom/github/tvbox/osc/event/RefreshEvent;->type:I
    const/4 v1, 0x1
    if-ne v0, v1, :repair_done
    sget-object v0, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;
    if-eqz v0, :repair_done
    const-string v2, "home_rec"
    const/4 v4, 0x1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    .line 150
    .end local v0    # "paddingLeft":I
    .end local v1    # "paddingTop":I
    .end local v3    # "paddingRight":I
    .end local v5    # "paddingBottom":I
    :goto_0
    invoke-static {v2, v4}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 151
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/github/tvbox/osc/cache/RoomDataManger;->getAllVodRecord(I)Ljava/util/List;

    move-result-object v0

    .line 152
    .local v0, "allVodRecord":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v1, "vodList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/tvbox/osc/bean/VodInfo;

    .line 154
    .local v3, "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    new-instance v4, Lcom/github/tvbox/osc/bean/Movie$Video;

    invoke-direct {v4}, Lcom/github/tvbox/osc/bean/Movie$Video;-><init>()V

    .line 155
    .local v4, "vod":Lcom/github/tvbox/osc/bean/Movie$Video;
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->id:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->id:Ljava/lang/String;

    .line 156
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->sourceKey:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->sourceKey:Ljava/lang/String;

    .line 157
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->name:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->name:Ljava/lang/String;

    .line 158
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->pic:Ljava/lang/String;

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->pic:Ljava/lang/String;

    .line 159
    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    if-eqz v5, :cond_2

    iget-object v5, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 160
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u4e0a\u6b21\u770b\u5230"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v3, Lcom/github/tvbox/osc/bean/VodInfo;->playNote:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/github/tvbox/osc/bean/Movie$Video;->note:Ljava/lang/String;

    .line 161
    :cond_2
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .end local v3    # "vodInfo":Lcom/github/tvbox/osc/bean/VodInfo;
    .end local v4    # "vod":Lcom/github/tvbox/osc/bean/Movie$Video;
    goto :goto_1

    .line 163
    :cond_3
    sget-object v2, Lcom/github/tvbox/osc/ui/fragment/UserFragment;->homeHotVodAdapter:Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;

    invoke-virtual {v2, v1}, Lcom/github/tvbox/osc/ui/adapter/HomeHotVodAdapter;->setNewData(Ljava/util/List;)V

    .line 165
    .end local v0    # "allVodRecord":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/VodInfo;>;"
    .end local v1    # "vodList":Ljava/util/List;, "Ljava/util/List<Lcom/github/tvbox/osc/bean/Movie$Video;>;"
    :cond_4
    :repair_done
    return-void

.end method
