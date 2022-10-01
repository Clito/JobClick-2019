
Partial Class _parceiro_REL_Candidato
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
        If Not IsPostBack Then
            DropDown_Empresa.SelectedValue = Session("idCadastroEmpresa")
        End If
    End Sub
End Class
