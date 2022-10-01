Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.Text.Encoding
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class enviaemail

    Public Function enviar(ByVal EnviarPara As String, ByVal EmailEnviarPara As String, ByVal sBody As String, ByVal sSubject As String, ByVal EnviadoPor As String, ByVal EmailEnviadoPor As String, ByVal sSMTP As String) As Boolean

        Dim Status As Boolean = False

        Dim mail As New System.Net.Mail.MailMessage()

        Dim objSmtp As New System.Net.Mail.SmtpClient
        objSmtp.Host = sSMTP


        REM ** **************************************************************************
        REM ** ENVIA E-MAILs
        REM ** **************************************************************************

        mail.From = New MailAddress(EnviadoPor + Chr(60) + EmailEnviadoPor + Chr(62))

        mail.To.Add(EmailEnviarPara)

        mail.Subject = sSubject
        mail.IsBodyHtml = True
        mail.Body = sBody
        mail.Priority = MailPriority.Normal

        mail.SubjectEncoding = GetEncoding("ISO-8859-1")
        mail.BodyEncoding = GetEncoding("ISO-8859-1")

        Try
            objSmtp.Send(mail)
            Status = True
        Catch ex As Exception
            Status = False
        End Try

        mail.To.Clear()

        Return Status

    End Function

    Public Function enviarZoya(ByVal URL As String, ByVal EnviarPara As String, ByVal EmailEnviarPara As String, ByVal sSubject As String, ByVal EnviadoPor As String, ByVal EmailEnviadoPor As String, ByVal sSMTP As String, ByVal ID As String, ByVal Var1 As String, ByVal Var2 As String, ByVal Var3 As String, ByVal Var4 As String) As Boolean

        Dim dr As SqlDataReader = Nothing
        Dim resposta As Int32 = 0
        Dim sSQL As String
        Dim Connection As SqlConnection
        Dim bodyRES As String = ""
        Dim mensagemRES As String = ""

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idmensagem, sbody, mensagem FROM tbmensagem WHERE (idmensagem = '" & ID & "')"

        Try
            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                dr.Read()
                mensagemRES = Replace(Replace(Replace(Replace(dr("mensagem"), "#1#", Var1), "#2#", Var2), "#3#", Var3), "#4#", Var4)
                bodyRES = Replace(Replace(dr("sbody"), "#", mensagemRES), "*", URL)
            End If

        Catch ex As Exception

        End Try

        Dim Status As Boolean = False

        Dim mail As New System.Net.Mail.MailMessage()

        Dim objSmtp As New System.Net.Mail.SmtpClient
        objSmtp.Host = sSMTP


        REM ** **************************************************************************
        REM ** ENVIA E-MAILs
        REM ** **************************************************************************

        mail.From = New MailAddress(EnviadoPor + Chr(60) + EmailEnviadoPor + Chr(62))

        mail.To.Add(EmailEnviarPara)

        mail.Subject = sSubject
        mail.IsBodyHtml = True
        mail.Body = bodyRES
        mail.Priority = MailPriority.Normal

        mail.SubjectEncoding = GetEncoding("ISO-8859-1")
        mail.BodyEncoding = GetEncoding("ISO-8859-1")

        Try
            objSmtp.Send(mail)
            Status = True
        Catch ex As Exception
            Status = False
        End Try

        mail.To.Clear()

        Return Status

    End Function

End Class
