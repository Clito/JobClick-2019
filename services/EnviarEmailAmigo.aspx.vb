Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports email
Imports BodyEmail
Imports EnviaEmailAmigo

Partial Class services_EnviarEmailAmigo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim strCodigo As String = Request.QueryString("strCodigo")
        Dim strVaga As String = Request.QueryString("strVaga")
        Dim nomeTextBox As String = Request.QueryString("nomeTextBox")
        Dim emailTextBox As String = Request.QueryString("emailTextBox")
        Dim mensagem As String = Request.QueryString("mensagem")
        Dim inomeTextBox As String = Request.QueryString("inomeTextBox")
        Dim iemailTextBox As String = Request.QueryString("iemailTextBox")

        Response.ContentType = "application/json"
        Response.Write(EnviarEmailAmigo(
                                      strCodigo _
                                    , strVaga _
                                    , nomeTextBox _
                                    , emailTextBox _
                                    , mensagem _
                                    , inomeTextBox _
                                    , iemailTextBox
                                    ))

    End Sub

    Public Function EnviarEmailAmigo( _
                                      ByVal strCodigo As String _
                                    , ByVal strVaga As String _
                                    , ByVal nomeTextBox As String _
                                    , ByVal emailTextBox As String _
                                    , ByVal mensagem As String _
                                    , ByVal inomeTextBox As String _
                                    , ByVal iemailTextBox As String _
                                    ) As String

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim HTML As String = ""
        Dim QUEBRA As String = ""
        Dim SETUPEmp As Integer = 1
        Dim idSetup As Integer = 1

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idsetup, idCadastroEmpresa, sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, meta, fonte, url, google FROM tbsetup WHERE (idsetup = " & SETUPEmp & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Dim emailAdmin As String = ""
        Dim nomeAdmin As String = ""
        Dim sSMTP As String = ""

        Try

            If oReader.HasRows() Then

                oReader.Read()

                emailAdmin = oReader("emailAdmin")
                nomeAdmin = oReader("nomeAdmin")
                sSMTP = oReader("sSmtp")

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Dim status As Boolean = False

        Dim myFriend As New EnviaEmailAmigo
        Dim URL As String = "http://www.jobclick.com.br"
        Dim montaDsVaga As String = "<b>Código da vaga: </b><a href='" & URL & "/vaga/" & strCodigo & "'>" & strCodigo & "</a><br><b>Vaga: </b> " & strVaga & "<br><b>Link para a Vaga: </b><a href='" & URL & "/_anonimo/vagas.aspx?Pesquisa=" & strCodigo & "'><span style='font-size: xx-small'>" & URL & "/_anonimo/vagas.aspx?Pesquisa=" & strCodigo & "</span></a><br><br><b>Seu(sua) amigo(a) " & nomeTextBox & " </b>(" & emailTextBox & ")<b> escreveu: </b><br>" & mensagem

        ResultSet.Add("ResultStatus", True)
        ResultSet.Add("ResultSet", myFriend.enviarZoya(URL, inomeTextBox, iemailTextBox, "Indicação de vaga por " & nomeTextBox & " - (" & emailTextBox & ")", nomeAdmin, emailAdmin, sSMTP, "indicaVaga", strVaga, nomeTextBox, montaDsVaga, inomeTextBox))

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()
    End Function

End Class