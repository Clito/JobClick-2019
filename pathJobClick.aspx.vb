
Partial Class pathJobClick
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        path.Text = Request.PhysicalApplicationPath
    End Sub
End Class
