
Partial Class App_Include_navegador
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim montador As String = ""


        montador = montador & "<table border='0' width='375px' id='navegador' cellspacing='0' cellpadding='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<table align='right' border='0' id='navegador_int' cellspacing='0' cellpadding='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)

        montador = montador & "<table border='0' id='navegador_cel' cellpadding='0' cellspacing='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/ini.gif' width='11' height='17'></td>" & Chr(10)
        montador = montador & "<td background='/images/layout/navega_sup/bg.gif'>" & Chr(10)
        montador = montador & "<a href='/'>Home</a></td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/mdl.gif' width='15' height='17'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)


        montador = montador & "<table border='0' id='table5' cellpadding='0' cellspacing='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td></td>" & Chr(10)
        montador = montador & "<td background='/images/layout/navega_sup/bg.gif'>" & Chr(10)
        montador = montador & "<a href='/_candidato/cadastro.aspx'>Meu curriculo</a></td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/mdl.gif' width='15' height='17'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)


        montador = montador & "<table border='0' id='table6' cellpadding='0' cellspacing='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td></td>" & Chr(10)
        montador = montador & "<td background='/images/layout/navega_sup/bg.gif'>" & Chr(10)
        montador = montador & "<a href='/_anonimo/vagas.aspx'>Vagas</a></td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/mdl.gif' width='15' height='17'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)


        montador = montador & "<table border='0' id='table6' cellpadding='0' cellspacing='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td></td>" & Chr(10)
        montador = montador & "<td background='/images/layout/navega_sup/bg.gif'>" & Chr(10)
        montador = montador & "<a href='/_anonimo/empresa.aspx'>Empresas</a></td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/mdl.gif' width='15' height='17'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)


        montador = montador & "<table border='0' id='table6' cellpadding='0' cellspacing='0'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td></td>" & Chr(10)
        montador = montador & "<td background='/images/layout/navega_sup/bg.gif'>" & Chr(10)
        montador = montador & "<a href='/_anonimo/fap.aspx'>Ajuda</a></td>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/end.gif' width='10' height='17'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "</td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "</td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)

        montador = montador & "</td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        html.Text = montador


    End Sub
End Class
