Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports sms
Imports PrimeiroNome



Partial Class _empresa_runProcessoSeletivo
    Inherits System.Web.UI.Page

    Dim myconnection As SqlConnection
    Dim myda As SqlDataAdapter
    Dim ds As New DataSet
    Dim dsSelDate As DataSet

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Legenda.Visible = False

        If Not IsPostBack Then
            CargoLabel.Text = ""
            ProtocoloCabecLabel.Text = ""
            idRELcandidato_vagaLabel.Text = ""
            HorainiLabel.Text = "08:00:00"
            CalendarCandidatoLabel.Text = Day(Now()) & "/" & Month(Now()) & "/" & Year(Now())
        End If


        If idFaseProcessoSeletivoCandidatoLabel.Text <> "" Then
            ImageButtonAGENDAC.Visible = True
        Else
            ImageButtonAGENDAC.Visible = False
        End If


        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If


        If idcurriculoLabel.Text <> "" Then
            myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            myda = New SqlDataAdapter("SELECT idCalendario, idCadastroEmpresa, idRH_Gestor, idUser, idCurriculo, idEventoAgenda, idProcessoSeletivo, idFaseProcessoSeletivoCV, DataStartField, DataEndField, DataTextField, DataValueField, Evento, dsEventoAceite, aceito, avisado FROM tbAgendaC WHERE (idRH_Gestor = " & Session("idRH_Gestor") & ") AND (idCadastroEmpresa = " & Session("idCadastroEmpresa") & ") AND (idcurriculo = " & idcurriculoLabel.Text & ")", myconnection)
            myda.Fill(ds, "tbAgendaC")
        End If

        REM ** ***********************************************************************************************
        REM ** AO SE SELECIONAR NA PÁGINA PRINCIPAL O PROCESSO SELETIVO ELE REDIRECIONA PARA ESTA PÁGINA
        REM ** UTILIZANDO A PÁGINA : readRedirect.aspx
        REM ** ***********************************************************************************************
        If Not IsPostBack Then
            If Request.QueryString("idVaga") <> "" Then
                AbreProcesso(Request.QueryString("idProcessoSeletivo"), Request.QueryString("idVaga"), Request.QueryString("idRH_Gestor"), Request.QueryString("Cargo"), Request.QueryString("Protocolo"))
            End If
        End If
        REM ** ***********************************************************************************************
        REM ** ***********************************************************************************************

    End Sub

    Sub AbreProcesso(idProcessoSeletivo As String, idVaga As String, idRH_Gestor As String, dsCargo As String, Protocolo As String)

        ImageButtonXML.Visible = False
        ImageButtonEncerrar.Visible = False
        PanelCandidaturaEx.Visible = False
        GridViewExpontaneo.Visible = False
        PanelRun.Visible = False
        LabelCabec0.Visible = False
        LabelCabec2.Visible = False
        GridViewIndica.Visible = False

        ImageButtonXML.Visible = False
        ImageButtonEncerrar.Visible = False
        PanelFase.Visible = True
        PanelCandidaturaEx.Visible = False
        GridViewExpontaneo.Visible = False
        GridViewResPesquisa.Visible = False

        idFaseProcessoSeletivoLabel.Text = ""
        idTipoFaseProcessoSeletivoLabel.Text = ""
        protocoloLabel.Text = ""


        idProcessoSeletivoLabel.Text = idProcessoSeletivo
        idVagaLabel.Text = idVaga
        idRH_GestorLabel.Text = idRH_Gestor
        CargoLabel.Text = dsCargo
        ProtocoloCabecLabel.Text = Protocolo

        GridViewApresentaFaseAtiva.DataBind()
        GridViewExpontaneo.DataBind()


        PanelCV.Visible = False

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""
        idcurriculoLabel.Text = ""

    End Sub

    Protected Sub DropDownListSelectEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.DataBound
        Try
            Dim myDropDownListSelectEmpresa As DropDownList = DropDownListSelectEmpresa
            myDropDownListSelectEmpresa.Items.Insert(0, New ListItem("-- Selecione uma Empresa --", "0"))
            myDropDownListSelectEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListSelectEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.SelectedIndexChanged

        ImageButtonXML.Visible = False
        ImageButtonEncerrar.Visible = False
        PanelCandidaturaEx.Visible = False
        GridViewExpontaneo.Visible = False
        PanelRun.Visible = False
        LabelCabec0.Visible = False
        LabelCabec2.Visible = False
        GridViewIndica.Visible = False

        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text

        CargoLabel.Text = ""
        ProtocoloCabecLabel.Text = ""

        idProcessoSeletivoLabel.Text = ""
        idTipoFaseProcessoSeletivoLabel.Text = ""
        idVagaLabel.Text = ""

        PanelFase.Visible = False
        PanelRun.Visible = False

        GridViewVAGA.DataBind()
        GridViewListaCandidatos.DataBind()
        GridViewApresentaFaseAtiva.DataBind()
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged

        REM ** ******************************************************************************************
        REM ** SELECIONA NOVA FASE DO PROCESSO SELETIVO

        ImageButtonFinalizaPS.Visible = True
        ImageButtonXML.Visible = False
        ImageButtonEncerrar.Visible = False
        PanelCandidaturaEx.Visible = False
        GridViewExpontaneo.Visible = False
        PanelRun.Visible = False
        LabelCabec0.Visible = False
        LabelCabec2.Visible = False
        GridViewIndica.Visible = False

        ImageButtonXML.Visible = False
        ImageButtonEncerrar.Visible = False
        PanelFase.Visible = True
        PanelCandidaturaEx.Visible = False
        GridViewExpontaneo.Visible = False
        GridViewResPesquisa.Visible = False

        idFaseProcessoSeletivoLabel.Text = ""
        idTipoFaseProcessoSeletivoLabel.Text = ""
        protocoloLabel.Text = ""


        idProcessoSeletivoLabel.Text = GridViewVAGA.SelectedDataKey("idProcessoSeletivo")
        idVagaLabel.Text = GridViewVAGA.SelectedDataKey("idVaga")
        idRH_GestorLabel.Text = GridViewVAGA.SelectedDataKey("idRH_Gestor")
        CargoLabel.Text = GridViewVAGA.SelectedDataKey("dsCargo")
        ProtocoloCabecLabel.Text = GridViewVAGA.SelectedDataKey("Protocolo")

        GridViewApresentaFaseAtiva.DataBind()
        GridViewExpontaneo.DataBind()


        PanelCV.Visible = False

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""
        idcurriculoLabel.Text = ""


    End Sub

    Protected Sub GridViewFase_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFase.SelectedIndexChanged

        ImageButtonFinalizaPS.Visible = False
        Legenda.Visible = True
        ImageButtonXML.Visible = True
        ImageButtonEncerrar.Visible = True
        PanelCandidaturaEx.Visible = True
        GridViewExpontaneo.Visible = True
        PanelRun.Visible = True
        LabelCabec0.Visible = True
        LabelCabec2.Visible = True
        GridViewIndica.Visible = True

        GridViewExpontaneo.DataBind()

        idFaseProcessoSeletivoLabel.Text = GridViewFase.SelectedDataKey("idFaseProcessoSeletivo")
        idFaseProcessoSeletivoCandidatoLabel.Text = ""
        idTipoFaseProcessoSeletivoLabel.Text = GridViewFase.SelectedDataKey("idTipoFaseProcessoSeletivo")
        dsFaseLabel.Text = GridViewFase.SelectedDataKey("dsFase")
        protocoloLabel.Text = GridViewFase.SelectedDataKey("Protocolo")

        REM ** VERIFICAÇÕES DA FASE DO PROCESSO SELETIVO

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_REALTIME_EXE", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idTipoFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idTipoFaseProcessoSeletivo").Value = idTipoFaseProcessoSeletivoLabel.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GetdadosFaseAtiva()

        GridViewFase.DataBind()

    End Sub

    Sub GetdadosFaseAtiva()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        con.Open()
        Dim query As String = "_USP_PROCESSOSELETIVO_REALTIME_EXE " & idFaseProcessoSeletivoLabel.Text & "," & idTipoFaseProcessoSeletivoLabel.Text
        Dim da As New SqlDataAdapter(query, con)
        Dim ds As New DataSet()
        da.Fill(ds)
        con.Close()

        GridViewApresentaFaseAtiva.DataSource = ds.Tables(0)

        GridViewApresentaFaseAtiva.DataBind()

    End Sub


    Sub GetPesquisaRES()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        con.Open()
        Dim query As String = "spPesquisaCandidato " & idProcessoSeletivoLabel.Text
        Dim da As New SqlDataAdapter(query, con)
        Dim ds As New DataSet()
        da.Fill(ds)
        con.Close()

        GridViewResPesquisa.DataSource = ds.Tables(0)

        GridViewResPesquisa.DataBind()
        ImageButtonXML.Visible = False
        ImageButtonEncerrar.Visible = True

    End Sub


    Protected Sub ImageButtonXML_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonXML.Click
        LabelCabec1.Visible = True
        GridViewResPesquisa.Visible = True
        GetPesquisaRES()
    End Sub






    REM ** ********************************************************************************************************************
    REM ** CV
    REM ** ********************************************************************************************************************


    Protected Sub ImageButtonPanel_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPanel.Click
        PanelCV.Visible = False
        msnEmailCandidato.Text = ""
        msgTextBox.Text = ""
        idRELcandidato_vagaLabel.Text = ""
        idFaseProcessoSeletivoCandidatoLabel.Text = ""
    End Sub


    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
            End If

            Dim myFoto As String = ""
            myFoto = DirectCast(e.Item.DataItem, DataRowView).Item("foto").ToString
            If myFoto <> "" Then
                ImageCV.ImageUrl = myFoto
            Else
                ImageCV.ImageUrl = "~/images/cvnoImage.png"
            End If


            Dim myNomeCadidato As String = ""
            myNomeCadidato = DirectCast(e.Item.DataItem, DataRowView).Item("nome").ToString
            If myNomeCadidato <> "" Then
                nomeCandidatoLabel.Text = myNomeCadidato
            Else
                nomeCandidatoLabel.Text = ""
            End If


            Dim myEmailCadidato As String = ""
            myEmailCadidato = DirectCast(e.Item.DataItem, DataRowView).Item("email").ToString
            If myEmailCadidato <> "" Then
                emailCandidatoLabel.Text = myEmailCadidato
            Else
                emailCandidatoLabel.Text = ""
            End If


        End If

    End Sub


    Private Sub DataList4_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList4.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label25.Text = DirectCast(e.Item.DataItem, DataRowView).Item("dsinstituicao").ToString

        End If

        If Label25.Text.ToString <> "" Then
            DataList4.ShowHeader = True
        Else
            DataList4.ShowHeader = False
        End If

    End Sub


    Private Sub DataList5_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList5.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label31.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("concluidoLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "Curso concluído"
            Else
                myLabel.Text = "Curso não concluído"
            End If

        End If

        If Label31.Text.ToString <> "" Then
            DataList5.ShowHeader = True
        Else
            DataList5.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList6_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList6.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label41.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label41.Text.ToString <> "" Then
            DataList6.ShowHeader = True
        Else
            DataList6.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList7_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList7.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label42.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label42.Text.ToString <> "" Then
            DataList7.ShowHeader = True
        Else
            DataList7.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList8_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList8.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label43.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label43.Text.ToString <> "" Then
            DataList8.ShowHeader = True
        Else
            DataList8.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList9_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList9.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label44.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label44.Text.ToString <> "" Then
            DataList9.ShowHeader = True
        Else
            DataList9.ShowHeader = False
        End If

    End Sub

    Protected Sub DataListDef_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListDef.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            LabelDf.Text = DirectCast(e.Item.DataItem, DataRowView).Item("Obs").ToString
        End If

        If LabelDf.Text.ToString <> "" Then
            DataListDef.ShowHeader = True
        Else
            DataListDef.ShowHeader = False
        End If

    End Sub



    REM ** ********************************************************************************************************************
    REM ** CV
    REM ** ********************************************************************************************************************


    Protected Sub GridViewResPesquisa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewResPesquisa.SelectedIndexChanged
        REM ** GARANTE QUE APENAS CANDIDATOS REGISTRADOS EM ALGUMA FASE POSSA RECEBER UM CONVITE DE AGENDAMENTO
        idFaseProcessoSeletivoCandidatoLabel.Text = ""
        REM ** *************************************************************************************************

        idcurriculoLabel.Text = GridViewResPesquisa.SelectedDataKey("idcurriculo")
        idUserLabel.Text = GridViewResPesquisa.SelectedDataKey("idUser")
        PanelCV.Visible = True

        Dim mycntCV As New cntCV
        mycntCV.cntCVCandidato(idcurriculoLabel.Text)

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""

    End Sub

    Protected Sub SqlSelecionarCV_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlSelecionarCV.Inserting
        e.Command.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text
        e.Command.Parameters("@idcurriculo").Value = idcurriculoLabel.Text
        e.Command.Parameters("@idvaga").Value = idVagaLabel.Text
    End Sub

    Protected Sub SqlSelecionarCV_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlSelecionarCV.Updating
        e.Command.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text
        e.Command.Parameters("@idcurriculo").Value = idcurriculoLabel.Text
    End Sub

    Protected Sub GridViewListaCandidatos_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaCandidatos.SelectedIndexChanged

        FormView1.ChangeMode(FormViewMode.Edit)

        idFaseProcessoSeletivoCandidatoLabel.Text = GridViewListaCandidatos.SelectedDataKey("idFaseProcessoSeletivo")

        If idFaseProcessoSeletivoCandidatoLabel.Text <> "" Then
            ImageButtonAGENDAC.Visible = True
        Else
            ImageButtonAGENDAC.Visible = False
        End If

        ImageButtonREPROVADOC.Visible = False
        ImageButtonAPROVADOC.ImageUrl = "~/images/empresa/PS_MudaAprovado_BT.png"

        idcurriculoLabel.Text = GridViewListaCandidatos.SelectedDataKey("idcurriculo")
        idUserLabel.Text = GridViewListaCandidatos.SelectedDataKey("idUser")

        PanelCV.Visible = True

        Dim mycntCV As New cntCV
        mycntCV.cntCVCandidato(idcurriculoLabel.Text)

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""

        FormView1.DataBind()

    End Sub

    Protected Sub SqlSelecionarCV_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlSelecionarCV.Inserted

        GridViewListaCandidatos.DataBind()
        GridViewExpontaneo.DataBind()

        REM ** *********************************************************************************
        REM ** ENVIA EMAIL AO CANDIDATO
        REM ** *********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.PathAndQuery, "")

        Dim msnCandidatoAviso As String = "Seu Currículo foi selecionado para fazer parte do Processo Seletivo " & protocoloLabel.Text & ", este é um bom momento para revisar seus dados!<br>Boa sorte."

        If emailCandidatoLabel.Text = "" Or nomeCandidatoLabel.Text = "" Then
            msnEmailCandidato.CssClass = "msn"
            msnEmailCandidato.Text = "Faltam dados do candidato, e-mail não enviado!"
        Else
            Dim TipoMensagem As String = "ProcessoSeletivo"
            Dim EnviaEmailCandidato As New EmailSQL
            Dim ResBodyEmail As String = ""
            Dim StatusEnviado As Boolean = False

            Dim bodyEmail As New BodyEmail

            ResBodyEmail = Replace(Replace(bodyEmail.GetBodySetup(TipoMensagem, Session("idSetup")), "#", msnCandidatoAviso), "*", URL)

            StatusEnviado = EnviaEmailCandidato.EnviamensagemSQL(ResBodyEmail, nomeCandidatoLabel.Text, emailCandidatoLabel.Text, "Processo Seletivo " & protocoloLabel.Text)

            If StatusEnviado Then
                msnEmailCandidato.CssClass = "msnOK"
                msnEmailCandidato.Text = "E-mail enviado com sucesso!"
            Else
                msnEmailCandidato.CssClass = "msn"
                msnEmailCandidato.Text = "Falha ao enviar e-mail ao candidato!"
            End If
        End If

        REM ** *********************************************************************************
        REM ** ENVIA EMAIL AO CANDIDATO
        REM ** *********************************************************************************

    End Sub

    Protected Sub SqlSelecionarCV_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlSelecionarCV.Updated
        GridViewListaCandidatos.DataBind()
    End Sub

    Protected Sub SqlSelecionarCV_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlSelecionarCV.Deleted

        GridViewListaCandidatos.DataBind()

        REM ** *********************************************************************************
        REM ** ENVIA EMAIL AO CANDIDATO
        REM ** *********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.PathAndQuery, "")

        Dim msnCandidatoAviso As String = "Seu Currículo foi removido do Processo Seletivo " & protocoloLabel.Text & ", não seria um bom momento para revisar seus dados?<br>Boa sorte na próxima."

        If emailCandidatoLabel.Text = "" Or nomeCandidatoLabel.Text = "" Then
            msnEmailCandidato.CssClass = "msn"
            msnEmailCandidato.Text = "Faltam dados do candidato, e-mail não enviado!"
        Else
            Dim TipoMensagem As String = "ProcessoSeletivo"
            Dim EnviaEmailCandidato As New EmailSQL
            Dim ResBodyEmail As String = ""
            Dim StatusEnviado As Boolean = False

            Dim bodyEmail As New BodyEmail

            ResBodyEmail = Replace(Replace(bodyEmail.GetBodySetup(TipoMensagem, Session("idSetup")), "#", msnCandidatoAviso), "*", URL)

            StatusEnviado = EnviaEmailCandidato.EnviamensagemSQL(ResBodyEmail, nomeCandidatoLabel.Text, emailCandidatoLabel.Text, "Processo Seletivo " & protocoloLabel.Text)

            If StatusEnviado Then
                msnEmailCandidato.CssClass = "msnOK"
                msnEmailCandidato.Text = "E-mail enviado com sucesso!"
            Else
                msnEmailCandidato.CssClass = "msn"
                msnEmailCandidato.Text = "Falha ao enviar e-mail ao candidato!"
            End If

        End If

        REM ** *********************************************************************************
        REM ** ENVIA EMAIL AO CANDIDATO
        REM ** *********************************************************************************
    End Sub

    Protected Sub GridViewListaCandidatos_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewListaCandidatos.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgAprovado As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "flgAprovado"))
            Select Case flgAprovado
                Case 0
                    e.Row.BackColor = Drawing.Color.Yellow ' Em análise, aguardando posição do Consultor.
                Case 1
                    e.Row.BackColor = Drawing.Color.YellowGreen ' Aprovado na Fase.
                Case 2
                    e.Row.BackColor = Drawing.Color.Orange  ' Aguardando posição do Candidato.
                Case 3
                    e.Row.BackColor = Drawing.Color.Red ' Reprovado na Fase.

            End Select
        End If

    End Sub

    Protected Sub ImageButtonEncerrar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonEncerrar.Click

        REM ** *********************************************************************************
        REM ** ENCERRAR O PROCESSO 
        REM ** *********************************************************************************

        Dim DataListEspontaneoRes As Int16 = DataListEspontaneo.SelectedValue


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_spFechaFaseProcessoSeletivo", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idsetup")

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewExpontaneo.DataBind()
        GridViewFase.DataBind()
        DataListEspontaneo.DataBind()


    End Sub

    Protected Sub GridViewExpontaneo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewExpontaneo.SelectedIndexChanged

        REM ** GARANTE QUE APENAS CANDIDATOS REGISTRADOS EM ALGUMA FASE POSSA RECEBER UM CONVITE DE AGENDAMENTO
        idFaseProcessoSeletivoCandidatoLabel.Text = ""
        REM ** *************************************************************************************************

        idRELcandidato_vagaLabel.Text = GridViewExpontaneo.SelectedDataKey("idRELcandidato_vaga")
        idcurriculoLabel.Text = GridViewExpontaneo.SelectedDataKey("idcurriculo")
        idUserLabel.Text = GridViewExpontaneo.SelectedDataKey("idUser")
        ImageButtonAPROVADOC.ImageUrl = "~/images/empresa/PS_Aprovado_BT.png"

        PanelCV.Visible = True
        ImageButtonREPROVADOC.Visible = True

        Dim mycntCV As New cntCV
        mycntCV.cntCVCandidato(idcurriculoLabel.Text)

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""

    End Sub

    Protected Sub ImageButtonEnviar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonEnviar.Click

        REM ** *********************************************************************************
        REM ** ENVIA EMAIL AO CANDIDATO
        REM ** *********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.PathAndQuery, "")

        If emailCandidatoLabel.Text = "" Or nomeCandidatoLabel.Text = "" Then
            msnEmailCandidato.CssClass = "msn"
            msnEmailCandidato.Text = "Faltam dados do candidato, e-mail não enviado!"
        Else
            Dim TipoMensagem As String = "ProcessoSeletivo"
            Dim EnviaEmailCandidato As New EmailSQL
            Dim ResBodyEmail As String = ""
            Dim StatusEnviado As Boolean = False

            Dim bodyEmail As New BodyEmail

            ResBodyEmail = Replace(Replace(bodyEmail.GetBodySetup(TipoMensagem, Session("idSetup")), "#", msgTextBox.Text), "*", URL)

            StatusEnviado = EnviaEmailCandidato.EnviamensagemSQL(ResBodyEmail, nomeCandidatoLabel.Text, emailCandidatoLabel.Text, "Processo Seletivo")

            If StatusEnviado Then
                msnEmailCandidato.CssClass = "msnOK"
                msnEmailCandidato.Text = "E-mail enviado com sucesso!"
            Else
                msnEmailCandidato.CssClass = "msn"
                msnEmailCandidato.Text = "Falha ao enviar e-mail ao candidato!"
            End If
        End If

    End Sub

    Protected Sub DataListEspontaneo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListEspontaneo.SelectedIndexChanged
        REM ** *********************************************************************************
        REM ** ENVIA EMAIL AO CANDIDATO
        REM ** *********************************************************************************

        REM ** *********************************************************************************
        REM ** PEGA MENSAGEM NO BANCO DE DADOS
        REM ** *********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.PathAndQuery, "")

        Dim MesagemAoCandidato As String = MONTAMENSAGEM(Session("idSetup"), "RetiraCandidaturaExp", nomeCandidatoLabel.Text, CargoLabel.Text, "", "")

        If emailCandidatoLabel.Text = "" Or nomeCandidatoLabel.Text = "" Then
            msnEmailCandidato.CssClass = "msn"
            msnEmailCandidato.Text = "Faltam dados do candidato, e-mail não enviado!"
        Else
            Dim TipoMensagem As String = "RetiraCandidaturaExp"
            Dim EnviaEmailCandidato As New EmailSQL
            Dim ResBodyEmail As String = ""
            Dim StatusEnviado As Boolean = False

            Dim bodyEmail As New BodyEmail

            ResBodyEmail = Replace(MesagemAoCandidato, "*", URL)

            StatusEnviado = EnviaEmailCandidato.EnviamensagemSQL(MesagemAoCandidato, nomeCandidatoLabel.Text, emailCandidatoLabel.Text, "Processo Seletivo")

            If StatusEnviado Then
                msnEmailCandidato.CssClass = "msnOK"
                msnEmailCandidato.Text = "E-mail enviado com sucesso!"
            Else
                msnEmailCandidato.CssClass = "msn"
                msnEmailCandidato.Text = "Falha ao enviar e-mail ao candidato!"
            End If
        End If

        REM ** *********************************************************************************
        REM ** LIBERAR CANDIDATO
        '_USP_PROCESSOSELETIVO_LIBERA_CANDIDATO
        REM ** *********************************************************************************

        Dim DataListEspontaneoRes As Int16 = DataListEspontaneo.SelectedValue


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_LIBERA_CANDIDATO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRELcandidato_vaga").Value = DataListEspontaneoRes

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewExpontaneo.DataBind()
        DataListEspontaneo.DataBind()

    End Sub

    Protected Sub GridViewIndica_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewIndica.SelectedIndexChanged

        REM ** GARANTE QUE APENAS CANDIDATOS REGISTRADOS EM ALGUMA FASE POSSA RECEBER UM CONVITE DE AGENDAMENTO
        idFaseProcessoSeletivoCandidatoLabel.Text = ""
        REM ** *************************************************************************************************

        idcurriculoLabel.Text = GridViewIndica.SelectedDataKey("idCurriculo")
        idUserLabel.Text = GridViewIndica.SelectedDataKey("idUser")
        PanelCV.Visible = True

        Dim mycntCV As New cntCV
        mycntCV.cntCVCandidato(idcurriculoLabel.Text)

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""
    End Sub

    Protected Sub NewButton_Load(sender As Object, e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub ImageButtonREPROVADOC_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonREPROVADOC.Click

        REM *** 
        REM RETIRAR
        REM ***

        If idRELcandidato_vagaLabel.Text <> "" Then

            REM ** *********************************************************************************
            REM ** PEGA MENSAGEM NO BANCO DE DADOS
            REM ** *********************************************************************************

            Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.PathAndQuery, "")

            Dim MesagemAoCandidato As String = MONTAMENSAGEM(Session("idSetup"), "RetiraCandidaturaExp", nomeCandidatoLabel.Text, CargoLabel.Text, "", "")

            If emailCandidatoLabel.Text = "" Or nomeCandidatoLabel.Text = "" Then
                msnEmailCandidato.CssClass = "msn"
                msnEmailCandidato.Text = "Faltam dados do candidato, e-mail não enviado!"
            Else
                Dim TipoMensagem As String = "RetiraCandidaturaExp"
                Dim EnviaEmailCandidato As New EmailSQL
                Dim ResBodyEmail As String = ""
                Dim StatusEnviado As Boolean = False

                Dim bodyEmail As New BodyEmail

                ResBodyEmail = Replace(MesagemAoCandidato, "*", URL)

                StatusEnviado = EnviaEmailCandidato.EnviamensagemSQL(MesagemAoCandidato, nomeCandidatoLabel.Text, emailCandidatoLabel.Text, "Processo Seletivo")

                If StatusEnviado Then
                    msnEmailCandidato.CssClass = "msnOK"
                    msnEmailCandidato.Text = "E-mail enviado com sucesso!"
                Else
                    msnEmailCandidato.CssClass = "msn"
                    msnEmailCandidato.Text = "Falha ao enviar e-mail ao candidato!"
                End If
            End If

            REM ** *********************************************************************************
            REM ** LIBERAR CANDIDATO
            '_USP_PROCESSOSELETIVO_LIBERA_CANDIDATO
            REM ** *********************************************************************************

            Dim DataListEspontaneoRes As Int16 = DataListEspontaneo.SelectedValue


            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PROCESSOSELETIVO_LIBERA_CANDIDATO", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaLabel.Text

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

            GridViewExpontaneo.DataBind()
            DataListEspontaneo.DataBind()
            PanelCV.Visible = False

        End If

    End Sub




    Protected Sub CalendarCandidato_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarCandidato.SelectionChanged
        DayPilotCalendarCandidato.StartDate = CalendarCandidato.SelectedDate
        CalendarCandidatoLabel.Text = CalendarCandidato.SelectedDate
        DataAgendamentoLabel.Text = "Agendamento para o dia: " & CalendarCandidato.SelectedDate
    End Sub


    Protected Sub SqlDataAgendaForm_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataAgendaForm.Inserting

        If CalendarCandidatoLabel.Text <> "" Then
            e.Command.Parameters("@idUser").Value = idUserLabel.Text
            e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
            e.Command.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")
            e.Command.Parameters("@idCurriculo").Value = idcurriculoLabel.Text
            e.Command.Parameters("@idEventoAgenda").Value = 5 ' ENTREVISTA [tbAgendaCEvento]
            e.Command.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text
            e.Command.Parameters("@idFaseProcessoSeletivoCV").Value = idFaseProcessoSeletivoLabel.Text
            e.Command.Parameters("@Protocolo").Value = Replace(ProtocoloCabecLabel.Text, ": Ok", "")
            e.Command.Parameters("@vaga").Value = CargoLabel.Text
            e.Command.Parameters("@DataTextField").Value = "Consultor: " & Session("nome") & "<br>" & CType(FormViewCalendario.FindControl("DataTextFieldTextBox"), TextBox).Text

            e.Command.Parameters("@DataStartField").Value = CalendarCandidatoLabel.Text & " " & CType(FormViewCalendario.FindControl("DropDownListIni"), DropDownList).SelectedItem.Text
            e.Command.Parameters("@DataEndField").Value = CalendarCandidatoLabel.Text & " " & CType(FormViewCalendario.FindControl("DropDownListFim"), DropDownList).SelectedItem.Text
            e.Command.Parameters("@Evento").Value = dsFaseLabel.Text
            e.Command.Parameters("@dsEventoAceite").Value = ""
            e.Command.Parameters("@DataValueField").Value = dsFaseLabel.Text
            e.Command.Parameters("@aceito").Value = 0
        Else
            CType(FormViewCalendario.FindControl("msn"), Label).Text = "Informe a data do agendamento!"
            e.Cancel = True
        End If

    End Sub

    Protected Sub SqlDataAgendaForm_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataAgendaForm.Updating
        e.Command.Parameters("@idUser").Value = Session("idUser")
        e.Command.Parameters("@DataStartField").Value = CType(FormViewCalendario.FindControl("DataStartFieldLabel"), Label).Text
        e.Command.Parameters("@DataEndField").Value = CType(FormViewCalendario.FindControl("DataEndFieldLabel"), Label).Text
    End Sub

    Protected Sub SqlDataAgendaForm_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataAgendaForm.Updated
        idCalendarioLabel.Text = ""
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        idCalendarioLabel.Text = ""
        DayPilotCalendarCandidato.DataBind()
    End Sub

    Protected Sub CalendarCandidato_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarCandidato.DayRender

        If Not e.Day.IsOtherMonth Then

            Dim dr As DataRow

            For Each dr In ds.Tables(0).Rows

                If Not dr("DataStartField") Is DBNull.Value Then

                    Dim dtEvent As DateTime = FormatDateTime(dr("DataStartField"), DateFormat.ShortDate)

                    If dtEvent.Equals(e.Day.Date) Then
                        e.Cell.BackColor = Drawing.Color.Orange
                        e.Cell.ForeColor = Drawing.Color.Black
                    End If

                End If
            Next

        Else

            e.Cell.Text = ""

        End If

    End Sub

    Protected Sub ImageButtonAGENDAC_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAGENDAC.Click

        PanelAgenda.Visible = True
        DataAgendamentoLabel.Text = "Agendamento para o dia: " & Day(Now()) & "/" & Month(Now()) & "/" & Year(Now())
        HorainiLabel.Text = "08:00:00"
        CalendarCandidatoLabel.Text = Day(Now()) & "/" & Month(Now()) & "/" & Year(Now())

        CType(FormViewCalendario.FindControl("DropDownListIni"), DropDownList).SelectedValue = HorainiLabel.Text
        CType(FormViewCalendario.FindControl("DropDownListIni"), DropDownList).DataBind()

        DayPilotCalendarCandidato.DataStartField = "DataStartField"
        DayPilotCalendarCandidato.DataEndField = "DataEndField"
        DayPilotCalendarCandidato.DataTextField = "DataTextField"
        DayPilotCalendarCandidato.StartDate = Now()
        DayPilotCalendarCandidato.DataValueField = "idCalendario"

    End Sub

    Protected Sub DropDownListIni_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        HorainiLabel.Text = CType(FormViewCalendario.FindControl("DropDownListIni"), DropDownList).SelectedValue
    End Sub

    Protected Sub ImageButtonCancel_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        PanelAgenda.Visible = False
    End Sub

    Protected Sub ImageButtonFechaAgenda_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonFechaAgenda.Click
        PanelAgenda.Visible = False
    End Sub

    Protected Sub DayPilotCalendarCandidato_FreeTimeClick(sender As Object, e As DayPilot.Web.Ui.FreeClickEventArgs) Handles DayPilotCalendarCandidato.FreeTimeClick

        Select Case Hour(e.Start)
            Case ("0")
                HorainiLabel.Text = "00:00:00"
            Case ("1")
                HorainiLabel.Text = "01:00:00"
            Case ("2")
                HorainiLabel.Text = "02:00:00"
            Case ("3")
                HorainiLabel.Text = "03:00:00"
            Case ("4")
                HorainiLabel.Text = "04:00:00"
            Case ("5")
                HorainiLabel.Text = "05:00:00"
            Case ("6")
                HorainiLabel.Text = "06:00:00"
            Case ("7")
                HorainiLabel.Text = "07:00:00"
            Case ("8")
                HorainiLabel.Text = "08:00:00"
            Case ("9")
                HorainiLabel.Text = "09:00:00"
            Case Else
                HorainiLabel.Text = Hour(e.Start) & ":00:00"
        End Select

        CType(FormViewCalendario.FindControl("DropDownListIni"), DropDownList).SelectedValue = HorainiLabel.Text
        CType(FormViewCalendario.FindControl("DropDownListIni"), DropDownList).DataBind()


    End Sub

    Protected Sub SqlDataAgendaForm_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataAgendaForm.Inserted
        Dim mySMS As New sms
        Dim myPrimeiroNome As New PrimeiroNome

        REM ** ****************************************************************************************************************
        REM ** SMS PARA O CANDIDATO
        mySMS.SendSMSPrepareVIAConsultor(idUserLabel.Text, myPrimeiroNome.FirstNome(Session("nmempresa")) & " Informa: Foi registrado um apontamento em sua agenda com o Consultor " & Session("nome"))
        REM ** ****************************************************************************************************************
        DayPilotCalendarCandidato.DataStartField = "DataStartField"
        DayPilotCalendarCandidato.DataEndField = "DataEndField"
        DayPilotCalendarCandidato.DataTextField = "DataTextField"
        DayPilotCalendarCandidato.StartDate = DayPilotCalendarCandidato.StartDate
        DayPilotCalendarCandidato.DataValueField = "idCalendario"

        SqlDataAgenda.DataBind()
        DayPilotCalendarCandidato.DataBind()
        CalendarCandidato.DataBind()

    End Sub

    Protected Sub LinkButton2_Load(sender As Object, e As System.EventArgs)
        FormViewCalendario.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub ImageButtonFinalizaPS_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonFinalizaPS.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_spFechaProcessoSeletivo", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewFase.DataBind()
        GridViewListaCandidatos.DataBind()


    End Sub

    Protected Sub ImageButtonImprimir_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonImprimir.Click
        Response.Redirect("/_anonimo/_mycurriculoDOC_Consultor.aspx?idUser=" & idUserLabel.Text & "&id=" & idcurriculoLabel.Text & "&DocName=" & nomeCandidatoLabel.Text)
    End Sub

    Function MONTAMENSAGEM(idSetup As Int32, idmensagem As String, Sub1 As String, Sub2 As String, Sub3 As String, Sub4 As String) As String

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim Res As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_MONTA_MENSAGENS_AOS_CANDIDATOS", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idmensagem", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idmensagem").Value = idmensagem

        prm = New SqlParameter("@idsetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idsetup").Value = idSetup

        prm = New SqlParameter("@1", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@1").Value = Sub1

        prm = New SqlParameter("@2", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@2").Value = Sub2

        prm = New SqlParameter("@3", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@3").Value = Sub3

        prm = New SqlParameter("@4", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@4").Value = Sub4


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()

        Res = dr("MENSAGEM_MONTADA")

        dr.Close()
        cn.Close()

        Return Res

    End Function

End Class
