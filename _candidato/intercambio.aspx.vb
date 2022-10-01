
Partial Class _candidato_situacao
    Inherits System.Web.UI.Page

    Protected Sub GoBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("intercambio.aspx")
    End Sub

    Protected Sub UpdInter(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource5.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O Intercâmbio foi atualizado com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewINTERCAMBIO.DataBind()
    End Sub

    Protected Sub IncInter(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource5.Inserted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O Intercâmbio foi incluído com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewINTERCAMBIO.DataBind()
    End Sub

    Protected Sub DelInter(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource5.Deleted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• O Intercâmbio foi excluído com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewINTERCAMBIO.DataBind()
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("/_candidato")
    End Sub

    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("intercambio.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub
End Class
