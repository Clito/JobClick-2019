<%@ WebHandler Language="VB" Class="AutocompleteData" %>

Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections.Generic

Public Class AutocompleteData
    Implements IHttpHandler

    Public Sub ProcessRequest(context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim firstname As String = context.Request.QueryString("q")
        Dim sql As String = "SELECT TOP(50) dsinstituicao + ' - ' + uf + ' - [' + CAST(idinstituicao AS VARCHAR(255)) + ']' FROM tbEntidadeEnsino  WHERE (dsinstituicao LIKE '%" + firstname + "%') ORDER BY dsinstituicao"
        Dim conexao As String = ConfigurationManager.ConnectionStrings("jobclickDB").ToString()
        Using connection As New SqlConnection(conexao)
            Using command As New SqlCommand(sql, connection)
                connection.Open()

                Using reader As SqlDataReader = command.ExecuteReader()
                    Dim list As New List(Of String)()
                    While reader.Read()
                        context.Response.Write(reader(0).ToString() & Environment.NewLine)
                    End While
                End Using
            End Using
        End Using
    End Sub

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class