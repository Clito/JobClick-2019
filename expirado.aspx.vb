
Partial Class expirado
    Inherits System.Web.UI.Page

    Protected Sub LinkButtonHome_Click(sender As Object, e As System.EventArgs) Handles LinkButtonHome.Click
        Response.Redirect("/")
    End Sub
End Class
