Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports cotaResumo

Partial Class _corporativo_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        AvisoVaga.Text = ""
        nomeConsultorLabel.Text = Session("nomeConsultor")
        emailConsultorLabel.Text = Session("emailConsultor")

        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
        idCadastroEmpresaLayoutLabel.Text = Session("idCadastroEmpresa_Layout")
        idSetupLabel.Text = Session("idSetup")
        idRH_GestorLabel.Text = Session("idRH_Gestor")
        nmresponsavelLabel.Text = Session("nomeRes")
        emailGESTORLabel.Text = Session("emailUser")
        idUserLabel.Text = Session("idUser")
        Application("nomeEntrevistador") = ""
        PanelAviso.Visible = False
        PanelAvisoCADASTROEMPRESA.Visible = False
        PanelATRIBUICAO.Visible = False

        REM ** ***********************************************************************************************************
        REM ** VERIFICA SE O ASSOCIADO TEM CRÉDITOS PARA CONTINUAR UTILIZANDO A APLICAÇÃO
        REM ** ESTA AÇÃO MUDA TOTALMENTE A VISÃO DO ITEM ACIMA
        REM ** VERIFICA SE O ASSOCIADO TEM CRÉDITOS SMS
        REM ** ***********************************************************************************************************
        'Response.Write(Session("idClient") & Session("contador") & Session("libera_associado"))

        Select Case True

            Case (Session("idClient") <= 0 And Session("libera_associado") = 0 And Session("contador") = 0)
                REM ** PRIMEIRO ACESSO NA APLICAÇÃO
                LinkButtonASSOCIADO.Visible = True
                AvisoVaga.Text = "<b>BEM VINDO</b>, para utilizar o sistema será necessário a compra de créditos, existem duas modalidades a sua escolha. Para conhece-las clique no botão (Compra de créditos para abertura de novas vagas) abaixo.<br>Para comprar créditos para comunicação com seus candidatos via SMS clique em (Compra de créditos para SMS)."

            Case (Session("idClient") = 0 And Session("libera_associado") = 0 And Session("contador") > 0)
                REM ** SEM CRÉDITO SMS SEM CRÉDITO PARA PS
                LinkButtonASSOCIADO.Visible = True
                AvisoVaga.Text = "<b>ATENÇÃO:</b> Os seus créditos estão esgotados, <i>se esta <b>não</b> for a sua primeira compra você ainda terá total acesso a seus processos seletivos, históricos, agenda e relatórios</i>. Para a compra de mais créditos clique no botão (Compra de créditos para abertura de novas vagas) abaixo.<br>Para a compra créditos de SMS clique em (Comprar Créditos para SMS)."

            Case (Session("idClient") > 0 And Session("libera_associado") = 0 And Session("contador") > 0)
                REM ** COM CRÉDITO SMS SEM CRÉDITO PARA PS
                LinkButtonASSOCIADO.Visible = True
                AvisoVaga.Text = "<b>ATENÇÃO:</b> Os seus créditos estão esgotados, <i>se esta <b>não</b> for a sua primeira compra você ainda terá total acesso a seus processos seletivos, históricos, agenda e relatórios</i>. Para a compra de mais créditos clique no botão (Compra de créditos para abertura de novas vagas) abaixo."

            Case (Session("idClient") = 0 And Session("libera_associado") > 0 And Session("contador") > 0)
                REM ** SEM CRÉDITO SMS COM CRÉDITO PARA PS
                LinkButtonASSOCIADO.Visible = False
                Dim cota As cotaResumoMask = New cotaResumoMask
                cota = cotaResumo.GetCotaDados(Session("idClient"))
                AvisoVaga.Text = "<b>ATENÇÃO: Aqui você encontrará as suas vagas salvas e não publicadas.</b><br>O sistema permite você gravar quantas vagas quiser para serem trabalhadas a qualquer momento, ou utilizar este recurso para apresentar as vagas antes da publicação, neste modelo o requisitante da vaga estará envolvido na aprovação.<br><br><b>Obs.:</b> Você não tem créditos SMS para utilizar no sistema.<br>"

            Case (Session("idClient") > 0 And Session("libera_associado") > 0 And Session("contador") > 0)
                REM ** NORMAL
                LinkButtonASSOCIADO.Visible = False
                Dim cota As cotaResumoMask = New cotaResumoMask
                cota = cotaResumo.GetCotaDados(Session("idClient"))
                AvisoVaga.Text = "<b>ATENÇÃO: Aqui você encontrará as suas vagas salvas e não publicadas.</b><br>O sistema permite você gravar quantas vagas quiser para serem trabalhadas a qualquer momento, ou utilizar este recurso para apresentar as vagas antes da publicação, neste modelo o requisitante da vaga estará envolvido na aprovação.<br><br><b>Obs.:</b> " & cota.numCurrentBalance.ToString & " créditos para uso no sistema.<br>"

        End Select

    End Sub

    Sub CARREGADADOSUSUARIO(ByVal idUser As Int32, ByVal password As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CONTA_ACESSO_CONSULTOR_ANALISTA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = idUser

        prm = New SqlParameter("@password", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@password").Value = password

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                nomeTextBox.Text = dr("nome")
                emailTextBox.Text = dr("email")
                DDDTextBox.Text = dr("ddd")
                NumeroTextBox.Text = dr("telefone")
                LinkButtonSalvarContaAcesso.Visible = True
                passwordTextBox.TextMode = TextBoxMode.SingleLine
                passwordTextBox.Text = password
            End If
            cn.Close()
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub DataListVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListVAGA.SelectedIndexChanged
        REM ** ***************************************************************************************
        REM ** PREPARA INFORMAÇÕES PARA ENVIAR VAGA PARA A PUBLICAÇÃO DA VAGA
        REM ** ***************************************************************************************
        Response.Redirect("cadastroVaga.aspx?idVagaAnuncioPREVIEW=" & DataListVAGA.SelectedValue)
    End Sub

    Protected Sub GridViewSALA_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewSALA.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim myLinkButton As LinkButton = e.Row.FindControl("LinkButtonSALA")

            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "aceito"))
            Select Case flgAprovado
                Case "0"
                    myLinkButton.Enabled = False
                    myLinkButton.ToolTip = "A presença não foi confirmada!"
                Case "1"
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#9bd7b4")
                    myLinkButton.Enabled = True
                    myLinkButton.ToolTip = "A presença foi confirmada, sala liberada!"
                Case "2"
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff2f2")
                    myLinkButton.Enabled = False
                    myLinkButton.ToolTip = "A entrevista virtual foi cancelada!"
                Case "3"
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff2f2")
                    myLinkButton.Enabled = False
                    myLinkButton.ToolTip = "A entrevista virtual foi finalizada!"
            End Select

        End If
    End Sub

    Protected Sub GridViewSALA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewSALA.SelectedIndexChanged
        Response.Redirect("sala.aspx?Info=100&sala=" & GridViewSALA.SelectedDataKey("sala") & "&id=" & GridViewSALA.SelectedDataKey("idEntrevistaVirtual") & "&idCV=" & GridViewSALA.SelectedDataKey("idcurriculo"))
    End Sub

    Protected Sub LinkButtonSalvarContaAcesso_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvarContaAcesso.Click

        REM ** **********************************************************************************************
        REM ** SALVA ALTERAÇÕES FEITAS NA CONTA DE ACESSO ENVIA E-MAIL AVISANDO DA ALTERAÇÃO
        REM ** **********************************************************************************************

        If passwordNOVOTextBox.Text = passwordREPITATextBox.Text Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter

            Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CONTA_ACESSO_CONSULTOR_ANALISTA", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idUser", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idUser").Value = Session("idUser")

            prm = New SqlParameter("@atualizar", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@atualizar").Value = 1 REM ** VAI ATUALIZAR

            prm = New SqlParameter("@nome", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nome").Value = nomeTextBox.Text

            prm = New SqlParameter("@ddd", SqlDbType.Char, 2)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ddd").Value = DDDTextBox.Text

            prm = New SqlParameter("@telefone", SqlDbType.Char, 9)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@telefone").Value = NumeroTextBox.Text

            prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@email").Value = emailTextBox.Text

            prm = New SqlParameter("@password", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@password").Value = passwordTextBox.Text

            prm = New SqlParameter("@passwordNOVO", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@passwordNOVO").Value = passwordNOVOTextBox.Text

            prm = New SqlParameter("@idSetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idSetup").Value = Session("idSetup")

            prm = New SqlParameter("@URL", SqlDbType.VarChar, 2000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@URL").Value = URL

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                cn.Close()

                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Seus dados de acesso foram salvo.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

                CARREGADADOSUSUARIO(Session("idUser"), emailTextBox.Text)
                ActiveAccordeon.Value = 0

            Catch ex As Exception

                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Erro ao gravar suas alterações.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"

            End Try
        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• As alterações não foram salvas (Password não confere).<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End If

    End Sub

    Protected Sub LinkButtonATIVA_Click(sender As Object, e As System.EventArgs) Handles LinkButtonATIVA.Click
        CARREGADADOSUSUARIO(Session("idUser"), passwordTextBox.Text)
    End Sub

    Protected Sub SqlDEPARTAMENTO_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDEPARTAMENTO.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")
        e.Command.Parameters("@dataCriacao_departamento").Value = Now()
        e.Command.Parameters("@idTypeUser").Value = "CorporativoDepartamento"
    End Sub

    Protected Sub SqlDEPARTAMENTO_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDEPARTAMENTO.Updating
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")
        e.Command.Parameters("@dataCriacao_departamento").Value = Now()
        e.Command.Parameters("@idTypeUser").Value = "CorporativoDepartamento"
    End Sub

    Protected Sub GridViewDEPARTAMENTO_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        iddepartamentoLabel.Text = GridViewDEPARTAMENTO.SelectedDataKey("idDepartamento")
    End Sub

    Protected Sub SqlDEPARTAMENTO_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDEPARTAMENTO.Inserted
        GridViewDEPARTAMENTO.DataBind()
    End Sub

    Protected Sub SqlDEPARTAMENTO_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDEPARTAMENTO.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• A conta de acesso foi atualizada com sucesso.<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
        GridViewDEPARTAMENTO.DataBind()
    End Sub

    Protected Sub SqlDEPARTAMENTO_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDEPARTAMENTO.Deleted
        GridViewDEPARTAMENTO.DataBind()
    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs)
        iddepartamentoLabel.Text = ""
    End Sub

    Protected Sub GridViewOUTLOOK_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewOUTLOOK.SelectedIndexChanged
        emailGESTORMSNLabel.Text = GridViewOUTLOOK.SelectedDataKey("emailGESTOR")
        nomeGestorLabel.Text = GridViewOUTLOOK.SelectedDataKey("nomeGESTOR")
        protocoloLabel.Text = GridViewOUTLOOK.SelectedDataKey("protocolo")
        idVagaAnuncio_PREVIEW_HistoricoLabel.Text = GridViewOUTLOOK.SelectedDataKey("idVagaAnuncio_PREVIEW_Historico")
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        idVagaAnuncio_PREVIEW_HistoricoLabel.Text = ""
    End Sub

    Protected Sub SqlOUTLOOK_FORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlOUTLOOK_FORM.Updating

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim myLink As String = URL & "/_anonimo/default.aspx?jobclickCryp=" & criptografia.Criptografar(Session("SETLayout"), "#!$a36?@") & "&jobclickCrypID=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&jobclickProtocolo=" & criptografia.Criptografar(protocoloLabel.Text, "#!$a36?@")

        REM ** O HISTÓRICO SERÁ GRAVADO NO NOME DO ANALISA OU CONSULTOR?
        Dim Authentic As String = HttpContext.Current.User.Identity.Name

        Dim emailConsultorAnalista As String = ""
        Dim nomeConsultorAnalista As String = ""

        Select Case Authentic
            Case "Consultor"
                nomeConsultorAnalista = Session("nomeConsultor")
                emailConsultorAnalista = Session("emailConsultor")
            Case "Corporativo"
                nomeConsultorAnalista = Session("nomeRes")
                emailConsultorAnalista = Session("emailUser")
        End Select

        e.Command.Parameters("@idVagaAnuncio_PREVIEW_Historico").Value = idVagaAnuncio_PREVIEW_HistoricoLabel.Text
        e.Command.Parameters("@enviaEmail").Value = 1
        e.Command.Parameters("@mensagemHistorico").Value = CType(FormViewMENSAGEM.FindControl("TextBoxMensagem"), TextBox).Text
        e.Command.Parameters("@parecerAnalista_Consultor").Value = CType(FormViewMENSAGEM.FindControl("parecerAnalista_ConsultorMTextBox"), TextBox).Text
        e.Command.Parameters("@Protocolo").Value = DBNull.Value
        e.Command.Parameters("@nomeANALISTA_CONSULTOR").Value = nomeConsultorAnalista 'Session("nomeRes")
        e.Command.Parameters("@emailANALISTA_CONSULTOR").Value = emailConsultorAnalista 'Session("emailUser")
        e.Command.Parameters("@SMS").Value = CType(FormViewMENSAGEM.FindControl("RadioButtonListSMS"), RadioButtonList).SelectedValue
        e.Command.Parameters("@nomeGESTOR").Value = nomeGestorLabel.Text
        e.Command.Parameters("@emailGESTOR").Value = emailGESTORMSNLabel.Text
        e.Command.Parameters("@URL").Value = myLink
        e.Command.Parameters("@dataCriacao").Value = Now()

        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Sua mensagem foi enviada com sucesso.<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

    End Sub

    Protected Sub EXCLUIR(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataListVAGA.ItemCommand

        Select Case e.CommandName

            Case "EXCLUIR"

                Dim cn As SqlConnection
                Dim cmd As SqlCommand
                Dim prm As SqlParameter

                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("[_USP_VAGA_SALVA_DELETE]", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@idVagaAnuncioPREVIEW", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idVagaAnuncioPREVIEW").Value = e.CommandArgument
                Try
                    cn.Open()
                    Dim dr As SqlDataReader = cmd.ExecuteReader
                    cn.Close()
                Catch ex As Exception

                End Try

                DataListVAGA.DataBind()
                GridViewOUTLOOK.DataBind()

        End Select

    End Sub


    REM ** **********************************************************************************************************
    REM ** CADASTRO EMPRESA
    REM ** **********************************************************************************************************

    Protected Sub PesquisaCEP_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles PesquisaCEP.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = Replace(cepTextBox.Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            enderecoTextBox.Text = dr("LOGRADOURO") & " " & dr("RUA") & ", "
            bairroTextBox.Text = dr("BAIRRO")
            cidadeTextBox.Text = dr("CIDADE")
            DDUf.SelectedValue = dr("UF")
            paisDropDownList.SelectedValue = dr("PAIS")
            paisDropDownList0.SelectedValue = dr("PAIS")
            numeroTextBox1.Focus()

        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub LinkButtonCadastrarCliente_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCadastrarCliente.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ

        Session("VarError") = False ' NÃO LIBERA O CADASTRO

        Dim LiberaParaGravar As Int32 = ContaGestor(passwordTextBoxCADASTROEMPRESA.Text, emailTextBoxCADASTROEMPRESA.Text, userNameTextBox.Text)

        If LiberaParaGravar = 0 Then

            REM ** ***************************************************************************************
            REM ** VERIFICA CNPJ
            REM ** ***************************************************************************************

            If TextBoxCNPJ.Text <> "__.___.___/____-__" Then

                If ValidaCNPJres.ValidaCNPJ(TextBoxCNPJ.Text) Then

                    cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                    cmd = New SqlCommand("spBuscaCNPJ", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    prm = New SqlParameter("@CNPJ", SqlDbType.VarChar, 20)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@CNPJ").Value = TextBoxCNPJ.Text

                    cn.Open()

                    Try

                        Dim dr As SqlDataReader = cmd.ExecuteReader

                        If dr.HasRows() Then
                            dr.Read()
                            lblmsn.Text = "CNPJ já cadastrado no sistema."
                            Session("VarError") = False
                        Else
                            lblmsnOK.Text = "[Verificado!]"
                            Session("VarError") = True
                        End If

                        dr.Close()

                    Catch ex As Exception
                        Session("VarError") = False
                        lblmsn.Text = "Erro ao pesquisar o CNPJ."
                    End Try

                    cn.Close()


                    REM ** ***************************************************************************************
                    REM ** [FIM] VERIFICA CNPJ
                    REM ** ***************************************************************************************

                    cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                    cmd = New SqlCommand("spGravaCadastroEmpresa", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    prm = New SqlParameter("@userName", SqlDbType.VarChar, 16)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@userName").Value = userNameTextBox.Text.ToString


                    prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@password").Value = passwordTextBoxCADASTROEMPRESA.Text.ToString


                    prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@email").Value = emailTextBoxCADASTROEMPRESA.Text.ToString


                    prm = New SqlParameter("@frase", SqlDbType.VarChar, 60)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@frase").Value = fraseTextBox.Text.ToString

                    REM *****************************************************************************************
                    REM ** EMPRESA QUE IRÁ FAZER AS GESTÃO DOS PROCESSOS SELETIVOS

                    prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@idCadastroEmpresa_Pai").Value = CInt(Session("idCadastroEmpresa"))
                    REM *****************************************************************************************

                    prm = New SqlParameter("@idAreaAtuacao", SqlDbType.Int, 9)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@idAreaAtuacao").Value = idAreaAtuacaoDropDownList.SelectedValue.ToString


                    prm = New SqlParameter("@idPorte", SqlDbType.Int, 9)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@idPorte").Value = idPorteRadioButtonList.SelectedValue.ToString


                    prm = New SqlParameter("@nmempresa", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@nmempresa").Value = nmempresaTextBox.Text.ToString


                    prm = New SqlParameter("@cnpj", SqlDbType.VarChar, 20)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@cnpj").Value = TextBoxCNPJ.Text.ToString

                    prm = New SqlParameter("@ie", SqlDbType.VarChar, 20)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@ie").Value = TextBoxIE.Text.ToString

                    prm = New SqlParameter("@emailRes", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@emailRes").Value = emailTextBoxCADASTROEMPRESA.Text.ToString

                    prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@nomeRes").Value = nomeResTextBox.Text.ToString

                    prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@endereco").Value = enderecoTextBox.Text & numeroTextBox1.Text

                    prm = New SqlParameter("@cep", SqlDbType.VarChar, 10)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@cep").Value = cepTextBox.Text.ToString

                    prm = New SqlParameter("@bairro", SqlDbType.VarChar, 180)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@bairro").Value = bairroTextBox.Text.ToString

                    prm = New SqlParameter("@cidade", SqlDbType.VarChar, 100)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@cidade").Value = cidadeTextBox.Text.ToString

                    prm = New SqlParameter("@uf", SqlDbType.Char, 2)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@uf").Value = DDUf.SelectedValue.ToString


                    prm = New SqlParameter("@pais", SqlDbType.VarChar, 100)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@pais").Value = paisDropDownList.SelectedValue.ToString

                    prm = New SqlParameter("@ddd", SqlDbType.Char, 2)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@ddd").Value = ddd.Text

                    prm = New SqlParameter("@telefone", SqlDbType.VarChar, 9)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@telefone").Value = telefone.Text


                    REM **********************************************************************************************
                    REM **********************************************************************************************
                    REM **********************************************************************************************

                    prm = New SqlParameter("@emailCobranca", SqlDbType.VarChar, 255)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@emailCobranca").Value = emailTextBox0.Text.ToString

                    prm = New SqlParameter("@nomeResposavelCobranca", SqlDbType.VarChar, 255)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@nomeResposavelCobranca").Value = nomeResTextBox0.Text.ToString

                    prm = New SqlParameter("@enderecoCobranca", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@enderecoCobranca").Value = enderecoTextBox0.Text.ToString

                    prm = New SqlParameter("@cepCobranca", SqlDbType.VarChar, 10)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@cepCobranca").Value = cepTextBox0.Text.ToString

                    prm = New SqlParameter("@bairroCobranca", SqlDbType.VarChar, 180)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@bairroCobranca").Value = bairroTextBox0.Text.ToString

                    prm = New SqlParameter("@cidadeCobranca", SqlDbType.VarChar, 100)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@cidadeCobranca").Value = cidadeTextBox0.Text.ToString

                    prm = New SqlParameter("@ufCobranca", SqlDbType.Char, 2)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@ufCobranca").Value = DDUf0.SelectedValue.ToString

                    prm = New SqlParameter("@paisCobranca", SqlDbType.VarChar, 100)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@paisCobranca").Value = paisDropDownList0.SelectedValue.ToString

                    prm = New SqlParameter("@dddCobranca", SqlDbType.Char, 2)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@dddCobranca").Value = ddd0.Text

                    prm = New SqlParameter("@telefoneCobranca", SqlDbType.VarChar, 9)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@telefoneCobranca").Value = telefone0.Text

                    REM **********************************************************************************************
                    REM **********************************************************************************************
                    REM **********************************************************************************************

                    prm = New SqlParameter("@privacidade", SqlDbType.Int, 9)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    Select Case PrivacidadeRadioButtonList.SelectedValue
                        Case "1"
                            cmd.Parameters("@privacidade").Value = 1
                        Case "0"
                            cmd.Parameters("@privacidade").Value = 0
                    End Select

                    prm = New SqlParameter("@tempoexistencia", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@tempoexistencia").Value = tempoexistenciaLabel.Text

                    prm = New SqlParameter("@site", SqlDbType.VarChar, 180)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@site").Value = siteTextBox.Text

                    If Session("VarError") Then
                        Try
                            cn.Open()
                            Dim dr As SqlDataReader = cmd.ExecuteReader
                            dr.Read()
                            Session("idCadastroEmpresaFilha") = dr("idCadastroEmpresa")
                            lblmsn.CssClass = "msnOK"
                            lblmsn.Text = "Empresa cadastrada no sistema!"
                            dr.Close()
                            cn.Close()

                            PanelAvisoCADASTROEMPRESA.Visible = True
                            AVISOLABELCADASTROEMPRESA.Text = "• Empresa cadastrada no sistema!<br>"
                            AVISOLABELCADASTROEMPRESA.CssClass = "textoProcessoSeletivoABERTO"
                            ImageAVISOCADASTROEMPRESA.ImageUrl = "~/_corporativo/images/buttonOK.png"

                        Catch ex As Exception
                            lblmsn.Text = "Falha ao cadastra a Empresa no sistema."
                            PanelAviso.Visible = True
                            AVISOLABEL.Text = "• Falha ao cadastra a Empresa no sistema.<br>"
                            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                        End Try
                    Else
                        lblmsn.Text = "Falha geral"
                        PanelAviso.Visible = True
                        AVISOLABEL.Text = "• Falha ao gravar a empresa!<br>"
                        AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                    End If

                Else
                    lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "• CNPJ não é válido, informe um CNPJ válido.<br>"
                    AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                    ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                End If

            Else
                lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• CNPJ não é válido, informe um CNPJ válido!<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            End If

        Else
            lblmsn.Text = "Conta de acesso já existe!"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Conta de acesso já existe!<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End If

    End Sub

    Function ContaGestor(passwordTextBox As String, emailTextBox As String, userNameTextBox As String) As Int32

        Dim LiberaParaGravar As Int32 = 1 ' NÂO LIBERA O CADASTRO

        REM ** ***************************************************************************************************
        REM ** VERIFICA SE EXISTE UMA CONTA JÁ CADASTRADA NO SISTEMA!!!
        REM ** ***************************************************************************************************

        If userNameTextBox = "" Or passwordTextBox = "" Or emailTextBox = "" Then
            CONTAMSN.Text = "Informe os dados de acesso para o Gestor desta Empresa!"
        End If

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_VERIFICA_CRIACAO_CONTA_DE_ACESSO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@userName", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@userName").Value = userNameTextBox REM ** EMBORA ENVIADO NÃO ESTÁ SENDO UTILIZADO NA SP

        prm = New SqlParameter("@password", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@password").Value = passwordTextBox

        prm = New SqlParameter("@email", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@email").Value = emailTextBox

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            If dr("VERIFICADOR") = 1 Then
                CONTAMSN.Text = "Esta conta já existe no sistema, favor mudar os dados de acesso do Gestor."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Esta conta já existe no sistema, favor mudar os dados de acesso do Gestor.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                LiberaParaGravar = 1 '<- NÃO LIBERA PARA CADASTRO
            Else
                LiberaParaGravar = 0 '<- LIBERA PARA CADASTRO
            End If
        End If

        dr.Close()
        cn.Close()

        Return LiberaParaGravar

    End Function

    Protected Sub LinkButtonCancelarCliente_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelarCliente.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub paisDropDownList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles paisDropDownList.DataBound
        paisDropDownList.SelectedValue = "Brasil"
    End Sub


    Protected Sub paisDropDownList0_DataBound(sender As Object, e As System.EventArgs) Handles paisDropDownList0.DataBound
        paisDropDownList0.SelectedValue = "Brasil"
    End Sub

    Protected Sub LinkButtonMesmo_Click(sender As Object, e As System.EventArgs) Handles LinkButtonMesmo.Click
        nomeResTextBox0.Text = nomeResTextBox.Text
        emailTextBox0.Text = emailTextBox.Text
        cepTextBox0.Text = cepTextBox.Text
        enderecoTextBox0.Text = enderecoTextBox.Text
        numeroTextBox0.Text = numeroTextBox1.Text
        bairroTextBox0.Text = bairroTextBox.Text
        cidadeTextBox0.Text = cidadeTextBox.Text
        DDUf0.SelectedValue = DDUf.SelectedValue
        paisDropDownList0.SelectedValue = paisDropDownList.SelectedValue
        ddd0.Text = ddd.Text
        telefone0.Text = telefone.Text
    End Sub

    Protected Sub DataListATRIBUICAO_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListATRIBUICAO.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            If DirectCast(e.Item.FindControl("idRH_GestorLabel"), Label).Text <> Session("idRH_Gestor") Then
                DirectCast(e.Item.FindControl("ImageButtonVagaATRIBUICAO"), ImageButton).Enabled = False
                DirectCast(e.Item.FindControl("ImageButtonVagaATRIBUICAO"), ImageButton).ImageUrl = "~/_corporativo/images/holomatica/EDITAR_OFF.png"
                DirectCast(e.Item.FindControl("ImageButtonVagaATRIBUICAO"), ImageButton).ToolTip = "Esta vaga não está atribuida a você."
            Else
                DirectCast(e.Item.FindControl("ImageButtonVagaATRIBUICAO"), ImageButton).Enabled = True
                DirectCast(e.Item.FindControl("ImageButtonVagaATRIBUICAO"), ImageButton).ImageUrl = "~/_corporativo/images/holomatica/EDITAR.png"
            End If

        End If
    End Sub

    Protected Sub DataListATRIBUICAO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListATRIBUICAO.SelectedIndexChanged
        MaintainScrollPositionOnPostBack = False
        PanelATRIBUICAO.Visible = True
        ATRIBUICAOLabel.Text = "Selecione para quem será atribuida esta vaga."
        idVagaLabel.Text = DataListATRIBUICAO.SelectedValue
    End Sub

    Protected Sub LinkButtonATRIBUIR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonATRIBUIR.Click

        REM ** FAZ A TROCA DE ATRIBUIÇÃO
        idRH_GestorAtribuidoLabel.Text = TextAtribuicao.Value

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_DISTRIBUICAO_ATRIBUICAO_CONSULTOR_ANALISTA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@idRH_Gestor_TRANFERIDO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor_TRANFERIDO").Value = idRH_GestorAtribuidoLabel.Text

        prm = New SqlParameter("@idVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVaga").Value = idVagaLabel.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Esta vaga foi transferida com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

        dr.Close()
        cn.Close()

        DataListATRIBUICAO.DataBind()
        MaintainScrollPositionOnPostBack = True

    End Sub

    Protected Sub LinkButtonASSOCIADO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonASSOCIADO.Click
        Response.Redirect("_creditoAssociado.aspx")
    End Sub

    Protected Sub SqlDataSourceDEPARTAMENTO_EMPRESA_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourceDEPARTAMENTO_EMPRESA.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@frase").Value = "Cadastro via Analista Gestor"
    End Sub

    Protected Sub SqlDataSourcetbuserTypeFORM_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourcetbuserTypeFORM.Updating
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@dsvinculo").Value = CType(FormViewAREA.FindControl("dsRH_vinculoTextBox"), TextBox).Text
    End Sub

    Protected Sub SqlDataSourcetbuserTypeFORM_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourcetbuserTypeFORM.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@dsvinculo").Value = CType(FormViewAREA.FindControl("dsRH_vinculoTextBox"), TextBox).Text
    End Sub

    Protected Sub LinkButtonSALVAR_Click(sender As Object, e As EventArgs) Handles LinkButtonSALVAR.Click
        REM ** ********************************************************************************************
        REM ** SALVA A NOVA CONTA DE ACESSO AO SISTEMA CORPORATIVO/CONSULTORIA

        REM ** FAZ A TROCA DE ATRIBUIÇÃO
        idRH_GestorAtribuidoLabel.Text = TextAtribuicao.Value

        If IsNumeric(dddTextBoxDEPARTAMENTO.Text) Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[uspCorporativoDepartamentoInsert]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idUser", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idUser").Value = 0

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@idRH", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRH").Value = DropDownListNivel.SelectedValue

            prm = New SqlParameter("@nome", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nome").Value = nomeTextBoxDEPARTAMENTO.Text

            prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@password").Value = passwordTextBoxDEPARTAMENTO.Text

            prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@email").Value = emailTextBoxDEPARTAMENTO.Text

            prm = New SqlParameter("@frase", SqlDbType.VarChar, 60)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@frase").Value = "Sistema Automático"

            prm = New SqlParameter("@ddd", SqlDbType.Char, 2)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ddd").Value = dddTextBoxDEPARTAMENTO.Text

            prm = New SqlParameter("@telefone", SqlDbType.Char, 10)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@telefone").Value = telefoneTextBoxDEPARTAMENTO.Text

            prm = New SqlParameter("@bloquear", SqlDbType.Char, 10)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@bloquear").Value = 0

            prm = New SqlParameter("@nivelAprovacao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nivelAprovacao").Value = RadionivelAprovacao.SelectedValue



            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()

                If dr("TIPO") > 0 Then
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "• " & dr("MENSAGEM") & "<br>"
                    AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                    ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
                Else
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "• " & dr("MENSAGEM") & "<br>"
                    AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                    ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                End If
            End If


            dr.Close()
            cn.Close()

        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• DDD deve ser numérico!<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End If

        GridViewDEPARTAMENTO.DataBind()


        REM ** ********************************************************************************************
    End Sub

    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As EventArgs) Handles LinkButtonCANCELAR.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub SqlDataSourcetbuserTypeFORM_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourcetbuserTypeFORM.Inserted
        DropDownListNivel.DataBind()
    End Sub

    Protected Sub SqlDataSourcetbuserTypeFORM_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourcetbuserTypeFORM.Updated
        DropDownListNivel.DataBind()
    End Sub

    Protected Sub SqlDataSourcetbuserTypeFORM_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourcetbuserTypeFORM.Deleted
        DropDownListNivel.DataBind()
    End Sub

    Protected Sub GridViewDEPARTAMENTO_SelectedIndexChanged1(sender As Object, e As EventArgs) Handles GridViewDEPARTAMENTO.SelectedIndexChanged
        idRH_GestorACESSOLabel.Text = GridViewDEPARTAMENTO.SelectedDataKey("idRH_Gestor")
    End Sub

End Class
