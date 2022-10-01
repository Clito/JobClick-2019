<%@ WebHandler Language="VB" Class="AutocompleteProcessoSeletivo" %>

Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections.Generic

Public Class AutocompleteProcessoSeletivo : Implements IHttpHandler
    
    Public Sub ProcessRequest(context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim firstname As String = context.Request.QueryString("q")
        Dim idSetup As String = context.Request.QueryString("idSetup")
        Dim idRH_Gestor As String = context.Request.QueryString("idRH_Gestor")
        Dim sql As String = "SELECT TOP (50) CAST(_tbVaga.Protocolo AS VARCHAR(255)) + ' - ' + CAST(tbProcessoSeletivo.dsProcesso AS VARCHAR(MAX)) collate latin1_general_ci_ai AS dsProcesso FROM _tbVaga INNER JOIN tbProcessoSeletivo ON _tbVaga.idVaga = tbProcessoSeletivo.idVaga  WHERE (dsfuncao LIKE '%" + firstname + "%') AND (idSetup = " & idSetup & ") AND (dbo._tbVaga.idRH_Gestor = " & idRH_Gestor & ")"
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