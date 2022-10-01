Imports EmailSQL

Partial Class enviaEmail
    Inherits System.Web.UI.Page


    Protected Sub ButtonEnviar_Click(sender As Object, e As System.EventArgs) Handles ButtonEnviar.Click
        Dim status As Boolean = False
        Dim myEnviar As New EmailSQL
        status = myEnviar.EnviamensagemSQL(MsgTextBox.Text, emailTextBox.Text, emailTextBox.Text, "Atenção")

        If status Then
            StatusLabel.Text = "Mensagem enviada"
        Else
            StatusLabel.Text = "erro" & Err.Description
        End If

    End Sub
End Class
