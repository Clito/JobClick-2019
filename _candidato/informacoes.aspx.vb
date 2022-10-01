
Partial Class _candidato_informacoes
    Inherits System.Web.UI.Page

    Protected Sub UpdDoc(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O documento foi atualizado com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewDOC.DataBind()
    End Sub

    Protected Sub IncDoc(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O documento foi salvo com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewDOC.DataBind()
    End Sub

    Protected Sub DelDoc(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O documento foi excluído com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewDOC.DataBind()
    End Sub

    Protected Sub goBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_candidato/informacoes.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub
End Class
