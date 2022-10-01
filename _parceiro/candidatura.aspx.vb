Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiro_candidatura
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PanelCVCandidato.Visible = False
    End Sub

    Protected Sub GridViewCandidatura_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCandidatura.SelectedIndexChanged

        idCurriculoLabel.Text = GridViewCandidatura.SelectedDataKey("idcurriculo")
        PanelCVCandidato.Visible = True

    End Sub

    Protected Sub GridViewListaVagas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaVagas.SelectedIndexChanged
        codigoLabel.Text = GridViewListaVagas.SelectedDataKey("codigo")
    End Sub
End Class
