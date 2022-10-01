Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Web.Configuration
Imports System.Web.Script.Serialization
Imports chartPIEService
Imports System.DBNull

Partial Class _corporativo_relatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        PanelAviso.Visible = False
        PanelHISTORICO.Visible = False
        PanelEMAIL.Visible = False
        GridViewAVALIACAO.Visible = True

        If IsPostBack Then

            Select Case Request.QueryString("InfoAGENDA")
                Case "1"
                    LinkButtonCOMPROMISSO.ToolTip = "Compromissos Agendados"
                    LinkButtonCOMPROMISSO.Attributes.Add("style", "font-weight:bold")
                    LinkButtonVIRTUAL.Attributes.Add("style", "font-weight:none")
                    LinkButtonAVALIACAO.Attributes.Add("style", "font-weight:none")
                    BodyInternoAGENDA.Visible = True
                    BodyInternoVIRTUAL.Visible = False
                    BodyInternoAVALIACAO.Visible = False
                Case "2"
                    LinkButtonVIRTUAL.ToolTip = "Compromissos Virtuais"
                    LinkButtonVIRTUAL.Attributes.Add("style", "font-weight:bold")
                    LinkButtonCOMPROMISSO.Attributes.Add("style", "font-weight:none")
                    LinkButtonAVALIACAO.Attributes.Add("style", "font-weight:none")
                    BodyInternoAGENDA.Visible = False
                    BodyInternoVIRTUAL.Visible = True
                    BodyInternoAVALIACAO.Visible = False
                Case "3"
                    LinkButtonAVALIACAO.ToolTip = "Você está em avaliação online"
                    LinkButtonCOMPROMISSO.Attributes.Add("style", "font-weight:none")
                    LinkButtonVIRTUAL.Attributes.Add("style", "font-weight:none")
                    LinkButtonAVALIACAO.Attributes.Add("style", "font-weight:bold")
                    BodyInternoAGENDA.Visible = False
                    BodyInternoVIRTUAL.Visible = False
                    BodyInternoAVALIACAO.Visible = True
                Case Else
                    LinkButtonCOMPROMISSO.ToolTip = "Compromissos Agendados"
                    LinkButtonCOMPROMISSO.Attributes.Add("style", "font-weight:bold")
            End Select
        Else
            LinkButtonCOMPROMISSO.ToolTip = "Compromissos Agendados"
            LinkButtonCOMPROMISSO.Attributes.Add("style", "font-weight:bold")
            inicioLabel.Text = Now()
        End If

    End Sub

    Protected Sub DayPilotCalendarAGENDA_DataBound(sender As Object, e As System.EventArgs) Handles DayPilotCalendarAGENDA.DataBound
        DayPilotCalendarAGENDA.StartDate = inicioLabel.Text
    End Sub

    Protected Sub ImageButtonAVANCAR_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAVANCAR.Click
        Dim DateTime As New DateTime
        DateTime = inicioLabel.Text
        inicioLabel.Text = DateTime.AddDays(+1)
        CalendarAgenda.SelectedDate = inicioLabel.Text
        CalendarAgenda.DataBind()
        DayPilotCalendarAGENDA.DataBind()
        naDataLabel.Text = "  no dia " & inicioLabel.Text
        PanelFORM.Visible = False
    End Sub

    Protected Sub ImageButtonVOLTA_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonVOLTA.Click
        Dim DateTime As New DateTime
        DateTime = inicioLabel.Text
        inicioLabel.Text = DateTime.AddDays(-1)
        CalendarAgenda.SelectedDate = inicioLabel.Text
        CalendarAgenda.DataBind()
        DayPilotCalendarAGENDA.DataBind()
        naDataLabel.Text = "  no dia " & inicioLabel.Text
        PanelFORM.Visible = False
    End Sub

    Protected Sub CalendarAgenda_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarAgenda.DayRender

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet
        Dim cmd As SqlCommand

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_COMPROMISSO", myconnection)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

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

    Protected Sub CalendarAgenda_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarAgenda.SelectionChanged
        inicioLabel.Text = CalendarAgenda.SelectedDate
        naDataLabel.Text = "  no dia " & inicioLabel.Text
        DayPilotCalendarAGENDA.DataBind()
    End Sub

    Protected Sub DayPilotCalendarAGENDA_EventClick(sender As Object, e As DayPilot.Web.Ui.EventClickEventArgs) Handles DayPilotCalendarAGENDA.EventClick

        finalizadoLabel.Text = "0"
        PanelFormEntrevista.Visible = False
        PanelFINALIZADO.Visible = False

        idEntrevistaPresencialLabel.Text = e.Value

        PanelFORM.Visible = True

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_COMPROMISSO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaPresencial", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaPresencial").Value = e.Value

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                HistoricoDBLabel.Text = "<b>Mensagem:</b><br>" & dr("HistoricoDasMensagens") & "<br>"
                DayPilotCalendarAGENDA.StartDate = dr("DataStartField")
                idCurriculoLabel.Text = dr("idCurriculo")
                idProcessoSeletivoLabel.Text = dr("idProcessoSeletivo")
                idFaseProcessoSeletivoLabel.Text = dr("idFaseProcessoSeletivo")
                idUserLabel.Text = dr("idUser")
            End If

            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR.Click
        idUserLabel.Text = ""
        idCurriculoLabel.Text = ""
        idProcessoSeletivoLabel.Text = ""
        idFaseProcessoSeletivoLabel.Text = ""
        idQuizLabel.Text = ""
        idEntrevistaPresencialLabel.Text = ""
        idPerguntaQuizAVALIACAOLabel.Text = ""

        PanelFORM.Visible = False
        idEntrevistaPresencialLabel.Text = ""
        MensagemTextBox.Text = ""
        ParecerDoProfissionalTextBox.Text = ""
        RadioButtonListstatusEntrevista.SelectedValue = "Não avaliar agora"
        CheckBoxPRESENCIAL.Checked = False
    End Sub

    Protected Sub LinkButtonENVIAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENVIAR.Click

        REM ** ***********************************************************************************
        REM ** RESPONDE E ENVIA E-MAIL PARA O CANDIDATO 
        REM ** ***********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_ANALISTA_AVALIACAO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaPresencial", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaPresencial").Value = idEntrevistaPresencialLabel.Text

        If RadioButtonListstatusEntrevista.SelectedValue <> "Apenas envio e-mail" Then

            prm = New SqlParameter("@ParecerDoProfissional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ParecerDoProfissional").Value = ParecerDoProfissionalTextBox.Text

            prm = New SqlParameter("@statusEntrevista", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@statusEntrevista").Value = RadioButtonListstatusEntrevista.SelectedValue

        End If


        REM ** REPROVA / APROVA NA FASE DO PROCESSO SELETIVO:
        REM ** *****************************************************************************************
        Select Case RadioButtonListstatusEntrevista.SelectedValue
            Case "Aprovado na fase"
                REM ** APROVADO
                REM ** *********************************************************************************
                APROVADO(idFaseProcessoSeletivoLabel.Text, idProcessoSeletivoLabel.Text, idCurriculoLabel.Text)
            Case "Reprovado na fase"
                REM ** REPROVADO
                REM ** *********************************************************************************
                REPROVADO(idFaseProcessoSeletivoLabel.Text, idProcessoSeletivoLabel.Text, idCurriculoLabel.Text)
            Case "Não compareceu reprovado"
                REM ** REPROVADO
                REM ** *********************************************************************************
                REPROVADO(idFaseProcessoSeletivoLabel.Text, idProcessoSeletivoLabel.Text, idCurriculoLabel.Text)
        End Select
        REM ** FIM REPROVA / APROVA NA FASE DO PROCESSO SELETIVO:
        REM ** *****************************************************************************************


        prm = New SqlParameter("@HistoricoDasMensagens", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@HistoricoDasMensagens").Value = MensagemTextBox.Text

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        If CheckBoxPRESENCIAL.Checked Then
            REM ** ********************************************************************************
            REM ** CANCELA A ENTREVISTA PRESENCIAL
            REM ** ********************************************************************************
            prm = New SqlParameter("@aceito", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@aceito").Value = 2
        End If


        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

            DayPilotCalendarAGENDA.DataBind()
            PanelFORM.Visible = False
            idEntrevistaPresencialLabel.Text = ""
            MensagemTextBox.Text = ""
            ParecerDoProfissionalTextBox.Text = ""
            RadioButtonListstatusEntrevista.SelectedValue = "Não avaliar agora"

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub CalendarAgendaVirtual_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarAgendaVirtual.DayRender

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet
        Dim cmd As SqlCommand

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_COMPROMISSO", myconnection)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

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

    Protected Sub CalendarAgendaVirtual_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarAgendaVirtual.SelectionChanged
        inicioLabel.Text = CalendarAgendaVirtual.SelectedDate
        naDataLabelVIRTUAL.Text = "  no dia " & inicioLabel.Text
        DayPilotCalendarAGENDAVIRTUAL.DataBind()
    End Sub

    Protected Sub DayPilotCalendarAGENDAVIRTUAL_DataBound(sender As Object, e As System.EventArgs) Handles DayPilotCalendarAGENDAVIRTUAL.DataBound
        DayPilotCalendarAGENDAVIRTUAL.StartDate = inicioLabel.Text
    End Sub

    Protected Sub DayPilotCalendarAGENDAVIRTUAL_EventClick(sender As Object, e As DayPilot.Web.Ui.EventClickEventArgs) Handles DayPilotCalendarAGENDAVIRTUAL.EventClick

        idEntrevistaVirtualLabel.Text = e.Value

        PanelFORMVIRTUAL.Visible = True

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_COMPROMISSO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaVirtual", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaVirtual").Value = e.Value

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                HistoricoDBLabel0.Text = "<b>Mensagem:</b><br>" & dr("HistoricoDasMensagens") & "<br>"
                DayPilotCalendarAGENDAVIRTUAL.StartDate = dr("DataStartField")
                idCurriculoLabel.Text = dr("idCurriculo")
                idProcessoSeletivoLabel.Text = dr("idProcessoSeletivo")
                idFaseProcessoSeletivoLabel.Text = dr("idFaseProcessoSeletivo")

                Select Case dr("aceito")
                    Case 0
                        RadioButtonListVIRTUAL.Visible = True
                    Case 1
                        RadioButtonListVIRTUAL.Visible = False
                    Case 2
                        RadioButtonListVIRTUAL.Visible = False
                    Case 3
                        RadioButtonListVIRTUAL.Visible = False
                End Select
            End If

            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub ImageButtonVOLTAVIRTUAL_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonVOLTAVIRTUAL.Click
        Dim DateTime As New DateTime
        DateTime = inicioLabel.Text
        inicioLabel.Text = DateTime.AddDays(-1)
        CalendarAgendaVirtual.SelectedDate = inicioLabel.Text
        CalendarAgendaVirtual.DataBind()
        DayPilotCalendarAGENDAVIRTUAL.DataBind()
        naDataLabelVIRTUAL.Text = "  no dia " & inicioLabel.Text
        PanelFORMVIRTUAL.Visible = False
    End Sub

    Protected Sub ImageButtonAVANCARVIRTUAL_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAVANCARVIRTUAL.Click
        Dim DateTime As New DateTime
        DateTime = inicioLabel.Text
        inicioLabel.Text = DateTime.AddDays(+1)
        CalendarAgendaVirtual.SelectedDate = inicioLabel.Text
        CalendarAgendaVirtual.DataBind()
        DayPilotCalendarAGENDAVIRTUAL.DataBind()
        naDataLabelVIRTUAL.Text = "  no dia " & inicioLabel.Text
        PanelFORMVIRTUAL.Visible = False
    End Sub

    Protected Sub LinkButtonFECHAR0_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR0.Click
        PanelFORMVIRTUAL.Visible = False
        idEntrevistaVirtualLabel.Text = ""
        MensagemTextBox0.Text = ""
        ParecerDoProfissionalTextBox0.Text = ""
        RadioButtonListstatusEntrevista0.SelectedValue = "Não avaliar agora"
    End Sub

    Protected Sub LinkButtonENVIAR0_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENVIAR0.Click

        REM ** ***********************************************************************************
        REM ** RESPONDE E ENVIA E-MAIL PARA O CANDIDATO 
        REM ** ***********************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_ANALISTA_AVALIACAO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaVirtual", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaVirtual").Value = idEntrevistaVirtualLabel.Text

        If RadioButtonListstatusEntrevista0.SelectedValue <> "Apenas envio e-mail" Then

            prm = New SqlParameter("@ParecerDoProfissional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ParecerDoProfissional").Value = ParecerDoProfissionalTextBox0.Text

            prm = New SqlParameter("@statusEntrevista", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@statusEntrevista").Value = RadioButtonListstatusEntrevista0.SelectedValue

        End If

        REM ** REPROVA / APROVA NA FASE DO PROCESSO SELETIVO:
        REM ** *****************************************************************************************
        Select Case RadioButtonListstatusEntrevista0.SelectedValue
            Case "Aprovado na fase"
                REM ** APROVADO
                REM ** *********************************************************************************
                APROVADO(idFaseProcessoSeletivoLabel.Text, idProcessoSeletivoLabel.Text, idCurriculoLabel.Text)
            Case "Reprovado na fase"
                REM ** REPROVADO
                REM ** *********************************************************************************
                REPROVADO(idFaseProcessoSeletivoLabel.Text, idProcessoSeletivoLabel.Text, idCurriculoLabel.Text)
            Case "Não compareceu reprovado"
                REM ** REPROVADO
                REM ** *********************************************************************************
                REPROVADO(idFaseProcessoSeletivoLabel.Text, idProcessoSeletivoLabel.Text, idCurriculoLabel.Text)
        End Select
        REM ** FIM REPROVA / APROVA NA FASE DO PROCESSO SELETIVO:
        REM ** *****************************************************************************************

        prm = New SqlParameter("@HistoricoDasMensagens", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@HistoricoDasMensagens").Value = MensagemTextBox0.Text

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        Select Case RadioButtonListVIRTUAL.SelectedValue
            Case 1
                REM ** ********************************************************************************
                REM ** CANCELA A ENTREVISTA VIRTUAL
                REM ** ********************************************************************************
                prm = New SqlParameter("@aceito", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@aceito").Value = 1
            Case 2
                REM ** ********************************************************************************
                REM ** CONFIRMA A ENTREVISTA VIRTUAL (PELO CANDIDATO)
                REM ** ********************************************************************************
                prm = New SqlParameter("@aceito", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@aceito").Value = 2
        End Select

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

            DayPilotCalendarAGENDAVIRTUAL.DataBind()
            PanelFORMVIRTUAL.Visible = False
            idEntrevistaVirtualLabel.Text = ""
            MensagemTextBox0.Text = ""
            ParecerDoProfissionalTextBox0.Text = ""
            RadioButtonListstatusEntrevista0.SelectedValue = "Não avaliar agora"

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub LinkButtonHITORICO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonHITORICO.Click

        REM ** **************************************************************************************
        REM ** VER HISTÓRICO DA ENTREVISTA
        REM ** **************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_HISTORICO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaVirtual", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaVirtual").Value = idEntrevistaVirtualLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                DataLabel.Text = dr("dataCriacao") & "<br>"
                HistoricoLabel.Text = "<b>Entrevista:</b><br>" & dr("historicoEntrevista") & "<br>"
                LaudoLabel.Text = "<b>Análise:</b><br>" & dr("parecerAnalista_Consultor") & "<br>"
            Else
                DataLabel.Text = Now()
                HistoricoLabel.Text = "Não existe histórico"
                LaudoLabel.Text = "Esta entrevista virtual não aconteceu ainda!"
            End If

            cn.Close()
        Catch ex As Exception

        End Try
        PanelHISTORICO.Visible = True
    End Sub

    Sub APROVADO(idFaseProcessoSeletivo As Int32, idProcessoSeletivo As Int32, idCurriculo As Int32)

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_APROVADO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivo

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivo

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculo

        prm = New SqlParameter("@nivelAPROVADO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nivelAPROVADO").Value = 9

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
            AVISOLABEL.Text = "Mensagem enviada, aprovado(a) na fase!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, porém candidato(a) aprovado(a) na fase!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try
    End Sub

    Sub REPROVADO(idFaseProcessoSeletivo As Int32, idProcessoSeletivo As Int32, idCurriculo As Int32)

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

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
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivo

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivo

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculo

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
            AVISOLABEL.Text = "Mensagem enviada, reprovado(a) na fase!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, porém candidato reprovado(a) na fase!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

    End Sub

    Protected Sub LinkButtonENVIAR1_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENVIAR1.Click
        Select Case RadioButtonListCandidato.SelectedItem.Value
            Case 0
                REPROVA_AVALIACAO()
                ENVIA_EMAIL_AVALIACAO(RadioButtonListCandidato.SelectedItem.Text, LabelEMAILCANDIDATO.Text, "Reprovado")
            Case 1
                APROVA_AVALIACAO()
                ENVIA_EMAIL_AVALIACAO(RadioButtonListCandidato.SelectedItem.Text, LabelEMAILCANDIDATO.Text, "Aprovado")
        End Select
    End Sub

    Sub APROVA_AVALIACAO()

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim enviaEmail As New email

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_APROVADO]", cn)
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
        cmd.Parameters("@nivelAPROVADO").Value = 9

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
            AVISOLABEL.Text = "Erro ao enviar a mensagem, candidatura não aprovada!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        GridViewAVALIACAO.DataBind()
        GridViewAVALIACAO.Visible = True

    End Sub

    Sub REPROVA_AVALIACAO()

        REM CANDIDATO (APROVA / REPROVA)
        REM NESTE SP O CAMPO AÇÃO FAZ O TRABALHO DE APROVAR/REPROVAR

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_REPROVA_APROVA_AVALIACAO]", cn)
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

        prm = New SqlParameter("@mensagemCandidato", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagemCandidato").Value = RadioButtonListCandidato.SelectedItem.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        prm = New SqlParameter("@avaliado", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@avaliado").Value = 1

        prm = New SqlParameter("@mensagemHistoricoAvaliacao", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagemHistoricoAvaliacao").Value = mensagemTextBoxCANDIDATO.Text

        prm = New SqlParameter("@acao", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@acao").Value = RadioButtonListCandidato.SelectedItem.Value REM DEFINE SE APROVA / REPROVA CANDIDATO

        prm = New SqlParameter("@idQuizCandidato", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idQuizCandidato").Value = idQuizCandidatoLabel.Text


        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If RadioButtonListCandidato.SelectedItem.Value = 1 Then
                PanelAviso.Visible = True
                AVISOLABEL.Text = "Mensagem enviada, candidato aprovado!"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            Else
                PanelAviso.Visible = True
                AVISOLABEL.Text = "Mensagem enviada, candidato reprovado!"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            End If
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, candidatura não excluída!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End Try

        LinkButtonCOMPROMISSO.ToolTip = "Compromissos Agendados"
        GridViewAVALIACAO.DataBind()
        GridViewAVALIACAO.Visible = True

    End Sub

    Protected Sub LinkButtonCANCELAR1_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCANCELAR1.Click
        PanelEMAIL.Visible = False
        GridViewAVALIACAO.Visible = True
        CabecLabelAVALIACAO.Text = "Avaliações solicitadas"
    End Sub

    Protected Sub GridViewAVALIACAO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewAVALIACAO.SelectedIndexChanged

        idCurriculoLabel.Text = GridViewAVALIACAO.SelectedDataKey("idCurriculo")
        idRH_GestorLabel.Text = GridViewAVALIACAO.SelectedDataKey("idRH_GESTOR")
        idQuizCandidatoLabel.Text = GridViewAVALIACAO.SelectedDataKey("idQuizCandidato")
        dsProcessoLabel.Text = GridViewAVALIACAO.SelectedDataKey("dsProcesso")
        nomeQuizLabel.Text = GridViewAVALIACAO.SelectedDataKey("nomeQuiz")
        idQuizLabel.Text = GridViewAVALIACAO.SelectedDataKey("idQuiz")
        idUserLabel.Text = GridViewAVALIACAO.SelectedDataKey("idUser")
        idProcessoSeletivoLabel.Text = GridViewAVALIACAO.SelectedDataKey("idProcessoSeletivo")
        idFaseProcessoSeletivoLabel.Text = GridViewAVALIACAO.SelectedDataKey("idFaseProcessoSeletivo")
        PanelEMAIL.Visible = True
        CabecLabelAVALIACAO.Text = GridViewAVALIACAO.SelectedDataKey("nomeQuiz")
        dsFaseLabel.Text = GridViewAVALIACAO.SelectedDataKey("dsFase")
        nomeCandidatoLabel.Text = GridViewAVALIACAO.SelectedDataKey("nomeCandidato")
        nomeConsultorLabel.Text = GridViewAVALIACAO.SelectedDataKey("nome")

        LabelEMAILCANDIDATO.Text = nomeQuizLabel.Text & " para o Processo Seletivo " & dsProcessoLabel.Text & "<br>Fase do Processo: " & dsFaseLabel.Text & "<br>Consultor/Analista: " & nomeConsultorLabel.Text & "<br>Candidato: <b>" & nomeCandidatoLabel.Text & "</b>"
        Dim mensagemLabelCandidatoA As String = nomeCandidatoLabel.Text & ", obrigado pela sua participação na seleção para o cargo " & dsProcessoLabel.Text & ".<br>Comunico que seu nome foi o aprovado para a próxima fase do processo seletivo.<br>Aguarde nosso contato.<br>Desejamos-lhe sucesso.<br>Atenciosamente."
        Dim mensagemLabelCandidatoR As String = nomeCandidatoLabel.Text & ", obrigado pela sua participação na seleção para o cargo " & dsProcessoLabel.Text & ".<br>Comunico que para este cargo, nesta oportunidade, seu nome não foi o aprovado.<br>Ficaremos com seu Curriculum para aproveitamento em outras oportunidades que surgirem.<br>Desejamos-lhe sucesso.<br>Atenciosamente."

        RadioButtonListCandidato.Items.Item(0).Text = "<b>Aprovado</b> - " & mensagemLabelCandidatoA
        RadioButtonListCandidato.Items.Item(0).Value = 1
        RadioButtonListCandidato.Items.Item(1).Text = "<b>Reprovado</b> - " & mensagemLabelCandidatoR
        RadioButtonListCandidato.Items.Item(1).Value = 0

        GridViewAVALIACAO.Visible = False

    End Sub


    Sub ENVIA_EMAIL_AVALIACAO(Mensagem As String, email As String, subject As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_EnviaEmail]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Mensagem", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Mensagem").Value = Mensagem

        prm = New SqlParameter("@email", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@email").Value = email

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@subject", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@subject").Value = subject

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub OpenFormAvaliacao_Click(sender As Object, e As System.EventArgs) Handles OpenFormAvaliacao.Click

        REM ** CARREGA NOVAS INFORMAÇÕES
        REM ** *********************************************************************************
        SqlFORMENTREVISTA_TITULO.DataBind()
        SqlFORMENTREVISTA_PERGUNTA_STEP.DataBind()
        SqlFORMENTREVISTA_MONTA_PERGUNTA_STEP.DataBind()
        DataListSTEP.DataBind()
        DataListAPRESENTACAO.DataBind()
        RadioButtonListAVALIACAO.DataBind()
        REM ** *********************************************************************************

        If finalizadoLabel.Text = "1" Then
            AVISOLABEL.Visible = True
            PanelFormEntrevista.Visible = False
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Avaliação finalizada!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            PanelFINALIZADO.Visible = True
            chart_bind()
        Else
            PanelFormEntrevista.Visible = True
            PanelFINALIZADO.Visible = False
        End If

    End Sub

    Protected Sub LinkButtonFECHARFORM_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHARFORM.Click
        PanelFormEntrevista.Visible = False
    End Sub

    Protected Sub DataListSTEP_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListSTEP.ItemDataBound
        idPerguntaQuizAVALIACAOLabel.Text = DirectCast(e.Item.FindControl("idPerguntaQuizLabel"), Label).Text
        idQuizLabel.Text = DirectCast(e.Item.FindControl("idQuizLabel"), Label).Text
        finalizadoLabel.Text = DirectCast(e.Item.FindControl("finalizadoLabel"), Label).Text
        campoLaudoLabel.Text = DirectCast(e.Item.FindControl("campoLaudoLabel"), Label).Text

        If finalizadoLabel.Text = "1" Then
            AVISOLABEL.Visible = True
            PanelFormEntrevista.Visible = False
            PanelFINALIZADO.Visible = True
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Avaliação finalizada!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
            chart_bind()
        End If
    End Sub

    Protected Sub LinkButtonSalvaAvaliacao_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvaAvaliacao.Click

        Dim myReplace As New ReplaceForm

        If RadioButtonListAVALIACAOLabel.Text = "" Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Informe qual é sua avaliação!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        Else

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[_USP_ENTREVISTA_PRESENCIAL_GRAVA_RESULTADO]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idSetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idSetup").Value = Session("idSetup")

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

            prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idQuiz", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idQuiz").Value = idQuizLabel.Text

            prm = New SqlParameter("@idPerguntaQuiz", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idPerguntaQuiz").Value = idPerguntaQuizAVALIACAOLabel.Text

            prm = New SqlParameter("@idRespostaQuiz", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRespostaQuiz").Value = RadioButtonListAVALIACAO.SelectedItem.Value

            prm = New SqlParameter("@avaliacao", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@avaliacao").Value = myReplace.ReplaceIn(AvaliacaoTextBox.Text)

            prm = New SqlParameter("@campoLaudo", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@campoLaudo").Value = campoLaudoLabel.Text



            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                cn.Close()

                RadioButtonListAVALIACAOLabel.Text = ""
                AvaliacaoTextBox.Text = ""
                DataListSTEP.DataBind()
                RadioButtonListAVALIACAO.DataBind()

            Catch ex As Exception

            End Try

        End If


    End Sub

    Protected Sub RadioButtonListAVALIACAO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonListAVALIACAO.SelectedIndexChanged
        RadioButtonListAVALIACAOLabel.Text = RadioButtonListAVALIACAO.SelectedItem.Text
    End Sub


    Private Sub chart_bind()

        REM ** **************************************************************************************************************************************************************
        REM ** REFERÊNCIA: "[['Total', 'Fechadas', 'Abertas'],['2004',  1000, 400], ['2005',  1170, 460],['2006',  660, 1120],['2007',  1030, 540]]"
        REM ** **************************************************************************************************************************************************************

        Dim selectSQL As String = ""

        selectSQL = "EXEC [_USP_ENTREVISTA_PRESENCIAL_RESULTADO_CHART] " & Session("idSetup") & ", " & idCurriculoLabel.Text & ", " & idQuizLabel.Text & ", " & idProcessoSeletivoLabel.Text & ", " & idFaseProcessoSeletivoLabel.Text

        Dim str As New StringBuilder()
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmdGV As New SqlCommand(selectSQL, con)
        Dim adp As New SqlDataAdapter(cmdGV)
        Dim dt As New DataTable()

        adp.Fill(dt)
        str.Append("[['Avaliação', 'Total'],")

        Dim i As Int32

        Try

            For i = 0 To dt.Rows.Count - 1
                str.Append("[")
                str.Append("'" & dt.Rows(i)(Trim("Analise")) & "',")
                str.Append(dt.Rows(i)(Trim("Total")))
                str.Append("],")
            Next

            str.Append("]")

            parametroLabel.Text = Replace(str.ToString(), "],]", "]]")

            con.Close()

        Catch
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub LinkButtonFECHARRESULTADO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHARRESULTADO.Click
        PanelFINALIZADO.Visible = False
    End Sub

End Class
