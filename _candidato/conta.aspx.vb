
Partial Class _candidato_conta
    Inherits System.Web.UI.Page

    Protected Sub updAcesso(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated

        PanelAviso.Visible = True
        AVISOLABEL.Text = AVISOLABEL.Text & "• Sua conta de acesso foi atualizada com sucesso!<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub
End Class
