
Partial Class _gestor_infoProcessoSeletivo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresa_Pai As String = Session("idCadastroEmpresa_Pai")

        If idCadastroEmpresa_Pai = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub
End Class
