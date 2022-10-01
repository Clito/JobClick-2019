
Partial Class _modulo_user_navegador
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Navegador As String = ""

        ImageButtonLogo.ImageUrl = "~/images/logoPrincipal_" & Session("SETLayout") & ".png"
        ImageButtonLogo.PostBackUrl = "/_user/"

        navegadorLabel.Text = ""

        Navegador = Navegador & "<table>" & Chr(10)
        Navegador = Navegador & "<tr>" & Chr(10)
        Navegador = Navegador & "<td><a href='/_user'>Home</a></td>" & Chr(10)
        Navegador = Navegador & "<td>&nbsp;|&nbsp;</td>" & Chr(10)
        Navegador = Navegador & "<td><a href='/_modulo/Default.aspx'>Enviar</a></td>" & Chr(10)
        Navegador = Navegador & "<td>&nbsp;|&nbsp;</td>" & Chr(10)
        Navegador = Navegador & "<td><a href='/_modulo/relatorio.aspx'>Relatórios</a></td>" & Chr(10)
        Navegador = Navegador & "<td>&nbsp;|&nbsp;</td>" & Chr(10)
        Navegador = Navegador & "<td><a href='/logout.aspx'>Sair</a></td>" & Chr(10)
        Navegador = Navegador & "</tr>" & Chr(10)
        Navegador = Navegador & "</table>" & Chr(10)

        navegadorLabel.Text = Navegador

    End Sub

End Class
