Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class appWS
     Inherits System.Web.Services.WebService

    <WebMethod(Description:="Consulta banco de dados e retorna DataSet")> _
    Function RetornaDataSet(ByVal strQuery As String) As DataSet

        Dim myconnection As SqlConnection

        Dim cmd As New SqlCommand
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd.Connection = myconnection
        cmd.CommandText = strQuery
        da.SelectCommand = cmd
        da.Fill(ds)
        myconnection.Dispose()
        cmd.Dispose()
        da.Dispose()
        Return ds

    End Function

End Class
