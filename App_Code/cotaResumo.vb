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

Public Class cotaResumo

    Public Shared Function GetCotaDados(ByVal idClient As Int32) As cotaResumoMask

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim en As cotaResumoMask = New cotaResumoMask

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSAssist.spQuota_Select", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idClient", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idClient").Value = idClient

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            en.numCurrentBalance = "Seu saldo é de " & dr("numCurrentBalance") & " SMS."
        Else
            en.numCurrentBalance = "Seu saldo é de 0 SMS."
        End If

        dr.Close()
        cn.Close()

        Return en

    End Function


    Public Shared Function GetCotaRel(ByVal idClient As Int32) As cotaResumoMask

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim en As cotaResumoMask = New cotaResumoMask

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSAssist.spTotalSended_Select", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idClient", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@numDay", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@numMonth", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@numYear", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idClient").Value = idClient
        cmd.Parameters("@numDay").Value = Day(Now())
        cmd.Parameters("@numMonth").Value = Month(Now())
        cmd.Parameters("@numYear").Value = Year(Now())

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            en.numQuotaSended = "Foram enviados " & dr("numTotalSended") & " SMS."
        Else
            en.numQuotaSended = "Foram enviados 0 SMS."
        End If

        dr.Close()
        cn.Close()

        Return en

    End Function

End Class
