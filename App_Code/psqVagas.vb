Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class psqVagas
    Inherits System.Web.Services.WebService

    <WebMethod(Description:="Pesquisa vagas WEB")> _
    Function vaga(ByVal psqVaga As String) As DataSet

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spPesquisaVaga", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@buscador", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@buscador").Value = psqVaga


        cmd.Connection = cn

        da.SelectCommand = cmd
        da.Fill(ds)

        da.Dispose()
        cmd.Dispose()
        cn.Dispose()

        Return ds

    End Function


    <WebMethod(Description:="Busca Vagas FLASH")> _
Function vagasFlash(ByVal psqVagaString As String) As String

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        Dim resposta As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spPesquisaVaga", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@buscador", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@buscador").Value = psqVagaString

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            Do While dr.Read()
                resposta = resposta & "<a href='vagas.aspx'>" & dr("titVagaPublica") & "</a>" & Chr(13)
            Loop
        Else
            resposta = "Não há vagas!"
        End If

        dr.Close()
        cn.Close()

        Return resposta

    End Function


    <WebMethod(Description:="PesquisaFuncao")> _
Function Funcao(ByVal psqFuncao As String) As DataSet

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spPesquisaFuncao", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@buscador", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@buscador").Value = psqFuncao


        cmd.Connection = cn

        da.SelectCommand = cmd
        da.Fill(ds)

        da.Dispose()
        cmd.Dispose()
        cn.Dispose()

        Return ds

    End Function

End Class
