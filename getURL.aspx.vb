Imports Microsoft.VisualBasic

Partial Class _anonimo_getURL
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonURL_Click(sender As Object, e As System.EventArgs) Handles ButtonURL.Click
        Dim URL As String = Replace(Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, ""), Request.Url.Query, "")
        URLLabel.Text = URL
    End Sub
End Class
