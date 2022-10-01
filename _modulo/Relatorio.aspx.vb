
Partial Class _modulo_Relatorio
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("tituloBanner") = "Relatórios"
        RelatorioIntroLabel.Text = "<b>Panorama mais amplo, decisões mais inteligentes:</b><br><br>Relatórios BI - Inteligência de Negócios - podem ajudar a aumentar a competitividade da sua empresa. Entender as tendências dos consumidores e a performance de sua empresa ajuda a tomar decisões mais inteligentes e mais bem informadas."


    End Sub
End Class
