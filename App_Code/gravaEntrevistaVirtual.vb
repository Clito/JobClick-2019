Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web

Public Class gravaEntrevistaVirtual

    Public Sub GravaEntrevista_ENTREVISTADOR(ByVal RoomName As String, ByVal Message As String, ByVal UserName As String, ByVal MessageHTML As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_GRAVADOR]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaVirtual", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaVirtual").Value = System.Web.HttpContext.Current.Session("idEntrevistaVirtual")

        prm = New SqlParameter("@historicoEntrevista", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@historicoEntrevista").Value = Message

        prm = New SqlParameter("@RespostaDO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@RespostaDO").Value = 1 REM (ENTREVISTADOR)

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Public Sub GravaEntrevista_CANDIDATO(ByVal RoomName As String, ByVal Message As String, ByVal UserName As String, ByVal MessageHTML As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_GRAVADOR]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaVirtual", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaVirtual").Value = System.Web.HttpContext.Current.Session("idEntrevistaVirtual")

        prm = New SqlParameter("@historicoEntrevista", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@historicoEntrevista").Value = Message

        prm = New SqlParameter("@RespostaDO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@RespostaDO").Value = 0 REM (CANDIDATO)

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

End Class
