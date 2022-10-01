Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Partial Class App_Include_ddgT
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myconnection As SqlConnection
        Dim myda As SqlDataAdapter
        Dim ds As New DataSet

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

    Public Property dataT() As String

        Get
            Return ddl2.SelectedValue
            Return ddl2.Visible = True
        End Get

        Set(ByVal value As String)
            ddl2.SelectedValue = value
        End Set

    End Property

End Class

