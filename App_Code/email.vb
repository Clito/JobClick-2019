Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Net.Mail
Imports System.Text.Encoding

Public Class email

    Public Function enviar(ByVal sBody As String, ByVal EnviarPara As String, ByVal EmailEnviarPara As String, ByVal idsetup As Int32) As Boolean

        REM ** *****************************************************************************
        REM ** RECUPERA AS VARIÁVEIS DE ENVIO DE E-MAIL NO BANCO DE DADOS
        REM ** *****************************************************************************

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim EmailEnviadoPor As String = ""
        Dim EnviadoPor As String = ""
        Dim sSMTP As String = ""
        Dim sSubject As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, meta, google FROM tbsetup WHERE (idsetup = " & idsetup & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then

                oReader.Read()

                EmailEnviadoPor = oReader("emailAdmin")
                EnviadoPor = oReader("nomeAdmin")
                sSMTP = oReader("sSMTP")
                sSubject = oReader("sSubject")

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Dim mail As New MailMessage()
        Dim logicerro As Boolean = True
        Dim sBodyFinal As String = sBody

        REM ** *****************************************************************************
        REM ** ENVIA EMAIL PARA USUÁRIO QUE UTILIZA O SISTEMA
        REM ** *****************************************************************************

        mail.From = New MailAddress(EmailEnviadoPor, EnviadoPor)
        mail.To.Add(EmailEnviarPara)

        mail.Subject = sSubject
        mail.IsBodyHtml = True
        mail.Body = sBodyFinal
        mail.Priority = MailPriority.Normal

        mail.SubjectEncoding = GetEncoding("ISO-8859-1")
        mail.BodyEncoding = GetEncoding("ISO-8859-1")

        Dim objSmtp As New SmtpClient
        objSmtp.Host = sSMTP

        Try
            objSmtp.Send(mail)
            logicerro = True

        Catch ex As Exception

            logicerro = False

        End Try

        Return logicerro

        mail.Dispose()

    End Function


    Public Function enviarAdmin(ByVal Assunto As String, ByVal EnviarPara As String, ByVal EmailEnviarPara As String, ByVal idsetup As Integer) As String

        REM ** *****************************************************************************
        REM ** ENVIA EMAIL PARA O ADMINISTRADOR DO SISTEMA
        REM ** *****************************************************************************

        REM ** *****************************************************************************
        REM ** RECUPERA AS VARIÁVEIS DE ENVIO DE E-MAIL NO BANCO DE DADOS
        REM ** *****************************************************************************

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim EmailEnviadoPor As String = ""
        Dim EnviadoPor As String = ""
        Dim sSMTP As String = ""
        Dim sSubject As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, meta, google FROM tbsetup WHERE (idsetup = " & idsetup & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then

                oReader.Read()

                EmailEnviadoPor = oReader("emailAdmin")
                EnviadoPor = oReader("nomeAdmin")
                sSMTP = oReader("sSMTP")
                sSubject = oReader("sSubject")

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()


        Dim mail As New MailMessage()
        Dim sBodyAdmin As String = ""
        Dim logicerro As Boolean = True

        sBodyAdmin = sBodyAdmin & "<table border='0' width='100%' id='table1' cellspacing='0' cellpadding='0'>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<tr>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<td><font face='Verdana' size='1'><b>Administrador </b>(Mensagem automática)</font></td>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "</tr>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<tr>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<td><font face='Verdana' size='1'>Aviso:<br>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "O sistema de e-mail do site foi utilizado gerando um registro no bando de dados.<br>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "&nbsp;</font></td>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "</tr>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<tr>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<td><font face='Verdana' size='1'><br>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "<br>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "Referente: " + Assunto + "<br>Nome: " + EnviarPara + " <br>E-Mail: " + EmailEnviarPara + "</font></td>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "</tr>" & Chr(10)
        sBodyAdmin = sBodyAdmin & "</table>" & Chr(10)


        mail.From = New MailAddress(EmailEnviarPara, EnviarPara)
        mail.To.Add(EmailEnviadoPor)


        mail.Subject = sSubject
        mail.IsBodyHtml = True
        mail.Body = sBodyAdmin

        mail.Priority = MailPriority.Normal

        mail.SubjectEncoding = GetEncoding("ISO-8859-1")
        mail.BodyEncoding = GetEncoding("ISO-8859-1")

        Dim objSmtp As New SmtpClient
        objSmtp.Host = sSMTP

        Try
            objSmtp.Send(mail)
            logicerro = True

        Catch ex As Exception

            logicerro = False

        End Try

        Return logicerro

        mail.Dispose()

    End Function



    Function RecuperaSenhaHot(ByVal dbBody As String, ByVal email As String, ByVal URL As String, ByVal IP As String, ByVal idsetup As Int32) As Boolean

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim sBody As String = ""
        Dim iBody As String = ""
        Dim status As Boolean = False

        Dim EmailEnviarPara As String, userName As String, password As String

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idUser, idTypeUser, userName, password, email, frase, bloquear, data FROM tbuser WHERE (email = '" + email + "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            If oReader.HasRows() Then

                oReader.Read()

                EmailEnviarPara = oReader("email")
                userName = oReader("userName")
                password = oReader("password")


                sBody = sBody & "<html>" & Chr(10)

                sBody = sBody & "<head>" & Chr(10)
                sBody = sBody & "<meta http-equiv='Content-Language' content='pt-br'>" & Chr(10)
                sBody = sBody & "<meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>" & Chr(10)
                sBody = sBody & "<title>Dados para acesso ao sistema JobClik</title>" & Chr(10)
                sBody = sBody & "<link rel='stylesheet' type='text/css' href='" + URL + "/App_Themes/jobclick.css'>" & Chr(10)
                sBody = sBody & "</head>" & Chr(10)

                sBody = sBody & "<body>" & Chr(10)

                iBody = iBody & "<table width='500px' border='0' id='Dados de acesso'>" & Chr(10)
                iBody = iBody & "<tr>" & Chr(10)
                iBody = iBody & "<td><span class='stylemail'>Caro usuário,</span></td>" & Chr(10)
                iBody = iBody & "</tr>" & Chr(10)
                iBody = iBody & "<tr>" & Chr(10)
                iBody = iBody & "<td><span class='stylemail'>Foi solicitado o envio de informações para o acesso ao site www.jobclick.com.br.</span></td>" & Chr(10)
                iBody = iBody & "</tr>" & Chr(10)
                iBody = iBody & "<tr>" & Chr(10)
                iBody = iBody & "<td><span class='stylemail'>Atendendo a esta solicitação enviamos os seus dados:<br>" & Chr(10)
                iBody = iBody & "<br>" & Chr(10)
                iBody = iBody & "Senha de acesso: " + password + "<br>" & Chr(10)
                iBody = iBody & "<br>" & Chr(10)
                iBody = iBody & "Agradecemos seu contato,<br>" & Chr(10)
                iBody = iBody & "Administração<br>" & Chr(10)
                iBody = iBody & "<br>" & Chr(10)
                iBody = iBody & "<b>Obs.:</b><br>" & Chr(10)
                iBody = iBody & "Caso não tenha solicitado este e-mail, pedimos para avisar o ocorrido para que possamos tomar as providências cabíveis.<br><br>" & Chr(10)
                iBody = iBody & "IP: " + IP + "</td></span>" & Chr(10)
                iBody = iBody & "</tr>" & Chr(10)
                iBody = iBody & "</table>" & Chr(10)

                REM ** ***************************************************************************************************
                sBody = sBody & Replace(Replace(dbBody, "#", iBody), "*", URL)
                REM ** ***************************************************************************************************

                sBody = sBody & "</body>" & Chr(10)
                sBody = sBody & "</html>" & Chr(10)

                If EnviarmensagemSQLretorno(sBody, "Senha de acesso", EmailEnviarPara) Then
                    status = True
                End If

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Return status

    End Function



    Function RecuperaSenha(ByVal dbBody As String, ByVal email As String, ByVal URL As String, ByVal IP As String, ByVal idsetup As Int32) As String

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim sBody As String = ""
        Dim iBody As String = ""
        Dim status As String = ""

        Dim EmailEnviarPara As String, userName As String, password As String

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idUser, idTypeUser, userName, password, email, frase, bloquear, data FROM tbuser WHERE (email = '" + email + "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            If oReader.HasRows() Then

                oReader.Read()

                EmailEnviarPara = oReader("email")
                userName = oReader("userName")
                password = oReader("password")


                sBody = sBody & "<html>" & Chr(10)

                sBody = sBody & "<head>" & Chr(10)
                sBody = sBody & "<meta http-equiv='Content-Language' content='pt-br'>" & Chr(10)
                sBody = sBody & "<meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>" & Chr(10)
                sBody = sBody & "<title>Dados para acesso ao sistema JobClik</title>" & Chr(10)
                sBody = sBody & "<link rel='stylesheet' type='text/css' href='" + URL + "/App_Themes/jobclick.css'>" & Chr(10)
                sBody = sBody & "</head>" & Chr(10)

                sBody = sBody & "<body>" & Chr(10)

                iBody = iBody & "<table width='500px' border='0' id='Dados de acesso'>" & Chr(10)
                iBody = iBody & "<tr>" & Chr(10)
                iBody = iBody & "<td><span class='stylemail'>Caro usuário,</span></td>" & Chr(10)
                iBody = iBody & "</tr>" & Chr(10)
                iBody = iBody & "<tr>" & Chr(10)
                iBody = iBody & "<td><span class='stylemail'>Foi solicitado o envio de informações para o acesso ao site www.jobclick.com.br.</span></td>" & Chr(10)
                iBody = iBody & "</tr>" & Chr(10)
                iBody = iBody & "<tr>" & Chr(10)
                iBody = iBody & "<td><span class='stylemail'>Atendendo a esta solicitação enviamos os seus dados:<br>" & Chr(10)
                iBody = iBody & "<br>" & Chr(10)
                iBody = iBody & "Usuário (Nickname): " + userName + "<br>" & Chr(10)
                iBody = iBody & "Senha de acesso: " + password + "<br>" & Chr(10)
                iBody = iBody & "<br>" & Chr(10)
                iBody = iBody & "Agradecemos seu contato,<br>" & Chr(10)
                iBody = iBody & "Administração<br>" & Chr(10)
                iBody = iBody & "<br>" & Chr(10)
                iBody = iBody & "<b>Obs.:</b><br>" & Chr(10)
                iBody = iBody & "Caso não tenha solicitado este e-mail, pedimos para avisar o ocorrido para que possamos tomar as providências cabíveis.<br><br>" & Chr(10)
                iBody = iBody & "IP: " + IP + "</td></span>" & Chr(10)
                iBody = iBody & "</tr>" & Chr(10)
                iBody = iBody & "</table>" & Chr(10)

                REM ** ***************************************************************************************************
                sBody = sBody & Replace(Replace(dbBody, "#", iBody), "*", URL)
                REM ** ***************************************************************************************************

                sBody = sBody & "</body>" & Chr(10)
                sBody = sBody & "</html>" & Chr(10)

                If EnviarmensagemSQLretorno(sBody, "Senha de acesso", EmailEnviarPara) Then
                    status = "Foi enviado e-mail contendo todas as informações necessárias para efetuar o login no sistema JobClick, caso houver alguma dúvida entre em contato com nosso administrador"
                Else
                    status = "Houve uma falha ao tentar enviar o e-mail de recuperação de acesso, a conta existe porém o servidor de e-mails está fora do ar.<br>Tente novamente mais tarde.<br><br>Obrigado."
                End If

            Else

                status = "Usuário não foi encontrado em nosso sistema, informe o e-mail utilizado na criação de sua conta."

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Return status

    End Function

    REM ** ***************************************************************************************************
    REM ** VERIFICAR SEMPRE A tbmensagem PARA OBTER TODAS AS MENSAGENS CADASTRADAS (MODELO)
    REM ** CadastroC | CadastroE
    REM ** MÁXIMO DE 4 VARIÁVEIS #1# | #2# | #3# | #4#
    REM ** ***************************************************************************************************

    Public Function enviarDB(ByVal MODELO As String, ByVal URL As String, ByVal EnviarPara As String, ByVal EmailEnviarPara As String, ByVal idsetup As Integer, ByVal varU As String, ByVal varS As String, ByVal varF As String, ByVal varIp As String) As String

        REM ** *****************************************************************************
        REM ** RECUPERA AS VARIÁVEIS DE ENVIO DE E-MAIL NO BANCO DE DADOS
        REM ** *****************************************************************************

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim sBody As String = ""
        Dim mensagemRES As String = ""
        Dim sBodyRES As String = ""

        Dim EmailEnviadoPor As String = ""
        Dim EnviadoPor As String = ""
        Dim sSMTP As String = ""
        Dim sSubject As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, meta, google FROM tbsetup WHERE (idsetup = " & idsetup & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then

                oReader.Read()

                EmailEnviadoPor = oReader("emailAdmin")
                EnviadoPor = oReader("nomeAdmin")
                sSMTP = oReader("sSMTP")
                sSubject = oReader("sSubject")

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()
        oSQL = ""

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA (MENSAGEM E CORPO DO EMAIL
        REM ** ***************************************************************

        oSQL = "SELECT idmensagem, sbody, mensagem FROM tbmensagem WHERE (idmensagem = '" & MODELO & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            If oReader.HasRows() Then

                oReader.Read()

                sBody = oReader("sbody")

                Dim mensagem As String = oReader("mensagem")

                mensagemRES = Replace(Replace(Replace(Replace(mensagem, "#1#", varU), "#2#", varS), "#3#", varF), "#4#", varIp)
                sBodyRES = Replace(Replace(sBody, "#", mensagemRES), "*", URL)

                EnviamensagemSQL(sBodyRES, EnviarPara, EmailEnviarPara, sSubject)

            End If

        Catch ex As Exception

        End Try

        REM ** ***************************************************************
        REM ** VARIÁVEIS PADRÃO
        REM ** ***************************************************************

        oConnection.Close()
        oSQL = ""

        REM ** ***************************************************************
        REM ** [FIM] - CONFIGURAÇÃO DO SISTEMA (MENSAGEM E CORPO DO EMAIL
        REM ** ***************************************************************

        Dim logicerro As Boolean = True
        Return logicerro

    End Function

    Function EnviarmensagemSQLretorno(sBodyRES As String, sSubject As String, EmailEnviarPara As String) As Boolean
        Dim status As Boolean = False
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB_MSDB").ConnectionString)

        cmd = New SqlCommand("sp_send_dbmail", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@profile_name", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@profile_name").Value = "Helpdesk JobClick"

        prm = New SqlParameter("@recipients", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@recipients").Value = EmailEnviarPara

        prm = New SqlParameter("@blind_copy_recipients", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@blind_copy_recipients").Value = "helpdesk@jobclick.com.br"

        prm = New SqlParameter("@subject", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@subject").Value = sSubject

        prm = New SqlParameter("@body", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@body").Value = sBodyRES

        prm = New SqlParameter("@body_format", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@body_format").Value = "HTML"

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
            status = True
        Catch ex As Exception

        End Try
        Return status

    End Function

    Sub EnviamensagemSQL(sBodyRES As String, EnviarPara As String, EmailEnviarPara As String, sSubject As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim EMAIL_PARA_ENVIO As String = BodyDoEmail(sBodyRES)

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB_MSDB").ConnectionString)

        cmd = New SqlCommand("sp_send_dbmail", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@profile_name", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@profile_name").Value = "Helpdesk JobClick"

        prm = New SqlParameter("@recipients", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@recipients").Value = EmailEnviarPara

        prm = New SqlParameter("@blind_copy_recipients", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@blind_copy_recipients").Value = "helpdesk@jobclick.com.br"

        prm = New SqlParameter("@subject", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@subject").Value = sSubject

        prm = New SqlParameter("@body", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@body").Value = EMAIL_PARA_ENVIO

        prm = New SqlParameter("@body_format", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@body_format").Value = "HTML"

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

        Catch ex As Exception

        End Try

    End Sub

    Function BodyDoEmail(sBodyRES As String) As String

        Dim body As String = ""
        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT bodyDoEmail FROM tbsetup WHERE (idsetup = 1)"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()

                body = Replace(oReader("bodyDoEmail"), "#1#", sBodyRES)

            End If

        Catch ex As Exception

        End Try

        Return body

    End Function

End Class
