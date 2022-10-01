
Partial Class _candidato_cursos
    Inherits System.Web.UI.Page

    Protected Sub updCurso(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seus dados foram atualizados com sucesso!<br>"
        AVISOLABEL.CssClass = "msnOK"
        GridView1.DataBind()
    End Sub

    Protected Sub incCurso(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Inserted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seus dados foram salvos com sucesso!<br>"
        AVISOLABEL.CssClass = "msnOK"
        GridView1.DataBind()
    End Sub

    Protected Sub VaPara(ByVal sender As Object, ByVal e As System.EventArgs)
        idCursoExtraCurricularLabel.Text = ""
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        idCursoExtraCurricularLabel.Text = GridView1.SelectedDataKey("idCursoExtraCurricular")
    End Sub

    Protected Sub SqlDataSource2_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Deleted
        PanelAviso.Visible = True
        AVISOLABEL.Text = ("• Seus dados foram excluídos com sucesso!<br>")
        AVISOLABEL.CssClass = "msnOK"
        GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        idCursoExtraCurricularLabel.Text = ""
    End Sub
End Class
