Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class facebook_permissaofanpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Label_idClient.Text = Request.QueryString("idClient")
    End Sub

    Protected Sub Button_Liberar_Click(sender As Object, e As System.EventArgs) Handles Button_Liberar.Click
        'Response.Write(TextBox_Page_id.Text)
        'Response.Write("<br />")
        'Response.Write(TextBox_Page_name.Text)
        'Response.Write("<br />")
        'Response.Write(TextBox_AccessToken.Text)
        'Response.Write("<br />")
        'Response.Write(Request.QueryString("idClient"))
        'Response.Write("<br />")


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[Jobclick_Facebook_Permite]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Facebook_Page_id", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Facebook_Page_id").Value = TextBox_Page_id.Text

        prm = New SqlParameter("@Facebook_Access_Token", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Facebook_Access_Token").Value = TextBox_AccessToken.Text

        prm = New SqlParameter("@Facebook_Page_name", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Facebook_Page_name").Value = TextBox_Page_name.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Request.QueryString("idClient")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
            End If
            cn.Close()
        Catch ex As Exception
            Response.Write("<script> alert('Falha na Liberação!') </script>")
        End Try

        Response.Write("<script> alert('Processo de Liberação Concluído!') </script>")
        Response.Write("<script> window.location = 'http://www.jobclick.com.br' </script>")

    End Sub
End Class
