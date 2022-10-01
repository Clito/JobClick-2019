Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Partial Class _candidato_agenda
    Inherits System.Web.UI.Page

    Dim myconnection As SqlConnection
    Dim myda As SqlDataAdapter
    Dim ds As New DataSet
    Dim dsSelDate As DataSet


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If Session("idcurriculo") = "" Then
            Response.Redirect("/_candidato")
        End If

        If TextBox1.Text = "" Then
            Calendar1.SelectedDate = FormatDateTime(Now(), DateFormat.ShortDate)
        End If

        If Calendar1.SelectedDate.ToString <> "" Then
            TextBox1.Text = FormatDateTime(Calendar1.SelectedDate.ToString, DateFormat.ShortDate)
            HTMLCal.Text = Calendario(TextBox1.Text)
        Else
            TextBox1.Text = FormatDateTime(Now(), DateFormat.ShortDate)
            HTMLCal.Text = Calendario(TextBox1.Text)
        End If

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        myda = New SqlDataAdapter("SELECT * FROM tbAgenda WHERE (idcurriculo = " & Session("idcurriculo") & ")", myconnection)
        myda.Fill(ds, "tbAgenda")

    End Sub

    Protected Sub CalendarDRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender

        If Not e.Day.IsOtherMonth Then

            Dim dr As DataRow

            For Each dr In ds.Tables(0).Rows

                If Not dr("data") Is DBNull.Value Then

                    Dim dtEvent As DateTime = FormatDateTime(dr("data"), DateFormat.ShortDate)

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

    Protected Sub mySelectDay(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged

        If Calendar1.SelectedDate.ToString <> "" Then
            TextBox1.Text = FormatDateTime(Calendar1.SelectedDate.ToString, DateFormat.ShortDate)
            HTMLCal.Text = Calendario(TextBox1.Text)
        Else
            TextBox1.Text = FormatDateTime(Now(), DateFormat.ShortDate)
            HTMLCal.Text = Calendario(TextBox1.Text)
        End If

    End Sub


    Function Calendario(ByVal data As String) As String

        Dim HTML As String = ""

        Dim dr As SqlDataReader = Nothing
        Dim resposta As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Dim A As Int32 = 0
        Dim HORA As Int32 = 0
        Dim CONTAHORA As Int32 = 0
        Dim CONTAREG As Int32 = 0
        Dim SubCONTAREG As Int32 = 0
        Dim aprHORA As String = ""
        Dim COR As String = ""
        Dim RELOGIO As String = ""

        Dim txtCompromisso As String = ""
        Dim txtdsRespostaCandidato As String = ""
        Dim data_endRES As String = ""
        Dim data_endRESint As String = ""

        Dim ComparaHora As String = "00:00:00"
        Dim SubComparaHora As String = "00:00:00"

        Dim ComparaHoraFIM As String = "00:00:00"
        Dim SubComparaHoraFIM As String = "00:00:00"

        Dim GravaLinha As Int16 = 0

        Dim data_start(20) As String
        Dim data_end(20) As String
        Dim data_compromisso(20) As String
        Dim dsRespostaCandidato(20) As String
        Dim ativo(20) As Boolean
        Dim Intercalado As String = ""

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idagenda, data, data_start, data_end, dsCompromissoEmp, dsRespostaCandidato, ativo, idcurriculo, idVaga FROM tbAgenda WHERE (data = CONVERT(DATETIME, '" & data & "', 103)) AND (idcurriculo = " & Session("idcurriculo") & ") ORDER BY data_start"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                Do While dr.Read()
                    data_start(CONTAREG) = dr("data_start")
                    data_end(CONTAREG) = dr("data_end")

                    If Not dr("dsCompromissoEmp") Is DBNull.Value Then
                        data_compromisso(CONTAREG) = dr("dsCompromissoEmp")
                    Else
                        data_compromisso(CONTAREG) = "Aguardando confirmação..."
                    End If

                    If Not dr("dsRespostaCandidato") Is DBNull.Value Then
                        dsRespostaCandidato(CONTAREG) = "<br>[RH]: " & dr("dsRespostaCandidato")
                    Else
                        dsRespostaCandidato(CONTAREG) = ""
                    End If

                    If Not dr("ativo") Is DBNull.Value Then
                        ativo(CONTAREG) = dr("ativo")
                    Else
                        ativo(CONTAREG) = False
                    End If

                    CONTAREG = CONTAREG + 1

                Loop

                resposta = True

            End If

        Catch ex As SqlClient.SqlException

            resposta = False

        Finally

            dr.Close()
            Connection.Close()

            For CONTAREG = CONTAREG To 20

                data_start(CONTAREG) = "2/2/2000"
                data_end(CONTAREG) = "2/2/2000"
                data_compromisso(CONTAREG) = ""
                dsRespostaCandidato(CONTAREG) = ""
                ativo(CONTAREG) = False

            Next

        End Try

        HTML = HTML & "<table class='DGCalendarioWidthSite' border='0' id='mycalendario'>" & Chr(10)
        HTML = HTML & "<tr>" & Chr(10)
        HTML = HTML & "<td class='showdata' valign='top'>" & FormatDateTime(data, DateFormat.LongDate) & "</td>" & Chr(10)
        HTML = HTML & "</tr>" & Chr(10)
        HTML = HTML & "</table>" & Chr(10)

        HTML = HTML & "<table class='DGCalendarioWidthSite' border='0' id='mycalendario'>" & Chr(10)

        CONTAREG = 0

        For A = 0 To 47

            CONTAHORA = CONTAHORA + 1

            If A < 16 Then

                If CONTAHORA > 1 Then
                    aprHORA = "0" & HORA & ":30:00"
                    CONTAHORA = 0
                    HORA = HORA + 1
                    COR = "DGBGCalendario1"
                Else
                    aprHORA = "0" & HORA & ":00:00"
                    COR = "DGBGCalendario2"
                End If

            Else

                If A > 36 Then

                    If CONTAHORA > 1 Then

                        If HORA <= 9 Then
                            aprHORA = "0" & HORA & ":30:00"
                            CONTAHORA = 0
                            HORA = HORA + 1
                            COR = "DGBGCalendario1"
                        Else
                            aprHORA = HORA & ":30:00"
                            CONTAHORA = 0
                            HORA = HORA + 1
                            COR = "DGBGCalendario1"
                        End If

                    Else

                        If HORA <= 9 Then
                            aprHORA = "0" & HORA & ":00:00"
                            COR = "DGBGCalendario2"
                        Else
                            aprHORA = HORA & ":00:00"
                            COR = "DGBGCalendario2"
                        End If

                    End If

                Else

                    If CONTAHORA > 1 Then
                        If HORA <= 9 Then
                            aprHORA = "0" & HORA & ":30:00"
                            CONTAHORA = 0
                            HORA = HORA + 1
                            COR = "DGBGCalendario4"
                        Else
                            aprHORA = HORA & ":30:00"
                            CONTAHORA = 0
                            HORA = HORA + 1
                            COR = "DGBGCalendario4"
                        End If
                    Else
                        If HORA <= 9 Then
                            aprHORA = "0" & HORA & ":00:00"
                            COR = "DGBGCalendario3"
                        Else
                            aprHORA = HORA & ":00:00"
                            COR = "DGBGCalendario3"
                        End If
                    End If

                End If

            End If

            REM ** ***********************************************************************
            REM ** VERIFICA O HORÁRIO DE INÍCIO
            REM ** ***********************************************************************

            If data_start(CONTAREG) <> "" Then

                ComparaHora = data_start(CONTAREG)

                If aprHORA <> ComparaHora Then
                    txtCompromisso = ""
                    txtdsRespostaCandidato = ""
                    data_endRES = ""
                Else
                    SubCONTAREG = CONTAREG
                    GravaLinha = 1 REM ** MARCA A LINHA INICIAL
                    txtCompromisso = data_compromisso(CONTAREG)
                    txtdsRespostaCandidato = dsRespostaCandidato(CONTAREG)
                    data_endRES = data_end(CONTAREG)

                    If ativo(CONTAREG) Then
                        RELOGIO = "<img border='0' src='/images/DGrelogio.gif'>"
                    Else
                        RELOGIO = "<img border='0' src='/images/DGrelogionull.gif'>"
                    End If

                    COR = "#FDF8EA"

                End If

            End If

            If GravaLinha = 1 Then

                COR = "#FDF8EA" REM ** MANTÉM A COR NAS LINHAS ATÉ CHEGAR NO ENCERRAMENTO

                If ativo(CONTAREG) Then
                    RELOGIO = "<img border='0' src='/images/DGrelogio.gif'>"
                Else
                    RELOGIO = "<img border='0' src='/images/DGrelogionull.gif'>"
                End If

            End If

            Intercalado = ""
            data_endRESint = ""

            Try

                If data_start(CONTAREG + 1) = data_end(CONTAREG) Then
                    Intercalado = "• " & data_compromisso(CONTAREG) & " das [" & data_start(CONTAREG) & " às " & data_end(CONTAREG) & "]<br>• " & data_compromisso(CONTAREG + 1) & " das [" & data_start(CONTAREG + 1) & " às " & data_end(CONTAREG + 1) & "]"
                    data_endRESint = data_end(CONTAREG + 1)
                Else
                    Intercalado = "<b>Término</b> " & data_end(CONTAREG)
                End If
            Catch ex As Exception

            End Try



            REM ** ***********************************************************************
            REM ** VERIFICA O HORÁRIO DE ENCERRAMENTO
            REM ** ***********************************************************************

            If data_end(CONTAREG) <> "" Then

                ComparaHoraFIM = data_end(CONTAREG)

                If aprHORA = ComparaHoraFIM Then
                    COR = "DGBGCalendario5" REM ** ATÉ A ÚLTIMA LINHA ...
                    GravaLinha = 0 REM ** LIBERA PARA A COR PADRÃO 
                    txtdsRespostaCandidato = Intercalado
                    data_endRES = data_endRESint

                    If ativo(CONTAREG) Then
                        RELOGIO = "<img border='0' src='/images/DGrelogio.gif'>"
                    Else
                        RELOGIO = "<img border='0' src='/images/DGrelogionull.gif'>"
                    End If

                    CONTAREG = CONTAREG + 1 REM APENAS AQUI É QUE REINICIA O CONTADOR
                End If

            End If

            HTML = HTML & "<tr>" & Chr(10)
            HTML = HTML & "<td class='" & COR & "' width='50' valign='top'>" & aprHORA & "</td>" & Chr(10)
            HTML = HTML & "<td class='" & COR & "' width='50' valign='top'>" & data_endRES & "</td>" & Chr(10)
            HTML = HTML & "<td class='" & COR & "' valign='top'>" & txtCompromisso & txtdsRespostaCandidato & "</td>" & Chr(10)
            HTML = HTML & "<td class='" & COR & "' width='15' valign='top'>" & RELOGIO & "</td>" & Chr(10)
            HTML = HTML & "</tr>" & Chr(10)

            RELOGIO = ""

        Next

        HTML = HTML & "</table>" & Chr(10)

        Calendario = HTML

    End Function

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.DataItem("ativo") Then
                e.Row.Cells(11).Visible = True
            Else
                e.Row.Cells(11).Visible = False
            End If
        End If
    End Sub

    Protected Sub GetCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles ImageButton8.Command

        Select Case e.CommandName
            Case "Cancel"
                TextBox3.Text = "Cancelar..."
                FormView1.DefaultMode = FormViewMode.ReadOnly
                ImageButton8.Enabled = True
                GridView1.Columns(9).Visible = True

                TextBox2.Text = ""

            Case "Select"
                Select Case e.CommandArgument.ToString
                    Case "S"
                        FormView1.Visible = True
                        FormView1.DefaultMode = FormViewMode.Edit
                        TextBox3.Text = e.CommandArgument.ToString
                        ImageButton8.Enabled = False

                    Case "U"
                        TextBox3.Text = e.CommandArgument.ToString

                        If FormView1.DefaultMode = FormViewMode.ReadOnly Then
                            FormView1.DefaultMode = FormViewMode.Edit
                        End If



                End Select

            Case "Incluir"

                FormView1.Visible = True
                FormView1.DefaultMode = FormViewMode.Insert
                TextBox3.Text = e.CommandArgument.ToString
                TextBox2.Text = ""


                GridView1.Columns(9).Visible = False

                CType(FormView1.FindControl("dataTextBox"), TextBox).Text = FormatDateTime(Calendar1.SelectedDate.ToString, DateFormat.ShortDate)
                CType(FormView1.FindControl("idcurriculoTextBox"), TextBox).Text = Session("idcurriculo")

        End Select

    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        TextBox2.Text = GridView1.SelectedValue.ToString

    End Sub

    Protected Sub SqlDataSource4_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource4.Updated

        GridView1.DataBind()

        HTMLCal.Text = Calendario(TextBox1.Text)

        TextBox2.Text = ""

        If FormView1.DefaultMode = FormViewMode.Edit Then
            FormView1.DefaultMode = FormViewMode.ReadOnly
            ImageButton8.Enabled = True
        End If

    End Sub

    Protected Sub SqlDataSource4_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource4.Inserted

        GridView1.DataBind()
        Calendar1.DataBind()

        HTMLCal.Text = Calendario(TextBox1.Text)

        TextBox2.Text = ""

        If FormView1.DefaultMode = FormViewMode.Insert Then
            FormView1.DefaultMode = FormViewMode.ReadOnly
            GridView1.Columns(9).Visible = True
        End If

    End Sub

    Sub ExcluirItemAgenda(ByVal source As Object, ByVal e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted

        If e.AffectedRows > 0 Then
            GridView1.DataBind()
            HTMLCal.Text = Calendario(TextBox1.Text)
        End If

    End Sub

    Protected Sub DropDownListIni_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        HorainiLabel.Text = CType(FormView1.FindControl("DropDownListIni"), DropDownList).SelectedValue
    End Sub

    Protected Sub ImageButton4_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        HorainiLabel.Text = ""
    End Sub

    Protected Sub SqlDataSource4_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource4.Inserting
        e.Command.Parameters("@data_start").Value = CType(FormView1.FindControl("DropDownListIni"), DropDownList).SelectedItem.Text
        e.Command.Parameters("@data_end").Value = CType(FormView1.FindControl("DropDownListFim"), DropDownList).SelectedItem.Text
    End Sub

    Protected Sub ImageButton8_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButton8.Click
        FormView1.Visible = True
    End Sub

    Protected Sub SqlDataSource1_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated
        Calendar1.DataBind()
    End Sub
End Class
