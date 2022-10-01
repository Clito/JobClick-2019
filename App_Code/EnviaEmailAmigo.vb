Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.Text.Encoding
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class EnviaEmailAmigo
    Public Function enviar(ByVal EnviarPara As String, ByVal EmailEnviarPara As String, ByVal sBody As String, ByVal sSubject As String, ByVal EnviadoPor As String, ByVal EmailEnviadoPor As String, ByVal sSMTP As String) As Boolean

        Dim Status As Boolean = False
        Status = EnviarmensagemSQLretorno(sBody, sSubject, EmailEnviarPara)
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

        Status = EnviarmensagemSQLretorno(bodyRES, "Um(a) amigo(a) lembrou de você no JobClick!", EmailEnviarPara)

        Return Status

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

        Catch ex As Exception

        End Try

    End Sub

End Class
