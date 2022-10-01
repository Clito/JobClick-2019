Imports ReplaceForm

Partial Class _admin_idioma
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Protected Sub GoBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("idioma.aspx")
    End Sub

    Protected Sub UpdIdioma(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Updated, SqlDataSource4.Updated
        Response.Redirect("idioma.aspx")
    End Sub

    Protected Sub IncIdioma(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Inserted, SqlDataSource4.Inserted
        Response.Redirect("idioma.aspx")
    End Sub

    Protected Sub DelIdioma(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Deleted, SqlDataSource4.Deleted
        Response.Redirect("idioma.aspx")
    End Sub

    Protected Sub UpdIdiomaING(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Updating
        e.Command.Parameters("@dsproficiencia").Value = myReplace.ReplaceIn(CType(FormViewIDIOMA.FindControl("TextBoxDS"), TextBox).Text)
    End Sub

    Protected Sub IncIdiomaING(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Inserting
        e.Command.Parameters("@dsproficiencia").Value = myReplace.ReplaceIn(CType(FormViewIDIOMA.FindControl("TextBoxDS"), TextBox).Text)
    End Sub

    Protected Sub FormViewIDIOMA_DataBound(sender As Object, e As System.EventArgs) Handles FormViewIDIOMA.DataBound
        Try
            CType(FormViewIDIOMA.FindControl("TextBoxDS"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewIDIOMA.FindControl("TextBoxDS"), TextBox).Text)
        Catch ex As Exception

        End Try
    End Sub
End Class
