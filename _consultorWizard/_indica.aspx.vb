Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports geraProtocoloIndica


Partial Class _gestor_indica
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub

    Protected Sub GridViewCliente_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCliente.SelectedIndexChanged
        Session("idCadastroEmpresaFilha") = GridViewCliente.SelectedDataKey("idCadastroEmpresa")
    End Sub

    Protected Sub GridViewIndicado_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewIndicado.SelectedIndexChanged
        idCVIndicadoLabel.Text = GridViewIndicado.SelectedDataKey("idCVIndicado")
    End Sub

    Protected Sub ImageButtonPsq_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPsq.Click
        LabelCPF.Text = cpfTextBox.Text
        msn.Text = ""
        GridViewPSQProf.Visible = True
    End Sub

    Protected Sub GridViewPSQProf_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPSQProf.SelectedIndexChanged
        emailTextBox.Text = GridViewPSQProf.SelectedDataKey("email")
        nomeTextBox.Text = GridViewPSQProf.SelectedDataKey("nome")
        idCurriculoTextBox.Text = GridViewPSQProf.SelectedDataKey("idcurriculo")
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged
        ProtocoloIndTextBox.Text = GridViewVAGA.SelectedDataKey("Protocolo")
        idVagaTextBox.Text = GridViewVAGA.SelectedDataKey("idVaga")
        idCadastroEmpresaFilhaTextBox.Text = Session("idCadastroEmpresaFilha")
        idCadastroEmpresaTextBox.Text = Session("idCadastroEmpresa")

        DataLabel.Text = Now()

    End Sub

    Protected Sub ButtonCadastra_Click(sender As Object, e As System.EventArgs) Handles ButtonCadastra.Click

        Dim incProtocolo As New geraProtocoloIndica
        Dim ResPS As Int32 = 0
        Dim ProtocoloInd As String

        ProtocoloInd = incProtocolo.getNrProtocoloIndica(Session("idSetup"))

        Select Case RadioButtonListincluirPS.SelectedValue
            Case 0
                ResPS = 0
            Case 1
                ResPS = 1
                If idCurriculoTextBox.Text = "" Or cpfTextBox.Text = "" Or cpfTextBox.Text = "___.___.___-__" Then
                    msnEmailCandidato.CssClass = "msn"
                    msnEmailCandidato.Text = "Para Cadastrar direto no Processo Seletivo é necessário informar o CV e o CPF!"
                    Return
                End If
            Case 3
                ResPS = 0

                REM ** *******************************************************************************************
                REM ** ENVIA E-MAIL AO CANDIDATO INFORMANDO DA INDICAÇÃO
                REM ** *******************************************************************************************

                Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.PathAndQuery, "")

                Dim msnCandidatoAviso As String = "Você foi indicado a fazer parte de um processo seletivo e foi solicitado seu cadastro no portal " & Application("urlapp") & ". Para que sua indicação seja aceita pedimos para informar o número do protocolo da indicação: [<a href=" & Application("urlapp") & ">" & ProtocoloInd & "</a>], após o seu cadastro e o preenchimento de seu currículo será apresentado um link [Indicação] onde deve ser informado o protocolo enviado a você. Pronto, você já estará participando!<br><br>Leia o recado de quem te indicou: <br>" & mensagemTextBox.Text

                If emailTextBox.Text = "" Or nomeTextBox.Text = "" Then
                    msnEmailCandidato.CssClass = "msn"
                    msnEmailCandidato.Text = "Faltam dados do candidato, e-mail não enviado!"
                Else
                    Dim TipoMensagem As String = "ProcessoSeletivo"
                    Dim EnviaEmailCandidato As New EmailSQL
                    Dim ResBodyEmail As String = ""
                    Dim StatusEnviado As Boolean = False

                    Dim bodyEmail As New BodyEmail

                    ResBodyEmail = Replace(Replace(bodyEmail.GetBodySetup(TipoMensagem, Session("idSetup")), "#", msnCandidatoAviso), "*", URL)

                    StatusEnviado = EnviaEmailCandidato.EnviamensagemSQL(ResBodyEmail, nomeTextBox.Text, emailTextBox.Text, "Protocolo Seletivo " & ProtocoloInd)

                    If StatusEnviado Then
                        msnEmailCandidato.CssClass = "msnOK"
                        msnEmailCandidato.Text = "E-mail enviado com sucesso!"
                    Else
                        msnEmailCandidato.CssClass = "msn"
                        msnEmailCandidato.Text = "Falha ao enviar e-mail ao candidato!"
                    End If

                End If

                REM ** *******************************************************************************************
                REM ** ENVIA E-MAIL AO CANDIDATO INFORMANDO DA INDICAÇÃO
                REM ** *******************************************************************************************

        End Select

        Dim ResCPF As String = ""
        If cpfTextBox.Text = "" Or cpfTextBox.Text = "___.___.___-__" Then
            ResCPF = "0"
        Else
            ResCPF = cpfTextBox.Text
        End If

        Dim idCurriculoRes As Int32
        If idCurriculoTextBox.Text = "" Then
            idCurriculoRes = "0"
        End If

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CADASTRA_INDICACAO_PROFISSIONAL", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idCadastroEmpresaFilha", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresaFilha").Value = Session("idCadastroEmpresaFilha")

        prm = New SqlParameter("@idVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVaga").Value = idVagaTextBox.Text

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = idCurriculoRes

        prm = New SqlParameter("@protocoloInd", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@protocoloInd").Value = ProtocoloInd

        prm = New SqlParameter("@cpf", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cpf").Value = ResCPF

        prm = New SqlParameter("@nome", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nome").Value = nomeTextBox.Text

        prm = New SqlParameter("@email", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@email").Value = emailTextBox.Text

        prm = New SqlParameter("@mensagem", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagem").Value = mensagemTextBox.Text

        prm = New SqlParameter("@incluirPS", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@incluirPS").Value = ResPS

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = ProtocoloIndTextBox.Text

        prm = New SqlParameter("@apresentacao", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@apresentacao").Value = apresentacaoTextBox.Text

        prm = New SqlParameter("@comentarioCV", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@comentarioCV").Value = comentarioCVTextBox.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Close()
        Catch ex As Exception
            msn.Text = ErrorToString()
        End Try

        cn.Close()

        GridViewPSQProf.DataBind()
        GridViewIndicado.DataBind()


    End Sub

End Class
