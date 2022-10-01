Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class varflash_vagas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim cmd2 As SqlCommand

        Dim ContadorWEB As Int32 = 0
        Dim ContadorJOBCLICK As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spVagasWEB", cn)
        cmd.CommandType = CommandType.StoredProcedure

        cmd2 = New SqlCommand("spVagasJOBCLICK", cn)
        cmd2.CommandType = CommandType.StoredProcedure

        Try

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            ContadorWEB = dr("Contador")
            dr.Close()

            Dim dr2 As SqlDataReader = cmd2.ExecuteReader
            dr2.Read()
            ContadorJOBCLICK = dr2("Contador")
            dr2.Close()

        Catch ex As Exception


        End Try

        cn.Close()

        htmldir.Text = "&nrjobclick=[<b>" & ContadorJOBCLICK & "</b>]&nrweb=[<b>" & ContadorWEB & "</b>]&"

    End Sub

End Class
