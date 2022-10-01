Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Public Class AtualizaDataCV

    Function AtualizaDataCVCandidato(ByVal idcurriculo As Int32) As String

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_ATUALIZA_DATACV", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idcurriculo").Value = idcurriculo

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            rs = True
        Catch ex As Exception

        End Try

        cn.Close()

        Return rs

    End Function

End Class
