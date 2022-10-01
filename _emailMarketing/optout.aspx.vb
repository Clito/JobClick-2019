Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _emailMarketing_optout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim Email As String
        Email = Request.QueryString("Email")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB_Mailing").ConnectionString)

        cmd = New SqlCommand("USP_REMOVE_MAILING", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Email", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Email").Value = Email

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()
        cn.Close()

    End Sub

End Class
