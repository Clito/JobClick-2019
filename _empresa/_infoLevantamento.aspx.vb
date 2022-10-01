
Partial Class _empresa_infoLevantamento
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub GridViewListaPerfil_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaPerfil.SelectedIndexChanged
        Response.Redirect("_cadastroLevantamento.aspx?autoTit=Acompanhamento dos Levantamento apresentados&idPerfilVaga=" & GridViewListaPerfil.SelectedDataKey("idPerfilVaga") & "&Protocolo=" & GridViewListaPerfil.SelectedDataKey("Protocolo") & "&idRH_Gestor=" & GridViewListaPerfil.SelectedDataKey("idRH_Gestor") & "&data_criacao=" & GridViewListaPerfil.SelectedDataKey("data_criacao") & "&idCadastroEmpresa=" & GridViewListaPerfil.SelectedDataKey("idCadastroEmpresa") & "&idCadastroEmpresaFilha=" & GridViewListaPerfil.SelectedDataKey("idCadastroEmpresa_Filha") & "&nmempresa=" & GridViewListaPerfil.SelectedDataKey("nmempresa"))
    End Sub

End Class
