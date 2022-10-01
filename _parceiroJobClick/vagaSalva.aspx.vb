
Partial Class _parceiroJobClick_vagaSalva
    Inherits System.Web.UI.Page

    Protected Sub GridViewMODELOLista_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewMODELOLista.SelectedIndexChanged
        Response.Redirect("/_parceiroJobClick/publicarNovaVaga.aspx?idMoleloVagaPublica=" & GridViewMODELOLista.SelectedDataKey("idMoleloVagaPublica"))
    End Sub
End Class
