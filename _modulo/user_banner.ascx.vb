
Partial Class _modulo_user_lateralApp
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ImageButtonLogo.ImageUrl = "~/images/logoPrincipal_" & Session("idSetup") & ".png"
        ImageButtonLogo.PostBackUrl = "/_empresa/Default.aspx"
        bannerAppLabel.Text = Session("tituloBanner")

        NavegacaoLabel.Text = Session("NavBanner")

    End Sub

End Class
