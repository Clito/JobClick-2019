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

            Dim URLXMLNot As String = "https://ws.pagseguro.uol.com.br/v2/transactions/notifications/" & Request.Form("notificationCode") & "?email=" & Application("emailAdmin") & "&token=" & Application("token")
            Dim readerNot As New XmlTextReader(URLXMLNot)

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            REM ** *********************************************************************************
            REM ** APENAS GRAVA OS RETORNOS COM AS ATUALIZAÇÕES DO MODELO PAGSEGURO (SEMPRE QUE HOUVER)
            REM ** *********************************************************************************

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_GRAVA_PAGSEGURO_NOTIFICACAO_XML_MODELO_ASSOCIACAO", cn)
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

            Dim URLXML As String = "https://ws.pagseguro.uol.com.br/v2/transactions/" & Request.QueryString("transaction_id") & "?email=" & Application("emailAdmin") & "&token=" & Application("token")
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

            cmd = New SqlCommand("_USP_GRAVA_PAGSEGURO_XML_MODELO_ASSOCIACAO", cn)
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

            PreparaMensagem()
        Else
            LabelStatus.Text = "Protocolo desta transação: <b>" & Session("ticket") & "</b> mantenha com você até o final desta transação comercial."
        End If

    End Sub

    Sub PreparaMensagem()

        If Session("idCadastroEmpresa") <> "" Then
            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_CREDITO_UTILIZADO", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then

                dr.Read()

                If dr("Utilizado") Is DBNull.Value Then
                    Utilizado.Text = "0"
                Else
                    Utilizado.Text = dr("Utilizado")
                End If

                If dr("nmempresa") Is DBNull.Value Then
                    nmempresa.Text = "Empresa não encontrada!"
                Else
                    nmempresa.Text = dr("nmempresa")
                End If

                If dr("emailRes") Is DBNull.Value Then
                    emailRes.Text = "e-mail não encontrado!"
                Else
                    emailRes.Text = dr("emailRes")
                End If

                If dr("nomeRes") Is DBNull.Value Then
                    nomeRes.Text = "Responsável não encontrado!"
                Else
                    nomeRes.Text = dr("nomeRes")
                End If

            End If

            dr.Close()
            cn.Close()



            'REM ** *********************************************************************************
            'REM ** [ENVIA EMAIL AO CLIENTE] - AguardandoPagSeguro (AGUARDANDO CONFIRMAÇÃO)
            'REM ** *********************************************************************************

            EnviaMensagem(emailRes.Text, nomeRes.Text, nmempresa.Text)

            'REM ** *********************************************************************************
            'REM ** [FIM] GRAVA NA TABELA PAGSEGURO
            'REM ** *********************************************************************************

        End If

    End Sub

    Sub EnviaMensagem(emailRes As String, nomeRes As String, nmempresa As String)

        Dim BodyEmailRES As String = ""
        Dim myEnviaEmail As New EmailSQL
        Dim myBodyEmail As New BodyEmail

        BodyEmailRES = Replace(Replace(Replace(Replace(myBodyEmail.GetBodySetup("AguardandoPagSeguro", Session("idSetup")), "#1#", "Informação sobre a aquisição de créditos JobClick e-Recruitment"), "#2#", nmempresa), "#3#", nomeRes), "#4#", "[Aguardando confirmação de pagamento por parte da PagSeguro UOL].")
        myEnviaEmail.EnviamensagemSQL(BodyEmailRES, nomeRes, emailRes, "Seus Créditos no JobClick e-Recruitment")

    End Sub

    Protected Sub ButtonVoltar_Click(sender As Object, e As System.EventArgs) Handles ButtonVoltar.Click

        REM ** VERIFICA DE ONDE VEIO O USUÁRIO
        REM ** ***********************************************************

        Dim UserNivel As String = HttpContext.Current.User.Identity.Name
        Dim url As String = ""

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_REDIRECIONAMENTO_PAGSEGURO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idTypeUser", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idTypeUser").Value = UserNivel

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            url = dr("url")
        End If

        dr.Close()
        cn.Close()

        If url <> "" Then
            Response.Redirect(url)
        Else
            Response.Redirect("/")
        End If

    End Sub

End Class
