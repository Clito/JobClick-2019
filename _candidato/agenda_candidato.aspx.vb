Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Partial Class _candidato_agenda_candidato
    Inherits System.Web.UI.Page

    Dim myconnection As SqlConnection
    Dim myda As SqlDataAdapter
    Dim ds As New DataSet
    Dim dsSelDate As DataSet

    Protected Sub CalendarCandidato_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarCandidato.DayRender

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet
        Dim cmd As SqlCommand

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_CANDIDATO_RESPONDE", myconnection)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

        cmd.Parameters.AddWithValue("@idUser", Session("idUser"))

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


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        PanelAviso.Visible = False

        If Not IsPostBack Then
            DayPilotCalendarCandidato.StartDate = Now()
        End If

        If Request.QueryString("dataAgenda") <> "" Then
            DayPilotCalendarCandidato.StartDate = Request.QueryString("dataAgenda")
        End If

    End Sub

    Protected Sub CalendarCandidato_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarCandidato.SelectionChanged
        DayPilotCalendarCandidato.StartDate = CalendarCandidato.SelectedDate
    End Sub

    Protected Sub DayPilotCalendarCandidato_EventClick(sender As Object, e As DayPilot.Web.Ui.EventClickEventArgs) Handles DayPilotCalendarCandidato.EventClick
        idEntrevistaPresencialLabel.Text = e.Value
        PanelFormCalendario.Visible = True
        REM ** ********************************************************************************
        REM ** RECUPERA INFORMAÇÕES SOBRE A ENTREVISTA
        REM ** ********************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_CANDIDATO_RESPONDE]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = Session("idUser")

        prm = New SqlParameter("@idEntrevistaPresencial", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaPresencial").Value = idEntrevistaPresencialLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                REM ** *****************************************************************************
                REM ** RECUPERA OS DADOS DO CANDIDATO - ATUALIZA CONTADOR DE VISUALIZAÇÃO
                REM ** *****************************************************************************

                Select Case dr("aceito")

                    Case 0
                        PanelFormCalendario.Visible = True
                        LabelMensagemDB.Text = "<br><b>Sobre a entrevista presencial:</b><br>" & dr("DataTextField") & "<br>" & dr("HistoricoDasMensagens") & "<br>"
                    Case 1
                        PanelFormCalendario.Visible = True
                        LabelMensagemDB.Text = "<br><b>Sobre a entrevista presencial:</b><br>" & dr("DataTextField") & "<br>" & dr("HistoricoDasMensagens") & "<br>"
                    Case 2
                        PanelFormCalendario.Visible = False
                        PanelAviso.Visible = True
                        AVISOLABEL.Text = "• Esta entrevista presencial foi cancelada!<br>"
                        AVISOLABEL.CssClass = "msnOK"
                        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
                    Case 3
                        PanelFormCalendario.Visible = False
                        PanelAviso.Visible = True
                        AVISOLABEL.Text = "• Esta entrevista presencial foi finalizada!<br>"
                        AVISOLABEL.CssClass = "msnOK"
                        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"

                End Select

            End If
            cn.Close()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub DayPilotCalendarCandidato_FreeTimeClick(sender As Object, e As DayPilot.Web.Ui.FreeClickEventArgs) Handles DayPilotCalendarCandidato.FreeTimeClick
        PanelFormCalendario.Visible = False
    End Sub

    Protected Sub LinkButtonEnviar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonEnviar.Click
        REM ** ********************************************************************************
        REM ** SOBRE A ENTREVISTA (RESPOSTA DO CANDIDATO)
        REM ** ********************************************************************************
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_CANDIDATO_RESPONDE]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = Session("idUser")

        prm = New SqlParameter("@idEntrevistaPresencial", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaPresencial").Value = idEntrevistaPresencialLabel.Text

        prm = New SqlParameter("@confirmar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@confirmar").Value = 1

        prm = New SqlParameter("@aceito", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@aceito").Value = RadioButtonListConfirme.SelectedValue

        prm = New SqlParameter("@HistoricoDasMensagens", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@HistoricoDasMensagens").Value = MensagemTextBox.Text

        prm = New SqlParameter("@URL", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URL").Value = URL

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Sua resposta foi enviada com sucesso!<br>"
            AVISOLABEL.CssClass = "msnOK"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
            PanelFormCalendario.Visible = False

        Catch ex As Exception

        End Try


    End Sub

    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCANCELAR.Click
        PanelFormCalendario.Visible = False
    End Sub

End Class
