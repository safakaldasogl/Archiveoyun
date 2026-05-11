.class Lcom/archiveoyun/app/MainActivity$1;
.super Landroid/webkit/WebChromeClient;

.field final synthetic this$0:Lcom/archiveoyun/app/MainActivity;

.method constructor <init>(Lcom/archiveoyun/app/MainActivity;)V
    .registers 2
    iput-object p1, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .registers 6
    # p1 = webView, p2 = filePathCallback, p3 = fileChooserParams

    # Önceki callback varsa iptal et
    iget-object v0, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    iget-object v1, v0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;
    if-eqz v1, :no_prev

    const/4 v2, 0x0
    invoke-interface {v1, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :no_prev
    # Yeni callback'i sakla
    iget-object v0, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    iput-object p2, v0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    # Intent oluştur
    new-instance v1, Landroid/content/Intent;
    const-string v2, "android.intent.action.GET_CONTENT"
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "*/*"
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;
    move-result-object v2

    # startActivityForResult
    iget-object v0, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    const/4 v3, 0x1
    invoke-virtual {v0, v1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v0, 0x1
    return v0
.end method
