
Partial Class varflash_varnavegador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Pagina As String = "cadastro"
        varFlashPagina.Visible = True
        varFlashPagina.Text = "&pagina=" + Pagina + "&"
    End Sub
End Class
