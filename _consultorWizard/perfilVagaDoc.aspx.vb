
Partial Class _empresa_perfilVagaDoc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim context As HttpContext = HttpContext.Current
        idCadastroEmpresaFilhaLabel.Text = context.Items("idCadastroEmpresaFilha")
        idPerfilVagaLabel.Text = context.Items("idPerfilVaga")
        idCadastroEmpresaLabel.Text = context.Items("idCadastroEmpresa")
        protocoloLabel.Text = context.Items("Protocolo")

    End Sub

End Class
