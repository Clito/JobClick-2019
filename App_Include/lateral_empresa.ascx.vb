
Partial Class App_Include_lateral_empresa
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim montador As String = ""


        Select Case Session("idTypeUser")

            Case "EmpresaJobClick"

                montador = montador & "" & Chr(10)

                montador = montador & "<table border='0' cellpadding='0' cellspacing='0' id='navSuperior'>" & Chr(10)
                montador = montador & "<tr>" & Chr(10)

                REM ** HOME
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='Default.aspx'>Home</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** CONTA DE ACESSO
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='conta.aspx'>Conta</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** CADASTRO
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='cadastro.aspx'>Cadastro</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** PUBLICAÇÃO DE VAGAS
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='vagapublica.aspx'>Publicação de vagas</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** CANDIDATURAS
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='candidatura.aspx'>Candidaturas</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesqCredito.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#e0f6e4'><a href='credito.aspx'>Compra de Créditos</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdirCredito.gif'></td>" & Chr(10)
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


            Case "Empresa"


                montador = montador & "" & Chr(10)

                montador = montador & "<table border='0' cellpadding='0' cellspacing='0' id='navSuperior'>" & Chr(10)
                montador = montador & "<tr>" & Chr(10)

                REM ** HOME
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='Default.aspx'>Home</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** CONTA DE ACESSO
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='conta.aspx'>Conta</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** CADASTRO
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='cadastro.aspx'>Cadastro</a></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempdir.gif'></td>" & Chr(10)
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempnull.gif'></td>" & Chr(10)

                REM ** PUBLICAÇÃO DE VAGAS
                montador = montador & "<td>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navSempesq.gif'></td>" & Chr(10)
                montador = montador & "<td bgcolor='#E6F0F0'><a href='vagapublica.aspx'>Publicação de vagas</a></td>" & Chr(10)
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

            Case "RHUser"
                Session.Abandon()
                Session.Clear()
                FormsAuthentication.SignOut()
                Response.Redirect("/")

        End Select


        html.Text = montador

    End Sub

End Class
