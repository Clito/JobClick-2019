
Partial Class _parceiroJobClick_ajuda
    Inherits System.Web.UI.Page

    Protected Sub FormViewContato_DataBound(sender As Object, e As EventArgs) Handles FormViewContato.DataBound
        CType(FormViewContato.FindControl("NomeEmpresaTextBox"), TextBox).Text = Session("nmempresa")
        CType(FormViewContato.FindControl("NomeContatoTextBox"), TextBox).Text = Session("nome")
        CType(FormViewContato.FindControl("EmailContatoTextBox"), TextBox).Text = Session("emailRes")
    End Sub

    Protected Sub SqlOrcamento_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlOrcamento.Inserted

        Dim myEmailProspect As New email
        Dim HTML_Usuario As String = ""
        HTML_Usuario = HTML_Usuario & "<p>Caro " & CType(FormViewContato.FindControl("NomeContatoTextBox"), TextBox).Text & ":<br></p>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p>Obrigado pelo contato com a JobClick.<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Neste momento foi enviado e-mail ao profissional que irá cuidar de sua mensagem.<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Assim que disponível enviaremos e-mail com a resposta a sua mensagem.<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "O profissional responsável em responder sua mensagem entrará em contato para qualquer dúvida que possa existir.<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p>Agradecemos pela atenção,<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Departamento Comercial JobClick<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<b>Obs.:</b><br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Caso não tenha feita esta solicitação, pedimos para avisar o ocorrido para que possamos tomar as providências cabíveis.<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "comercial@jobclick.com.br<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "</p>" & Chr(10)

        Dim HTML_Comercial As String = ""
        HTML_Comercial = HTML_Comercial & "Foi acionado o sistema de contato comercial no JobClick<br />" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<p><strong>Nome:</strong> " & CType(FormViewContato.FindControl("NomeContatoTextBox"), TextBox).Text & "<br>" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<strong>Nome da Empresa:</strong> " & CType(FormViewContato.FindControl("NomeEmpresaTextBox"), TextBox).Text & "<br>" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<strong>Cargo:</strong> " & CType(FormViewContato.FindControl("CargoContatoTextBox"), TextBox).Text & "<br>" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<strong>Email:</strong> " & CType(FormViewContato.FindControl("EmailContatoTextBox"), TextBox).Text & "<br>" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<strong>Telefone:</strong> (" & CType(FormViewContato.FindControl("TextBoxDDD"), TextBox).Text & ") " & CType(FormViewContato.FindControl("TelefoneContatoTextBox"), TextBox).Text & " Ramal:" & CType(FormViewContato.FindControl("TextBoxRAMAL"), TextBox).Text & " <br></p>" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<b>Mensagem:</b><br>" & CType(FormViewContato.FindControl("MensagemTextBox"), TextBox).Text & Chr(10)

        myEmailProspect.EnviamensagemSQL(HTML_Usuario, CType(FormViewContato.FindControl("NomeContatoTextBox"), TextBox).Text, CType(FormViewContato.FindControl("EmailContatoTextBox"), TextBox).Text, "Contato Comercial JobClick")
        myEmailProspect.EnviamensagemSQL(HTML_Comercial, "Contato comercial", "comercial@jobclick.com.br", "Solicitação de contato comercial JobClick.")

        PanelStatus.Visible = True
        msnLabel.Text = "Sua mensagem foi enviada com sucesso!"
        FormViewContato.Visible = False

    End Sub

    Protected Sub SqlOrcamento_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlOrcamento.Inserting
        e.Command.Parameters("@CNPJ").Value = "0"
        e.Command.Parameters("@VagasMes").Value = 1
        e.Command.Parameters("@TipoOrcamento").Value = CType(FormViewContato.FindControl("RadioButtonListMENSAGEM"), RadioButtonList).SelectedItem.Text & " Para: " & CType(FormViewContato.FindControl("RadioButtonListMENSAGEM"), RadioButtonList).SelectedItem.Value
        e.Command.Parameters("@TelefoneContato").Value = CType(FormViewContato.FindControl("TextBoxDDD"), TextBox).Text & " | " & CType(FormViewContato.FindControl("TelefoneContatoTextBox"), TextBox).Text & " Ramal: " & CType(FormViewContato.FindControl("TextBoxRAMAL"), TextBox).Text
        e.Command.Parameters("@Mensagem").Value = Left(CType(FormViewContato.FindControl("MensagemTextBox"), TextBox).Text, 1200)
    End Sub

End Class
