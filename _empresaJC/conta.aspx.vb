
Partial Class _empresa_conta
    Inherits System.Web.UI.Page

    Protected Sub VaPara(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_empresaJC/default.aspx")
    End Sub

    Protected Sub updAcesso(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated

        If e.AffectedRows > 0 Then
            msn.CssClass = "msnOK"
            msn.Text = "Sua conta de acesso foi atualizada com sucesso!"
            AVISOLABEL.Text = "Sua conta de acesso foi atualizada com sucesso!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_empresaJC/images/buttonOK.png"
            PanelAviso.Visible = True
        End If

    End Sub
End Class
