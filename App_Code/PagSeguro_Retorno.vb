Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports EmailSQL
Imports BodyEmail

Public Class PagSeguro_Retorno

    Function RetornoPagSeguroVenda(ByVal ref_transacao As String, ByVal TransacaoID As String, ByVal nome As String, ByVal ClienteEmail As String, ByVal IdStatus As Integer, ByVal Status As String, ByVal ValorTransacoes As Decimal, ByVal DataTransacao As String, ByVal TipoPagamento As String, ByVal anotacao As String, ByVal Creditos As Integer, ByVal nmempresaRES As String, ByVal idSetup As Int32, QTDCota As Int32) As Boolean

        Dim RetornoPagSeguro As Boolean = False
        Dim BodyEmailRES As String = ""
        REM ** *************************************************************************************************
        REM ** GRAVA TODAS AS TRANSAÇÕES FEITAS PELO PAGSEGURO E O CLIENTE, ENVIA E-MAIL AO CLIENTE
        REM ** *************************************************************************************************

        Dim DataTransacaoRES As String = Year(DataTransacao) & "-" & Month(DataTransacao) & "-" & Day(DataTransacao) & " 00:00:000"

        Try
            REM ** *********************************************************************************************
            REM ** VERIFICA SE É A PRIMEIRA COMPRA DO CLIENTE
            REM ** *********************************************************************************************

            Dim CREDITOSRes As String = PRIMEIRA_COMPRA(ref_transacao, IdStatus)
            Dim MENSAGEMRES As String = ""
            Select Case CREDITOSRes
                Case 0
                    MENSAGEMRES = "AprovadoPagSeguro"
                Case 1
                    MENSAGEMRES = "AprovadoPagSeguroCliente"
            End Select

            REM ** *********************************************************************************************
            REM ** VERIFICA SE É A PRIMEIRA COMPRA DO CLIENTE
            REM ** *********************************************************************************************

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String = ""
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            Dim myEnviaEmail As New EmailSQL
            Dim myBodyEmail As New BodyEmail

            Select Case IdStatus
                Case 0 ' AGUARDANDO AguardandoPagSeguro
                    oSQL = "INSERT INTO tbPagSeguro (idCadastroEmpresa, TransacaoID, nome, ClienteEmail, idStatus, Status, ValorTransacoes, DataTransacao, TipoPagamento, anotacao, Creditos) VALUES ('" & ref_transacao & "','" & TransacaoID & "', '" & nome & "', '" & ClienteEmail & "', '" & IdStatus & "' ,'" & Status & "', '" & ValorTransacoes & "', '" & DataTransacaoRES & "', '" & TipoPagamento & "', '" & idSetup & ":" & nmempresaRES & " - " & anotacao & "', '" & Creditos & "')"
                    BodyEmailRES = Replace(Replace(Replace(Replace(myBodyEmail.GetBodySetup("AguardandoPagSeguro", idSetup), "#1#", "Informação sobre a aquisição de créditos JobClick e-Recruitment"), "#2#", nmempresaRES), "#3#", nome), "#4#", "[Aguardando confirmação de pagamento por parte da PagSeguro UOL].")
                    myEnviaEmail.EnviamensagemSQL(BodyEmailRES, nome, ClienteEmail, "Seus Créditos no JobClick e-Recruitment")
                Case 1 ' APROVADO AprovadoPagSeguro
                    oSQL = "UPDATE tbPagSeguro SET idStatus = " & IdStatus & ", Status = '" & Status & "' WHERE (TransacaoID = '" & TransacaoID & "')"
                    BodyEmailRES = Replace(Replace(Replace(Replace(myBodyEmail.GetBodySetup(MENSAGEMRES, idSetup), "#1#", "Informação sobre a aquisição de créditos JobClick e-Recruitment"), "#2#", nmempresaRES), "#3#", nome), "#4#", "[Confirmação de pagamento PagSeguro UOL].")
                    myEnviaEmail.EnviamensagemSQL(BodyEmailRES, nome, ClienteEmail, "Seus Créditos no JobClick e-Recruitment")
                    SomaCreditos(TransacaoID, ref_transacao, TipoPagamento, Status, Creditos)
                    SomaSMS(ref_transacao, QTDcota)
                Case 2 ' CANCELADO
                    oSQL = "UPDATE tbPagSeguro SET idStatus = " & IdStatus & ", Status = '" & Status & "' WHERE (TransacaoID = '" & TransacaoID & "')"
                Case 3 ' COMPLETO (ENTREGA)
                    oSQL = "UPDATE tbPagSeguro SET idStatus = " & IdStatus & ", Status = '" & Status & "' WHERE (TransacaoID = '" & TransacaoID & "')"
                Case 4 ' EM ANÁLISE
                    oSQL = "UPDATE tbPagSeguro SET idStatus = " & IdStatus & ", Status = '" & Status & "' WHERE (TransacaoID = '" & TransacaoID & "')"
            End Select


            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            oReader.Close()
            oConnection.Close()

        Catch ex As Exception

        End Try

        Return RetornoPagSeguro

    End Function

    Sub SomaSMS(idCadastroEmpresa As Int32, QTDCota As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CREDITO_SMS", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@QTDCota", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@QTDCota").Value = QTDCota

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

    Function PRIMEIRA_COMPRA(idCadastroEmpresa As Int32, IdStatus As Int32) As Int32

        Dim PRIMEIRA_COMPRARes As Int32 = 0

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PRIMEIRA_COMPRA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@IdStatus", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@IdStatus").Value = IdStatus

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

        End If

        dr.Close()
        cn.Close()

        Return PRIMEIRA_COMPRARes

    End Function

    Sub SomaCreditos(ByVal TransacaoID As String, ByVal idCadastroEmpresa As String, ByVal TipoPagamento As String, ByVal StatusTransacao As String, ByVal Creditos As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_SOMA_CREDITO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@codTransacao", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@creditos", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@TipoPagemento", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@StatusTransacao", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@codTransacao").Value = TransacaoID
        cmd.Parameters("@creditos").Value = Creditos
        cmd.Parameters("@TipoPagemento").Value = TipoPagamento
        cmd.Parameters("@StatusTransacao").Value = StatusTransacao

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

        End If

        dr.Close()
        cn.Close()

    End Sub

End Class
