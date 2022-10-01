Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Public Class cntCV

    Sub cntCVCandidato(idcurriculo As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CONTADOR_CV", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idcurriculo

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

End Class
