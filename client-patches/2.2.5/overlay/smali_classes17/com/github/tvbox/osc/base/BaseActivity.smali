.class public abstract Lcom/github/tvbox/osc/base/BaseActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BaseActivity.java"

# interfaces
.implements Lme/jessyan/autosize/internal/CustomAdapt;


# static fields
.field protected static globalWp:Landroid/graphics/drawable/BitmapDrawable;

.field private static volatile screenPortrait:Z

.field private static screenRatio:F


# instance fields
.field private brandLoadingOverlay:Landroid/view/View;

.field private final hideSysBarRunnable:Ljava/lang/Runnable;

.field private lastScaledDensity:F

.field protected mContext:Landroid/content/Context;

.field private mLoadService:Lcom/kingja/loadsir/core/LoadService;

.field private final refreshAutoSizeRunnable:Ljava/lang/Runnable;


# direct methods
.method public static synthetic $r8$lambda$pqDup8WwNqeci5JAKLy2aRt_-eA(Lcom/github/tvbox/osc/base/BaseActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->hideBrandLoading()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 55
    const/high16 v0, -0x3d380000    # -100.0f

    sput v0, Lcom/github/tvbox/osc/base/BaseActivity;->screenRatio:F

    .line 353
    const/4 v0, 0x0

    sput-object v0, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 57
    new-instance v0, Lcom/github/tvbox/osc/base/BaseActivity$1;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/base/BaseActivity$1;-><init>(Lcom/github/tvbox/osc/base/BaseActivity;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSizeRunnable:Ljava/lang/Runnable;

    .line 63
    new-instance v0, Lcom/github/tvbox/osc/base/BaseActivity$2;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/base/BaseActivity$2;-><init>(Lcom/github/tvbox/osc/base/BaseActivity;)V

    iput-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->hideSysBarRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/github/tvbox/osc/base/BaseActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/github/tvbox/osc/base/BaseActivity;

    .line 49
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSize()V

    return-void
.end method

.method static synthetic access$100(Lcom/github/tvbox/osc/base/BaseActivity;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/github/tvbox/osc/base/BaseActivity;

    .line 49
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->hideSysBarRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method private enableFullUserRotationForPhones()V
    .locals 6

    .line 105
    :try_start_0
    const-string v0, "sensor"

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 106
    .local v0, "sensors":Landroid/hardware/SensorManager;
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 108
    .local v3, "hasAccelerometer":Z
    :goto_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.software.leanback"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 109
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.hardware.type.television"

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    const/4 v1, 0x1

    .line 110
    .local v1, "television":Z
    :cond_2
    if-eqz v3, :cond_3

    if-nez v1, :cond_3

    .line 111
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Lcom/github/tvbox/osc/base/BaseActivity;->setRequestedOrientation(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 113
    .end local v0    # "sensors":Landroid/hardware/SensorManager;
    .end local v1    # "television":Z
    .end local v3    # "hasAccelerometer":Z
    :catchall_0
    move-exception v0

    :cond_3
    :goto_1
    nop

    .line 114
    return-void
.end method

.method private hideBrandLoading()V
    .locals 2

    .line 300
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 301
    new-instance v0, Lcom/github/tvbox/osc/base/BaseActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/base/BaseActivity$$ExternalSyntheticLambda1;-><init>(Lcom/github/tvbox/osc/base/BaseActivity;)V

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 302
    return-void

    .line 304
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->brandLoadingOverlay:Landroid/view/View;

    if-eqz v0, :cond_1

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 305
    :cond_1
    return-void
.end method

.method private initSystemUiListener()V
    .locals 2

    .line 158
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 159
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 160
    .local v0, "decorView":Landroid/view/View;
    new-instance v1, Lcom/github/tvbox/osc/base/BaseActivity$3;

    invoke-direct {v1, p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity$3;-><init>(Lcom/github/tvbox/osc/base/BaseActivity;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 170
    .end local v0    # "decorView":Landroid/view/View;
    :cond_0
    return-void
.end method

.method private refreshAutoSize()V
    .locals 3

    .line 196
    :try_start_0
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 197
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 198
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lez v1, :cond_1

    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-gtz v1, :cond_0

    goto :goto_0

    .line 201
    :cond_0
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->updateScreenRatio(Landroid/util/DisplayMetrics;)V

    .line 202
    invoke-static {}, Lme/jessyan/autosize/AutoSizeConfig;->getInstance()Lme/jessyan/autosize/AutoSizeConfig;

    move-result-object v1

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 203
    invoke-virtual {v1, v2}, Lme/jessyan/autosize/AutoSizeConfig;->setScreenWidth(I)Lme/jessyan/autosize/AutoSizeConfig;

    move-result-object v1

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 204
    invoke-virtual {v1, v2}, Lme/jessyan/autosize/AutoSizeConfig;->setScreenHeight(I)Lme/jessyan/autosize/AutoSizeConfig;

    .line 205
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p0}, Lme/jessyan/autosize/AutoSizeCompat;->autoConvertDensityOfCustomAdapt(Landroid/content/res/Resources;Lme/jessyan/autosize/internal/CustomAdapt;)V

    .line 206
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    iput v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->lastScaledDensity:F

    .line 207
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    .end local v0    # "dm":Landroid/util/DisplayMetrics;
    goto :goto_1

    .line 199
    .restart local v0    # "dm":Landroid/util/DisplayMetrics;
    :cond_1
    :goto_0
    return-void

    .line 208
    .end local v0    # "dm":Landroid/util/DisplayMetrics;
    :catchall_0
    move-exception v0

    .line 209
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 211
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_1
    return-void
.end method

.method private rescaleTextViews(Landroid/view/View;FF)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "oldDensity"    # F
    .param p3, "newDensity"    # F
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "view",
            "oldDensity",
            "newDensity"
        }
    .end annotation

    .line 131
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 132
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    .line 133
    .local v0, "text":Landroid/widget/TextView;
    const/4 v1, 0x0

    .line 134
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    move-result v2

    div-float/2addr v2, p2

    mul-float v2, v2, p3

    .line 133
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 136
    .end local v0    # "text":Landroid/widget/TextView;
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 137
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    .line 138
    .local v0, "group":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 139
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {p0, v2, p2, p3}, Lcom/github/tvbox/osc/base/BaseActivity;->rescaleTextViews(Landroid/view/View;FF)V

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 142
    .end local v0    # "group":Landroid/view/ViewGroup;
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private scheduleRefreshAutoSize()V
    .locals 4

    .line 189
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 190
    .local v0, "decorView":Landroid/view/View;
    iget-object v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSizeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 191
    iget-object v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSizeRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 192
    return-void
.end method

.method private updateScreenRatio(Landroid/util/DisplayMetrics;)V
    .locals 5
    .param p1, "dm"    # Landroid/util/DisplayMetrics;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dm"
        }
    .end annotation

    .line 214
    iget v0, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 215
    .local v0, "screenWidth":I
    iget v1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 216
    .local v1, "screenHeight":I
    if-le v1, v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    sput-boolean v2, Lcom/github/tvbox/osc/base/BaseActivity;->screenPortrait:Z

    .line 217
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 218
    .local v2, "min":I
    if-lez v2, :cond_1

    .line 219
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    int-to-float v4, v2

    div-float/2addr v3, v4

    sput v3, Lcom/github/tvbox/osc/base/BaseActivity;->screenRatio:F

    .line 221
    :cond_1
    return-void
.end method


# virtual methods
.method public changeWallpaper(Z)V
    .locals 12
    .param p1, "force"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "force"
        }
    .end annotation

    .line 356
    if-nez p1, :cond_0

    sget-object v0, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_0

    .line 357
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget-object v1, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 359
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/wp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 360
    .local v1, "wp":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 361
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 362
    .local v2, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 363
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 365
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 366
    .local v4, "imageHeight":I
    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 367
    .local v5, "imageWidth":I
    const/16 v6, 0x2d0

    .line 368
    .local v6, "picHeight":I
    const/16 v7, 0x438

    .line 369
    .local v7, "picWidth":I
    div-int v8, v5, v7

    .line 370
    .local v8, "scaleX":I
    div-int v9, v4, v6

    .line 371
    .local v9, "scaleY":I
    const/4 v10, 0x1

    .line 372
    .local v10, "scale":I
    if-le v8, v9, :cond_1

    if-lt v9, v3, :cond_1

    .line 373
    move v10, v8

    .line 375
    :cond_1
    if-ge v8, v9, :cond_2

    if-lt v8, v3, :cond_2

    .line 376
    move v10, v9

    .line 378
    :cond_2
    const/4 v3, 0x0

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 380
    iput v10, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 381
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v11

    invoke-direct {v3, v11}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    sput-object v3, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    .line 382
    .end local v2    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v4    # "imageHeight":I
    .end local v5    # "imageWidth":I
    .end local v6    # "picHeight":I
    .end local v7    # "picWidth":I
    .end local v8    # "scaleX":I
    .end local v9    # "scaleY":I
    .end local v10    # "scale":I
    goto :goto_0

    .line 383
    :cond_3
    sput-object v0, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    .end local v1    # "wp":Ljava/io/File;
    :goto_0
    goto :goto_1

    .line 385
    :catchall_0
    move-exception v1

    .line 386
    .local v1, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 387
    sput-object v0, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    .line 389
    .end local v1    # "throwable":Ljava/lang/Throwable;
    :goto_1
    sget-object v0, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_4

    .line 390
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget-object v1, Lcom/github/tvbox/osc/base/BaseActivity;->globalWp:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 392
    :cond_4
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x7f080051

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 393
    :goto_2
    return-void
.end method

.method protected getAssetText(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fileName"
        }
    .end annotation

    .line 325
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    :try_start_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 328
    .local v1, "assets":Landroid/content/res/AssetManager;
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 330
    .local v2, "bf":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    .local v4, "line":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 331
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 333
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 334
    .end local v1    # "assets":Landroid/content/res/AssetManager;
    .end local v2    # "bf":Ljava/io/BufferedReader;
    .end local v4    # "line":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 335
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 337
    .end local v1    # "e":Ljava/io/IOException;
    const-string v1, ""

    return-object v1
.end method

.method protected abstract getLayoutResID()I
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 2

    .line 225
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 226
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p0}, Lme/jessyan/autosize/AutoSizeCompat;->autoConvertDensityOfCustomAdapt(Landroid/content/res/Resources;Lme/jessyan/autosize/internal/CustomAdapt;)V

    .line 228
    :cond_0
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getSizeInDp()F
    .locals 2

    .line 344
    sget-boolean v0, Lcom/github/tvbox/osc/base/BaseActivity;->screenPortrait:Z

    const/high16 v1, 0x44340000    # 720.0f

    if-eqz v0, :cond_0

    return v1

    .line 345
    :cond_0
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->isBaseOnWidth()Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 v1, 0x44a00000    # 1280.0f

    :cond_1
    return v1
.end method

.method public hasPermission(Ljava/lang/String;)Z
    .locals 2
    .param p1, "permission"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permission"
        }
    .end annotation

    .line 232
    const/4 v0, 0x1

    .line 234
    .local v0, "has":Z
    :try_start_0
    invoke-static {p0, p1}, Landroidx/core/content/PermissionChecker;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    move v0, v1

    .line 237
    goto :goto_1

    .line 235
    :catch_0
    move-exception v1

    .line 236
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 238
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return v0
.end method

.method public hideSysBar()V
    .locals 2

    .line 145
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 146
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    .line 147
    .local v0, "uiOptions":I
    or-int/lit16 v0, v0, 0x100

    .line 148
    or-int/lit16 v0, v0, 0x200

    .line 149
    or-int/lit16 v0, v0, 0x400

    .line 150
    or-int/lit8 v0, v0, 0x2

    .line 151
    or-int/lit8 v0, v0, 0x4

    .line 152
    or-int/lit16 v0, v0, 0x1000

    .line 153
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 155
    .end local v0    # "uiOptions":I
    :cond_0
    return-void
.end method

.method protected abstract init()V
.end method

.method public isBaseOnWidth()Z
    .locals 2

    .line 350
    sget-boolean v0, Lcom/github/tvbox/osc/base/BaseActivity;->screenPortrait:Z

    if-nez v0, :cond_1

    sget v0, Lcom/github/tvbox/osc/base/BaseActivity;->screenRatio:F

    const/high16 v1, 0x40800000    # 4.0f

    cmpl-float v0, v0, v1

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected isLoading()Z
    .locals 2

    .line 278
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->brandLoadingOverlay:Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 279
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/kingja/loadsir/core/LoadService;->getCurrentCallback()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 280
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    invoke-virtual {v0}, Lcom/kingja/loadsir/core/LoadService;->getCurrentCallback()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/github/tvbox/osc/callback/LoadingCallback;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 282
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public jumpActivity(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "clazz"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/github/tvbox/osc/base/BaseActivity;",
            ">;)V"
        }
    .end annotation

    .line 314
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/github/tvbox/osc/base/BaseActivity;>;"
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 315
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->startActivity(Landroid/content/Intent;)V

    .line 316
    return-void
.end method

.method public jumpActivity(Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 2
    .param p2, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "clazz",
            "bundle"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/github/tvbox/osc/base/BaseActivity;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 319
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/github/tvbox/osc/base/BaseActivity;>;"
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 320
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 321
    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->startActivity(Landroid/content/Intent;)V

    .line 322
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newConfig"
        }
    .end annotation

    .line 118
    iget v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->lastScaledDensity:F

    .line 119
    .local v0, "oldDensity":F
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 120
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSize()V

    .line 121
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 122
    .local v1, "newDensity":F
    const/4 v2, 0x0

    cmpl-float v3, v0, v2

    if-lez v3, :cond_0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    sub-float v2, v0, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x3a83126f    # 0.001f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 123
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0, v2, v0, v1}, Lcom/github/tvbox/osc/base/BaseActivity;->rescaleTextViews(Landroid/view/View;FF)V

    .line 125
    :cond_0
    iput v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->lastScaledDensity:F

    .line 126
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->scheduleRefreshAutoSize()V

    .line 127
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->hideSysBar()V

    .line 128
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->enableFullUserRotationForPhones()V

    .line 74
    :try_start_0
    sget v0, Lcom/github/tvbox/osc/base/BaseActivity;->screenRatio:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 75
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 76
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 77
    invoke-direct {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->updateScreenRatio(Landroid/util/DisplayMetrics;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    .end local v0    # "dm":Landroid/util/DisplayMetrics;
    :cond_0
    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    .local v0, "th":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 82
    .end local v0    # "th":Ljava/lang/Throwable;
    :goto_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 83
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSize()V

    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getLayoutResID()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->setContentView(I)V

    .line 84
    iput-object p0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mContext:Landroid/content/Context;

    .line 85
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->initSystemUiListener()V

    .line 86
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lxyz/doikki/videoplayer/util/CutoutUtil;->adaptCutoutAboveAndroidP(Landroid/content/Context;Z)V

    .line 87
    invoke-static {}, Lcom/github/tvbox/osc/util/AppManager;->getInstance()Lcom/github/tvbox/osc/util/AppManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/github/tvbox/osc/util/AppManager;->addActivity(Landroid/app/Activity;)V

    .line 88
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->init()V

    .line 89
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    iput v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->lastScaledDensity:F

    .line 90
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 309
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 310
    invoke-static {}, Lcom/github/tvbox/osc/util/AppManager;->getInstance()Lcom/github/tvbox/osc/util/AppManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/github/tvbox/osc/util/AppManager;->finishActivity(Landroid/app/Activity;)V

    .line 311
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 174
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 175
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSizeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 176
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/github/tvbox/osc/base/BaseActivity;->hideSysBarRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 177
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 94
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 95
    invoke-static {}, Lcom/github/tvbox/osc/base/App;->syncForegroundNow()V

    .line 96
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->hideSysBar()V

    .line 97
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->changeWallpaper(Z)V

    .line 98
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->refreshAutoSize()V

    .line 99
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->scheduleRefreshAutoSize()V

    .line 100
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hasFocus"
        }
    .end annotation

    .line 181
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onWindowFocusChanged(Z)V

    .line 182
    if-eqz p1, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->hideSysBar()V

    .line 184
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->scheduleRefreshAutoSize()V

    .line 186
    :cond_0
    return-void
.end method

.method protected setLoadSir(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 246
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    if-nez v0, :cond_0

    .line 247
    invoke-static {}, Lcom/kingja/loadsir/core/LoadSir;->getDefault()Lcom/kingja/loadsir/core/LoadSir;

    move-result-object v0

    new-instance v1, Lcom/github/tvbox/osc/base/BaseActivity$4;

    invoke-direct {v1, p0}, Lcom/github/tvbox/osc/base/BaseActivity$4;-><init>(Lcom/github/tvbox/osc/base/BaseActivity;)V

    invoke-virtual {v0, p1, v1}, Lcom/kingja/loadsir/core/LoadSir;->register(Ljava/lang/Object;Lcom/kingja/loadsir/callback/Callback$OnReloadListener;)Lcom/kingja/loadsir/core/LoadService;

    move-result-object v0

    iput-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    .line 253
    :cond_0
    return-void
.end method

.method protected showEmpty()V
    .locals 2

    .line 286
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->hideBrandLoading()V

    .line 287
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    if-eqz v0, :cond_0

    .line 288
    const-class v1, Lcom/github/tvbox/osc/callback/EmptyCallback;

    invoke-virtual {v0, v1}, Lcom/kingja/loadsir/core/LoadService;->showCallback(Ljava/lang/Class;)V

    .line 290
    :cond_0
    return-void
.end method

.method protected showLoading()V
    .locals 5

    .line 256
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 257
    new-instance v0, Lcom/github/tvbox/osc/base/BaseActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/github/tvbox/osc/base/BaseActivity$$ExternalSyntheticLambda0;-><init>(Lcom/github/tvbox/osc/base/BaseActivity;)V

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 258
    return-void

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->brandLoadingOverlay:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 261
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Lcom/github/tvbox/osc/base/BaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 262
    .local v0, "content":Landroid/view/ViewGroup;
    if-eqz v0, :cond_1

    .line 263
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d0085

    .line 264
    invoke-virtual {v2, v3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/github/tvbox/osc/base/BaseActivity;->brandLoadingOverlay:Landroid/view/View;

    .line 265
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 269
    .end local v0    # "content":Landroid/view/ViewGroup;
    :cond_1
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->brandLoadingOverlay:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 270
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 271
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->brandLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    goto :goto_0

    .line 272
    :cond_2
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    if-eqz v0, :cond_3

    .line 273
    const-class v1, Lcom/github/tvbox/osc/callback/LoadingCallback;

    invoke-virtual {v0, v1}, Lcom/kingja/loadsir/core/LoadService;->showCallback(Ljava/lang/Class;)V

    .line 275
    :cond_3
    :goto_0
    return-void
.end method

.method protected showSuccess()V
    .locals 1

    .line 293
    invoke-direct {p0}, Lcom/github/tvbox/osc/base/BaseActivity;->hideBrandLoading()V

    .line 294
    iget-object v0, p0, Lcom/github/tvbox/osc/base/BaseActivity;->mLoadService:Lcom/kingja/loadsir/core/LoadService;

    if-eqz v0, :cond_0

    .line 295
    invoke-virtual {v0}, Lcom/kingja/loadsir/core/LoadService;->showSuccess()V

    .line 297
    :cond_0
    return-void
.end method
