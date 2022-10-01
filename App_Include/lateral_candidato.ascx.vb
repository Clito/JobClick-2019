Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class App_Include_lateral_candidato
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim zoyaView As String = ""

        If Session("idCadastroUser") <> "" Then

            Dim oSQL As String = ""
            Dim oReader As SqlDataReader = Nothing
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT tbCadastroUser.idCadastroUser, tbZoya.idZoya FROM tbCadastroUser LEFT OUTER JOIN tbZoya ON tbCadastroUser.idCadastroUser = tbZoya.idCadastroUser WHERE (tbCadastroUser.idCadastroUser = " & Session("idCadastroUser") & ")"

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                oReader.Read()

                Try

                    If Not oReader("idZoya") Is DBNull.Value Then
                        Session("idZoya") = oReader("idZoya")
                        zoyaView = "<a href='zoyaview.aspx'>Zoya:)</a>"
                    Else
                        zoyaView = ""
                    End If

                Catch ex As Exception

                End Try

            Else

            End If

            oReader.Close()
            oConnection.Close()

        End If

        Dim montador As String = ""
        Dim largura As String = "180px"
        Dim larguraint As String = "154px"
        Dim cor As String = "#FFFFFF"

        Dim agenda As String = "Agenda"
        Dim zoya As String = "Profile no Zoya:)"

        Dim icone As String = "ind_bativo.gif"
        Dim perfil As String = "" REM "Perfil Profissional"
        Dim objetivo As String = "Sumário"
        Dim qualificacao As String = "" REM "Qualificação Profissional"
        Dim experiencia As String = "Experiência Profissional"
        Dim formacao As String = "Formação Acadêmica"
        Dim curso As String = "Cursos Complementares"
        Dim conhecimento As String = "Conhecimentos em Informática"
        Dim idioma As String = "Idiomas"
        Dim informacoes As String = "Informações Adicionais"
        Dim intecambio As String = "Intercâmbio"
        Dim curriculo As String = "Ver Currículo"
        Dim publicar As String = "Enviar Currículo"
        Dim VagasPublicas As String = "Vagas WEB"

        If Session("idcurriculo") <> "" Then

            icone = "ind_nativo.gif"

            perfil = "" REM "<a href='perfil.aspx'>Perfil Profissional</a>"

            zoya = "<a href='zoya.aspx'>Profile no Zoya:)</a>"

            agenda = "<a href='agenda.aspx'>Agenda</a>"

            objetivo = "<a href='objetivo.aspx'>Sumário</a>"
            qualificacao = "" REM "<a href='qualificacao.aspx'>Qualificação Profissional</a>"
            experiencia = "<a href='experiencia.aspx'>Experiência Profissional</a>"
            formacao = "<a href='formacao.aspx'>Formação Acadêmica</a>"
            curso = "<a href='cursos.aspx'>Cursos Complementares</a>"
            conhecimento = "<a href='conhecimento.aspx'>Conhecimentos em Informática</a>"
            idioma = "<a href='idiomas.aspx'>Idiomas</a>"
            informacoes = "<a href='informacoes.aspx'>Informações Adicionais</a>"
            intecambio = "<a href='intercambio.aspx'>Intercâmbio</a>"
            curriculo = "<a href='mycurriculo.aspx'>Ver Currículo</a>"
            publicar = "<a href='publicar.aspx'>Enviar Currículo</a>"
            VagasPublicas = "<a href='vagaspublicas.aspx'>Vagas WEB</a>"

        End If

        montador = montador & "" & Chr(10)

        montador = montador & "<table border='0' id='LateralCandidato' cellspacing='0' cellpadding='0'>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td><b>&nbsp;Currículos</b><br><br></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)

        REM ** **************************************************************************************
        REM ** NOVA TABELA
        REM ** **************************************************************************************

        montador = montador & "<table border='0' id='Links' cellspacing='0' cellpadding='0'>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
        montador = montador & "<td width='169'><a href='Default.aspx'>Página inicial</a></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
        montador = montador & "<td width='169'><a href='cv.aspx'>Selecionar Currículo</a></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td><img border='0' src='/images/layout/navega_sup/15px.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td bgcolor='#FF0000'>" & Chr(10)
        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td bgcolor='#808080'><img border='0' src='/images/layout/navega_sup/1px.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)
        montador = montador & "</td>" & Chr(10)
        montador = montador & "<td><img border='0' src='/images/layout/navega_sup/15px.gif'></td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        montador = montador & "</table>" & Chr(10)

        REM ** **************************************************************************************
        REM ** [FIM] - NOVA TABELA
        REM ** **************************************************************************************

        montador = montador & "</td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)

        If Session("idcurriculo") <> "" Then

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td><b>&nbsp;Perfil Profissional</b><br><br></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

        End If

        montador = montador & "<tr>" & Chr(10)
        montador = montador & "<td>" & Chr(10)

        If Session("idcurriculo") <> "" Then


            montador = montador & "<table border='0' id='Links' cellspacing='0' cellpadding='0'>" & Chr(10)

            If agenda <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + agenda + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If


            If objetivo <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + objetivo + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If formacao <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + formacao + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If curso <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + curso + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If conhecimento <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + conhecimento + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If perfil <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + perfil + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If qualificacao <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + qualificacao + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If experiencia <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + experiencia + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If idioma <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + idioma + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If informacoes <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + informacoes + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If intecambio <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + intecambio + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If curriculo <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + curriculo + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If

            If publicar <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + publicar + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If





            If VagasPublicas <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + VagasPublicas + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If





            If zoya <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td>&nbsp;</td>" & Chr(10)
                montador = montador & "<td>&nbsp;</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + zoya + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If


            If zoyaView <> "" Then

                montador = montador & "<tr>" & Chr(10)
                montador = montador & "<td valign='top'>" & Chr(10)
                montador = montador & "<img border='0' src='/images/layout/navega_sup/" + icone + "'></td>" & Chr(10)
                montador = montador & "<td>" + zoyaView + "</td>" & Chr(10)
                montador = montador & "</tr>" & Chr(10)

            End If


            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td>" & Chr(10)
            montador = montador & "</td>" & Chr(10)
            montador = montador & "<td><img border='0' src='/images/layout/navega_sup/15px.gif'></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)


            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td bgcolor='#FF0000'>" & Chr(10)
            montador = montador & "</td>" & Chr(10)
            montador = montador & "<td bgcolor='#808080'><img border='0' src='/images/layout/navega_sup/1px.gif'></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "</table>" & Chr(10)

        End If

        montador = montador & "</td>" & Chr(10)
        montador = montador & "</tr>" & Chr(10)
        montador = montador & "</table>" & Chr(10)

        REM ** HELPDESK
        REM ** ******************************************************************************************************

        montador = montador & "<table border='0' id='help'>"
        montador = montador & "<tr>"
        montador = montador & "<td valign='top'>"
        montador = montador & "<img border='0' src='/images/msn.gif'></td>"
        montador = montador & "<td><b>(MSN) Help!!!</b><br>jobclick@hotmail.com</td>"
        montador = montador & "</tr>"
        montador = montador & "</table>"

        html.Text = montador

    End Sub
End Class
