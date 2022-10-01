
Partial Class _gestor_acompanhaPS
    Inherits System.Web.UI.Page

    Protected Sub GridViewAtr_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewAtr.SelectedIndexChanged
        PanelVISAO.Visible = False
        PanelPS.Visible = True
        ProtocoloLabel.Text = GridViewAtr.SelectedDataKey("Protocolo")
        CargoLabel.Text = GridViewAtr.SelectedDataKey("Cargo")
        idProcessoSeletivoLabel.Text = GridViewAtr.SelectedDataKey("idProcessoSeletivo")
        idRH_GestorLabel.Text = GridViewAtr.SelectedDataKey("idRH_Gestor")
        PanelResultadoPesquisa.Visible = True
        SqlDataSourcePesquisa.DataBind()
    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR.Click
        PanelVISAO.Visible = True
        PanelPS.Visible = False
        SqlDataSourcePesquisa.DataBind()
    End Sub
End Class
