﻿Imports Microsoft.VisualBasic
Imports System.Text.Encoding
Imports System.IO
Imports System.Net.Mail
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class ErrHandler

    Public Shared Sub WriteError(ByVal errorMessage As String)

        Try
            Dim path As String = "~/Error/" & DateTime.Today.ToString("dd-mm-yyyy") & ".txt"
            If (Not File.Exists(System.Web.HttpContext.Current.Server.MapPath(path))) Then
                File.Create(System.Web.HttpContext.Current.Server.MapPath(path)).Close()
            End If
            Using w As StreamWriter = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(path))
                w.WriteLine(Constants.vbCrLf & "Log Entry : ")
                w.WriteLine("{0}", DateTime.Now.ToString)
                Dim err As String = "Error in: " & System.Web.HttpContext.Current.Request.Url.ToString() & ". Error Message:" & errorMessage
                w.WriteLine(err)
                w.WriteLine("__________________________")
                w.Flush()
                w.Close()
            End Using
        Catch ex As Exception
            WriteError(ex.Message)
        End Try

        GetErrorSys(errorMessage)

    End Sub

    Public Shared Sub GetErrorSys(sBodyRES As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim status As Boolean = False

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
        cmd.Parameters("@recipients").Value = "helpdesk@jobclick.com.br"

        prm = New SqlParameter("@blind_copy_recipients", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@blind_copy_recipients").Value = "helpdesk@jobclick.com.br"

        prm = New SqlParameter("@subject", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@subject").Value = "Erro no sistema"

        prm = New SqlParameter("@body", SqlDbType.Text)
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
            status = True
            cn.Close()

        Catch ex As Exception

        End Try


    End Sub

End Class
