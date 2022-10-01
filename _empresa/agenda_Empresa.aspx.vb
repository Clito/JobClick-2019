
Partial Class _empresa_agenda_Empresa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        '?idcurriculo=216&idvaga=1&idRELcandidato_vaga=135&id=19&dsProcesso=Analista%20de%20Sistemas
        lblidcurriculo.Text = Request.QueryString("idcurriculo")
        lblidvaga.Text = Request.QueryString("idvaga")
        idRELcandidato_vaga.Text = Request.QueryString("idRELcandidato_vaga")
        idProcessoLabel.Text = Request.QueryString("id")
    End Sub
End Class
