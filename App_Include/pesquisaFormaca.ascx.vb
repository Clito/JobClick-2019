
Partial Class App_Include_pesquisaFormaca
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub psqTB(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SQLpsqInst.Selecting

        If Len(psqTextBox.Text) >= 5 Then
            Dim SearchTxt As String = Replace(psqTextBox.Text, " ", "%")
            e.Command.Parameters("@buscador").Value = "%" & SearchTxt & "%"
        Else
            e.Command.Parameters("@buscador").Value = ""
        End If

    End Sub

    Protected Sub GetInfoPsq(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewPsq.SelectedIndexChanged
        resPsq.Text = GridViewPsq.SelectedValue.ToString
        msn.Text = "Entidade educacional selecionada [" & GridViewPsq.SelectedValue.ToString & "]"
    End Sub


    Public Property psqF() As String

        Get
            Return resPsq.Text
        End Get

        Set(ByVal value As String)

        End Set

    End Property

End Class
