
Partial Class _admin_mailing
    Inherits System.Web.UI.Page


    Protected Sub GridViewCampanha_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewCampanha.SelectedIndexChanged
        idCampanhaLabel.Text = GridViewCampanha.SelectedDataKey("idCampanha")
    End Sub
End Class
