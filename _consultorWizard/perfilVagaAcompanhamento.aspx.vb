
Partial Class _empresa_perfilVagaAcompanhamento
    Inherits System.Web.UI.Page

    Protected Sub GridViewListaPerfilVaga_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaPerfilVaga.SelectedIndexChanged
        idPublicaPerfilVagaLabel.Text = GridViewListaPerfilVaga.SelectedDataKey("idPublicaPerfilVaga")
    End Sub
End Class
