
Partial Class _admin_clientes
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
    End Sub

End Class
