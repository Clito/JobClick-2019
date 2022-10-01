Imports System.Threading
Imports System.IO

Partial Class _empresa_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")
        HyperLink1.NavigateUrl = Application("urlapp") & "/_security/usercheck.aspx?id=" & Session("idRH_Gestor") & Session("idUser") & "&ticket=" & Session("ticket") & "&ip=" & Session("ip") & "&url=" & URL & "&key=" & Application("idCadastroEmpresa")
    End Sub

End Class
