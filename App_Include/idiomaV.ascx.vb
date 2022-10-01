
Partial Class App_Include_idiomaV
    Inherits System.Web.UI.UserControl

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        lblidIdioma.Text = GridView1.SelectedValue.ToString
    End Sub

    Protected Sub SqlDataSource2_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Deleted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource2_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Updated
        GridView1.DataBind()
        lblidIdioma.Text = ""
    End Sub

    Protected Sub SqlDataSource2_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Inserted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource2_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Inserting
        e.Command.Parameters("@dscomentario").Value = Replace(CType(FormView1.FindControl("dscomentarioTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@idVaga").Value = lblIdVaga.Text
    End Sub

    Protected Sub SqlDataSource2_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Updating
        e.Command.Parameters("@dscomentario").Value = Replace(CType(FormView1.FindControl("dscomentarioTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dscomentarioTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dscomentarioTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dscomentarioTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        lblidIdioma.Text = ""
    End Sub


    Public Property IdiomaV() As String

        Get
            Return lblIdVaga.Text
        End Get

        Set(ByVal value As String)
            lblIdVaga.Text = value
        End Set

    End Property

End Class
