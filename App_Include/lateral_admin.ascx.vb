
Partial Class App_Include_lateral_admin
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim montador As String = ""
        Dim largura As String = "180px"
        Dim larguraint As String = "154px"
        Dim cor As String = "#FFFFFF"

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='Default.aspx'>Home</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='produtoJobclick.aspx'>e-commerce JobClick</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='menu.aspx'>Menu Clientes</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='contrato.aspx'>Contratos</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='home.aspx'>Conteúdo HOME</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='navegador.aspx'>Navegador Empresa</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='reenvio_email.aspx'>Reenviar e-mails</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='avisoHomePage.aspx'>Avisos HOME</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='setup.aspx'>Setup Empresas</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='albumZoya.aspx'>Album do Zoya</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='emailCandidato.aspx'>CRM (Candidatos)</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='emailEmpresa.aspx'>CRM (Empresas)</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='emailEscola.aspx'>CRM (Escolas)</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='empresa.aspx'>Cadastro de Empresas</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='user.aspx'>Usuários</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='faqAdm.aspx'>Gerenciar FAQ</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='faq.aspx'>Responder e-mails</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='funcao.aspx'>Gerenciar Função (Cargo)</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='idioma.aspx'>Gerenciar Idioma</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='instituicao.aspx'>Gerenciar Instituição</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='vagasPublicas.aspx'>Vagas Públicas</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='viewvagaspublicas.aspx'>Vagas Públicas (Layout)</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='mensagem.aspx'>Gerenciar corpo de e-mail</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)


        montador = montador & "<table border='0' width='" + largura + "' id='lateral' cellspacing='0' cellpadding='0' bgcolor='" + cor + "'>" & Chr(10)
        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td width='16'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_ini.gif'></td>" & Chr(10)
        montador = montador & "<td width='" + larguraint + "'><a class='left' href='../../logout.aspx'>Sair</a></td>" & Chr(10)
        montador = montador & "<td width='10'>" & Chr(10)
        montador = montador & "<img border='0' src='/images/lateral_fim.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)



        html.Text = montador

    End Sub

End Class
