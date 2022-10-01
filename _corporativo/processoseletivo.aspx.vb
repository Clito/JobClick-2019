Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _corporativo_Default
    Inherits System.Web.UI.Page


    Protected Sub ImageButtonSelect_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        PanelListaCandidato.Visible = True
    End Sub

    Protected Sub DataListMensagem_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListMensagem.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If Not DirectCast(e.Item.DataItem, DataRowView).Item("Mensagem") Is DBNull.Value Then
                DataListProcessoSeletivo.Visible = False
            Else
                DataListProcessoSeletivo.Visible = True
            End If
        End If
    End Sub

    Protected Sub DataListProcessoSeletivo_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListProcessoSeletivo.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.FindControl("FechadoLabel"), Label).Text = "Aberto" Then
                DirectCast(e.Item.FindControl("FechadoLabel"), Label).CssClass = "textoProcessoSeletivoABERTO"
            Else
                DirectCast(e.Item.FindControl("FechadoLabel"), Label).CssClass = "textoProcessoSeletivoFECHADO"
            End If
        End If
    End Sub

    Protected Sub DataListProcessoSeletivo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListProcessoSeletivo.SelectedIndexChanged
        idProcessoSeletivoLabel.Text = DataListProcessoSeletivo.SelectedValue

        DataListResultado.DataBind()
        SqlDataSourceCandidato.DataBind()
        PanelListaCandidato.Visible = True
    End Sub

    Protected Sub LinkButtonCandidatura_Click(sender As Object, e As System.EventArgs)

        TipoPesquisaLabel.Text = "Expontanea"
        minAderenciaLabel.Text = "1"
        idRH_GestorLabel.Text = Session("idRH_Gestor")

        DataListResultado.DataBind()
        SqlDataSourceCandidato.DataBind()

    End Sub

    Protected Sub LinkButtonAnalisado_Click(sender As Object, e As System.EventArgs)
        TipoPesquisaLabel.Text = "Analisado"
        minAderenciaLabel.Text = "1"
        idRH_GestorLabel.Text = Session("idRH_Gestor")

        DataListResultado.DataBind()
        SqlDataSourceCandidato.DataBind()

    End Sub

    Protected Sub LinkButtonAprovado_Click(sender As Object, e As System.EventArgs)
        TipoPesquisaLabel.Text = "Aprovado"
        minAderenciaLabel.Text = "1"
        idRH_GestorLabel.Text = Session("idRH_Gestor")

        DataListResultado.DataBind()
        SqlDataSourceCandidato.DataBind()

    End Sub

    Protected Sub LinkButtonReprovado_Click(sender As Object, e As System.EventArgs)
        TipoPesquisaLabel.Text = "Reprovado"
        minAderenciaLabel.Text = "1"
        idRH_GestorLabel.Text = Session("idRH_Gestor")

        DataListResultado.DataBind()
        SqlDataSourceCandidato.DataBind()
    End Sub

    Protected Sub DataListResultado_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListResultado.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If Len(DirectCast(e.Item.FindControl("ResumoLabelCV"), Label).Text) > 255 Then
                DirectCast(e.Item.FindControl("ResumoLabelCV"), Label).Text = Left(DirectCast(e.Item.FindControl("ResumoLabelCV"), Label).Text, 250) & "  (...)"
            End If
        End If
    End Sub
End Class
