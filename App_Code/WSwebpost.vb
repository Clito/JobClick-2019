Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class WSwebpost
    Inherits System.Web.Services.WebService

    <WebMethod(Description:="Retorna XML com os ID das mensagens a serem enviadas.")> _
    Public Function ReceivePost(ByVal XMLtoSend As String) As DataSet

        ' SMSWebPost.spUserAuthentication()
        ' @strLogin = 'AbilitySMS'
        ',@strPassword = 'qwert2010'
        ',@idProject = '3'

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionStringOut").ConnectionString)

        cmd = New SqlCommand("SMSWebPost.spReceivePost_IN", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@ReceivePostXML", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@ReceivePostXML").Value = XMLtoSend
        cmd.Connection = cn

        cn.Open()

        da.SelectCommand = cmd
        da.Fill(ds)

        da.Dispose()
        cmd.Dispose()
        cn.Dispose()

        cn.Close()

        Return ds

    End Function

End Class
