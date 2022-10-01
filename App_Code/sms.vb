Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports System.Collections.ObjectModel
Imports System.Linq

Public Class sms

    Function SendSMSPrepare(idCadastroUser As Int32, menssage As String) As Boolean

        Dim status As Boolean = False

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim HtmlBanner As String = ""
        Dim HtmlLateral As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_OPTIN_SMS", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroUser").Value = idCadastroUser

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            SendSMS(dr("CELULAR"), menssage)
            dr.Close()
            status = True
        Catch ex As Exception
            status = False
        End Try

        cn.Close()

        Return status

    End Function

    Function SendSMS(strPhoneOdds As String, menssage As String) As Boolean

        Dim status As Boolean = False

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim HtmlBanner As String = ""
        Dim HtmlLateral As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSSite.spPrepareMessage", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@FKidClient", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@FKidClient").Value = vbNull

        prm = New SqlParameter("@FKidProject", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@FKidProject").Value = vbNull

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = vbNull

        prm = New SqlParameter("@strPhoneOdds", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@strPhoneOdds").Value = strPhoneOdds

        prm = New SqlParameter("@strGroups", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@strGroups").Value = vbNull

        prm = New SqlParameter("@strMessage", SqlDbType.VarChar, 150)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@strMessage").Value = menssage

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            dr.Close()
            status = True
        Catch ex As Exception
            status = False
        End Try

        cn.Close()

        Return status

    End Function

    Function SendSMSPrepareVIAConsultor(idUser As Int32, menssage As String) As Boolean

        Dim status As Boolean = False

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim HtmlBanner As String = ""
        Dim HtmlLateral As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_OPTIN_SMS_PELO_CONSULTOR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = idUser

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            SendSMS(dr("CELULAR"), menssage)
            dr.Close()
            status = True
        Catch ex As Exception
            status = False
        End Try

        cn.Close()

        Return status

    End Function
End Class
