.class public Lcom/archiveoyun/app/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

.field private webView:Landroid/webkit/WebView;
.field filePathCallback:Landroid/webkit/ValueCallback;

.method public constructor <init>()V
    .registers 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    # p0=this, p1=savedInstanceState  => 2 params
    # .registers 7 => locals: v0..v4, params: v5=p0, v6=p1
    .registers 7
    .param p1, "savedInstanceState"

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Landroid/webkit/WebView;
    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/archiveoyun/app/MainActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v1

    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    new-instance v3, Lcom/archiveoyun/app/MainActivity$1;
    invoke-direct {v3, p0}, Lcom/archiveoyun/app/MainActivity$1;-><init>(Lcom/archiveoyun/app/MainActivity;)V
    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    const-string v4, "file:///android_asset/index.html"
    invoke-virtual {v0, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public onBackPressed()V
    .registers 3
    iget-object v0, p0, Lcom/archiveoyun/app/MainActivity;->webView:Landroid/webkit/WebView;
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z
    move-result v1
    if-eqz v1, :cond_no_back
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V
    return-void
    :cond_no_back
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    # p0=this, p1=requestCode, p2=resultCode, p3=data  => 4 params
    # .registers 9 => locals: v0..v4, params: v5=p0, v6=p1, v7=p2, v8=p3
    .registers 9
    .param p1, "requestCode"
    .param p2, "resultCode"
    .param p3, "data"

    const/4 v0, 0x1
    if-ne p1, v0, :cond_not_ours

    iget-object v1, p0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;
    if-eqz v1, :cond_done

    # RESULT_OK = -1
    const/4 v2, -0x1
    if-ne p2, v2, :cond_cancelled
    if-eqz p3, :cond_cancelled

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v3
    if-eqz v3, :cond_cancelled

    const/4 v4, 0x1
    new-array v4, v4, [Landroid/net/Uri;
    const/4 v0, 0x0
    aput-object v3, v4, v0
    invoke-interface {v1, v4}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    const/4 v0, 0x0
    iput-object v0, p0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;
    return-void

    :cond_cancelled
    const/4 v0, 0x0
    invoke-interface {v1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;
    return-void

    :cond_done
    return-void

    :cond_not_ours
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V
    return-void
.end method
