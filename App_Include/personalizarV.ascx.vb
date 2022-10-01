
Partial Class App_Include_personalizarV
    Inherits System.Web.UI.UserControl

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        lblidPersonalizada.Text = GridView2.SelectedValue.ToString
    End Sub

    Protected Sub SqlPersonalizadoForm_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlPersonalizadoForm.Deleted
        GridView2.DataBind()
    End Sub

    Protected Sub SqlPersonalizadoForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlPersonalizadoForm.Inserted
        GridView2.DataBind()
    End Sub

    Protected Sub SqlPersonalizadoForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlPersonalizadoForm.Updated
        GridView2.DataBind()
    End Sub

    Protected Sub SqlPersonalizadoForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlPersonalizadoForm.Inserting
        e.Command.Parameters("@conteudo").Value = Replace(CType(FormView2.FindControl("conteudoTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@idVaga").Value = lblIdVagaP.Text
    End Sub

    Protected Sub NewButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        lblidPersonalizada.Text = ""
    End Sub

    Protected Sub conteudoTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView2.FindControl("conteudoTextBox"), TextBox).Text = Replace(CType(FormView2.FindControl("conteudoTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub SqlPersonalizadoForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlPersonalizadoForm.Updating
        e.Command.Parameters("@conteudo").Value = Replace(CType(FormView2.FindControl("conteudoTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub


    Public Property personalizarV() As String

        Get
            Return lblIdVagaP.Text
        End Get

        Set(ByVal value As String)
            lblIdVagaP.Text = value
        End Set

    End Property

End Class
