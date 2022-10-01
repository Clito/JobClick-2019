
Partial Class App_Include_filtroFuncao
    Inherits System.Web.UI.UserControl

    Protected Sub TxtBoxC(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourcePsq.Selecting

        If TextBox1.Text <> "" Then
            Dim SearchTxt As String = Replace(TextBox1.Text, " ", "%")
            e.Command.Parameters("@buscador").Value = "%" & SearchTxt & "%"
        Else
            e.Command.Parameters("@buscador").Value = ""
        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        resTxt.Text = GridView1.SelectedValue
    End Sub

End Class
