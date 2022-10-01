Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _consultorWizard_agendaCandidato
    Inherits System.Web.UI.Page

    Dim myconnection As SqlConnection
    Dim myda As SqlDataAdapter
    Dim ds As New DataSet
    Dim dsSelDate As DataSet

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LabelCabec.Text = Request.QueryString("autoTit")
            DayPilotCalendarCandidato.StartDate = Now()
        End If
    End Sub

    Protected Sub CalendarCandidato_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarCandidato.SelectionChanged
        DayPilotCalendarCandidato.StartDate = CalendarCandidato.SelectedDate
    End Sub

    Protected Sub CalendarCandidato_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarCandidato.DayRender

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        myda = New SqlDataAdapter("SELECT idCalendario, idCadastroEmpresa, idRH_Gestor, idUser, idCurriculo, idEventoAgenda, idProcessoSeletivo, idFaseProcessoSeletivoCV, DataStartField, DataEndField, DataTextField, DataValueField, Evento, dsEventoAceite, aceito, avisado FROM tbAgendaC WHERE (idRH_Gestor = " & Session("idRH_Gestor") & ") AND (idCadastroEmpresa = " & Session("idCadastroEmpresa") & ")", myconnection)
        myda.Fill(ds, "tbAgendaC")

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

    Protected Sub DayPilotCalendarCandidato_FreeTimeClick(sender As Object, e As DayPilot.Web.Ui.FreeClickEventArgs) Handles DayPilotCalendarCandidato.FreeTimeClick
        DayPilotCalendarCandidato.StartDate = e.Start
    End Sub

    Protected Sub DayPilotCalendarCandidato_EventClick(sender As Object, e As DayPilot.Web.Ui.EventClickEventArgs) Handles DayPilotCalendarCandidato.EventClick
        idCalendarioLabel.Text = e.Value
        idUserLabel.Text = GetidUser(idCalendarioLabel.Text)
        PanelFormCalendario.Visible = True

    End Sub

    Function GetidUser(idCalendario As Int32) As Int32
        Dim idUser As Int32
        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        myda = New SqlDataAdapter("SELECT idUser FROM tbAgendaC WHERE (idCalendario = " & idCalendario & ")", myconnection)
        myda.Fill(ds, "tbAgendaC")
        Dim dr As DataRow
        For Each dr In ds.Tables(0).Rows
            idUser = dr("idUser")
        Next
        Return idUser
    End Function



    Protected Sub SqlDataAgendaForm_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataAgendaForm.Updated
        PanelFormCalendario.Visible = False
        idCalendarioLabel.Text = ""
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        PanelFormCalendario.Visible = False
        idCalendarioLabel.Text = ""
    End Sub

    Protected Sub SqlDataAgendaForm_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataAgendaForm.Updating
        e.Command.Parameters("@idUser").Value = idUserLabel.Text
        e.Command.Parameters("@DataStartField").Value = CType(FormViewCalendario.FindControl("DataStartFieldLabel"), Label).Text
        e.Command.Parameters("@DataEndField").Value = CType(FormViewCalendario.FindControl("DataEndFieldLabel"), Label).Text
        e.Command.Parameters("@DataTextField").Value = "---------------------------------------------------------<br>Consultor: " & Session("nome") & "<br>" & CType(FormViewCalendario.FindControl("DataTextFieldNEWTextBox"), TextBox).Text & "<br>" & Now() & "<br>" & CType(FormViewCalendario.FindControl("DataTextFieldTextBox"), TextBox).Text
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelFormCalendario.Visible = False
    End Sub

End Class
