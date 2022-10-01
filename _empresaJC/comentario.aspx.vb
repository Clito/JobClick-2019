Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresa__processo_comentario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'http://apache:9090/_empresaJC/_processo/comentario.aspx?idRELcandidato_vaga=43&idvaga=4&idcurriculo=70

        lblidcurriculo.Text = Request.QueryString("idcurriculo")
        lblidvaga.Text = Request.QueryString("idvaga")
        lblidRELcandidato_vaga.Text = Request.QueryString("idRELcandidato_vaga")
        lblidUser.Text = Request.QueryString("idUser")
        idProcessoLabel.Text = Request.QueryString("id")

        LBVoltar.PostBackUrl = "processo.aspx?id=" & idProcessoLabel.Text & "&idvaga=" & lblidvaga.Text & "&dsProcesso=" & Request.QueryString("dsProcesso")

        HLCV.Target = "_blank"
        HLCV.NavigateUrl = "/_anonimo/mycurriculo.aspx?idUser=" & lblidUser.Text & "&id=" & lblidcurriculo.Text

    End Sub

    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("processo.aspx?id=" & idProcessoLabel.Text & "&idvaga=" & lblidvaga.Text & "&dsProcesso=" & Request.QueryString("dsProcesso"))
    End Sub

    Protected Sub SqlComentario_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlComentario.Updated
        msn.Text = "Comentários e pontuação foram vinculados ao candidato."
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Dim myLabel As Label = DirectCast(e.Item.FindControl("portadorDefLabel"), Label)
            Dim myLabelT As Label = DirectCast(e.Item.FindControl("trabalhandoLabel"), Label)

            If myLabelT.Text Then
                myLabelT.Text = "Sim"
            Else
                myLabelT.Text = "Não"
            End If

            If myLabel.Text Then
                myLabel.Text = "Sim - Veja detalhes no CV do candidato"
            Else
                myLabel.Text = "Não"
            End If

        End If

    End Sub
End Class
