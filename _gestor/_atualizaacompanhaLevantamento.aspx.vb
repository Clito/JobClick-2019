
Partial Class _gestor_atualizaacompanhaLevantamento
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresa_Filha As String = Session("idCadastroEmpresa_Filha")

        If idCadastroEmpresa_Filha = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub

    Protected Sub GridViewLevantamento_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewLevantamento.SelectedIndexChanged
        Response.Redirect("aprPerfilVaga.aspx?Protocolo=" & GridViewLevantamento.SelectedDataKey("Protocolo") & "&perfil_vaga_aprovado=" & GridViewLevantamento.SelectedDataKey("perfil_vaga_aprovado"))
    End Sub

End Class
