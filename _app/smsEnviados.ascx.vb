
Partial Class _app_smsEnviados
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cota As cotaResumoMask = New cotaResumoMask
        cota = cotaResumo.GetCotaRel(Session("idClient"))
        SMSEnviadosLabel.Text = cota.numQuotaSended
    End Sub
End Class
