Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Net.Mail
Imports System.Text.Encoding
Imports System.DBNull


Public Class BodyEmail

    Function GetBody(ByVal MODELO As String, idSetup As Int32) As String

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim sbody As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE (idmensagem = '" & MODELO & "') AND (idsetup = '" & idSetup & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()
        Try

            oReader.Read()
            sbody = oReader("sbody")

        Catch ex As Exception

            sbody = sbody & "<table>" & Chr(10)
            sbody = sbody & "<tr>" & Chr(10)
            sbody = sbody & "<td>#</td>" & Chr(10)
            sbody = sbody & "</tr>" & Chr(10)
            sbody = sbody & "</table>" & Chr(10)

        End Try

        oConnection.Close()

        GetBody = sbody

    End Function

    Function GetBodySetup(ByVal MODELO As String, idSetup As Int32) As String

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim sbody As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE (idmensagem = '" & MODELO & "') AND (idsetup = '" & idSetup & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()
        Try

            oReader.Read()
            sbody = oReader("sbody")

        Catch ex As Exception

            sbody = sbody & "<table>" & Chr(10)
            sbody = sbody & "<tr>" & Chr(10)
            sbody = sbody & "<td>#</td>" & Chr(10)
            sbody = sbody & "</tr>" & Chr(10)
            sbody = sbody & "</table>" & Chr(10)

        End Try

        oConnection.Close()

        GetBodySetup = sbody

    End Function

    Function GetBodyEmpresaCliente(ByVal MODELO As String) As String

        Dim conteudoEmpresa As String = ""
        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim sbody As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE (idmensagem = '" & MODELO & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            oReader.Read()

            sbody = sbody & oReader("sbody")

        Catch ex As Exception

        End Try

        oConnection.Close()

        GetBodyEmpresaCliente = sbody

    End Function

    Function GetBodyEmpresaClienteConteudo(ByVal Protocolo As String) As String

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim sbody As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT tbDescEmpresa_Vaga.msnCandidato, tbDescEmpresa_Vaga.msnCandidatoFim, _tbVaga.idVaga, dbo._tbVaga.Protocolo FROM tbDescEmpresa_Vaga INNER JOIN _tbVaga ON tbDescEmpresa_Vaga.iddsempresa = _tbVaga.iddsAnuncioEmpresa WHERE (dbo._tbVaga.Protocolo = '" & Protocolo & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()
        Try

            oReader.Read()
            sbody = oReader("msnCandidato")

        Catch ex As Exception

        End Try

        oConnection.Close()

        GetBodyEmpresaClienteConteudo = sbody

    End Function

End Class
