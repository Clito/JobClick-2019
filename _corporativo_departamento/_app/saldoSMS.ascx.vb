Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable
Imports cotaResumo

Partial Class _app_saldoSMS
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cota As cotaResumoMask = New cotaResumoMask
        cota = cotaResumo.GetCotaDados(Session("idClient"))
        SaldoLabel.Text = cota.numCurrentBalance.ToString
    End Sub

End Class
