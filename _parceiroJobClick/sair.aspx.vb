
Partial Class _parceiroJobClick_sair
    Inherits System.Web.UI.Page

    Protected Sub LinkButtonSAIR_Click(sender As Object, e As EventArgs) Handles LinkButtonSAIR.Click

        FormsAuthentication.SignOut()
        Session.Abandon()
        Session.Clear()

        Response.Redirect("/default.aspx")

    End Sub
End Class
