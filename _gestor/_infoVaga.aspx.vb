
Partial Class _gestor_infoVaga
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresa_Pai As String = Session("idCadastroEmpresa_Pai")

        If idCadastroEmpresa_Pai = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub

    Protected Sub FormViewAnuncio_DataBound(sender As Object, e As System.EventArgs) Handles FormViewAnuncio.DataBound
        Try
            CType(FormViewAnuncio.FindControl("HyperLinkVoltar"), HyperLink).NavigateUrl = "/_empresa/_atualizaVaga.aspx?autoTit=" & Request.QueryString("autoTit")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewLevantamento_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewLevantamento.SelectedIndexChanged
        ProtocoloLabel.Text = GridViewLevantamento.SelectedDataKey("Protocolo")
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        ProtocoloLabel.Text = ""
    End Sub
End Class
