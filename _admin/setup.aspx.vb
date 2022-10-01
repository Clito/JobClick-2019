
Partial Class _admin_setup
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        Session("idSetup_Adm") = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        GridViewEmpresa.Visible = False
    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs)
        idCadastroEmpresaLabel.Text = ""
        GridViewEmpresa.Visible = True
    End Sub
End Class
