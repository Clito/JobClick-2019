Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class services_ContadorVaga
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim idVaga As String = Request.QueryString("idVaga")
        Dim strTipoNivelVaga As String = Request.QueryString("strTipoNivelVaga")

        Response.ContentType = "application/json"
        Response.Write(ContadorVaga(idVaga, strTipoNivelVaga))

    End Sub

    Public Function ContadorVaga(ByVal idVaga As String, ByVal strTipoNivelVaga As String) As String
        Dim result As String = False
        Dim myConnection As SqlConnection
        Dim myCommand As SqlCommand
        Dim dr As SqlDataReader

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

        Try
            myConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            'you need to provide password for sql server
            myConnection.Open()
            If strTipoNivelVaga = 1 Then
                myCommand = New SqlCommand("UPDATE _tbVaga SET cnt = cnt + 1 WHERE (idVaga = " & idVaga & " )", myConnection)
            Else
                myCommand = New SqlCommand("UPDATE tbVagaPublica SET cnt = cnt + 1 WHERE (idVagaPublica = " & idVaga & " )", myConnection)
            End If

            'myCommand = New SqlCommand("select top 10 * from tbuser where idUser > " & LastID, myConnection)
            dr = myCommand.ExecuteReader

            Do
                While dr.Read()
                    ResultSet.Add("ResultStatus", True)
                End While

            Loop While dr.NextResult()


            dr.Close()
            myConnection.Close()
        Catch e As Exception
            ResultSet.Add("ResultStatus", False)
            ResultSet.Add("ResultStatus_StatusMessage", "Erro - " & e.Message.ToString)
        End Try

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()

    End Function
End Class
