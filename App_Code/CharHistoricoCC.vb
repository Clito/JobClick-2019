Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web

Public Class CharHistoricoCC

    Public Sub GravaHistoricoChat(ByVal RoomName As String, ByVal Message As String, ByVal UserName As String, ByVal MessageHTML As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_HISTORICO_CHAT", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idHistoricoChat", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuarioCC", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuario", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idSetup", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idocorrenciamotivo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idocorrenciatipo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@Chat", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@encerrado", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@idHistoricoChat").Value = 0 'System.Web.HttpContext.Current.Session("idHistoricoChat")
        cmd.Parameters("@protocolo").Value = System.Web.HttpContext.Current.Session("protocoloRES")
        cmd.Parameters("@idUsuarioCC").Value = System.Web.HttpContext.Current.Session("idUsuarioCCRES")
        cmd.Parameters("@idUsuario").Value = System.Web.HttpContext.Current.Session("idUsuarioRES")
        cmd.Parameters("@idSetup").Value = System.Web.HttpContext.Current.Session("idSetupRES")
        cmd.Parameters("@idocorrenciamotivo").Value = System.Web.HttpContext.Current.Session("idocorrenciamotivoRES")
        cmd.Parameters("@idocorrenciatipo").Value = System.Web.HttpContext.Current.Session("idocorrenciatipoRES")

        cmd.Parameters("@Chat").Value = Chr(10) & "• " & UserName & " - " & Now() & " : " & Message

        cmd.Parameters("@encerrado").Value = 0

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()

        cn.Close()

    End Sub

    Public Sub EncerraHistoricoChat(ByVal RoomName As String, ByVal Message As String, ByVal UserName As String, ByVal MessageHTML As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_HISTORICO_CHAT", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idHistoricoChat", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuarioCC", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuario", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idSetup", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idocorrenciamotivo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idocorrenciatipo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@Chat", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@encerrado", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@idHistoricoChat").Value = System.Web.HttpContext.Current.Session("idHistoricoChat")
        cmd.Parameters("@protocolo").Value = System.Web.HttpContext.Current.Session("protocoloRES")
        cmd.Parameters("@idUsuarioCC").Value = System.Web.HttpContext.Current.Session("idUsuarioCCRES")
        cmd.Parameters("@idUsuario").Value = System.Web.HttpContext.Current.Session("idUsuarioRES")
        cmd.Parameters("@idSetup").Value = System.Web.HttpContext.Current.Session("idSetupRES")
        cmd.Parameters("@idocorrenciamotivo").Value = System.Web.HttpContext.Current.Session("idocorrenciamotivoRES")
        cmd.Parameters("@idocorrenciatipo").Value = System.Web.HttpContext.Current.Session("idocorrenciatipoRES")

        cmd.Parameters("@Chat").Value = Chr(10) & "• " & UserName & " - " & Now() & " : " & Message

        cmd.Parameters("@encerrado").Value = 1

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

    Public Sub AtendenteHistoricoChat(ByVal RoomName As String, ByVal Message As String, ByVal UserName As String, ByVal MessageHTML As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_HISTORICO_CHAT_ATENDENTE", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuarioCC", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@Chat", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@protocolo").Value = RoomName
        cmd.Parameters("@idUsuarioCC").Value = System.Web.HttpContext.Current.Session("idUsuarioCCRESAt")
        cmd.Parameters("@Chat").Value = Chr(10) & "• " & UserName & " - " & Now() & " : " & Message


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

    Public Sub Atendente(ByVal idUsuarioCC As Integer, ByVal protocolo As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_ATENDENTE", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuarioCC", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@protocolo").Value = protocolo
        cmd.Parameters("@idUsuarioCC").Value = System.Web.HttpContext.Current.Session("idUsuarioCCRESAt")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

    Function getAtendente(ByVal protocolo As String) As Int32

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_GET_ATENDENTE", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@protocolo").Value = protocolo

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()
        rs = dr("idUsuarioCC")
        dr.Close()
        cn.Close()

        Return rs

    End Function

    Public Sub UsuarioHelpDesk(ByVal nome As String, ByVal msn As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_HISTORICO_HELPDESK", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idHistoricoHelpDesk", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuarioCC", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuario", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idSetup", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idocorrenciamotivo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idocorrenciatipo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@Chat", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@encerrado", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@idHistoricoHelpDesk").Value = 0
        cmd.Parameters("@protocolo").Value = System.Web.HttpContext.Current.Session("protocoloRES")
        cmd.Parameters("@idUsuarioCC").Value = System.Web.HttpContext.Current.Session("idUsuarioCCRES")
        cmd.Parameters("@idUsuario").Value = System.Web.HttpContext.Current.Session("idUsuarioRES")
        cmd.Parameters("@idSetup").Value = System.Web.HttpContext.Current.Session("idSetupRES")
        cmd.Parameters("@idocorrenciamotivo").Value = System.Web.HttpContext.Current.Session("idocorrenciamotivoRES")
        cmd.Parameters("@idocorrenciatipo").Value = System.Web.HttpContext.Current.Session("idocorrenciatipoRES")

        cmd.Parameters("@Chat").Value = Chr(10) & "• " & nome & " - " & Now() & " : " & msn

        cmd.Parameters("@encerrado").Value = 0

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()

        cn.Close()
    End Sub

    Public Sub fixaAtendenteHELPDESK(ByVal idHistoricoHelpDesk As Int32, ByVal idUsuarioCC As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("USP_CC_FIXA_ATENDENTE_HELPDESK", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idHistoricoHelpDesk", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idUsuarioCC", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idHistoricoHelpDesk").Value = idHistoricoHelpDesk
        cmd.Parameters("@idUsuarioCC").Value = idUsuarioCC

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()
        cn.Close()

    End Sub

End Class
