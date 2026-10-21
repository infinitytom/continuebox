.class public final Lcom/github/tvbox/osc/sync/EmbyDirectDialog;
.super Ljava/lang/Object;
.source "EmbyDirectDialog.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static field(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "hint"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "hint"
        }
    .end annotation

    .line 65
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .local v0, "input":Landroid/widget/EditText;
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 66
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    return-object v0
.end method

.method static synthetic lambda$login$2(Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/content/Context;Ljava/lang/Runnable;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p0, "password"    # Landroid/widget/EditText;
    .param p1, "dialog"    # Landroid/app/AlertDialog;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "changed"    # Ljava/lang/Runnable;
    .param p4, "result"    # Lorg/json/JSONObject;
    .param p5, "error"    # Ljava/lang/String;

    .line 50
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 51
    if-eqz p5, :cond_0

    .line 52
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 53
    invoke-static {p2, p5, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 54
    return-void

    .line 56
    :cond_0
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 57
    const/4 v0, 0x0

    const-string v1, "Emby \u5df2\u76f4\u8fde"

    invoke-static {p2, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 58
    if-eqz p3, :cond_1

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 59
    :cond_1
    return-void
.end method

.method static synthetic lambda$login$3(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 4
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "address"    # Landroid/widget/EditText;
    .param p2, "username"    # Landroid/widget/EditText;
    .param p3, "password"    # Landroid/widget/EditText;
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "changed"    # Ljava/lang/Runnable;
    .param p6, "v"    # Landroid/view/View;

    .line 47
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 48
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 49
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda4;

    invoke-direct {v3, p3, p0, p4, p5}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda4;-><init>(Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 48
    invoke-static {v0, v1, v2, v3}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/github/tvbox/osc/sync/IntegrationClient$Callback;)V

    .line 60
    return-void
.end method

.method static synthetic lambda$login$4(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 9
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "address"    # Landroid/widget/EditText;
    .param p2, "username"    # Landroid/widget/EditText;
    .param p3, "password"    # Landroid/widget/EditText;
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "changed"    # Ljava/lang/Runnable;
    .param p6, "ignored"    # Landroid/content/DialogInterface;

    .line 46
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v8, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda3;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda3;-><init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic lambda$show$0(Landroid/content/Context;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "changed"    # Ljava/lang/Runnable;
    .param p2, "d"    # Landroid/content/DialogInterface;
    .param p3, "w"    # I

    .line 22
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog;->login(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$show$1(Landroid/content/Context;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "changed"    # Ljava/lang/Runnable;
    .param p2, "d"    # Landroid/content/DialogInterface;
    .param p3, "w"    # I

    .line 24
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->disconnect()V

    .line 25
    const-string v0, "\u5df2\u65ad\u5f00 Emby \u76f4\u8fde"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 26
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 27
    :cond_0
    return-void
.end method

.method private static login(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "changed"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "changed"
        }
    .end annotation

    .line 32
    move-object/from16 v7, p0

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object v8, v0

    .line 33
    .local v8, "box":Landroid/widget/LinearLayout;
    const/4 v0, 0x1

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41c00000    # 24.0f

    mul-float v0, v0, v1

    float-to-int v9, v0

    .line 35
    .local v9, "pad":I
    div-int/lit8 v0, v9, 0x2

    const/4 v1, 0x0

    invoke-virtual {v8, v9, v0, v9, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 36
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object v10, v0

    .line 37
    .local v10, "note":Landroid/widget/TextView;
    const-string v0, "\u76f4\u63a5\u767b\u5f55\u4f60\u81ea\u5df1\u7684 Emby \u7528\u6237\u3002\u5bc6\u7801\u53ea\u53d1\u9001\u7ed9\u8be5 Emby\uff0c\u767b\u5f55\u6210\u529f\u540e\u7acb\u5373\u4e22\u5f03\uff1b\u7528\u6237\u4ee4\u724c\u52a0\u5bc6\u4fdd\u5b58\u5728\u672c\u673a\u3002\u7ba1\u7406\u5458 API \u5bc6\u94a5\u4ecd\u53ea\u7559\u5728\u98de\u725b\u3002 "

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    const-string v0, "Emby \u5730\u5740\uff0c\u4f8b\u5982 http://192.168.1.100:8096"

    invoke-static {v7, v0}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog;->field(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v11

    .line 39
    .local v11, "address":Landroid/widget/EditText;
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->baseUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 40
    const-string v0, "Emby \u7528\u6237\u540d"

    invoke-static {v7, v0}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog;->field(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v12

    .line 41
    .local v12, "username":Landroid/widget/EditText;
    const-string v0, "Emby \u5bc6\u7801\uff08\u4e0d\u4f1a\u4fdd\u5b58\uff09"

    invoke-static {v7, v0}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog;->field(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v13

    .line 42
    .local v13, "password":Landroid/widget/EditText;
    const/16 v0, 0x81

    invoke-virtual {v13, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 43
    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v8, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v8, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 44
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u76f4\u8fde\u5c0f\u96c5 Emby"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 45
    const-string v1, "\u53d6\u6d88"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u767b\u5f55\u5e76\u8fde\u63a5"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v14

    .line 46
    .local v14, "dialog":Landroid/app/AlertDialog;
    new-instance v15, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda2;

    move-object v0, v15

    move-object v1, v14

    move-object v2, v11

    move-object v3, v12

    move-object v4, v13

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda2;-><init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Ljava/lang/Runnable;)V

    invoke-virtual {v14, v15}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 61
    invoke-virtual {v14}, Landroid/app/AlertDialog;->show()V

    .line 62
    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "changed"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "changed"
        }
    .end annotation

    .line 17
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->configured()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 18
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->accountName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Emby \u7528\u6237"

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->accountName()Ljava/lang/String;

    move-result-object v0

    .line 19
    .local v0, "name":Ljava/lang/String;
    :goto_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Emby \u5df2\u76f4\u8fde"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5f53\u524d\u7528\u6237\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n\u670d\u52a1\u5668\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    invoke-static {}, Lcom/github/tvbox/osc/sync/EmbyDirectClient;->baseUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n\n\u5a92\u4f53\u5e93\u4e0e\u64ad\u653e\u9ed8\u8ba4\u76f4\u8fde\uff1b\u98de\u725b\u4ec5\u8d1f\u8d23\u8de8\u8bbe\u5907\u540c\u6b65\u548c\u5f02\u5e38\u515c\u5e95\u3002"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 22
    const-string v3, "\u5173\u95ed"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    const-string v3, "\u91cd\u65b0\u767b\u5f55"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 23
    const-string v3, "\u65ad\u5f00\u76f4\u8fde"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 28
    .end local v0    # "name":Ljava/lang/String;
    goto :goto_1

    :cond_1
    invoke-static {p0, p1}, Lcom/github/tvbox/osc/sync/EmbyDirectDialog;->login(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 29
    :goto_1
    return-void
.end method
