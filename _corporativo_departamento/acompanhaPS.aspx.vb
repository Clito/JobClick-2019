
Partial Class _gestor_acompanhaPS
    Inherits System.Web.UI.Page

    Protected Sub GridViewAtr_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewAtr.SelectedIndexChanged
        PanelVISAO.Visible = False
        ProtocoloLabel.Text = Trim(GridViewAtr.SelectedDataKey("protocoloVaga"))
        CargoLabel.Text = Trim(GridViewAtr.SelectedDataKey("Cargo"))
        idProcessoSeletivoLabel.Text = Trim(GridViewAtr.SelectedDataKey("idProcessoSeletivo"))
        idRH_GestorLabel.Text = Trim(GridViewAtr.SelectedDataKey("idRH_Gestor"))
        PanelResultadoPesquisa.Visible = True
        SqlDataSourcePesquisa.DataBind()
        PanelPS.Visible = True
    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR.Click
        PanelVISAO.Visible = True
        PanelPS.Visible = False
        'SqlDataSourcePesquisa.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
    End Sub

End Class
