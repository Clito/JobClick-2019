Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ

Partial Class _empresa_agenda_schedule_Empresa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            DayPilotSchedulerEmpresa.StartDate = Convert.ToDateTime(Now())
            DayPilotSchedulerEmpresa.Days = DateTime.DaysInMonth(DateTime.Today.Year, DateTime.Today.Month)
            GetPlanejamento()

        End If

        LabelCabec.Text = Request.QueryString("autoTit")

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If


    End Sub

    Sub GetPlanejamento()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PLANEJAMENTO_AGENDA_GESTOR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idSetup").Value = Session("idSetup")

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows() Then
                Do While dr.Read()
                    DayPilotSchedulerEmpresa.Resources.Add(dr("dsEventoPerfilVaga"), dr("idEventoPerfilVaga"))
                Loop
            End If
            dr.Close()
        Catch ex As Exception

        End Try


        cn.Close()

    End Sub
    Protected Sub DropDownListPerfil_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListPerfil.DataBound
        Try
            Dim myDropDownListPerfil As DropDownList = DropDownListPerfil
            myDropDownListPerfil.Items.Insert(0, New ListItem("-- Selecione --", ""))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListPlanejamento_DataBound(sender As Object, e As System.EventArgs)

        Try
            Dim myDropDownListPlanejamento As DropDownList = CType(FormViewTarefa.FindControl("DropDownListPlanejamento"), DropDownList)
            myDropDownListPlanejamento.Items.Insert(0, New ListItem("-- Selecione Planejamento --", ""))
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        REM ** TEM QUE RECEBER O RELACIONAMENTO DO PLANEJADO COM OS ÍTENS DO PLANEJAMENTO

        idPerfilVagaLabel.Text = DropDownListPerfil.SelectedValue
        DayPilotSchedulerEmpresa.Resources.Clear()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AGENDA_GESTOR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idPerfilVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows() Then
                Do While dr.Read()
                    DayPilotSchedulerEmpresa.Resources.Add(dr("dsEventoPerfilVaga"), dr("idEventoPerfilVaga"))
                Loop
                DayPilotSchedulerEmpresa.Resources.Add("Incluir Tarefas", 0)
            Else
                DayPilotSchedulerEmpresa.Resources.Add("Incluir Tarefas", 0)
            End If
            dr.Close()
        Catch ex As Exception

        End Try


        cn.Close()

        FormViewTarefa.Visible = True
        DayPilotSchedulerEmpresa.Visible = True

    End Sub

    Protected Sub DropDownListGestor_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListGestor.DataBound

        Try
            Dim myDropDownListGestor As DropDownList = DropDownListGestor
            myDropDownListGestor.Items.Insert(0, New ListItem("-- Selecione --", "0"))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DayPilotSchedulerEmpresa_EventClick(sender As Object, e As DayPilot.Web.Ui.EventClickEventArgs) Handles DayPilotSchedulerEmpresa.EventClick
        idEventoAgendaLabel.Text = e.Value
    End Sub

    Protected Sub DayPilotSchedulerEmpresa_FreeTimeClick(sender As Object, e As DayPilot.Web.Ui.FreeClickEventArgs) Handles DayPilotSchedulerEmpresa.FreeTimeClick
        idEventoFreeAgendaLabel.Text = e.Start
        FormViewTarefa.DefaultMode = FormViewMode.Insert
        FormViewTarefa.Visible = True
        Try
            CType(FormViewTarefa.FindControl("inicioTextBox"), TextBox).Text = idEventoFreeAgendaLabel.Text
            CType(FormViewTarefa.FindControl("idPerfilVagaTextBox"), TextBox).Text = idPerfilVagaLabel.Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub CalendarTarefas_SelectionChanged(sender As Object, e As System.EventArgs) Handles CalendarTarefas.SelectionChanged
        DayPilotSchedulerEmpresa.StartDate = Convert.ToDateTime(CalendarTarefas.SelectedDate)
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As System.EventArgs)
        FormViewTarefa.DefaultMode = FormViewMode.ReadOnly
        FormViewTarefa.Visible = True
    End Sub

    Protected Sub SqlAgendaTarefaForm_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlAgendaTarefaForm.Inserted
        DayPilotSchedulerEmpresa.DataBind()
        AtualizaAgenda()
        GridViewFolowup.DataBind()
    End Sub

    Protected Sub SqlAgendaTarefaForm_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlAgendaTarefaForm.Deleted
        DayPilotSchedulerEmpresa.DataBind()
        AtualizaAgenda()
        GridViewFolowup.DataBind()
    End Sub

    Protected Sub SqlAgendaTarefaForm_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlAgendaTarefaForm.Updated
        DayPilotSchedulerEmpresa.DataBind()
        GridViewFolowup.DataBind()
        AtualizaAgenda()
    End Sub

    Sub AtualizaAgenda()

        idPerfilVagaLabel.Text = DropDownListPerfil.SelectedValue
        DayPilotSchedulerEmpresa.Resources.Clear()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AGENDA_GESTOR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idPerfilVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows() Then
                Do While dr.Read()
                    DayPilotSchedulerEmpresa.Resources.Add(dr("dsEventoPerfilVaga"), dr("idEventoPerfilVaga"))
                Loop
                DayPilotSchedulerEmpresa.Resources.Add("Incluir Tarefas", 0)
            Else
                DayPilotSchedulerEmpresa.Resources.Add("Incluir Tarefas", 0)
            End If
            dr.Close()
        Catch ex As Exception

        End Try


        cn.Close()

    End Sub


    Protected Sub SqlAgendaTarefaForm_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlAgendaTarefaForm.Inserting

        Dim DataIni As DateTime
        Dim DataFim As DateTime

        Dim Calc As Int32 = 0
        Dim CalcRes As Int32 = 0

        DataIni = CType(FormViewTarefa.FindControl("inicioTextBox"), TextBox).Text
        DataFim = CType(FormViewTarefa.FindControl("finalTextBox"), TextBox).Text

        Calc = DateDiff("d", DataIni, DataFim)
        CalcRes = 50 + Calc

        If CalcRes < 50 Then

            MSNLabel.Text = "ATENÇÃO:<br>A data inicial deve ser maior que a data do fim do compromisso.<br>Não foi gravado o compromisso."
            e.Cancel = True
            Return

        Else
            MSNLabel.Text = ""
        End If

        e.Command.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel.Text
        e.Command.Parameters("@idEventoPerfilVaga").Value = CType(FormViewTarefa.FindControl("DropDownListPlanejamento"), DropDownList).SelectedValue

    End Sub

    Protected Sub DropDownListGestor_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListGestor.SelectedIndexChanged
        idEventoAgendaLabel.Text = ""
        idPerfilVagaLabel.Text = ""
        AtualizaAgenda()
    End Sub


    Protected Sub LinkButtonCancelarEdit_Click(sender As Object, e As System.EventArgs)
        idEventoAgendaLabel.Text = ""
    End Sub


    Protected Sub GridViewFolowup_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFolowup.SelectedIndexChanged
        DayPilotSchedulerEmpresa.StartDate = Convert.ToDateTime(GridViewFolowup.SelectedDataKey("inicio"))
    End Sub

End Class
