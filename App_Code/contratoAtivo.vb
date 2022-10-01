Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Public Class contratoAtivo
    Function GetContrato(idCadastroEmpresa As Int32) As String

        Dim GetReturn As String = "SEM CONTRATO"

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AD_CONTRATO_ATIVO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows Then
            dr.Read()
            GetReturn = dr("modeloContrato")
        Else
            GetReturn = "SEM CONTRATO"
        End If

        dr.Close()
        cn.Close()


        Return GetReturn

    End Function
End Class
