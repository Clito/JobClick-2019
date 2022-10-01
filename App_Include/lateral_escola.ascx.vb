
Partial Class App_Include_lateral_escola
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim montador As String = ""

        If Session("idTypeUser") = "Escola" Then

            montador = montador & "" & Chr(10)

            montador = montador & "<table border='0' cellpadding='0' cellspacing='0' id='navSuperior'>" & Chr(10)
            montador = montador & "<tr>" & Chr(10)

            REM ** HOME
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
            montador = montador & "<td bgcolor='#E6F0F0'><a href='/_escola'>Home</a></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

            REM ** CONTA DE ACESSO
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
            montador = montador & "<td bgcolor='#E6F0F0'><a href='/_escola/conta.aspx'>Conta</a></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

            REM ** CADASTRO
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
            montador = montador & "<td bgcolor='#E6F0F0'><a href='/_escola/cadastro.aspx'>Cadastro</a></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

            REM ** ALUNOS CADASTRADOS
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
            montador = montador & "<td bgcolor='#E6F0F0'><a href='/_escola/aluno.aspx'>Alunos cadastrados no programa de estágio</a></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
            montador = montador & "<td bgcolor='#E6F0F0'><a href='../../logout.aspx'>Sair</a></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

            montador = montador & "</tr>" & Chr(10)
            montador = montador & "</table>" & Chr(10)

        
        End If

        html.Text = montador

    End Sub

End Class
