
Partial Class varflash_varlateral
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim A As String = Now()
        varFlashLateral.Text = "&recados=<b>(200)</b>&processo=<b>(2)</b>&entrevistas=<b>(1)</b>&tempo=<b>" + A + "</b>&privilegio=<b>[" + Session("cadastroTipo") + "]</b>&"

    End Sub
End Class
