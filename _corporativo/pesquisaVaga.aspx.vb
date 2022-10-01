Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.HttpCookie
Imports System.DBNull
Imports ReplaceForm
Imports System.Web.Security
Partial Class _corporativo_Default
    Inherits System.Web.UI.Page

    Protected Sub LinkButtonPSQ_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPSQ.Click

        If TextBoxPesquisaVAGA.Text <> "" Then
            Dim COMPRIMENTOTEXTO As Int32 = Len(TextBoxPesquisaVAGA.Text)
            If COMPRIMENTOTEXTO >= 22 Then
                TEXTOPESQUISALabel.Text = Trim(Right(TextBoxPesquisaVAGA.Text, COMPRIMENTOTEXTO - 19))
                PanelResultadoPesquisa.Visible = True
                DataListVAGA.DataBind()
                SqlPESQUISAVAGA.DataBind()
            Else
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Informe o nome ou parte do nome da vaga.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            End If
        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe o nome ou parte do nome da vaga.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End If

    End Sub

    Protected Sub LinkButtonLIMPAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLIMPAR.Click
        TextBoxPesquisaVAGA.Text = ""
        TEXTOPESQUISALabel.Text = ""
        idVagaVALIDADELabel.Text = ""
        DataListVAGA.DataBind()
        SqlPESQUISAVAGA.DataBind()
        PanelResultadoPesquisa.Visible = False
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        REM ******************************************************************************************
        REM CONFIGURAÇÃO DO NAVEGADOR

        PanelAviso.Visible = False
        PanelVAGA.Visible = False
        PanelAvisoVAGA.Visible = False
        PanelPESQUISA.DefaultButton = "LinkButtonPSQ"

        REM CONFIGURAÇÃO DO NAVEGADOR
        REM ******************************************************************************************

        REM ******************************************************************************************
        REM INFORMA QUEM É O CONSULTOR LOGADO
        ConsultorLabelATUAL.Text = Session("idRH_Gestor")
        REM ******************************************************************************************
    End Sub

    Protected Sub DataListVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListVAGA.SelectedIndexChanged
        idVagaLabel.Text = DataListVAGA.SelectedValue
        If ConsultorLabelATUAL.Text <> ConsultorLabelVAGA.Text Then
            PanelAvisoVAGA.Visible = True
            AVISOVAGALABEL.Text = "• Você não é o responsável por esta vaga!<br>A(s) sua(s) alteração(ões) serão aplicadas e um e-mail será enviado ao responsável."
            AVISOVAGALABEL.CssClass = "textoProcessoSeletivoFECHADO"
            imagemAVISOVAGALABEL.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        Else
            PanelVAGA.Visible = True
        End If
    End Sub

    Protected Sub LinkButtonALTERACAO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonALTERACAO.Click
        PanelEDITORANUNCIO.Visible = True
        FormViewEDITAVAGA.DataBind()
    End Sub

    Protected Sub FECHAR_Click(sender As Object, e As System.EventArgs)
        LinkButtonFecharEditor.ToolTip = "Clique aqui para fechar o editor de vagas"
        LinkButtonALTERACAO.Text = "Quero fazer alterações neste anúncio"
        LinkButtonALTERACAO.ToolTip = "Clique aqui para abrir o editor de vagas"
        PanelEDITORANUNCIO.Visible = False
        LinkButtonFecharEditor.Visible = False
    End Sub

    Protected Sub LinkButtonFecharEditor_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFecharEditor.Click
        LinkButtonFecharEditor.ToolTip = "Clique aqui para fechar o editor de vagas"
        LinkButtonALTERACAO.Text = "Quero fazer alterações neste anúncio"
        LinkButtonALTERACAO.ToolTip = "Clique aqui para abrir o editor de vagas"
        PanelEDITORANUNCIO.Visible = False
        LinkButtonFecharEditor.Visible = False

        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O anúncio foi salvo com sucesso.<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
    End Sub

    Protected Sub SqlEDITAVAGA_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlEDITAVAGA.Updating

        Dim myreplece As New ReplaceForm

        If ConsultorLabelATUAL.Text = ConsultorLabelVAGA.Text Then
            e.Command.Parameters("@idVaga").Value = idVagaLabel.Text
            e.Command.Parameters("@idSetup").Value = Session("idSetup")
            e.Command.Parameters("@idRH_Gestor").Value = 0
            e.Command.Parameters("@Remuneracao").Value = Trim(Replace(Replace(CType(FormViewEDITAVAGA.FindControl("RemuneracaoTextBox"), TextBox).Text, "R$", ""), ".", ""))
            e.Command.Parameters("@RemuneracaoVariavel").Value = Trim(Replace(Replace(CType(FormViewEDITAVAGA.FindControl("RemuneracaoVariavelTextBox"), TextBox).Text, "R$", ""), ".", ""))
            e.Command.Parameters("@Honorario").Value = Trim(Replace(Replace(CType(FormViewEDITAVAGA.FindControl("HonorarioTextBox"), TextBox).Text, "R$", ""), ".", ""))
            e.Command.Parameters("@UF").Value = CType(FormViewEDITAVAGA.FindControl("DropDownListUF"), DropDownList).SelectedValue

            LinkButtonALTERACAO.Text = "Quero continuar as alterações deste anúncio"
            LinkButtonFecharEditor.ToolTip = "Clique aqui para fechar o editor de vagas"
            LinkButtonALTERACAO.ToolTip = "Clique aqui para continuar no editor de vagas"
            LinkButtonFecharEditor.Visible = True
        Else

            e.Command.Parameters("@idVaga").Value = idVagaLabel.Text
            e.Command.Parameters("@idSetup").Value = Session("idSetup")
            e.Command.Parameters("@idRH_Gestor").Value = ConsultorLabelATUAL.Text
            e.Command.Parameters("@Remuneracao").Value = Trim(Replace(Replace(CType(FormViewEDITAVAGA.FindControl("RemuneracaoTextBox"), TextBox).Text, "R$", ""), ".", ""))
            e.Command.Parameters("@RemuneracaoVariavel").Value = Trim(Replace(Replace(CType(FormViewEDITAVAGA.FindControl("RemuneracaoVariavelTextBox"), TextBox).Text, "R$", ""), ".", ""))
            e.Command.Parameters("@Honorario").Value = Trim(Replace(Replace(CType(FormViewEDITAVAGA.FindControl("HonorarioTextBox"), TextBox).Text, "R$", ""), ".", ""))
            e.Command.Parameters("@UF").Value = CType(FormViewEDITAVAGA.FindControl("DropDownListUF"), DropDownList).SelectedValue

            LinkButtonALTERACAO.Text = "Quero continuar as alterações deste anúncio"
            LinkButtonFecharEditor.ToolTip = "Clique aqui para fechar o editor de vagas"
            LinkButtonALTERACAO.ToolTip = "Clique aqui para continuar no editor de vagas"
            LinkButtonFecharEditor.Visible = True

        End If
    End Sub

    Protected Sub SqlEDITAVAGA_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlEDITAVAGA.Updated
        DataListPREVIEWVAGA.DataBind()
        DataListVAGA.DataBind()
        PanelVAGA.Visible = True
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        PanelEDITORANUNCIO.Visible = False
        LinkButtonFecharEditor.Visible = False
    End Sub

    Protected Sub SalvaEnviarEmail_Click(sender As Object, e As System.EventArgs)

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim UrlVerVagaDB As String = URL & "/_anonimo/email_PerfilVaga.aspx?CammaleonFilhaCryp=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&CammaleonPerfilCryp=" & criptografia.Criptografar(CType(FormViewEDITAVAGA.FindControl("idPerfilVagaLabel"), Label).Text, "#!$a36?@") & "&CammaleonEmpresaCryp=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&CammaleonProtocoloCryp=" & criptografia.Criptografar(CType(FormViewEDITAVAGA.FindControl("ProtocoloTextBox"), TextBox).Text, "#!$a36?@")
        Dim UrlVerVaga As String = URL & "/_anonimo/email_PerfilVaga.aspx?CammaleonFilhaCryp=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&CammaleonPerfilCryp=" & criptografia.Criptografar(CType(FormViewEDITAVAGA.FindControl("idPerfilVagaLabel"), Label).Text, "#!$a36?@") & "&CammaleonEmpresaCryp=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&CammaleonProtocoloCryp=" & criptografia.Criptografar(CType(FormViewEDITAVAGA.FindControl("ProtocoloTextBox"), TextBox).Text, "#!$a36?@") & "&CammaleonstatusCryp=" & criptografia.Criptografar(1, "#!$a36?@") & "&CammaleonemailGestorCryp=" & criptografia.Criptografar(CType(FormViewEDITAVAGA.FindControl("emailTextBox"), TextBox).Text, "#!$a36?@")

        REM *** *********************************************************************************************
        REM *** ENVIA EMAIL AO GESTOR COM A URL CRYPTOGRAFADA

        Dim myEmail As New EmailSQL
        Dim myBody As New BodyEmail
        Dim Body As String = ""
        Dim sBody As String = ""
        Dim dbBody As String = ""
        Dim Status As Boolean = False

        Dim MODELO As String = "PerfilVaga"


        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>Consultor: " & Session("nome") & "<br>Protocolo de referência: " & CType(FormViewEDITAVAGA.FindControl("ProtocoloTextBox"), TextBox).Text & "<br>" & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>Mensagem: " & CType(FormViewEDITAVAGA.FindControl("msnTextBox"), TextBox).Text & "<br>E-mail para contato: " & Session("emailUser") & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Clique no link abaixo para ver o Levantamento do Perfil da Vaga:<br>Para visualizar o Levantamento do Perfil da Vaga <a href='" & Application("urlapp") & UrlVerVaga & "'>[Clique aqui]</a>." & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBodySetup(MODELO, Application("idsetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)


        Status = myEmail.EnviamensagemSQL(sBody, CType(FormViewEDITAVAGA.FindControl("nomeTextBox"), TextBox).Text, CType(FormViewEDITAVAGA.FindControl("emailTextBox"), TextBox).Text, "Alterações no Levantamento Perfil de Vaga.")


        AtualizaMENSAGEM(CType(FormViewEDITAVAGA.FindControl("ProtocoloTextBox"), TextBox).Text, UrlVerVaga, CType(FormViewEDITAVAGA.FindControl("msnTextBox"), TextBox).Text)
        REM *** *********************************************************************************************

    End Sub

    Sub AtualizaMENSAGEM(protocolo As String, url As String, mensagem As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_ATUALIZA_MENSAGEM_ABERTURA_VAGA]", cn)

        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = protocolo

        prm = New SqlParameter("@url", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@url").Value = url

        prm = New SqlParameter("@mensagem", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagem").Value = mensagem

        prm = New SqlParameter("@nome", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nome").Value = Session("nomeRes")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()

        cn.Close()

    End Sub

    Protected Sub ATIVIDADE(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataListVAGA.ItemCommand

        ConsultorLabelVAGA.Text = e.CommandArgument

        Select Case e.CommandName
            Case "VALIDADE"
                idVagaVALIDADELabel.Text = e.CommandArgument
                PanelVALIDADE.Visible = True
        End Select

    End Sub

    Protected Sub LinkButtonContinuar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonContinuar.Click
        PanelVAGA.Visible = True
    End Sub

    Protected Sub DataListVAGA_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListVAGA.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.FindControl("publicarLabel"), Label).Text Then
                DirectCast(e.Item.FindControl("ImageButtonVaga"), ImageButton).ImageUrl = "~/_corporativo/images/holomatica/PESQUISACANDIDATO.png"
                DirectCast(e.Item.FindControl("publicarLabel"), Label).CssClass = "textoProcessoSeletivoABERTO"
                DirectCast(e.Item.FindControl("publicarLabel"), Label).Text = "Publicado"
            Else
                DirectCast(e.Item.FindControl("ImageButtonVaga"), ImageButton).ImageUrl = "~/_corporativo/images/holomatica/PESQUISACANDIDATO_D.png"
                DirectCast(e.Item.FindControl("ImageButtonVaga"), ImageButton).Enabled = False
                DirectCast(e.Item.FindControl("ImageButtonVaga"), ImageButton).ToolTip = "Vaga encerrada, processo seletivo finalizado."
                DirectCast(e.Item.FindControl("publicarLabel"), Label).CssClass = "textoProcessoSeletivoFECHADO"
                DirectCast(e.Item.FindControl("publicarLabel"), Label).Text = "Encerrado"
            End If
        End If
    End Sub

    Protected Sub UpdateCancelButton_Click1(sender As Object, e As EventArgs)
        PanelVALIDADE.Visible = False
    End Sub

    Protected Sub SqlDataSourceVALIDADE_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceVALIDADE.Updated
        PanelVALIDADE.Visible = False
        DataListVAGA.DataBind()
        FormViewVALIDADE.DataBind()
    End Sub
End Class
