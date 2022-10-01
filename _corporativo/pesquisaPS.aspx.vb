Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser
Imports email
Imports ReplaceForm
Imports criptografia

Partial Class _corporativo_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        REM ******************************************************************************************
        REM CONFIGURAÇÃO DO NAVEGADOR

        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
        candidatoPagaLabel.Text = Session("candidatoPaga")
        liberaQtdCadLabel.Text = Session("liberaQtdCad")
        idsetupLabel.Text = Session("idsetup")

        idRH_GestorLabel.Text = Session("idRH_Gestor")
        nomeConsultorLabel.Text = Session("nomeConsultor")
        PanelAviso.Visible = False
        PanelENTREVISTAVIRTUAL.Visible = False
        PanelEXCLUICANDIDATURA.Visible = False
        PanelCVCandidato.Visible = False
        PanelEMAIL.Visible = False
        PanelENTREVISTAPRESENCIAL.Visible = False
        PanelAPROVACANDIDATURA.Visible = False
        PanelANALISE.Visible = False
        PanelEXCLUICANDIDATURA.Visible = False
        PanelENCERRAFASE.Visible = False
        PanelFILTRO.Visible = False
        PanelLAUDO.Visible = False
        PanelTESTE.Visible = False
        PanelAVALIACAOENTREVISTAPRESENCIAL.Visible = False
        PanelCOMPRACV.Visible = False
        DayPilotCalendarENTREVISTAPRESENCIAL.StartDate = Now()
        DayPilotCalendarENTREVISTAVIRTUAL.StartDate = Now()
        HorafimLabel.Value = "30"

        If Not IsPostBack Then
            idCurriculoLabel.Text = ""
        End If


        REM CONFIGURAÇÃO DO NAVEGADOR
        REM ******************************************************************************************

    End Sub

    Sub COMPRACV(idCurriculo As Int32, idCadastroEmpresa As Int32, idCadastroEmpresa_Layout As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_COMPRA_CURRICULO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = DataListResultado.SelectedValue

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idCadastroEmpresa_Layout", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa_Layout").Value = Session("idCadastroEmpresa_Layout")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@COMPRAR", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@COMPRAR").Value = 0

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                REM ** *****************************************************************************
                REM ** RECUPERA OS DADOS DO CANDIDATO - ATUALIZA CONTADOR DE VISUALIZAÇÃO
                REM ** *****************************************************************************

                CVliberado.Text = dr("associadoComprou")

            End If
            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub LinkButtonPS_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPS.Click

        If TextBoxPesquisaPS.Text <> "" Then
            Dim COMPRIMENTOTEXTO As Int32 = Len(TextBoxPesquisaPS.Text)
            If COMPRIMENTOTEXTO >= 22 Then
                TEXTOPESQUISALabel.Text = Trim(Right(TextBoxPesquisaPS.Text, COMPRIMENTOTEXTO - 19))
                TipoPesquisaLabel.Text = ""
                idProcessoSeletivoLabel.Text = ""
                minAderenciaLabel.Text = ""
                habilitaLaudoLabel.Text = DropDownListFase.SelectedItem.Text
            Else
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Informe o nome ou parte do nome do Processo Seletivo.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            End If

            PanelListaCandidato.Visible = False
            PanelResultadoPesquisa.Visible = True
            DataListProcessoSeletivo.DataBind()
            SqlDataSourcePesquisa.DataBind()
        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe o nome ou parte do nome do Processo Seletivo.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End If

        LinkButtonPS.Text = "Pesquisar nos Processos Seletivos"
        LinkButtonPS.ToolTip = "Clique para iniciar a pesquisa por aderência"

    End Sub



    Protected Sub DataListMensagem_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListMensagem.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If Not DirectCast(e.Item.DataItem, DataRowView).Item("Mensagem") Is DBNull.Value Then
                DataListProcessoSeletivo.Visible = False
            Else
                DataListProcessoSeletivo.Visible = True
            End If
        End If
    End Sub

    Protected Sub DataListProcessoSeletivo_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListProcessoSeletivo.ItemDataBound

        REM ** NO MOMENTO DE CRIAÇÃO DO DATALIST

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            If DirectCast(e.Item.FindControl("statusFASE"), Label).Text = "Aberto" Then
                DirectCast(e.Item.FindControl("statusFASE"), Label).CssClass = "textoProcessoSeletivoABERTO"
            Else
                DirectCast(e.Item.FindControl("statusFASE"), Label).CssClass = "textoProcessoSeletivoFECHADO"
            End If

            If DirectCast(e.Item.FindControl("FechadoLabel"), Label).Text = "Aberto" Then
                DirectCast(e.Item.FindControl("FechadoLabel"), Label).CssClass = "textoProcessoSeletivoABERTO"
            Else
                DirectCast(e.Item.FindControl("FechadoLabel"), Label).CssClass = "textoProcessoSeletivoFECHADO"
            End If

            REM [NEW]
            idTipoFaseProcessoSeletivoLabel.Text = DirectCast(e.Item.FindControl("idTipoFaseProcessoSeletivoLabel"), Label).Text
            idFaseProcessoSeletivoLabel.Text = DirectCast(e.Item.FindControl("idFaseProcessoSeletivoLabel"), Label).Text
            moduloLabel.Text = DirectCast(e.Item.FindControl("moduloLabel"), Label).Text
            StatusFaseLabel.Text = DirectCast(e.Item.FindControl("statusFASE"), Label).Text
            REM [NEW]

            REM ** ************************************************************************************************
            REM ** PROCESSO SELETIVO ENCERRADO (LIBERAR PREENCHIMENTO DE LAUDO DO CANDIDATO)
            REM ** (flgEncerradoPS)
            REM ** ************************************************************************************************
            flgEncerradoPSLabel.Text = DirectCast(e.Item.FindControl("FechadoLabel"), Label).Text
            REM ** ************************************************************************************************

            If DirectCast(e.Item.FindControl("statusFASE"), Label).Text = "Aberto" Then
                DirectCast(e.Item.FindControl("statusFASE"), Label).CssClass = "textoProcessoSeletivoABERTO"
                DirectCast(e.Item.FindControl("ImageButtonPESQUISA"), ImageButton).ImageUrl = "~/_corporativo/images/holomatica/PESQUISACANDIDATO.png"
                DirectCast(e.Item.FindControl("ImageButtonPESQUISA"), ImageButton).Enabled = True
                DirectCast(e.Item.FindControl("ImageButtonFILTRO"), ImageButton).Visible = True
                DirectCast(e.Item.FindControl("ImageButtonFILTRO"), ImageButton).ToolTip = "Clique aqui para aplicar o filtro dinâmico"
            Else
                DirectCast(e.Item.FindControl("statusFASE"), Label).CssClass = "textoProcessoSeletivoFECHADO"
                DirectCast(e.Item.FindControl("ImageButtonPESQUISA"), ImageButton).ImageUrl = "~/_corporativo/images/holomatica/PESQUISACANDIDATO_D.png"
                DirectCast(e.Item.FindControl("ImageButtonPESQUISA"), ImageButton).Enabled = False
                DirectCast(e.Item.FindControl("ImageButtonFILTRO"), ImageButton).Visible = False
                DirectCast(e.Item.FindControl("ImageButtonPESQUISA"), ImageButton).ToolTip = "Fase encerrada"
            End If

        End If
    End Sub

    Protected Sub DataListProcessoSeletivo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListProcessoSeletivo.SelectedIndexChanged
        idProcessoSeletivoLabel.Text = DataListProcessoSeletivo.SelectedValue
        faseSelecionadaLabel.Text = "Resultado da pesquisa "
        TipoPesquisaLabel.Text = "Pesquisa"

        DropDownListADERENCIA.SelectedValue = "50"
        REFINAMENTOPESQUISA.Visible = True
        LinkButtonPS.Text = "Retornar os resultados da pesquisa"
        LinkButtonPS.ToolTip = "Clique aqui para retornar aos resultados da sua pesquisa por aderência"

        SqlDataSourceCandidato.DataBind()
        DataListResultado.DataBind()
        PanelListaCandidato.Visible = True
    End Sub

    Protected Sub ImageButtonCadidato_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        REM ** *******************************************************************************************************************
        REM ** APRESENTA OS DADOS DO CANDIDATO
        REM ** *******************************************************************************************************************


        REM ** *******************************************************************************************************************
        REM ** APRESENTA OS DADOS DO CANDIDATO
        REM ** *******************************************************************************************************************
    End Sub

    Protected Sub DataListResultado_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListResultado.SelectedIndexChanged

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        idCurriculoLabel.Text = DataListResultado.SelectedValue
        PanelCVCandidato.Visible = True
        MaintainScrollPositionOnPostBack = False

        REM ** REGISTRA NA TABELA (tbFaseProcessoSeletivo) UMA ANALISE FEITA EM UM CURRÍCULO

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CV_ANALIZADO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = DataListResultado.SelectedValue

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@URL", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        prm = New SqlParameter("@ENVIAEMAIL", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ENVIAEMAIL").Value = 1


        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                REM ** *****************************************************************************
                REM ** RECUPERA OS DADOS DO CANDIDATO - ATUALIZA CONTADOR DE VISUALIZAÇÃO
                REM ** *****************************************************************************

                nomeCandidatoLabel.Text = dr("nome")

            End If
            cn.Close()
        Catch ex As Exception

        End Try

        SqlDADOSPESSOAIS.DataBind()

        If idCurriculoLabel.Text <> "" Then
            COMPRACV(idCurriculoLabel.Text, idCadastroEmpresaLabel.Text, Session("idCadastroEmpresa_Layout"))
        End If

    End Sub

    Protected Sub LinkButtonLIMPAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLIMPAR.Click

        DropDownListFase.SelectedValue = 0
        TextBoxPesquisaPS.Text = ""
        TEXTOPESQUISALabel.Text = ""
        DataListProcessoSeletivo.DataBind()
        SqlDataSourcePesquisa.DataBind()
        PanelListaCandidato.Visible = False
        PanelResultadoPesquisa.Visible = False
        PanelENTREVISTAPRESENCIALFORM.Visible = False
        PanelENCERRAFASEFORM.Visible = False
        PanelFILTRODINAMICO.Visible = False
        LinkButtonPS.Text = "Pesquisar nos Processos Seletivos"
        LinkButtonPS.ToolTip = "Clique para iniciar a pesquisa por aderência"
        PanelLAUDOFORM.Visible = False

    End Sub

    Protected Sub DataListResultado_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListResultado.ItemDataBound
        Dim i As Integer
        Dim REPROVAButton As ImageButton
        Dim APROVAButton As ImageButton
        Dim APROVAFASEButton As ImageButton
        Dim EMAILButton As ImageButton
        Dim ENTREVISTAPRESENCIALButton As ImageButton
        Dim ENTREVISTAVIRTUALButton As ImageButton
        Dim LAUDOButton As ImageButton
        Dim TESTEButton As ImageButton
        Dim HISTORICO_ENTREVISTA_PRESENCIALButton As ImageButton

        For i = 0 To DataListResultado.Items.Count - 1
            REPROVAButton = DataListResultado.Items(i).FindControl("ImageButtonREPROVAR")
            APROVAButton = DataListResultado.Items(i).FindControl("ImageButtonAPROVAR")
            APROVAFASEButton = DataListResultado.Items(i).FindControl("ImageButtonAPROVAR_FASE")
            EMAILButton = DataListResultado.Items(i).FindControl("ImageButtonEMAIL")
            ENTREVISTAPRESENCIALButton = DataListResultado.Items(i).FindControl("ImageButtonAGENDA")
            LAUDOButton = DataListResultado.Items(i).FindControl("ImageButtonLAUDO")
            TESTEButton = DataListResultado.Items(i).FindControl("ImageButtonTESTE")
            HISTORICO_ENTREVISTA_PRESENCIALButton = DataListResultado.Items(i).FindControl("ImageButtonHISTORICO_ENTREVISTA_PRESENCIAL")
            ENTREVISTAVIRTUALButton = DataListResultado.Items(i).FindControl("ImageButtonENTREVISTAVIRTUAL")

            REM ** O QUE É APRESENTADO QUANDO É PESQUISADA A BASE DE TALENTOS
            REM ** ****************************************************************************
            If TipoPesquisaLabel.Text = "Pesquisa" Then
                REPROVAButton.Visible = True
                APROVAButton.Visible = False
                APROVAFASEButton.Visible = True
                EMAILButton.Visible = True
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = False
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False
            End If

            REM ** O QUE É APRESENTADO QUANDO É CANDIDATURA ESPONTÂNEA
            REM ** ****************************************************************************
            If TipoPesquisaLabel.Text = "Espontanea" Then
                REPROVAButton.Visible = True
                APROVAButton.Visible = False
                APROVAFASEButton.Visible = True
                EMAILButton.Visible = True
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = False
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False
            End If

            If TipoPesquisaLabel.Text = "Aprovado" Then
                REPROVAButton.Visible = True
                APROVAButton.Visible = False
                EMAILButton.Visible = True
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = False
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False
            End If

            REM ** AQUI SERÁ APLICADO OS MÓDULO
            REM ** **************************************************************************
            REM ** LÓGICA PARA OS MÓDULOS
            REM ** **************************************************************************
            REM ** fase_mod_recrutamento
            REM ** fase_mod_avaliacao
            REM ** fase_mod_entrevistaPresencial
            REM ** fase_mod_entrevistaVirtual
            REM ** fase_mod_laudo
            REM ** fase_mod_finalizado

            Select Case True

                Case StatusFaseLabel.Text = "Fechado"

                    REPROVAButton.Visible = False
                    APROVAButton.Visible = False
                    APROVAFASEButton.Visible = False '(*) O APROVA NA FASE É UTILIZADO APENAS AQUI
                    EMAILButton.Visible = True
                    ENTREVISTAPRESENCIALButton.Visible = False
                    ENTREVISTAVIRTUALButton.Visible = False
                    LAUDOButton.Visible = False
                    TESTEButton.Visible = False
                    HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = True

                Case moduloLabel.Text = "fase_mod_recrutamento"

                    REM ** 

                    If TipoPesquisaLabel.Text = "Fase" Then

                        REPROVAButton.Visible = True
                        APROVAButton.Visible = True
                        APROVAFASEButton.Visible = False '(*) O APROVA NA FASE É UTILIZADO APENAS AQUI
                        EMAILButton.Visible = True
                        ENTREVISTAPRESENCIALButton.Visible = False
                        ENTREVISTAVIRTUALButton.Visible = False
                        LAUDOButton.Visible = False
                        TESTEButton.Visible = False
                        HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False

                    End If

                Case moduloLabel.Text = "fase_mod_entrevistaPresencial"

                    If TipoPesquisaLabel.Text = "Fase" Then
                        REPROVAButton.Visible = False
                        APROVAButton.Visible = False
                        EMAILButton.Visible = True
                        ENTREVISTAPRESENCIALButton.Visible = True
                        ENTREVISTAVIRTUALButton.Visible = False
                        LAUDOButton.Visible = False
                        TESTEButton.Visible = False
                        HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = True

                    End If

                Case moduloLabel.Text = "fase_mod_entrevistaVirtual"

                    If TipoPesquisaLabel.Text = "Fase" Then
                        REPROVAButton.Visible = False
                        APROVAButton.Visible = False
                        EMAILButton.Visible = True
                        ENTREVISTAPRESENCIALButton.Visible = False
                        ENTREVISTAVIRTUALButton.Visible = True
                        LAUDOButton.Visible = False
                        TESTEButton.Visible = False
                        HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False

                    End If

                Case moduloLabel.Text = "fase_mod_avaliacao"

                    If TipoPesquisaLabel.Text = "Fase" Then
                        REPROVAButton.Visible = False
                        APROVAButton.Visible = False
                        EMAILButton.Visible = True
                        ENTREVISTAPRESENCIALButton.Visible = False
                        ENTREVISTAVIRTUALButton.Visible = False
                        LAUDOButton.Visible = False
                        TESTEButton.Visible = True
                        HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False

                    End If

                Case moduloLabel.Text = "fase_mod_laudo"

                    If TipoPesquisaLabel.Text = "Fase" Then
                        REPROVAButton.Visible = False
                        APROVAButton.Visible = False
                        EMAILButton.Visible = True
                        ENTREVISTAPRESENCIALButton.Visible = False
                        ENTREVISTAVIRTUALButton.Visible = False
                        LAUDOButton.Visible = True
                        TESTEButton.Visible = False
                        HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = True

                    End If

            End Select

            If TipoPesquisaLabel.Text = "Analisado" Then
                REPROVAButton.Visible = False
                APROVAButton.Visible = False
                EMAILButton.Visible = False
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = False
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False
            End If

            If TipoPesquisaLabel.Text = "Reprovado" Then
                REPROVAButton.Visible = False
                APROVAButton.Visible = False
                EMAILButton.Visible = False
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = False
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False
            End If

            If flgEncerradoPSLabel.Text = "Fechado" Then
                REPROVAButton.Visible = False
                APROVAButton.Visible = False
                EMAILButton.Visible = False
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = True
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = True
            End If

            If habilitaLaudoLabel.Text = "Laudo" Then
                REPROVAButton.Visible = True
                APROVAButton.Visible = True
                EMAILButton.Visible = True
                ENTREVISTAPRESENCIALButton.Visible = False
                ENTREVISTAVIRTUALButton.Visible = False
                LAUDOButton.Visible = True
                TESTEButton.Visible = False
                HISTORICO_ENTREVISTA_PRESENCIALButton.Visible = False
            End If
        Next
    End Sub

    Protected Sub Aprova(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataListResultado.ItemCommand
        idCurriculoLabel.Text = e.CommandArgument
        Select Case e.CommandName
            Case "Aprova"
                AVALIADO(idCurriculoLabel.Text)
                PanelAPROVACANDIDATURA.Visible = True
                inpHide.Visible = True
                LOGICACOMPRA()
            Case "Analise" '--> COLOCA O CANDIDATO EM ANÁLISE
                AVALIADO(idCurriculoLabel.Text)
                PanelANALISE.Visible = True
                inpHide.Visible = True
                LOGICACOMPRA()
            Case "Reprova"
                AVALIADO(idCurriculoLabel.Text)
                PanelEXCLUICANDIDATURA.Visible = True
            Case "Email"
                AVALIADO(idCurriculoLabel.Text)
                PanelEMAIL.Visible = True
                LOGICACOMPRA()
            Case "EntrevistaVirtual"
                AVALIADO(idCurriculoLabel.Text)
                PanelENTREVISTAVIRTUAL.Visible = True
                PanelENTREVISTAVIRTUALFORM.Visible = True
                GridViewCANDIDATOVIRTUAL.DataBind()
            Case "EntrevistaPresencial"
                AVALIADO(idCurriculoLabel.Text)
                PanelENTREVISTAPRESENCIAL.Visible = True
                PanelENTREVISTAPRESENCIALFORM.Visible = True
                GridViewCANDIDATO.DataBind()
            Case "Laudo"
                PanelLAUDO.Visible = True
                PanelLAUDOFORM.Visible = False
                MONTALAUDOCANDIDATO(idCurriculoLabel.Text)
                GridViewCANDIDATO.DataBind()
            Case "Teste"
                AVALIADO(idCurriculoLabel.Text)
                PanelTESTE.Visible = True
                PanelTesteFORM.Visible = True
            Case "HistoricoEntrevistaPresencial"
                PanelAVALIACAOENTREVISTAPRESENCIAL.Visible = True

        End Select
    End Sub

    Sub MONTALAUDOCANDIDATO(ByVal idCurriculo As Int32)

        REM ** ****************************************************************************************
        REM ** MONTA AUTOMATICAMENTE O LAUDO DO CANDIDATO (DADOS DISPONÍVEIS) OU ATUALIZA LAUDO
        REM ** ****************************************************************************************

        Dim idLaudo As Int32
        REM ** **************************************************************
        REM ** VERIFICA SE EXISTE LAUDO PARA O CANDIDATO
        REM ** **************************************************************
        idLaudo = VERIFICA_LAUDO()


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        If idLaudo = 0 Then

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_LAUDO]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

            prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

            prm = New SqlParameter("@idSetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idSetup").Value = Session("idSetup")

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")


            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows Then
                    dr.Read()
                    idLaudoLabel.Text = dr("idLaudo")
                End If

                cn.Close()
            Catch ex As Exception

            End Try

        End If

        REM ** ****************************************************************************************
        REM ** LAUDO CRIADO
        REM ** ****************************************************************************************

        CARREGAFORMULARIO()

    End Sub

    Function VERIFICA_LAUDO() As Int32

        Dim idLaudo As Int32

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_LAUDO_CARREGA_FORM]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                idLaudo = dr("idLaudo")
                idLaudoLabel.Text = idLaudo
            Else
                idLaudo = 0
            End If

            cn.Close()

        Catch ex As Exception

        End Try

        Return idLaudo

    End Function

    Sub CARREGAFORMULARIO()

        REM ** ****************************************************************************************
        REM ** CARREGAR O FORMULÁRIO PARA ALTERAÇÃO DOS DADOS DO LAUDO
        REM ** ****************************************************************************************

        Dim myReplace As New ReplaceForm

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        trajetoriaProfissionalTextBox0.Text = ""
        conhecimentoTextBox0.Text = ""
        ultimoSalarioTextBox0.Text = ""
        caracteristicaPessoal_FamiliarTextBox0.Text = ""
        caracteristicaPessoal_SocialTextBox0.Text = ""
        caracteristicaPessoal_AtitudinaisTextBox0.Text = ""
        caracteristicaPessoal_HabilidadeTextBox0.Text = ""
        caracteristicaPessoal_MotivacaoTextBox0.Text = ""
        pontoforteTextBox0.Text = ""
        pontoaObservarDesenvolverTextBox0.Text = ""


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_LAUDO_CARREGA_FORM]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idLaudo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idLaudo").Value = idLaudoLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()

                idLaudoLabel.Text = dr("idLaudo")
                trajetoriaProfissionalTextBox0.Text = myReplace.ReplaceIn(dr("trajetoriaProfissional"))
                conhecimentoTextBox0.Text = myReplace.ReplaceIn(dr("conhecimento"))
                ultimoSalarioTextBox0.Text = myReplace.ReplaceIn(dr("ultimoSalario"))
                caracteristicaPessoal_FamiliarTextBox0.Text = myReplace.ReplaceIn(dr("caracteristicaPessoal_Familiar"))
                caracteristicaPessoal_SocialTextBox0.Text = myReplace.ReplaceIn(dr("caracteristicaPessoal_Social"))
                caracteristicaPessoal_AtitudinaisTextBox0.Text = myReplace.ReplaceIn(dr("caracteristicaPessoal_Atitudinais"))
                caracteristicaPessoal_HabilidadeTextBox0.Text = myReplace.ReplaceIn(dr("caracteristicaPessoal_Habilidade"))
                caracteristicaPessoal_MotivacaoTextBox0.Text = myReplace.ReplaceIn(dr("caracteristicaPessoal_Motivacao"))
                pontoforteTextBox0.Text = myReplace.ReplaceIn(dr("pontoforte"))
                pontoaObservarDesenvolverTextBox0.Text = myReplace.ReplaceIn(dr("pontoaObservarDesenvolver"))

            End If

            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub LinkButtonREPROVAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonREPROVAR.Click

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim enviaEmail As New EmailSQL

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_REPROVADO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Mensagem enviada, candidatura excluída!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, candidatura não excluída!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        DataListResultado.DataBind()
        DataListProcessoSeletivo.DataBind()

    End Sub

    Protected Sub ATIVIDADE(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataListProcessoSeletivo.ItemCommand

        idFaseProcessoSeletivoLabel.Text = e.CommandArgument
        idProcessoSeletivoLabel.Text = CType(e.Item.FindControl("idProcessoSeletivoLabel"), Label).Text
        idTipoFaseProcessoSeletivoLabel.Text = CType(e.Item.FindControl("idTipoFaseProcessoSeletivoLabel"), Label).Text
        Select Case e.CommandName

            Case "SELECT_MODULO"

                SELECIONAFASE(idTipoFaseProcessoSeletivoLabel.Text)

            Case "ESPONTANEO"
                idCurriculoLabel.Text = ""
                PanelListaCandidato.Visible = True
                faseSelecionadaLabel.Text = "Lista das candidaturas espontâneas "
                TipoPesquisaLabel.Text = "Espontanea"
                dataLabel.Text = Session("idRH_Gestor")

                DataListResultado.DataBind()
                SqlDataSourceCandidato.DataBind()
                DropDownListADERENCIA.SelectedValue = "50"
                REFINAMENTOPESQUISA.Visible = True
                MaintainScrollPositionOnPostBack = False
                REM ** [NEW]
                SELECIONAFASE(idTipoFaseProcessoSeletivoLabel.Text)
                REM ** [NEW]

            Case "ANALISADO"
                idCurriculoLabel.Text = ""
                PanelListaCandidato.Visible = True
                faseSelecionadaLabel.Text = "Lista dos Candidatos analisados "
                TipoPesquisaLabel.Text = "Analisado"
                dataLabel.Text = Session("idRH_Gestor")

                DataListResultado.DataBind()
                SqlDataSourceCandidato.DataBind()
                DropDownListADERENCIA.SelectedValue = "50"
                REFINAMENTOPESQUISA.Visible = True
                MaintainScrollPositionOnPostBack = False
                REM ** [NEW]
                SELECIONAFASE(idTipoFaseProcessoSeletivoLabel.Text)
                REM ** [NEW]

            Case "APROVADO"
                idCurriculoLabel.Text = ""
                PanelListaCandidato.Visible = True
                faseSelecionadaLabel.Text = "Lista dos Candidatos aprovados "
                TipoPesquisaLabel.Text = "Aprovado"
                dataLabel.Text = Session("idRH_Gestor")

                DataListResultado.DataBind()
                SqlDataSourceCandidato.DataBind()
                DropDownListADERENCIA.SelectedValue = "50"
                REFINAMENTOPESQUISA.Visible = True
                MaintainScrollPositionOnPostBack = False
                REM ** [NEW]
                SELECIONAFASE(idTipoFaseProcessoSeletivoLabel.Text)
                REM ** [NEW]

            Case "REPROVADO"
                idCurriculoLabel.Text = ""
                PanelListaCandidato.Visible = True
                faseSelecionadaLabel.Text = "Lista dos Candidatos reprovados "
                TipoPesquisaLabel.Text = "Reprovado"
                dataLabel.Text = Session("idRH_Gestor")

                DataListResultado.DataBind()
                SqlDataSourceCandidato.DataBind()
                DropDownListADERENCIA.SelectedValue = "50"
                REFINAMENTOPESQUISA.Visible = True
                MaintainScrollPositionOnPostBack = False
                REM ** [NEW]
                SELECIONAFASE(idTipoFaseProcessoSeletivoLabel.Text)
                REM ** [NEW]

            Case "NAFASE"
                idCurriculoLabel.Text = ""
                PanelListaCandidato.Visible = True
                faseSelecionadaLabel.Text = "Lista dos participantes na fase "
                TipoPesquisaLabel.Text = "Fase"
                dataLabel.Text = Session("idRH_Gestor")

                DataListResultado.DataBind()
                SqlDataSourceCandidato.DataBind()
                DropDownListADERENCIA.SelectedValue = "50"
                REFINAMENTOPESQUISA.Visible = True
                MaintainScrollPositionOnPostBack = False
                REM ** [NEW]
                SELECIONAFASE(idTipoFaseProcessoSeletivoLabel.Text)
                REM ** [NEW]

            Case "ENCERRADO"

                LabelENCERRAFASE.Text = "Você está abrindo uma nova fase para este processo seletivo.<br><b>Aviso:</b> Para iniciar uma nova fase, basta selecionar uma das fases apresentadas na lista abaixo. Se deseja finalizar o processo seletivo, selecione na lista abaixo a fase (Finalizado) que o processo será finalizado juntamente com a fase atual."
                PanelENCERRAFASE.Visible = True
                PanelENCERRAFASEFORM.Visible = True

            Case "FILTRO"

                PanelFILTRODINAMICO.Visible = True

        End Select

    End Sub

    Protected Sub LinkButtonCANCELAR2_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCANCELAR2.Click
        PanelENCERRAFASEFORM.Visible = False
    End Sub

    Protected Sub LinkButtonAPROVAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAPROVAR.Click

        NivelAprovacaoLabel.Text = inpHide.Value
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim enviaEmail As New email

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_APROVADO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@nivelAPROVADO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nivelAPROVADO").Value = NivelAprovacaoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Mensagem enviada, candidatura aprovada!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, candidatura não aprovada!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        DataListResultado.DataBind()
        DataListProcessoSeletivo.DataBind()

    End Sub

    Protected Sub LinkButtonENVIAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENVIAR.Click
        textareaMENSAGEMLabel.Text = inpHideTextArea.Value
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim enviaEmail As New EmailSQL

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_EMAIL]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@mensagem", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagem").Value = textareaMENSAGEMLabel.Text

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Mensagem enviada ao candidato!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        DataListResultado.DataBind()
        DataListProcessoSeletivo.DataBind()

    End Sub

    Protected Sub CalendarSET_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarSET.SelectionChanged
        DayPilotCalendarENTREVISTAPRESENCIAL.StartDate = CalendarSET.SelectedDate
    End Sub

    Protected Sub DayPilotCalendarENTREVISTAPRESENCIAL_FreeTimeClick(sender As Object, e As DayPilot.Web.Ui.FreeClickEventArgs) Handles DayPilotCalendarENTREVISTAPRESENCIAL.FreeTimeClick

        DayPilotCalendarENTREVISTAPRESENCIAL.StartDate = e.Start
        CalendarSET.SelectedDate = e.Start.Date
        HorafimLabel.Value = "30"

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

        ApresentaPANEL(e.Start.Date, 0)
        idEntrevistaPresencialLabel.Text = ""
        HistoricoLabel.Text = ""

    End Sub

    Protected Sub DayPilotCalendarENTREVISTAPRESENCIAL_EventClick(sender As Object, e As DayPilot.Web.Ui.EventClickEventArgs) Handles DayPilotCalendarENTREVISTAPRESENCIAL.EventClick
        HistoricoLabel.Text = ""
    End Sub

    Protected Sub LinkButtonCancelarEntrevista_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelarEntrevista.Click
        PanelENTREVISTAPRESENCIALFORM.Visible = False
        PanelENTREVISTA_FORM.Visible = False
        idEntrevistaPresencialLabel.Text = ""
    End Sub

    Sub ApresentaPANEL(data As String, agenda As Int32)
        dataLabel.Text = data
        HorafimLabel.Value = "30"
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        If agenda > 0 Then
            DescricaoEntrevistaLabel.Text = "Você pode responder uma dúvida ou fazer uma pergunta para <b>" & nomeCandidatoLabel.Text & "</b><br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de"
            mensagemEntrevistaEmailLabel.Text = nomeCandidatoLabel.Text & ", sobre a entrevista presencial.<br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de " & HorafimLabel.Value & " minutos.<br>Você precisa confirmar a sua presença:<br>[<a title='Para confirmar a sua presença clique aqui, informe seus dados de login, entre na agenda com o consultor e clique sobre o agendamento.' href='" & URL & "/_candidato/agenda_candidato.aspx'>Confirme sua presença aqui</a>]"
            PanelENTREVISTA_FORM.Visible = True
            LinkButtonAgendar.Text = "Enviar"
            LinkButtonAgendar.ToolTip = "Para enviar uma mensagem ao candidato clique aqui"
            PanelENTREVISTA_FORM.DataBind()
        Else
            DescricaoEntrevistaLabel.Text = "Você está agendando uma entrevista com <b>" & nomeCandidatoLabel.Text & "</b><br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de"
            mensagemEntrevistaEmailLabel.Text = nomeCandidatoLabel.Text & ", foi agendando com você uma entrevista presencial.<br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de " & HorafimLabel.Value & " minutos.<br>Você precisa confirmar a sua presença:<br>[<a title='Para confirmar a sua presença clique aqui, informe seus dados de login, entre na agenda com o consultor e clique sobre o agendamento.' href='" & URL & "/_candidato/agenda_candidato.aspx'>Confirme sua presença aqui</a>]"
            PanelENTREVISTA_FORM.Visible = True
            PanelENTREVISTA_FORM.DataBind()
        End If

    End Sub

    Sub ApresentaVIRTUALPANEL(data As String, agenda As Int32)
        dataLabel.Text = data
        HorafimLabel.Value = "30"
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        If agenda > 0 Then
            DescricaoEntrevistaLabel0.Text = "Você pode responder uma dúvida ou fazer uma pergunta para <b>" & nomeCandidatoLabel.Text & "</b><br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de"
            mensagemEntrevistaEmailLabel0.Text = nomeCandidatoLabel.Text & ", sobre a entrevista virtual.<br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de " & HorafimLabel.Value & " minutos.<br>Você precisa confirmar a sua presença:<br>[<a title='Para confirmar a sua presença clique aqui, informe seus dados de login, entre na agenda com o consultor e clique sobre o agendamento.' href='" & URL & "/_candidato/agenda_candidato.aspx'>Confirme sua presença aqui</a>]"
            PanelENTREVISTA_FORM0.Visible = True
            LinkButtonAgendar0.Text = "Enviar"
            LinkButtonAgendar0.ToolTip = "Para enviar uma mensagem ao candidato clique aqui"
            PanelENTREVISTA_FORM0.DataBind()
        Else
            DescricaoEntrevistaLabel0.Text = "Você está agendando uma entrevista virtual com <b>" & nomeCandidatoLabel.Text & "</b><br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de"
            mensagemEntrevistaEmailLabel0.Text = nomeCandidatoLabel.Text & ", foi agendando com você uma entrevista virtual.<br>Data da entrevista está marcada para " & dataLabel.Text & " com início às " & HorainiLabel.Text & " com duração de " & HorafimLabel.Value & " minutos.<br>Você precisa confirmar a sua presença:<br>[<a title='Para confirmar a sua presença clique aqui, informe seus dados de login, entre na agenda com o consultor e clique sobre o agendamento.' href='" & URL & "/_candidato/agenda_virtual.aspx'>Confirme sua presença aqui</a>]"
            PanelENTREVISTA_FORM0.Visible = True
            PanelENTREVISTA_FORM0.DataBind()
        End If

    End Sub


    Protected Sub LinkButtonAgendar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAgendar.Click

        If idEntrevistaPresencialLabel.Text = "" Then

            REM ** ***********************************************************************************
            REM ** GRAVA A ENTREVISTA COM O CANDIDATO E ENVIA E-MAIL PARA O CANDIDATO 
            REM ** ***********************************************************************************

            Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
            Dim enviaEmail As New EmailSQL

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

            prm = New SqlParameter("@idSetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idSetup").Value = Session("idSetup")

            prm = New SqlParameter("@mensagem", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@mensagem").Value = mensagemEntrevistaEmailLabel.Text

            prm = New SqlParameter("@URL", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@URL").Value = URL

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

            prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nomeRes").Value = Session("nomeConsultor")

            prm = New SqlParameter("@dsEventoAgenda", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsEventoAgenda").Value = "Entrevista Presencial"

            prm = New SqlParameter("@DataStartField", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@DataStartField").Value = dataLabel.Text & " " & HorainiLabel.Text

            prm = New SqlParameter("@DataEndField", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@DataEndField").Value = dataLabel.Text & " " & Left(HorainiLabel.Text, 2) & ":" & HorafimLabel.Value

            prm = New SqlParameter("@DataTextField", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@DataTextField").Value = "Entrevista presencial com " & nomeCandidatoLabel.Text & "."

            prm = New SqlParameter("@DataValueField", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@DataValueField").Value = "Entrevista Presencial"

            prm = New SqlParameter("@Evento", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Evento").Value = "Entrevista Presencial"

            prm = New SqlParameter("@HistoricoDasMensagens", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@HistoricoDasMensagens").Value = HistoricoDasMensagensTextBox.Text

            prm = New SqlParameter("@aceito", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@aceito").Value = 0

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                PanelAviso.Visible = True
                AVISOLABEL.Text = "Entrevista agendada com " & nomeCandidatoLabel.Text & "!"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
                cn.Close()
            Catch ex As Exception
                PanelAviso.Visible = True
                AVISOLABEL.Text = "Erro ao agendar a entrevista com " & nomeCandidatoLabel.Text & "!" & Err.Description
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            End Try

            DayPilotCalendarENTREVISTAPRESENCIAL.DataBind()
            GridViewCANDIDATO.DataBind()
            PanelENTREVISTA_FORM.Visible = False

        Else

            REM ** ***********************************************************************************
            REM ** RESPONDE E ENVIA E-MAIL PARA O CANDIDATO 
            REM ** ***********************************************************************************

            Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_ANALISTA_RESPONDE]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCurriculo").Value = idCurriculoLabel.Text

            prm = New SqlParameter("@idEntrevistaPresencial", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idEntrevistaPresencial").Value = idEntrevistaPresencialLabel.Text

            prm = New SqlParameter("@HistoricoDasMensagens", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@HistoricoDasMensagens").Value = HistoricoDasMensagensTextBox.Text

            prm = New SqlParameter("@URL", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@URL").Value = URL

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                cn.Close()

                PanelAviso.Visible = True
                AVISOLABEL.Text = "Resposta enviada para " & nomeCandidatoLabel.Text & "!"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

                DayPilotCalendarENTREVISTAPRESENCIAL.DataBind()
                PanelENTREVISTAPRESENCIALFORM.Visible = False
                idEntrevistaPresencialLabel.Text = ""

            Catch ex As Exception

            End Try

        End If

    End Sub

    Protected Sub FecharFORM_Click(sender As Object, e As System.EventArgs) Handles FecharFORM.Click
        PanelENTREVISTA_FORM.Visible = False
        idEntrevistaPresencialLabel.Text = ""
    End Sub


    Sub AVALIADO(idCurriculo As String)

        REM ** REGISTRA NA TABELA (tbFaseProcessoSeletivo) UMA ANALISE FEITA EM UM CURRÍCULO

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        nomeCandidatoLabel.Text = ""

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CV_ANALIZADO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = idCurriculo

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@URL", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        prm = New SqlParameter("@ENVIAEMAIL", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ENVIAEMAIL").Value = 0

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                REM ** *****************************************************************************
                REM ** RECUPERA OS DADOS DO CANDIDATO - ATUALIZA CONTADOR DE VISUALIZAÇÃO
                REM ** *****************************************************************************

                nomeCandidatoLabel.Text = dr("nome")

            End If
            cn.Close()
        Catch ex As Exception

        End Try

        LabelAPROVADO.Text = "Você está adicionando este candidato(a) para esta fase. (Confirme abaixo)<br><br>Nome do candidato(a): " & nomeCandidatoLabel.Text
        LabelREPROVADO.Text = "Você está reprovando este candidato(a) desta fase. (Confirme abaixo)<br><br>Nome do candidato(a): " & nomeCandidatoLabel.Text
        LabelENTREVISTA.Text = "Para marcar uma <b>entrevista presencial</b> com este candidato(a)<br>informe os dados no painel abaixo:<br>(Confirme abaixo) <br><br>Nome do candidato(a): " & nomeCandidatoLabel.Text
        LabelEMAIL.Text = "Para falar com o candidato preencha o formulário abaixo.<br>(Após preenchido clique em [<b>Enviar</b>])<br><br>Nome do candidato(a): " & nomeCandidatoLabel.Text
        LabelENTREVISTAVIRTUAL.Text = "Para marcar uma <b>entrevista virtual</b> com este candidato(a)<br>informe os dados no painel abaixo:<br>(Confirme abaixo) <br><br>Nome do candidato(a): " & nomeCandidatoLabel.Text
        LabelTESTE.Text = "Você está para marcar uma avaliação online com o Candidato: " & nomeCandidatoLabel.Text & ".<br>Escolha abaixo qual das avaliações disponíveis será aplicado, o candidato será avisado por e-mail."
        LabelAVALIACAOFORM.Text = "Candidato selecionado para avaliação: " & nomeCandidatoLabel.Text & "<br>"
    End Sub

    Protected Sub CalendarSET_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarSET.DayRender

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet
        Dim cmd As SqlCommand

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_AGENDA_EMPRESA", myconnection)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

        cmd.Parameters.AddWithValue("@idCurriculo", 0)
        cmd.Parameters.AddWithValue("@idFaseProcessoSeletivo", idFaseProcessoSeletivoLabel.Text)
        cmd.Parameters.AddWithValue("@idProcessoSeletivo", idProcessoSeletivoLabel.Text)
        cmd.Parameters.AddWithValue("@idSetup", Session("idSetup"))
        cmd.Parameters.AddWithValue("@idCadastroEmpresa", Session("idCadastroEmpresa"))
        cmd.Parameters.AddWithValue("@idRH_Gestor", Session("idRH_Gestor"))

        myda = New SqlDataAdapter(cmd)
        myda.Fill(ds)

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

    Protected Sub CalendarVirtualSET_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarVirtualSET.DayRender

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet
        Dim cmd As SqlCommand

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_AGENDA_EMPRESA", myconnection)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

        cmd.Parameters.AddWithValue("@idCurriculo", 0)
        cmd.Parameters.AddWithValue("@idFaseProcessoSeletivo", idFaseProcessoSeletivoLabel.Text)
        cmd.Parameters.AddWithValue("@idProcessoSeletivo", idProcessoSeletivoLabel.Text)
        cmd.Parameters.AddWithValue("@idSetup", Session("idSetup"))
        cmd.Parameters.AddWithValue("@idCadastroEmpresa", Session("idCadastroEmpresa"))
        cmd.Parameters.AddWithValue("@idRH_Gestor", Session("idRH_Gestor"))

        myda = New SqlDataAdapter(cmd)
        myda.Fill(ds)

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

    Protected Sub LinkButtonLimparFORM_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLimparFORM.Click
        HistoricoDasMensagensTextBox.Text = ""
    End Sub

    Protected Sub GridViewCANDIDATO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCANDIDATO.SelectedIndexChanged
        Try
            Dim DateTime As New DateTime
            DateTime = GridViewCANDIDATO.SelectedValue
            DayPilotCalendarENTREVISTAPRESENCIAL.StartDate = DateTime
            CalendarSET.SelectedDate = DateTime
            DayPilotCalendarENTREVISTAPRESENCIAL.DataBind()
            CalendarSET.DataBind()

            REM ** ***********************************************************************
            REM ** HABILITA CANDIDATO
            REM ** ***********************************************************************
            idFaseProcessoSeletivoLabel.Text = GridViewCANDIDATO.SelectedDataKey("idFaseProcessoSeletivo")
            idProcessoSeletivoLabel.Text = GridViewCANDIDATO.SelectedDataKey("idProcessoSeletivo")
            idCurriculoLabel.Text = GridViewCANDIDATO.SelectedDataKey("idcurriculo")
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Este candidato " & nomeCandidatoLabel.Text & " já está participando de outro processo seletivo!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try
    End Sub

    Protected Sub LinkButtonCancelarEntrevista0_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelarEntrevista0.Click
        PanelENTREVISTAVIRTUALFORM.Visible = False
        PanelENTREVISTA_FORM0.Visible = False
        idEntrevistavirtualLabel.Text = ""
    End Sub

    Protected Sub CalendarVirtualSET_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarVirtualSET.SelectionChanged
        DayPilotCalendarENTREVISTAVIRTUAL.StartDate = CalendarVirtualSET.SelectedDate
    End Sub

    Protected Sub DayPilotCalendarENTREVISTAVIRTUAL_FreeTimeClick(sender As Object, e As DayPilot.Web.Ui.FreeClickEventArgs) Handles DayPilotCalendarENTREVISTAVIRTUAL.FreeTimeClick

        DayPilotCalendarENTREVISTAVIRTUAL.StartDate = e.Start
        CalendarVirtualSET.SelectedDate = e.Start.Date
        HorafimLabel.Value = "30"

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

        ApresentaVIRTUALPANEL(e.Start.Date, 0)
        idEntrevistavirtualLabel.Text = ""
        HistoricoLabel0.Text = ""

    End Sub

    Protected Sub LinkButtonLimparFORM0_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLimparFORM0.Click
        HistoricoDasMensagensTextBox0.Text = ""
    End Sub

    Protected Sub FecharFORM0_Click(sender As Object, e As System.EventArgs) Handles FecharFORM0.Click
        PanelENTREVISTA_FORM0.Visible = False
        idEntrevistavirtualLabel.Text = ""
    End Sub

    Protected Sub LinkButtonAgendar0_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAgendar0.Click


        REM ** ***********************************************************************************
        REM ** GRAVA A ENTREVISTA (VIRTUAL) COM O CANDIDATO E ENVIA E-MAIL PARA O CANDIDATO 
        REM ** ***********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim enviaEmail As New EmailSQL

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@mensagem", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagem").Value = mensagemEntrevistaEmailLabel0.Text

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeRes").Value = Session("nomeConsultor")

        prm = New SqlParameter("@dsEventoAgenda", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dsEventoAgenda").Value = "Entrevista Virtual"

        prm = New SqlParameter("@DataStartField", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@DataStartField").Value = dataLabel.Text & " " & HorainiLabel.Text

        prm = New SqlParameter("@DataEndField", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@DataEndField").Value = dataLabel.Text & " " & Left(HorainiLabel.Text, 2) & ":" & HorafimLabel.Value

        prm = New SqlParameter("@DataTextField", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@DataTextField").Value = "Entrevista virtual com " & nomeCandidatoLabel.Text & "."

        prm = New SqlParameter("@DataValueField", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@DataValueField").Value = "Entrevista Virtual"

        prm = New SqlParameter("@Evento", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Evento").Value = "Entrevista Virtual"

        prm = New SqlParameter("@HistoricoDasMensagens", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@HistoricoDasMensagens").Value = HistoricoDasMensagensTextBox0.Text

        prm = New SqlParameter("@aceito", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@aceito").Value = 0

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Entrevista virtual agendada com " & nomeCandidatoLabel.Text & "!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao agendar a entrevista virtual com " & nomeCandidatoLabel.Text & "!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        DayPilotCalendarENTREVISTAVIRTUAL.DataBind()
        GridViewCANDIDATOVIRTUAL.DataBind()
        PanelENTREVISTA_FORM0.Visible = False

    End Sub

    Protected Sub GridViewCANDIDATOVIRTUAL_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCANDIDATOVIRTUAL.SelectedIndexChanged

        Try
            Dim DateTime As New DateTime
            DateTime = GridViewCANDIDATOVIRTUAL.SelectedValue
            DayPilotCalendarENTREVISTAVIRTUAL.StartDate = DateTime
            CalendarSET.SelectedDate = DateTime
            DayPilotCalendarENTREVISTAVIRTUAL.DataBind()
            CalendarSET.DataBind()

            REM ** ***********************************************************************
            REM ** HABILITA CANDIDATO
            REM ** ***********************************************************************
            idFaseProcessoSeletivoLabel.Text = GridViewCANDIDATOVIRTUAL.SelectedDataKey("idFaseProcessoSeletivo")
            idProcessoSeletivoLabel.Text = GridViewCANDIDATOVIRTUAL.SelectedDataKey("idProcessoSeletivo")
            idCurriculoLabel.Text = GridViewCANDIDATOVIRTUAL.SelectedDataKey("idcurriculo")
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Este candidato " & nomeCandidatoLabel.Text & " já está participando de outro processo seletivo!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

    End Sub

    Protected Sub LinkButtonENCERRAFASE_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENCERRAFASE.Click

        DataListProcessoSeletivo.DataBind()

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

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProximoTipoFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProximoTipoFaseProcessoSeletivo").Value = DropDownListPROXIMAFASE.SelectedValue

        prm = New SqlParameter("@dataInicioProximaFase", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dataInicioProximaFase").Value = iniFASETextBox.Text

        prm = New SqlParameter("@dataFimProximaFase", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dataFimProximaFase").Value = fimFASETextBox.Text

        If DropDownListPROXIMAFASE.SelectedItem.Text = "Finalizado" Then
            prm = New SqlParameter("@flgEncerraProcesso", SqlDbType.Bit)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@flgEncerraProcesso").Value = 1

            prm = New SqlParameter("@strMessageAprovadoEncerrado", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@strMessageAprovadoEncerrado").Value = strMessageAprovadoEncerradoTextBox.Text

        Else
            prm = New SqlParameter("@flgEncerraProcesso", SqlDbType.Bit)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@flgEncerraProcesso").Value = 0

            prm = New SqlParameter("@strMessageAprovadoEncerrado", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@strMessageAprovadoEncerrado").Value = DBNull.Value
        End If

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        If DropDownListPROXIMAFASE.SelectedItem.Text = "Finalizado" Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Processo seletivo encerrado com sucesso!.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Nova fase do processo seletivo criada com sucesso!.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
        End If

        PanelENCERRAFASEFORM.Visible = False
        DataListProcessoSeletivo.DataBind()

    End Sub

    Protected Sub LinkButtonFILTROCANCELAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFILTROCANCELAR.Click
        PanelFILTRODINAMICO.Visible = False
    End Sub

    Protected Sub LinkButtonFILTRO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFILTRO.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_FILTROS_MONTADOS_CONSULTOR_ANALISTA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idsetup")

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@salvar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@salvar").Value = 1

        prm = New SqlParameter("@remover", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@remover").Value = 0

        prm = New SqlParameter("@atualizar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@atualizar").Value = 0

        Select Case PANELLabel.Text
            Case 1
                prm = New SqlParameter("@value", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@value").Value = TextBoxValue.Text

                prm = New SqlParameter("@nivel", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nivel").Value = DBNull.Value

                prm = New SqlParameter("@field", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@field").Value = refTabelaLabel.Text

            Case 2
                prm = New SqlParameter("@value", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@value").Value = DropDownList_CDB_SN.SelectedValue

                prm = New SqlParameter("@nivel", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nivel").Value = DBNull.Value

                prm = New SqlParameter("@field", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@field").Value = refTabelaLabel.Text

            Case 3
                prm = New SqlParameter("@value", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@value").Value = DropDownList_CDB_CN.SelectedValue

                prm = New SqlParameter("@nivel", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nivel").Value = DropDownList_CN.SelectedValue

                prm = New SqlParameter("@field", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@field").Value = refTabelaLabel.Text

        End Select

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        ATUALIZA_FILTRO()

        PanelAviso.Visible = True
        AVISOLABEL.Text = "Filtro salvo com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"


    End Sub

    Sub ATUALIZA_FILTRO()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_FILTROS_XML_Consultor_Analista]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

        GridViewFILTRO.DataBind()

    End Sub

    Protected Sub GridViewFILTRO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFILTRO.SelectedIndexChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_FILTROS_MONTADOS_CONSULTOR_ANALISTA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idsetup")

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@salvar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@salvar").Value = 0

        prm = New SqlParameter("@remover", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@remover").Value = 1

        prm = New SqlParameter("@atualizar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@atualizar").Value = 0

        prm = New SqlParameter("@idFiltroDinamicoMontador_Consultor_Analista", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFiltroDinamicoMontador_Consultor_Analista").Value = GridViewFILTRO.SelectedDataKey("idFiltroDinamicoMontador_Consultor_Analista")

        Select Case PANELLabel.Text
            Case 1
                prm = New SqlParameter("@value", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@value").Value = TextBoxValue.Text

                prm = New SqlParameter("@nivel", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nivel").Value = DBNull.Value

                prm = New SqlParameter("@field", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@field").Value = refTabelaLabel.Text

            Case 2
                prm = New SqlParameter("@value", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@value").Value = DropDownList_CDB_SN.SelectedValue

                prm = New SqlParameter("@nivel", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nivel").Value = DBNull.Value

                prm = New SqlParameter("@field", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@field").Value = refTabelaLabel.Text

            Case 3
                prm = New SqlParameter("@value", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@value").Value = DropDownList_CDB_CN.SelectedValue

                prm = New SqlParameter("@nivel", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nivel").Value = DropDownList_CN.SelectedValue

                prm = New SqlParameter("@field", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@field").Value = refTabelaLabel.Text

        End Select

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        PanelAviso.Visible = True
        AVISOLABEL.Text = "Filtro removido com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

        GridViewFILTRO.DataBind()

    End Sub

    Protected Sub FILTROS_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles FILTROS.SelectedIndexChanged
        REM ** ********************************************************************************************
        REM ** LÓGICA PARA MONTAR O INSERT
        REM ** ********************************************************************************************
        REM ** idFiltroDinamicoXML_Liberado,tabela,modelo,panel,refTabela,tabelaNivel,refTabelaNivel
        Dim SDB_SN As Int32 = 0
        Dim CDB_SN As Int32 = 0
        Dim CDB_CN As Int32 = 0
        Dim PANEL As Int32 = FILTROS.SelectedDataKey("panel")
        Dim COLUNA As String = FILTROS.SelectedDataKey("refTabela")
        Dim TABELA As String = FILTROS.SelectedDataKey("tabela")
        Dim COLUNA_N As String = FILTROS.SelectedDataKey("refTabelaNivel")
        Dim TABELA_N As String = FILTROS.SelectedDataKey("tabelaNivel")
        Dim MODELO As String = FILTROS.SelectedDataKey("modelo")
        refTabelaNivelLabel.Text = COLUNA_N
        refTabelaLabel.Text = COLUNA

        idFiltroDinamicoXML_LiberadoLabel.Text = FILTROS.SelectedDataKey("idFiltroDinamicoXML_Liberado")

        Select Case PANEL
            Case 1
                PANELLabel.Text = PANEL
                PanelSDB_SN.Visible = True
                PanelCDB_SN.Visible = False
                PanelCDB_CN.Visible = False
                REM ** NÃO FAZ NADA
            Case 2
                PANELLabel.Text = PANEL
                PanelSDB_SN.Visible = False
                PanelCDB_SN.Visible = True
                PanelCDB_CN.Visible = False
                CARREGADROPDOWN_DB(COLUNA, TABELA)
            Case 3
                PANELLabel.Text = PANEL
                PanelSDB_SN.Visible = False
                PanelCDB_SN.Visible = False
                PanelCDB_CN.Visible = True
                CARREGADROPDOWN_DB_N(COLUNA, TABELA, COLUNA_N, TABELA_N)
        End Select

        REM ** ********************************************************************************************
        REM ** CARREGA O DROPDONW CONTEÚDO
        REM ** ********************************************************************************************

    End Sub

    Sub CARREGADROPDOWN_DB_N(COLUNA As String, TABELA As String, COLUNA_N As String, TABELA_N As String)

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT " & COLUNA & " AS value FROM " & TABELA

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)

        Dim ds As New DataSet()
        Dim adpt As New SqlDataAdapter(oCommand)

        adpt.Fill(ds)

        DropDownList_CDB_CN.DataSource = ds
        DropDownList_CDB_CN.DataTextField = "value"
        DropDownList_CDB_CN.DataValueField = "value"
        DropDownList_CDB_CN.DataBind()

        oConnection.Close()

        CARREGADROPDOWN_NIVEL(COLUNA_N, TABELA_N)

    End Sub

    Sub CARREGADROPDOWN_NIVEL(COLUNA_N As String, TABELA_N As String)

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT " & COLUNA_N & " AS value FROM " & TABELA_N

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)

        Dim ds As New DataSet()
        Dim adpt As New SqlDataAdapter(oCommand)

        adpt.Fill(ds)

        DropDownList_CN.DataSource = ds
        DropDownList_CN.DataTextField = "value"
        DropDownList_CN.DataValueField = "value"
        DropDownList_CN.DataBind()

        oConnection.Close()

    End Sub

    Sub CARREGADROPDOWN_DB(COLUNA As String, TABELA As String)

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT " & COLUNA & " AS value FROM " & TABELA

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)

        Dim ds As New DataSet()
        Dim adpt As New SqlDataAdapter(oCommand)

        adpt.Fill(ds)

        DropDownList_CDB_SN.DataSource = ds
        DropDownList_CDB_SN.DataTextField = "value"
        DropDownList_CDB_SN.DataValueField = "value"
        DropDownList_CDB_SN.DataBind()

        oConnection.Close()

    End Sub

    Protected Sub LinkButtonFECHARLAUDO_Click(sender As Object, e As System.EventArgs)
        PanelLAUDOFORM.Visible = False
    End Sub

    Protected Sub LinkButtonFECHARFORMLAUDO_Click(sender As Object, e As System.EventArgs)
        PanelLAUDOFORM.Visible = False
    End Sub

    Protected Sub UpdateButton_Click(sender As Object, e As System.EventArgs) Handles UpdateButton.Click, UpdateButton0.Click

        Dim myReplace As New ReplaceForm

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_LAUDO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idLaudo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idLaudo").Value = idLaudoLabel.Text

        prm = New SqlParameter("@trajetoriaProfissional", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@trajetoriaProfissional").Value = myReplace.ReplaceIn(trajetoriaProfissionalTextBox0.Text)

        prm = New SqlParameter("@conhecimento", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@conhecimento").Value = myReplace.ReplaceIn(conhecimentoTextBox0.Text)

        prm = New SqlParameter("@ultimoSalario", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ultimoSalario").Value = myReplace.ReplaceIn(ultimoSalarioTextBox0.Text)

        prm = New SqlParameter("@caracteristicaPessoal_Familiar", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@caracteristicaPessoal_Familiar").Value = myReplace.ReplaceIn(caracteristicaPessoal_FamiliarTextBox0.Text)

        prm = New SqlParameter("@caracteristicaPessoal_Social", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@caracteristicaPessoal_Social").Value = myReplace.ReplaceIn(caracteristicaPessoal_SocialTextBox0.Text)

        prm = New SqlParameter("@caracteristicaPessoal_Atitudinais", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@caracteristicaPessoal_Atitudinais").Value = myReplace.ReplaceIn(caracteristicaPessoal_AtitudinaisTextBox0.Text)

        prm = New SqlParameter("@caracteristicaPessoal_Habilidade", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@caracteristicaPessoal_Habilidade").Value = myReplace.ReplaceIn(caracteristicaPessoal_HabilidadeTextBox0.Text)

        prm = New SqlParameter("@caracteristicaPessoal_Motivacao", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@caracteristicaPessoal_Motivacao").Value = myReplace.ReplaceIn(caracteristicaPessoal_MotivacaoTextBox0.Text)

        prm = New SqlParameter("@pontoforte", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@pontoforte").Value = myReplace.ReplaceIn(pontoforteTextBox0.Text)

        prm = New SqlParameter("@pontoaObservarDesenvolver", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@pontoaObservarDesenvolver").Value = myReplace.ReplaceIn(pontoaObservarDesenvolverTextBox0.Text)

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Laudo salvo com sucesso!<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Falha ao salvar o Laudo do candidato<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADI"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        cn.Close()


        DataListLaudo.DataBind()


    End Sub

    Protected Sub LinkButtonLaudo_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLaudo.Click, LinkButtonLaudo0.Click
        PanelLAUDO.Visible = True
        PanelLAUDO.Visible = True
        PanelLAUDOFORM.Visible = False
        MONTALAUDOCANDIDATO(idCurriculoLabel.Text)
        GridViewCANDIDATO.DataBind()
    End Sub

    Protected Sub DOWNLOAD_Click(sender As Object, e As System.EventArgs) Handles DOWNLOAD.Click
        Response.Redirect("laudos/laudoCandidato.aspx?idLaudo=" & criptografia.Criptografar(idLaudoLabel.Text, "#!$a36?@"))
    End Sub

    Protected Sub PDF_Click(sender As Object, e As System.EventArgs) Handles PDF.Click

        Response.ClearContent()
        Response.AddHeader("content-disposition", "attachment;filename=laudo.pdf")
        Response.ContentType = "application/pdf"
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
        DataListLaudo.RenderControl(hw)

        Dim imageFilePath As String = Server.MapPath(".") & "/logomarca/" & Session("idSetup") & ".png"
        Dim jpg As iTextSharp.text.Image = iTextSharp.text.Image.GetInstance(imageFilePath)

        Dim sr As New StringReader(sw.ToString())
        Dim pdfDoc As New Document(PageSize.LETTER, 50.0F, 50.0F, 50.0F, 60.0F)
        Dim htmlparser As New html.simpleparser.HTMLWorker(pdfDoc)
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
        pdfDoc.Open()
        pdfDoc.Add(jpg)
        htmlparser.Parse(sr)
        pdfDoc.Close()
        Response.Write(pdfDoc)
        Response.[End]()

    End Sub

    Protected Sub LinkButtonTESTE_Click(sender As Object, e As System.EventArgs) Handles LinkButtonTESTE.Click
        PanelTesteFORM.Visible = False
    End Sub

    Protected Sub GridViewAVALIACAO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewAVALIACAO.SelectedIndexChanged

        REM ** **********************************************************************************************
        REM ** REGISTRA A AVALIAÇÃO PARA O CANDIDATO SELECIONADO
        REM ** **********************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_QUIZ_CANDIDATO_CONVOCACAO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idQuiz").Value = GridViewAVALIACAO.SelectedDataKey("idQuiz")

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@nomeAVALIACAO", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeAVALIACAO").Value = GridViewAVALIACAO.SelectedDataKey("nomeQuiz")

        prm = New SqlParameter("@nomeANALISTA_CONSULTOR", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeANALISTA_CONSULTOR").Value = Session("nomeConsultor")

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        cn.Open()

        Dim MENSAGEM As String = ""

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                MENSAGEM = dr("MENSAGEM")
            End If
            dr.Close()
            PanelAviso.Visible = True
            AVISOLABEL.Text = MENSAGEM
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Falha ao salvar o agendamento da avaliação com o candidato<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADI"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try
        PanelTesteFORM.Visible = False
        cn.Close()
    End Sub


    Sub SELECIONAFASE(CommandArgument As String)
        Dim idTipoFaseProcessoSeletivo As Int32 = CommandArgument
        DropDownListFase.SelectedValue = idTipoFaseProcessoSeletivo
    End Sub



    Protected Sub LinkButtonAPROVARFASE_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAPROVARFASE.Click

        NivelAprovacaoLabel.Text = inpHide.Value
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim enviaEmail As New email

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_EMANALISE", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@nivelAPROVADO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nivelAPROVADO").Value = NivelAprovacaoLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Mensagem enviada, candidatura aprovada!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, candidatura não aprovada!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        DataListResultado.DataBind()
        DataListProcessoSeletivo.DataBind()

    End Sub

    Protected Sub LinkButtonEDITAR_LAUDO_Click(sender As Object, e As EventArgs) Handles LinkButtonEDITAR_LAUDO.Click
        PanelLAUDOFORM.Visible = True
    End Sub

    Sub LOGICACOMPRA()

        If Session("candidatoPaga") = 1 Then
            If CVliberado.Text <= "0" Then
                Select Case True
                    Case (Session("liberaQtdCad") <= 0)
                        REM ** PRIMEIRO ACESSO NA APLICAÇÃO
                        LinkButtonCOMPRACV.Visible = True
                        LinkButtonCOMPRACV.Text = "Compra de créditos"
                        LabelCOMPRACV.Text = "<b>Olá</b>, para utilizar o sistema será necessário a compra de créditos, existem várias modalidades a sua escolha. Para conhece-las clique no botão (Compra de créditos) abaixo."
                        PanelCOMPRACV.Visible = True

                    Case (Session("liberaQtdCad") > 0)
                        REM ** SEM CRÉDITO SMS COM CRÉDITO PARA PS
                        LinkButtonCOMPRACV.Visible = True
                        LinkButtonCOMPRACV.Text = "Incluir na minha base de talentos"
                        LabelCOMPRACV.Text = "<b>ATENÇÃO:</b> Para incluir este CV em sua base de talentos clique no botão<br>[Incluir na minha base de talentos]<br>Obs.: Será debitado um crédito de sua conta.<br>"
                        PanelCOMPRACV.Visible = True
                End Select

                PanelAviso.Visible = False
                PanelENTREVISTAVIRTUAL.Visible = False
                PanelEXCLUICANDIDATURA.Visible = False
                PanelEMAIL.Visible = False
                PanelENTREVISTAPRESENCIAL.Visible = False
                PanelAPROVACANDIDATURA.Visible = False
                PanelANALISE.Visible = False
                PanelEXCLUICANDIDATURA.Visible = False
                PanelENCERRAFASE.Visible = False
                PanelFILTRO.Visible = False
                PanelLAUDO.Visible = False
                PanelTESTE.Visible = False
                PanelAVALIACAOENTREVISTAPRESENCIAL.Visible = False
            End If
        End If

    End Sub

    Protected Sub LinkButtonCOMPRACV_Click(sender As Object, e As EventArgs) Handles LinkButtonCOMPRACV.Click
        REM ** ***********************************************************************************
        REM ** DEFINE SE COMPRA CRÉDITOS OU COMPRA CV
        REM ** ***********************************************************************************
        Select Case True
            Case (Session("libera_associado") = 0)
                COMPRACREDITO()
            Case (Session("libera_associado") > 0)
                COMPRACV()
        End Select
    End Sub

    Sub COMPRACREDITO()
        Response.Redirect("_creditoAssociado.aspx")
    End Sub

    Sub COMPRACV()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_COMPRA_CURRICULO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idCadastroEmpresa_Layout", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa_Layout").Value = Session("idCadastroEmpresa_Layout")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@COMPRAR", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@COMPRAR").Value = 1

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            PanelCOMPRACV.Visible = True
            LabelCOMPRACV.Text = "Este CV agora faz parte de sua base de talentos exclusiva!"
            LabelCOMPRACV.CssClass = "textoProcessoSeletivoABERTO"
            ImageCOMPRACV.ImageUrl = "~/_corporativo/images/buttonOK.png"
            LinkButtonCOMPRACV.Visible = False
            cn.Close()
        Catch ex As Exception
            PanelCOMPRACV.Visible = True
            LabelCOMPRACV.Text = "Erro ao incluir o CV em sua base de talento!" & Err.Description
            LabelCOMPRACV.CssClass = "textoProcessoSeletivoFECHADO"
            ImageCOMPRACV.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            LinkButtonCOMPRACV.Visible = False
        End Try

        SqlDADOSPESSOAIS.DataBind()

    End Sub
End Class
