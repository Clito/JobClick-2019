Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Public Class Credito
    Function RestaCredito(idCadastroEmpresa As Int32) As Int32
        Dim Credito As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT liberaQtdCad FROM tbCadastroEmpresa WHERE (idCadastroEmpresa =  " & idCadastroEmpresa & " )"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                dr.Read()
                Credito = dr("liberaQtdCad").ToString
            Else
                Credito = 0
            End If

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Return Credito

    End Function

    Function RestaCreditoAD(idsetup As Int32, idCadastroEmpresa As Int32, idUser As Int32) As Int32

        Dim Credito As Int32 = 0

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_SALDO_AD", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idsetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idsetup").Value = idsetup

        prm = New SqlParameter("@MES", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@MES").Value = Month(Now())

        prm = New SqlParameter("@ANO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ANO").Value = Year(Now())

        prm = New SqlParameter("@REF_COD", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@REF_COD").Value = idUser

        prm = New SqlParameter("@idUsuario", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUsuario").Value = idUser

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            Credito = dr("valor")

        End If

        dr.Close()
        cn.Close()

        Return Credito

    End Function
End Class
