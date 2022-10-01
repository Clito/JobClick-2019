Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class getfbaccesstoken
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'http://localhost:50658/getfbaccesstoken.aspx#access_token=AAAF17NLFKnwBACD1OWZBs2vuYUbPxvZBZAZBFJlOwZBhZC4eAAFP0mz08OBu0XPgXBE4lA2YcJBoQgCJtUYPSJJpiwmKOdsuKQITOcoJ0HogZDZD&expires_in=0

        Dim myConnection As SqlConnection
        Dim myCommand As SqlCommand

        myConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        If TXT_AccessToken.Text <> "" Then
            Try
                myConnection.Open()
                myCommand = New SqlCommand("Insert Into tb_FBAccessToken(Access_Token) Values ('" & TXT_AccessToken.Text & "')", myConnection)
                myCommand.ExecuteReader()
                Response.Redirect("http://www.jobclick.com.br")
            Catch ex As Exception
                Response.Write("Houve uma falha ao resgatar a chave de acesso, por favor informe a chave '" & TXT_AccessToken.Text & "' para helpdesk@jobclick.com.br")
                Response.Write("Erro: " & ex.Message.ToString)
            End Try
        End If
    End Sub
End Class
