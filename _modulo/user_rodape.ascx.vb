
Partial Class _modulo_user_rodape
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        rodape.Text = "© JOBCLICK. 1998 | " & Year(Now())
    End Sub
End Class
