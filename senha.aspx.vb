Imports email
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class senha
    Inherits System.Web.UI.Page

    Protected Sub RecuperaDados_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles RecuperaDados.Click

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim RecuperaConta As New email
        Dim dbBody As String = ""

        REM ** ***************************************************************************************************
        Dim MODELO As String = "Geral"
        REM ** ***************************************************************************************************

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE(idmensagem = '" & MODELO & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()
                dbBody = oReader("sbody")
            Else
                dbBody = ""
            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")
        msn.Text = RecuperaConta.RecuperaSenha(dbBody, email.Text, URL, Request.UserHostAddress, Application("idsetup")).ToString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        email.Focus()

    End Sub

End Class
