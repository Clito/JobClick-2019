
Partial Class _empresa_previewVaga
    Inherits System.Web.UI.Page

    Protected Sub FormViewAnuncio_DataBound(sender As Object, e As System.EventArgs) Handles FormViewAnuncio.DataBound
        Try
            CType(FormViewAnuncio.FindControl("HyperLinkVoltar"), HyperLink).NavigateUrl = "/_empresa/_atualizaVaga.aspx?autoTit=" & Request.QueryString("autoTit")
        Catch ex As Exception

        End Try
    End Sub
End Class
