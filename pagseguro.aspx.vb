Imports UOL.PagSeguro
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml

Partial Class pagseguro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Request.Form("notificationType") = "transaction" Then

            notificationCodeLabel.Text = Request.Form("notificationCode")
            notificationTypeLabel.Text = Request.Form("notificationType")

            REM ** ************************************************************************************************
            REM ** MONTA A CHAMADA
            REM ** ************************************************************************************************

            Dim URLXMLNot As String = "https://ws.pagseguro.uol.com.br/v2/transactions/notifications/" & Request.Form("notificationCode") & "?email=helpdesk@jobclick.com.br&token=C6DEA3A0C12842CD8FAC6F42BE4F0DF4"
            Dim readerNot As New XmlTextReader(URLXMLNot)

            pesquisaNotificador.Text = URLXMLNot

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            REM ** *********************************************************************************
            REM ** APENAS GRAVA OS RETORNOS COM AS ATUALIZAÇÕES DO MODELO PAGSEGURO (SEMPRE QUE HOUVER)
            REM ** *********************************************************************************

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_GRAVA_PAGSEGURO_NOTIFICACAO_JSON", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@codeNotificacao", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@codeNotificacao").Value = notificationCodeLabel.Text

            prm = New SqlParameter("@xmlcodeNotificacao", SqlDbType.Xml)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@xmlcodeNotificacao").Value = readerNot
            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

        End If

        If Request.QueryString("transaction_id") <> "" Then

            Dim URLXML As String = "https://ws.pagseguro.uol.com.br/v2/transactions/" & Request.QueryString("transaction_id") & "?email=helpdesk@jobclick.com.br&token=C6DEA3A0C12842CD8FAC6F42BE4F0DF4"
            Dim reader As New XmlTextReader(URLXML)

            LabelStatus.Text = "Protocolo desta transação: <b>" & Request.QueryString("transaction_id") & "</b> mantenha com você até o final desta transação comercial."

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False


            REM ** *********************************************************************************
            REM ** GRAVA O XML ENVIADO PELO PAGSEGURO
            REM ** *********************************************************************************

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_GRAVA_PAGSEGURO_JSON", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@code", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@code").Value = Request.QueryString("transaction_id")

            prm = New SqlParameter("@xmlcode", SqlDbType.Xml)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@xmlcode").Value = reader
            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

        End If

    End Sub

    Protected Sub ButtonVoltar_Click(sender As Object, e As EventArgs) Handles ButtonVoltar.Click
        Response.Redirect("/_parceiroJobClick")
    End Sub

End Class
