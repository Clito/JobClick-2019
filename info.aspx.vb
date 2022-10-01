Imports System.Web.HttpRuntime
Imports System.Web.HttpException
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class info
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("idMultimidiaInfoCategoria") <> "" Then
            Dim idMultimidiaInfoCategoria As String = Request.QueryString("idMultimidiaInfoCategoria")

            HTML.Text = GetPaginaPrincipal(idMultimidiaInfoCategoria)

            If Request.QueryString("idMultimidiaInfo") <> "" Then

                FormView1.Visible = True

            End If

        Else

            Response.Redirect("/")

        End If

    End Sub

    Protected Sub SqlComentario_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlComentario.Inserting
        e.Command.Parameters("@data").Value = Now()
        e.Command.Parameters("@idMultimidiaInfo").Value = Request.QueryString("idMultimidiaInfo")
    End Sub

    Protected Sub SqlComentario_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlComentario.Inserted

        FormView1.Visible = False

    End Sub

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.Visible = False
    End Sub

    Function GetPaginaPrincipal(ByVal idMultimidiaInfoCategoria) As Object

        Dim HTML As String = ""
        Dim HTMLFoto As String = ""
        Dim Foto As String = ""
        Dim EditM As String = ""
        Dim Comentario As String = ""

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        oSQL = "SELECT idMultimidiaInfo, idMultimidiaInfoCategoria, url, dsMultimídia FROM tbMultimidiaInfo WHERE (idMultimidiaInfoCategoria = " & idMultimidiaInfoCategoria & ")"

        oConnection.Open()


        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then

            HTML = HTML & "<table width='500px' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)

            Do While oReader.Read()

                Dim idMultimidiaInfo As Integer = oReader("idMultimidiaInfo")
                Dim url As String = Replace(oReader("url"), "/watch?v=", "/v/")
                Dim dsMultimídia As String = oReader("dsMultimídia")

                Comentario = GetComentario(idMultimidiaInfo)

                HTML = HTML & "<tr>" & Chr(10)
                HTML = HTML & "<td width='230px' valign='top'><object width='230' height='175'><param name='movie' value='" & url & "'></param><param name='wmode' value='transparent'></param><embed src='" & url & "' type='application/x-shockwave-flash' wmode='transparent' width='230' height='175'></embed></object></td>" & Chr(10)
                HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                HTML = HTML & "<td width='250px' valign='top'>" & dsMultimídia & "<br><br>[ <a href='/info.aspx?idMultimidiaInfoCategoria=" & idMultimidiaInfoCategoria & "&idMultimidiaInfo=" & idMultimidiaInfo & "'>Comentários</a> ] " & Comentario & "</td>" & Chr(10)
                HTML = HTML & "</tr>" & Chr(10)
                HTML = HTML & "<tr>" & Chr(10)
                HTML = HTML & "<td><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                HTML = HTML & "<td><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                HTML = HTML & "</tr>" & Chr(10)

            Loop

            HTML = HTML & "</table>" & Chr(10)

        End If

        oReader.Close()
        oConnection.Close()

        Return HTML

    End Function

    Function GetComentario(ByVal idMultimidiaInfo)

        Dim HTML As String = ""

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        oSQL = "SELECT idMultimidiaInfoComentario, idMultimidiaInfo, comentario, email, nome, data FROM tbMultimidiaInfoComentario WHERE (idMultimidiaInfo = " & idMultimidiaInfo & ")"

        oConnection.Open()


        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then

            HTML = HTML & "<table width='250px' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)

            Do While oReader.Read()

                HTML = HTML & "<tr>" & Chr(10)
                HTML = HTML & "<td><b><br><br>" & oReader("nome") & "</b><br>" & oReader("comentario") & " <br></td>" & Chr(10)
                HTML = HTML & "</tr>" & Chr(10)

            Loop

            HTML = HTML & "</table>" & Chr(10)

        End If

        oReader.Close()
        oConnection.Close()


        GetComentario = HTML


    End Function

End Class
