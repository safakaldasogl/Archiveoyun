.class Lcom/archiveoyun/app/MainActivity$1;
.super Landroid/webkit/WebChromeClient;

.field final synthetic this$0:Lcom/archiveoyun/app/MainActivity;

.method constructor <init>(Lcom/archiveoyun/app/MainActivity;)V
    .registers 2
    # super() ÖNCE çağrılmalı, sonra field yazılabilir
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V
    iput-object p1, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    # p0=this, p1=webView, p2=filePathCallback, p3=fileChooserParams  => 4 params
    # .registers 8 => locals v0..v3, params p0=v4 p1=v5 p2=v6 p3=v7
    .registers 8

    # Önceki callback varsa null ile iptal et
    iget-object v0, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    iget-object v1, v0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;
    if-eqz v1, :no_prev
    const/4 v2, 0x0
    invoke-interface {v1, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :no_prev
    # Yeni callback'i kaydet
    iget-object v0, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    iput-object p2, v0, Lcom/archiveoyun/app/MainActivity;->filePathCallback:Landroid/webkit/ValueCallback;

    # Dosya seçici intent
    new-instance v1, Landroid/content/Intent;
    const-string v2, "android.intent.action.GET_CONTENT"
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const-string v2, "*/*"
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;
    move-result-object v2

    iget-object v3, p0, Lcom/archiveoyun/app/MainActivity$1;->this$0:Lcom/archiveoyun/app/MainActivity;
    const/4 v0, 0x1
    invoke-virtual {v3, v1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    const/4 v0, 0x1
    return v0
.end method
