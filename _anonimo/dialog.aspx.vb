
Partial Class _anonimo_dialog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        LabelVaga.Text = LabelVaga.Text & Request.QueryString("id")
    End Sub
End Class
