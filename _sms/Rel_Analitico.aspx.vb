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

    End Sub

    Protected Sub SqlRelatorioAnalitico_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRelatorioAnalitico.Selected
        contadorRegLabel.Text = "Total de SMS enviados no período de " & dataILabel.Text & " à " & dataFLabel.Text & " é de: " & e.AffectedRows.ToString() & "."
    End Sub

End Class
