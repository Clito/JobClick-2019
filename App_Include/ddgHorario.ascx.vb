Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Partial Class App_Include_ddgHorario
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet
        Dim mydaT As SqlDataAdapter
        Dim dsT As New DataSet
        Dim DataI As String = "00:00:00"

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        myda = New SqlDataAdapter("SELECT idAgendaHoraInicio, data_start FROM tbAgendaHora", myconnection)
        ds = New DataSet
        myda.Fill(ds, "tbAgendaHora")

        mydaT = New SqlDataAdapter("SELECT idAgendaHoraTermino, data_end FROM tbAgendaHoraTermino WHERE (data_end >= '" & DataI & "')", myconnection)
        dsT = New DataSet
        mydaT.Fill(dsT, "tbAgendaHoraTermino")

        Try

            ddl1.DataSource = ds
            ddl1.DataSource = ds.Tables(0)
            ddl1.DataTextField = ds.Tables(0).Columns("data_start").ColumnName.ToString()
            ddl1.DataValueField = ds.Tables(0).Columns("data_start").ColumnName.ToString()
            ddl1.DataBind()

            ddl2.DataSource = dsT
            ddl2.DataSource = dsT.Tables(0)
            ddl2.DataTextField = dsT.Tables(0).Columns("data_end").ColumnName.ToString()
            ddl2.DataValueField = dsT.Tables(0).Columns("data_end").ColumnName.ToString()
            ddl2.DataBind()

        Finally

        End Try

    End Sub

    Protected Sub GetHorario(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl1.SelectedIndexChanged

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet

        Dim data_startRES As String = ddl1.SelectedValue.ToString

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        myda = New SqlDataAdapter("SELECT idAgendaHoraTermino, data_end FROM tbAgendaHoraTermino", myconnection)
        ds = New DataSet
        myda.Fill(ds, "tbAgendaHoraTermino")

        Try

            ddl2.DataSource = ds
            ddl2.DataSource = ds.Tables(0)
            ddl2.DataTextField = ds.Tables(0).Columns("data_end").ColumnName.ToString()
            ddl2.DataValueField = ds.Tables(0).Columns("data_end").ColumnName.ToString()
            ddl2.DataBind()

        Finally

        End Try

    End Sub

    Public Property HorarioI() As String

        Get
            Return ddl1.SelectedValue
        End Get

        Set(ByVal value As String)
            ddl1.SelectedValue = value
            ddl2.SelectedValue = value
        End Set

    End Property

    Public Property HorarioT() As String

        Get
            Return ddl2.SelectedValue
        End Get

        Set(ByVal value As String)
            ddl2.SelectedValue = value
        End Set

    End Property


End Class
