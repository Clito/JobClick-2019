Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class identify
     Inherits System.Web.Services.WebService

    <WebMethod(Description:="Login de usuários")> _
    Function identify(ByVal user As String, ByVal senha As String) As String

        Dim nomeRes As String = ""

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, nome FROM vwuser_pocket WHERE (userName = '" + user + "') AND (password = '" + senha + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                nomeRes = "Olá " & dr("nome")

            Else
                nomeRes = "Usuário não existe no sistema."
            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Return nomeRes

    End Function

End Class
