
Partial Class _empresa_infoCliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub GridViewCliente_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCliente.SelectedIndexChanged
        idCadastroEmpresaLabel.Text = GridViewCliente.SelectedDataKey("idCadastroEmpresa")
        idCadastroEmpresaPaiLabel.Text = GridViewCliente.SelectedDataKey("idCadastroEmpresa_Pai")
        ImageButtonADES.Visible = True
    End Sub

    Protected Sub ImageButtonADES_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonADES.Click
        Response.Redirect("_atualizacadastroCliente.aspx?autoTit=Atualiza%20informações%20das%20Empresas&idCadastroEmpresa=" & idCadastroEmpresaLabel.Text & "&idCadastroEmpresa_Pai=" & idCadastroEmpresaPaiLabel.Text)
    End Sub

    Protected Sub ImageButtonCNC_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCNC.Click
        Response.Redirect("/_empresa/_cadastroCliente.aspx?autoTit=Cadastro%20de%20novo%20Cliente")
    End Sub
End Class
