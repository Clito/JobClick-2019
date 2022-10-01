Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports System.Web.Script.Serialization

Public Class chartPIEService

    Public Shared Function Get_chartPIEService(ByVal procedureTipo As String, parametro1 As String, valorparametro1 As String, parametro2 As String, valorparametro2 As String) As chartPIE

        Dim ct As chartPIE = New chartPIE
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("REL_VagaAbertaXFechada", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Ano", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Ano").Value = 2012


        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = 17


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()

            Dim jss As New JavaScriptSerializer()
            Dim sbRes As New StringBuilder()

            ct.campo = "Totais"
            ct.valor = dr("Vagas Abertas")

            Dim ResultSet As New Hashtable

            dr.Close()
            cn.Close()

        End If

        Return ct

    End Function


End Class
