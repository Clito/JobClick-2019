Imports System.Web.HttpRuntime
Imports System.Web.HttpException
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class profissional_jobclick
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        index.Text = Request.QueryString("idindex")
        ApresentaLabel.Text = ""
        idProfileLabel.Text = ""
        LabelClassificados.Text = "<b>Zoya:<br>O Classificado dos profissionais Qualificados do JobClick</b><br>A sua direita estão as funções existentes para sua pesquisa, selecione uma delas para listar os profissionais relacionados."
        LabelPublicidade.Text = "<b>Marketing Pessoal</b> hoje, é a ferramenta mais eficiente de fazer com que seus pensamentos e atitudes, sua apresentação e comunicação, trabalhem a ser favor no ambiente profissional.<br><br>Além desses detalhes o cuidado com a ética e a capacidade de liderar, a habilidade de se auto-motivar e de motivar as pessoas a sua volta, também fazem parte do Marketing Pessoal.<br><br>As empresas de hoje analisam muito mais do que sua experiência profissional.<br>A preocupação com o capital intelectual e a ética, são fundamentais na definição do perfil daqueles que serão parceiros/colaboradores.<br><br><b>O Zoya</b> (Amigo em Russo) é uma ferramenta para publicar seus conhecimentos suas habilidades e pretenções para os Consultores de diversas empresas que utilizam nosso Portal no interesse em localizar um Talento como o seu!"
    End Sub

    Protected Sub DataList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList1.SelectedIndexChanged
        Response.Redirect("profissional_jobclick.aspx?idindex=" & DataList1.SelectedValue)
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        PanelPreview.Visible = False
        idFuncao.Text = GridView1.SelectedDataKey("idfuncao")
        dsfuncaoLabel.Text = GridView1.SelectedDataKey("dsfuncao")
        ApresentaLabel.Text = "Profissionais com experiência como"

    End Sub

    Protected Sub DataList2_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList2.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Dim myPanel As Panel = DirectCast(e.Item.FindControl("PanelProfile"), Panel)

            Dim myImageDetalhe As Image = DirectCast(e.Item.FindControl("ImageDetalhe"), Image)
            Dim ImageMembro As Image = DirectCast(e.Item.FindControl("ImageMembro"), Image)
            Dim ImageProfile As ImageButton = DirectCast(e.Item.FindControl("IBProfile"), ImageButton)
            Dim InfoRes As Label = DirectCast(e.Item.FindControl("dsfuncaoLabel"), Label)
            Dim resumoRes As Label = DirectCast(e.Item.FindControl("resumoLabel"), Label)
            Dim resumoPanelRes As Label = DirectCast(e.Item.FindControl("resumoLabelPainel"), Label)
            Dim mynomeLabel As Label = DirectCast(e.Item.FindControl("nomeLabel"), Label)
            Dim mynomeLabel0 As Label = DirectCast(e.Item.FindControl("nomeLabel0"), Label)
            Dim privacidade As Label = DirectCast(e.Item.FindControl("privacidade"), Label)

            If DirectCast(e.Item.DataItem, DataRowView).Item("privacidade") Then
                ImageMembro.ImageUrl = "/_candidato/foto/null.gif"
                myImageDetalhe.ImageUrl = "/_candidato/foto/null_privacidade.gif"
            Else
                If DirectCast(e.Item.DataItem, DataRowView).Item("foto") Is DBNull.Value Then
                    Select Case DirectCast(e.Item.DataItem, DataRowView).Item("sexo")
                        Case "Feminino"
                            ImageMembro.ImageUrl = "/images/candidato/padraoC_F.gif"
                            myImageDetalhe.ImageUrl = "/images/candidato/padraoC_F.gif"
                        Case "Masculino"
                            ImageMembro.ImageUrl = "/images/candidato/padraoC_M.gif"
                            myImageDetalhe.ImageUrl = "/images/candidato/padraoC_M.gif"
                        Case Else
                            ImageMembro.ImageUrl = "/images/candidato/padraoC_M.gif"
                            myImageDetalhe.ImageUrl = "/images/candidato/padraoC_M.gif"
                    End Select
                End If
            End If


                resumoPanelRes.Text = Left(UCase(DirectCast(e.Item.FindControl("resumoLabelPainel"), Label).Text), 1024) & "..."
                resumoRes.Text = UCase(DirectCast(e.Item.FindControl("resumoLabel"), Label).Text)
                InfoRes.Text = UCase(DirectCast(e.Item.FindControl("dsfuncaoLabel"), Label).Text)

                If DirectCast(e.Item.DataItem, DataRowView).Item("idZoya") Is DBNull.Value Then
                    ImageProfile.ImageUrl = "/_candidato/foto/no_profile.gif"
                    ImageProfile.Enabled = False
                    ImageProfile.ToolTip = "Este profissional não possui profile Zoya."
                Else
                    ImageProfile.ImageUrl = "/_candidato/foto/profile.gif"
                    ImageProfile.Enabled = True
                    ImageProfile.ToolTip = "Veja o profile Zoya deste profissional."
                End If

                If DirectCast(e.Item.DataItem, DataRowView).Item("privacidade") Then
                    mynomeLabel.Text = "Privacidade Solicitada"
                    mynomeLabel0.Text = "Privacidade Solicitada"
                End If

            End If
    End Sub

    Protected Sub DataList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList2.SelectedIndexChanged

        'GridView1.Visible = False
        ApresentaLabel.Text = "Profissionais com experiência como"
        idProfileLabel.Text = DataList2.SelectedValue

        Response.Redirect("/profile.aspx?idProfile=" & idProfileLabel.Text & "&idindex=" & Request.QueryString("idindex"))

    End Sub

End Class
