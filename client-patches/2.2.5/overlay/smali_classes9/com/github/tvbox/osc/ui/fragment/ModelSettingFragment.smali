.class public Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
.super Lcom/github/tvbox/osc/base/BaseLazyFragment;
.source "ModelSettingFragment.java"


# static fields
.field private static final REQUEST_LOCAL_CONFIG:I = 0x3e9

.field public static foundRemoteTv:Z

.field public static loadingSearchRemoteTvDialog:Lcom/github/tvbox/osc/ui/dialog/SearchRemoteTvDialog;

.field public static remoteTvHostList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private apiDialog:Lcom/github/tvbox/osc/ui/dialog/ApiDialog;

.field private llApi:Landroid/view/View;

.field private llApiHistory:Landroid/view/View;

.field private llApiLine:Landroid/view/View;

.field private selectLocalLive:Z

.field private tvApi:Landroid/widget/TextView;

.field private tvApiLine:Landroid/widget/TextView;

.field private tvAutoSwitchLineText:Landroid/widget/TextView;

.field private tvDanmuApiText:Landroid/widget/TextView;

.field private tvDanmuOpenText:Landroid/widget/TextView;

.field private tvDebugOpen:Landroid/widget/TextView;

.field private tvDns:Landroid/widget/TextView;

.field private tvFastSearchText:Landroid/widget/TextView;

.field private tvHistoryNum:Landroid/widget/TextView;

.field private tvHomeApi:Landroid/widget/TextView;

.field private tvHomeDefaultShow:Landroid/widget/TextView;

.field private tvHomeRec:Landroid/widget/TextView;

.field private tvIjkCachePlay:Landroid/widget/TextView;

.field private tvMediaCodec:Landroid/widget/TextView;

.field private tvParseWebView:Landroid/widget/TextView;

.field private tvPlay:Landroid/widget/TextView;

.field private tvRecStyleText:Landroid/widget/TextView;

.field private tvRender:Landroid/widget/TextView;

.field private tvScale:Landroid/widget/TextView;

.field private tvSearchView:Landroid/widget/TextView;

.field private tvShowPreviewText:Landroid/widget/TextView;

.field private tvm3u8AdText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDebugOpen:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvParseWebView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Lcom/github/tvbox/osc/ui/dialog/ApiDialog;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->apiDialog:Lcom/github/tvbox/osc/ui/dialog/ApiDialog;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;Lcom/github/tvbox/osc/ui/dialog/ApiDialog;)Lcom/github/tvbox/osc/ui/dialog/ApiDialog;
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
    .param p1, "x1"    # Lcom/github/tvbox/osc/ui/dialog/ApiDialog;

    .line 75
    iput-object p1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->apiDialog:Lcom/github/tvbox/osc/ui/dialog/ApiDialog;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvApi:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->refreshApiLineText()V

    return-void
.end method

.method static synthetic access$1400(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->restartAppAfterConfigChanged()V

    return-void
.end method

.method static synthetic access$1500(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
    .param p1, "x1"    # Z

    .line 75
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->openLocalConfig(Z)V

    return-void
.end method

.method static synthetic access$1600(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvMediaCodec:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvScale:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvPlay:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvRender:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeRec:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvSearchView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvShowPreviewText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHistoryNum:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvFastSearchText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvm3u8AdText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuOpenText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvAutoSwitchLineText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvRecStyleText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeDefaultShow:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4300(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4500(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->restartApp()V

    return-void
.end method

.method static synthetic access$4600(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-boolean v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->selectLocalLive:Z

    return v0
.end method

.method static synthetic access$4700(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
    .param p1, "x1"    # Z

    .line 75
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->openLocalFileActivity(Z)V

    return-void
.end method

.method static synthetic access$4800(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4900(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->restartAppAfterCacheCleared()V

    return-void
.end method

.method static synthetic access$500(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$600(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$700(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeApi:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$900(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    .line 75
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDns:Landroid/widget/TextView;

    return-object v0
.end method

.method private copyUriToLocalConfig(Landroid/net/Uri;)Ljava/lang/String;
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    .line 1022
    const-string v0, ""

    const/4 v1, 0x0

    .line 1023
    .local v1, "input":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 1025
    .local v2, "output":Ljava/io/FileOutputStream;
    :try_start_0
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    move-object v1, v3

    .line 1026
    if-nez v1, :cond_2

    .line 1042
    if-eqz v2, :cond_0

    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1043
    :catchall_0
    move-exception v3

    goto :goto_1

    .line 1044
    :cond_0
    :goto_0
    nop

    .line 1046
    :goto_1
    if-eqz v1, :cond_1

    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    .line 1047
    :catchall_1
    move-exception v3

    goto :goto_3

    .line 1048
    :cond_1
    :goto_2
    nop

    .line 1026
    :goto_3
    return-object v0

    .line 1027
    :cond_2
    :try_start_3
    new-instance v3, Ljava/io/File;

    invoke-static {}, Lcom/github/tvbox/osc/util/FileUtils;->getExternalCachePath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "config"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1028
    .local v3, "dir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 1029
    :cond_3
    new-instance v4, Ljava/io/File;

    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getDisplayName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1030
    .local v4, "file":Ljava/io/File;
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v2, v5

    .line 1031
    const/16 v5, 0x2000

    new-array v5, v5, [B

    .line 1033
    .local v5, "buffer":[B
    :goto_4
    invoke-virtual {v1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move v7, v6

    .local v7, "length":I
    const/4 v8, -0x1

    if-eq v6, v8, :cond_4

    .line 1034
    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6, v7}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_4

    .line 1036
    :cond_4
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 1042
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1044
    goto :goto_5

    .line 1043
    :catchall_2
    move-exception v6

    .line 1046
    :goto_5
    if-eqz v1, :cond_5

    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_6

    .line 1047
    :catchall_3
    move-exception v6

    goto :goto_7

    .line 1048
    :cond_5
    :goto_6
    nop

    .line 1036
    :goto_7
    return-object v0

    .line 1037
    .end local v3    # "dir":Ljava/io/File;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "buffer":[B
    .end local v7    # "length":I
    :catchall_4
    move-exception v3

    .line 1038
    .local v3, "th":Ljava/lang/Throwable;
    :try_start_6
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    .line 1039
    nop

    .line 1042
    if-eqz v2, :cond_6

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto :goto_8

    .line 1043
    :catchall_5
    move-exception v4

    goto :goto_9

    .line 1044
    :cond_6
    :goto_8
    nop

    .line 1046
    :goto_9
    if-eqz v1, :cond_7

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    goto :goto_a

    .line 1047
    :catchall_6
    move-exception v4

    goto :goto_b

    .line 1048
    :cond_7
    :goto_a
    nop

    .line 1039
    :goto_b
    return-object v0

    .line 1041
    .end local v3    # "th":Ljava/lang/Throwable;
    :catchall_7
    move-exception v0

    .line 1042
    if-eqz v2, :cond_8

    :try_start_9
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_8

    goto :goto_c

    .line 1043
    :catchall_8
    move-exception v3

    goto :goto_d

    .line 1044
    :cond_8
    :goto_c
    nop

    .line 1046
    :goto_d
    if-eqz v1, :cond_9

    :try_start_a
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_9

    goto :goto_e

    .line 1047
    :catchall_9
    move-exception v3

    goto :goto_f

    .line 1048
    :cond_9
    :goto_e
    nop

    .line 1049
    :goto_f
    throw v0
.end method

.method private getDisplayName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    .line 1053
    const-string v0, "local_config.json"

    .line 1054
    .local v0, "name":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1056
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    move-object v1, v2

    .line 1057
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1058
    const-string v2, "_display_name"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 1059
    .local v2, "index":I
    if-ltz v2, :cond_0

    .line 1060
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1061
    .local v3, "displayName":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    .line 1062
    move-object v0, v3

    .line 1068
    .end local v2    # "index":I
    .end local v3    # "displayName":Ljava/lang/String;
    :cond_0
    if-eqz v1, :cond_1

    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1066
    :catchall_0
    move-exception v2

    .line 1068
    if-eqz v1, :cond_1

    goto :goto_0

    .line 1070
    :cond_1
    :goto_1
    return-object v0
.end method

.method private getPathFromUri(Landroid/net/Uri;)Ljava/lang/String;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    .line 1001
    :try_start_0
    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1002
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1004
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1005
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 1006
    .local v0, "docId":Ljava/lang/String;
    const-string v1, "com.android.externalstorage.documents"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1007
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1008
    .local v1, "split":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    const-string v2, "primary"

    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1009
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1012
    .end local v1    # "split":[Ljava/lang/String;
    :cond_1
    const-string v1, "com.android.providers.downloads.documents"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "raw:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1013
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    .line 1017
    .end local v0    # "docId":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 1016
    :catchall_0
    move-exception v0

    .line 1018
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private localConfigToApi(Landroid/net/Uri;)Ljava/lang/String;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    .line 981
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getPathFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 982
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 983
    :cond_0
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->copyUriToLocalConfig(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 985
    :cond_1
    const-string v1, ""

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 988
    :cond_2
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 989
    .local v2, "storageRoot":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "^/+"

    const-string v5, "clan://localhost/"

    if-eqz v3, :cond_3

    .line 990
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 992
    :cond_3
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->copyUriToLocalConfig(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 993
    if-eqz v0, :cond_4

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 994
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 996
    :cond_4
    return-object v1

    .line 986
    .end local v2    # "storageRoot":Ljava/lang/String;
    :cond_5
    :goto_0
    return-object v1
.end method

.method public static newInstance()Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
    .locals 1

    .line 106
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    invoke-direct {v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;-><init>()V

    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->setArguments()Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;

    move-result-object v0

    return-object v0
.end method

.method private onClickClearCache(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 1074
    invoke-static {p1}, Lcom/github/tvbox/osc/util/FastClickCheckUtil;->check(Landroid/view/View;)V

    .line 1075
    invoke-static {}, Lcom/github/tvbox/osc/util/FileUtils;->getCachePath()Ljava/lang/String;

    move-result-object v0

    .line 1076
    .local v0, "cachePath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1077
    .local v1, "cacheDir":Ljava/io/File;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda4;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1094
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1095
    return-void
.end method

.method private onClickIjkCachePlay(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 923
    invoke-static {p1}, Lcom/github/tvbox/osc/util/FastClickCheckUtil;->check(Landroid/view/View;)V

    .line 924
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "ijk_cache_play"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->put(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 925
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvIjkCachePlay:Landroid/widget/TextView;

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u5f00\u542f"

    goto :goto_0

    :cond_0
    const-string v0, "\u5173\u95ed"

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 926
    return-void
.end method

.method private openLocalConfig(Z)V
    .locals 3
    .param p1, "live"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "live"
        }
    .end annotation

    .line 929
    iput-boolean p1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->selectLocalLive:Z

    .line 930
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/hjq/permissions/Permission$Group;->STORAGE:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/hjq/permissions/XXPermissions;->isGranted(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 931
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "\u8bf7\u9009\u62e9\u6587\u4ef6\u524d\u9700\u8981\u5148\u6388\u4e88\u5b58\u50a8\u6743\u9650"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 932
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/hjq/permissions/XXPermissions;->with(Landroid/content/Context;)Lcom/hjq/permissions/XXPermissions;

    move-result-object v0

    sget-object v1, Lcom/hjq/permissions/Permission$Group;->STORAGE:[Ljava/lang/String;

    .line 933
    invoke-virtual {v0, v1}, Lcom/hjq/permissions/XXPermissions;->permission([Ljava/lang/String;)Lcom/hjq/permissions/XXPermissions;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$30;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$30;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    .line 934
    invoke-virtual {v0, v1}, Lcom/hjq/permissions/XXPermissions;->request(Lcom/hjq/permissions/OnPermissionCallback;)V

    .line 953
    return-void

    .line 955
    :cond_0
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->openLocalFileActivity(Z)V

    .line 956
    return-void
.end method

.method private openLocalFileActivity(Z)V
    .locals 3
    .param p1, "live"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "live"
        }
    .end annotation

    .line 959
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    const-class v2, Lcom/github/tvbox/osc/ui/activity/LocalFileActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 960
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "live"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 961
    const/16 v1, 0x3e9

    invoke-virtual {p0, v0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 962
    return-void
.end method

.method private refreshApiLineText()V
    .locals 7

    .line 878
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvApiLine:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 879
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "api_line_list"

    invoke-static {v1, v0}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 880
    .local v0, "apiLines":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v1, "api_url"

    const-string v2, ""

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 881
    .local v1, "current":Ljava/lang/String;
    invoke-static {v1}, Lcom/github/tvbox/osc/util/HistoryHelper;->isApiLineUrl(Ljava/lang/String;)Z

    move-result v2

    .line 882
    .local v2, "showLine":Z
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApiLine:Landroid/view/View;

    if-eqz v3, :cond_2

    .line 883
    if-eqz v2, :cond_1

    const/4 v4, 0x0

    goto :goto_0

    :cond_1
    const/16 v4, 0x8

    :goto_0
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 885
    :cond_2
    invoke-direct {p0, v2}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->updateApiRowWeight(Z)V

    .line 886
    const-string v3, ""

    .line 887
    .local v3, "lineName":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 888
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 889
    .local v5, "apiLine":Ljava/lang/String;
    invoke-static {v5}, Lcom/github/tvbox/osc/util/HistoryHelper;->getApiLineUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 890
    invoke-static {v5}, Lcom/github/tvbox/osc/util/HistoryHelper;->getApiLineName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 891
    goto :goto_2

    .line 893
    .end local v5    # "apiLine":Ljava/lang/String;
    :cond_3
    goto :goto_1

    .line 895
    :cond_4
    :goto_2
    iget-object v4, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvApiLine:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 896
    return-void
.end method

.method private refreshDanmuApiText()V
    .locals 6

    .line 1103
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuApiText:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 1104
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->getPriority()I

    move-result v0

    invoke-static {v0}, Lcom/github/tvbox/osc/api/DanmakuApi;->priorityShortLabel(I)Ljava/lang/String;

    move-result-object v0

    .line 1105
    .local v0, "priority":Ljava/lang/String;
    invoke-static {}, Lcom/github/tvbox/osc/api/DanmakuApi;->isUseDefault()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1106
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuApiText:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " \u00b7 \u8ddf\u968f\u914d\u7f6e"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1107
    return-void

    .line 1109
    :cond_1
    const-string v1, "danmu_api"

    const-string v2, ""

    invoke-static {v1, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1110
    .local v1, "custom":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1111
    iget-object v2, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuApiText:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " \u00b7 \u81ea\u5b9a\u4e49"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1112
    return-void

    .line 1114
    :cond_2
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/tvbox/osc/api/ApiConfig;->getDanmaku()Ljava/lang/String;

    move-result-object v2

    .line 1115
    .local v2, "config":Ljava/lang/String;
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuApiText:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, " \u00b7 \u65e0\u989d\u5916\u63a5\u53e3"

    goto :goto_0

    :cond_3
    const-string v5, " \u00b7 \u914d\u7f6e\u63a5\u53e3"

    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1116
    return-void
.end method

.method private restartApp()V
    .locals 2

    .line 913
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    return-void

    .line 914
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 915
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 916
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 917
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->startActivity(Landroid/content/Intent;)V

    .line 918
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 920
    :cond_1
    return-void
.end method

.method private restartAppAfterCacheCleared()V
    .locals 4

    .line 868
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    const-string v1, "\u7f13\u5b58\u5df2\u6e05\u7a7a,\u5373\u5c06\u56de\u5230\u4e3b\u9875!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 869
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$29;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$29;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 875
    return-void
.end method

.method private restartAppAfterConfigChanged()V
    .locals 4

    .line 856
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mContext:Landroid/content/Context;

    const-string v1, "\u914d\u7f6e\u5df2\u5207\u6362,\u5373\u5c06\u91cd\u65b0\u52a0\u8f7d!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 857
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$28;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$28;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 865
    return-void
.end method

.method private updateApiRowWeight(Z)V
    .locals 4
    .param p1, "showLine"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "showLine"
        }
    .end annotation

    .line 899
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApi:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    .line 900
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 901
    .local v0, "params":Landroid/widget/LinearLayout$LayoutParams;
    if-eqz p1, :cond_1

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_1
    const v1, 0x40451eb8    # 3.08f

    :goto_0
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 902
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApi:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 903
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApiHistory:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 904
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 905
    .local v1, "historyParams":Landroid/widget/LinearLayout$LayoutParams;
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07010c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    .line 906
    .local v2, "margin":I
    :goto_1
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 907
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 908
    iget-object v3, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApiHistory:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 910
    .end local v1    # "historyParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v2    # "margin":I
    :cond_3
    return-void
.end method


# virtual methods
.method getHomeRecName(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .line 1125
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 1126
    const-string v0, "\u7ad9\u70b9\u63a8\u8350"

    return-object v0

    .line 1127
    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 1128
    const-string v0, "\u89c2\u770b\u5386\u53f2"

    return-object v0

    .line 1130
    :cond_1
    const-string v0, "\u8c46\u74e3\u70ed\u64ad"

    return-object v0
.end method

.method protected getLayoutResID()I
    .locals 1

    .line 115
    const v0, 0x7f0d005c

    return v0
.end method

.method getSearchView(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .line 1135
    if-nez p1, :cond_0

    .line 1136
    const-string v0, "\u6587\u5b57\u5217\u8868"

    return-object v0

    .line 1138
    :cond_0
    const-string v0, "\u7f29\u7565\u56fe"

    return-object v0
.end method

.method protected init()V
    .locals 11

    .line 120
    const v0, 0x7f0a0210

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvFastSearchText:Landroid/widget/TextView;

    .line 121
    const/4 v1, 0x1

    .line 158
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 121
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "fast_search_mode"

    invoke-static {v3, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v4, "\u5f00\u542f"

    const-string v5, "\u5173\u95ed"

    if-eqz v3, :cond_0

    move-object v3, v4

    goto :goto_0

    :cond_0
    move-object v3, v5

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    const v0, 0x7f0a017c

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvm3u8AdText:Landroid/widget/TextView;

    .line 123
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "m3u8_purify"

    invoke-static {v7, v6}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v6, v4

    goto :goto_1

    :cond_1
    move-object v6, v5

    :goto_1
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    const v0, 0x7f0a0096

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuOpenText:Landroid/widget/TextView;

    .line 125
    const v0, 0x7f0a0094

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuApiText:Landroid/widget/TextView;

    .line 126
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->refreshDanmuApiText()V

    .line 127
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDanmuOpenText:Landroid/widget/TextView;

    invoke-static {}, Lcom/github/tvbox/osc/util/DanmuHelper;->isOpen()Z

    move-result v6

    if-eqz v6, :cond_2

    move-object v6, v4

    goto :goto_2

    :cond_2
    move-object v6, v5

    :goto_2
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    const v0, 0x7f0a005c

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvAutoSwitchLineText:Landroid/widget/TextView;

    .line 129
    const-string v6, "auto_switch_line"

    invoke-static {v6, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v6, v4

    goto :goto_3

    :cond_3
    move-object v6, v5

    :goto_3
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    const v0, 0x7f0a0214

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvRecStyleText:Landroid/widget/TextView;

    .line 131
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "home_rec_style"

    invoke-static {v7, v6}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v6, "\u662f"

    goto :goto_4

    :cond_4
    const-string v6, "\u5426"

    :goto_4
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    const v0, 0x7f0a0213

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvShowPreviewText:Landroid/widget/TextView;

    .line 133
    const-string v6, "show_preview"

    invoke-static {v6, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_5

    move-object v6, v4

    goto :goto_5

    :cond_5
    move-object v6, v5

    :goto_5
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    const v0, 0x7f0a027b

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDebugOpen:Landroid/widget/TextView;

    .line 135
    const v0, 0x7f0a02ad

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvParseWebView:Landroid/widget/TextView;

    .line 136
    const v0, 0x7f0a02a5

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvMediaCodec:Landroid/widget/TextView;

    .line 137
    const v0, 0x7f0a02b4

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvPlay:Landroid/widget/TextView;

    .line 138
    const v0, 0x7f0a02bb

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvRender:Landroid/widget/TextView;

    .line 139
    const v0, 0x7f0a02bf

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvScale:Landroid/widget/TextView;

    .line 140
    const v0, 0x7f0a0153

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApi:Landroid/view/View;

    .line 141
    const v6, 0x7f0a0154

    invoke-virtual {p0, v6}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApiHistory:Landroid/view/View;

    .line 142
    const v7, 0x7f0a0155

    invoke-virtual {p0, v7}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->llApiLine:Landroid/view/View;

    .line 143
    const v8, 0x7f0a0270

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvApi:Landroid/widget/TextView;

    .line 144
    const v8, 0x7f0a0271

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvApiLine:Landroid/widget/TextView;

    .line 145
    const v8, 0x7f0a029a

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeApi:Landroid/widget/TextView;

    .line 146
    const v8, 0x7f0a0282

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDns:Landroid/widget/TextView;

    .line 147
    const v8, 0x7f0a029c

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeRec:Landroid/widget/TextView;

    .line 148
    const v8, 0x7f0a0298

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHistoryNum:Landroid/widget/TextView;

    .line 149
    const v8, 0x7f0a02c3

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvSearchView:Landroid/widget/TextView;

    .line 150
    const v8, 0x7f0a029f

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvIjkCachePlay:Landroid/widget/TextView;

    .line 151
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvMediaCodec:Landroid/widget/TextView;

    const-string v9, "ijk_codec"

    const-string v10, "\u786c\u89e3\u7801"

    invoke-static {v9, v10}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDebugOpen:Landroid/widget/TextView;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const-string v10, "debug_open"

    invoke-static {v10, v9}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_6

    const-string v9, "\u5df2\u6253\u5f00"

    goto :goto_6

    :cond_6
    const-string v9, "\u5df2\u5173\u95ed"

    :goto_6
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    iget-object v8, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvParseWebView:Landroid/widget/TextView;

    const-string v9, "parse_webview"

    invoke-static {v9, v1}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "\u7cfb\u7edf\u81ea\u5e26"

    goto :goto_7

    :cond_7
    const-string v1, "XWalkView"

    :goto_7
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvApi:Landroid/widget/TextView;

    const-string v8, "api_url"

    const-string v9, ""

    invoke-static {v8, v9}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/CharSequence;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->refreshApiLineText()V

    .line 157
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvDns:Landroid/widget/TextView;

    sget-object v8, Lcom/github/tvbox/osc/util/OkGoHelper;->dnsHttpsList:Ljava/util/ArrayList;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "doh_url"

    invoke-static {v10, v9}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/CharSequence;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeRec:Landroid/widget/TextView;

    const-string v8, "home_rec"

    invoke-static {v8, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getHomeRecName(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHistoryNum:Landroid/widget/TextView;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "history_num"

    invoke-static {v9, v8}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v8}, Lcom/github/tvbox/osc/util/HistoryHelper;->getHistoryNumName(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvSearchView:Landroid/widget/TextView;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "search_view"

    invoke-static {v9, v8}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getSearchView(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeApi:Landroid/widget/TextView;

    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v8

    invoke-virtual {v8}, Lcom/github/tvbox/osc/api/ApiConfig;->getHomeSourceBean()Lcom/github/tvbox/osc/bean/SourceBean;

    move-result-object v8

    invoke-virtual {v8}, Lcom/github/tvbox/osc/bean/SourceBean;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvScale:Landroid/widget/TextView;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "play_scale"

    invoke-static {v9, v8}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v8}, Lcom/github/tvbox/osc/util/PlayerHelper;->getScaleName(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvPlay:Landroid/widget/TextView;

    const-string v8, "play_type"

    invoke-static {v8, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {}, Lcom/github/tvbox/osc/util/PlayerChoice;->configuredType()I
    move-result v2
    invoke-static {v2}, Lcom/github/tvbox/osc/util/PlayerHelper;->getPlayerName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvRender:Landroid/widget/TextView;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v8, "play_render"

    invoke-static {v8, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/github/tvbox/osc/util/PlayerHelper;->getRenderName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvIjkCachePlay:Landroid/widget/TextView;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v8, "ijk_cache_play"

    invoke-static {v8, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_8

    :cond_8
    move-object v4, v5

    :goto_8
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    const v1, 0x7f0a029d

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->tvHomeDefaultShow:Landroid/widget/TextView;

    .line 167
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "DEFAULT_LOAD_LIVE"

    invoke-static {v3, v2}, Lcom/orhanobut/hawk/Hawk;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_9

    const-string v2, "\u76f4\u64ad"

    goto :goto_9

    :cond_9
    const-string v2, "\u70b9\u64ad"

    :goto_9
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    const v1, 0x7f0a0159

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$1;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$1;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    const v1, 0x7f0a0163

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$2;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$2;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    const v1, 0x7f0a0157

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$3;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$3;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 203
    const v1, 0x7f0a0152

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$4;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$4;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    const v1, 0x7f0a016a

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$5;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$5;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    const v1, 0x7f0a016b

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$6;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$6;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 244
    const v1, 0x7f0a015d

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$7;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$7;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    const v1, 0x7f0a015a

    invoke-virtual {p0, v1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$8;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$8;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 319
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$9;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$9;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    invoke-virtual {p0, v6}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$10;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$10;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 397
    invoke-virtual {p0, v7}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$11;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$11;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 444
    const v0, 0x7f0a0162

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$12;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$12;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 488
    const v0, 0x7f0a0166

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$13;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$13;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 527
    const v0, 0x7f0a0164

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$14;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 576
    const v0, 0x7f0a0165

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$15;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$15;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 612
    const v0, 0x7f0a015e

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$16;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$16;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 648
    const v0, 0x7f0a0168

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$17;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$17;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 683
    new-instance v0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$18;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$18;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    sput-object v0, Lcom/github/tvbox/osc/ui/activity/SettingActivity;->callback:Lcom/github/tvbox/osc/ui/activity/SettingActivity$DevModeCallback;

    .line 690
    const v0, 0x7f0a0212

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$19;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$19;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 698
    const v0, 0x7f0a015b

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$20;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$20;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 734
    const v0, 0x7f0a020f

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$21;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$21;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 742
    const v0, 0x7f0a017b

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$22;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$22;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 751
    const v0, 0x7f0a0095

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$23;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$23;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 760
    const v0, 0x7f0a0093

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 766
    const v0, 0x7f0a005b

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$24;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$24;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 775
    const v0, 0x7f0a015f

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$25;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$25;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 784
    const v0, 0x7f0a0167

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$26;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$26;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 842
    const v0, 0x7f0a029b

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$27;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$27;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 851
    const v0, 0x7f0a0160

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 852
    const v0, 0x7f0a0158

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda2;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 853
    return-void
.end method

.method synthetic lambda$init$0$com-github-tvbox-osc-ui-fragment-ModelSettingFragment(Ljava/lang/String;)V
    .locals 0
    .param p1, "api"    # Ljava/lang/String;

    .line 763
    invoke-direct {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->refreshDanmuApiText()V

    return-void
.end method

.method synthetic lambda$init$1$com-github-tvbox-osc-ui-fragment-ModelSettingFragment(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 761
    invoke-static {p1}, Lcom/github/tvbox/osc/util/FastClickCheckUtil;->check(Landroid/view/View;)V

    .line 762
    new-instance v0, Lcom/github/tvbox/osc/ui/dialog/DanmuApiDialog;

    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/github/tvbox/osc/ui/dialog/DanmuApiDialog;-><init>(Landroid/content/Context;)V

    .line 763
    .local v0, "dialog":Lcom/github/tvbox/osc/ui/dialog/DanmuApiDialog;
    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$$ExternalSyntheticLambda3;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v0, v1}, Lcom/github/tvbox/osc/ui/dialog/DanmuApiDialog;->setOnListener(Lcom/github/tvbox/osc/ui/dialog/DanmuApiDialog$OnListener;)V

    .line 764
    invoke-virtual {v0}, Lcom/github/tvbox/osc/ui/dialog/DanmuApiDialog;->show()V

    .line 765
    return-void
.end method

.method synthetic lambda$init$2$com-github-tvbox-osc-ui-fragment-ModelSettingFragment(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 851
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->onClickIjkCachePlay(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$init$3$com-github-tvbox-osc-ui-fragment-ModelSettingFragment(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 852
    invoke-direct {p0, p1}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->onClickClearCache(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$onClickClearCache$4$com-github-tvbox-osc-ui-fragment-ModelSettingFragment(Ljava/io/File;)V
    .locals 3
    .param p1, "cacheDir"    # Ljava/io/File;

    .line 1079
    :try_start_0
    invoke-static {}, Lcom/github/tvbox/osc/api/ApiConfig;->get()Lcom/github/tvbox/osc/api/ApiConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/tvbox/osc/api/ApiConfig;->clearSpiderCache()V

    .line 1080
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/github/tvbox/osc/util/FileUtils;->cleanDirectory(Ljava/io/File;)V

    .line 1081
    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/util/FileUtils;->clearSpiderCacheFiles()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1085
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 1086
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$31;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$31;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    goto :goto_0

    .line 1085
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 1082
    :catch_0
    move-exception v0

    .line 1083
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1085
    .end local v0    # "e":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 1086
    iget-object v0, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$31;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$31;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1094
    :cond_1
    return-void

    .line 1085
    :goto_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    if-eqz v1, :cond_2

    .line 1086
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->mActivity:Landroid/app/Activity;

    new-instance v2, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$31;

    invoke-direct {v2, p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment$31;-><init>(Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1093
    :cond_2
    throw v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "requestCode",
            "resultCode",
            "data"
        }
    .end annotation

    .line 966
    invoke-super {p0, p1, p2, p3}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 967
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_4

    const/4 v0, -0x1

    if-ne p2, v0, :cond_4

    if-eqz p3, :cond_4

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 970
    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->localConfigToApi(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 971
    .local v0, "api":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 975
    :cond_1
    iget-object v1, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->apiDialog:Lcom/github/tvbox/osc/ui/dialog/ApiDialog;

    if-eqz v1, :cond_2

    .line 976
    iget-boolean v2, p0, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->selectLocalLive:Z

    invoke-virtual {v1, v0, v2}, Lcom/github/tvbox/osc/ui/dialog/ApiDialog;->setLocalApi(Ljava/lang/String;Z)V

    .line 978
    :cond_2
    return-void

    .line 972
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "\u8bfb\u53d6\u672c\u5730\u914d\u7f6e\u5931\u8d25"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 973
    return-void

    .line 968
    .end local v0    # "api":Ljava/lang/String;
    :cond_4
    :goto_1
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 1120
    invoke-super {p0}, Lcom/github/tvbox/osc/base/BaseLazyFragment;->onDestroyView()V

    .line 1121
    const/4 v0, 0x0

    sput-object v0, Lcom/github/tvbox/osc/ui/activity/SettingActivity;->callback:Lcom/github/tvbox/osc/ui/activity/SettingActivity$DevModeCallback;

    .line 1122
    return-void
.end method

.method public setArguments()Lcom/github/tvbox/osc/ui/fragment/ModelSettingFragment;
    .locals 0

    .line 110
    return-object p0
.end method
