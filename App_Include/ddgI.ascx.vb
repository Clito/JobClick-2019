Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Partial Class App_Include_ddg
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet

        myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        myda = New SqlDataAdapter("SELECT idAgendaHoraInicio, data_start FROM tbAgendaHora", myconnection)
        ds = New DataSet
        myda.Fill(ds, "tbAgendaHora")

        Try

            ddl1.DataSource = ds
            ddl1.DataSource = ds.Tables(0)
            ddl1.DataTextField = ds.Tables(0).Columns("data_start").ColumnName.ToString()
            ddl1.DataValueField = ds.Tables(0).Columns("data_start").ColumnName.ToString()
            ddl1.DataBind()

        Finally

        End Try

    End Sub

    Public Property dataI() As String

        Get
            Return ddl1.SelectedValue
            Return ddl1.Visible = True
        End Get

        Set(ByVal value As String)
            ddl1.SelectedValue = value
        End Set

    End Property

End Class
