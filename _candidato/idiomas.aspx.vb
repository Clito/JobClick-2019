
Partial Class _candidato_idiomas
    Inherits System.Web.UI.Page

    Protected Sub GoBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("idiomas.aspx")
    End Sub

    Protected Sub upIdioma(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataListaIdiomaCANDIDATO.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu conhecimento do idioma foi salvo com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewIDIOMA.DataBind()
        DataListListIDIOMA.DataBind()
    End Sub

    Protected Sub DtIdioma(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataListaIdiomaCANDIDATO.Deleted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu conhecimento do idioma foi excluído com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewIDIOMA.DataBind()
        DataListListIDIOMA.DataBind()
    End Sub

    Protected Sub IcIdioma(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataListaIdiomaCANDIDATO.Inserted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu conhecimento do idioma foi salvo com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewIDIOMA.DataBind()
        DataListListIDIOMA.DataBind()
    End Sub

    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("idiomas.aspx")
    End Sub

    Protected Sub GridViewIDIOMA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewIDIOMA.SelectedIndexChanged
        ididiomaLabel.Text = GridViewIDIOMA.SelectedDataKey("ididiomaC")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        PanelProficiencia.Visible = False
        ididiomaLabel.Text = "0"
    End Sub

    Protected Sub LinkButtonProficiencia_Click(sender As Object, e As System.EventArgs)
        PanelProficiencia.Visible = True
    End Sub

    Protected Sub DataListListIDIOMA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListListIDIOMA.SelectedIndexChanged
        ididiomaLabel.Text = DataListListIDIOMA.SelectedValue
    End Sub

End Class
