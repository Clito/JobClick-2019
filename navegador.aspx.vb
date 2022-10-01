
Partial Class navegador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim jsVersion As String
        jsVersion = Request.Browser("EcmaScriptVersion").ToString & Request.Browser.ActiveXControls.ToString
        NavegadorLabel.Text = jsVersion
    End Sub
End Class
