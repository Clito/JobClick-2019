
Partial Class _parceiro_REL_Candidato
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
    End Sub

    Protected Sub GridView_RegiaoIndexChanged(sender As Object, e As System.EventArgs) Handles GridView_Regiao.SelectedIndexChanged
        DropDown_Regiao.SelectedValue = GridView_Regiao.SelectedRow.Cells(1).Text
    End Sub

End Class
