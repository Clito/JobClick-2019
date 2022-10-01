Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _anonimo_sponsoredADControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("idAD") <> "" Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[_USP_AD_CONTA_CLICK]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idAD", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idAD").Value = Request.QueryString("idAD")

            cn.Open()

            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader
                dr.Close()
            Catch ex As Exception

            End Try
            cn.Close()
        End If

        If Request.QueryString("idADMergulho") <> "" Then

            Dim URLMergulho As String = ""

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[_USP_AD_CONTA_MERGULHO]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idAD", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idAD").Value = Request.QueryString("idADMergulho")

            cn.Open()

            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader
                dr.Read()
                URLMergulho = dr("URLMergulho")
                dr.Close()
            Catch ex As Exception

            End Try

            cn.Close()

            If URLMergulho <> "" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType, "OK", "top.location.replace('" & URLMergulho & "');", True)
            End If

        End If

    End Sub

End Class
