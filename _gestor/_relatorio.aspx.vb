
Partial Class _gestor_relatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresa_Pai As String = Session("idCadastroEmpresa_Pai")

        If idCadastroEmpresa_Pai = "" Then
            Response.Redirect("Default.aspx")
        End If

        idCadastroEmpresa_PaiLabel.Text = Session("idCadastroEmpresa_Pai")
        idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")

    End Sub

    Protected Sub RadioButtonListConsultor_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonListConsultor.SelectedIndexChanged
        idRH_GestorLabel.Text = RadioButtonListConsultor.SelectedValue
    End Sub
End Class
