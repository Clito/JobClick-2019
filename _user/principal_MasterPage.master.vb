
Partial Class _user_principal_MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" And Session("PWD") = "" Then
            Response.Redirect("/")
        End If
    End Sub

End Class

