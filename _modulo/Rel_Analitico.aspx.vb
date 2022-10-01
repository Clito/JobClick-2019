Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System.Web.UI.WebControls


Partial Class _modulo_Rel_Analitico
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("tituloBanner") = "Relatório Analítico"
    End Sub

    Protected Sub ButtonGerarRelatorio_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonGerarRelatorio.Click

        dataILabel.Text = dtITextBox.Text
        dataFLabel.Text = dtFTextBox.Text


        'Dim cn As SqlConnection
        'Dim cmd As SqlCommand
        'Dim prm As SqlParameter
        'Dim rs As Boolean = False

        'Dim en As cotaResumoMask = New cotaResumoMask

        'cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        'cmd = New SqlCommand("SMSReport.Rel_Ana", cn)
        'cmd.CommandType = CommandType.StoredProcedure

        'prm = New SqlParameter("@idAggregationType", SqlDbType.Int, 4)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@idAggregationType").Value = 2

        'prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@idUser").Value = Session("idUser_SMS")

        'prm = New SqlParameter("@strDateStart", SqlDbType.VarChar, 10)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@strDateStart").Value = dtITextBox.Text

        'prm = New SqlParameter("@strDateFinish", SqlDbType.VarChar, 10)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@strDateFinish").Value = dtFTextBox.Text

        'prm = New SqlParameter("@idAggregation", SqlDbType.Int)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@idAggregation").Value = -1

        'cn.Open()

        'Dim dr As SqlDataReader = cmd.ExecuteReader

        'If dr.HasRows() Then
        '    dr.Read()
        'Else

        'End If

        'dr.Close()
        'cn.Close()

    End Sub

    Protected Sub SqlRelatorioAnalitico_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRelatorioAnalitico.Selected
        contadorRegLabel.Text = "Total de SMS enviados no período de " & dataILabel.Text & " à " & dataFLabel.Text & " é de: " & e.AffectedRows.ToString() & "."
    End Sub

End Class
