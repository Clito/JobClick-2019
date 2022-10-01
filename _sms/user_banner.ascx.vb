
Partial Class _modulo_user_lateralApp
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ImageButtonLogo.ImageUrl = "~/images/logoPrincipal_" & Session("SETLayout") & ".png"
        ImageButtonLogo.PostBackUrl = "/_user/"
        bannerAppLabel.Text = Session("tituloBanner")

        NavegacaoLabel.Text = Session("NavBanner")

    End Sub

End Class
