Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class wscep
    Inherits System.Web.Services.WebService

    <WebMethod(Description:="retorna o endereço completo Copyright © 2008 Cheyenne")> _
    Public Function cep(ByVal strcep As String) As DataSet

        Dim strcepRES As String = Replace(strcep, "-", "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEPws", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = strcepRES
        cmd.Connection = cn

        da.SelectCommand = cmd
        da.Fill(ds)

        da.Dispose()
        cmd.Dispose()
        cn.Dispose()

        Return ds

    End Function


    <WebMethod(Description:="retorna o todos endereços nas proximidades Copyright © 2008 Cheyenne")> _
Public Function cep_search(ByVal range As Integer, ByVal strcep_search As String) As DataSet

        Dim strcepRES As String = Replace(strcep_search, "-", "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spu_cep_search", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@range", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@CEP", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@range").Value = range
        cmd.Parameters("@CEP").Value = strcepRES
        cmd.Connection = cn

        da.SelectCommand = cmd
        da.Fill(ds)

        da.Dispose()
        cmd.Dispose()
        cn.Dispose()

        Return ds

    End Function

End Class
