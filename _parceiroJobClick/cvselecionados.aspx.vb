Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_cvselecionados
    Inherits System.Web.UI.Page

    
    Protected Sub GridViewCVs_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewCVs.SelectedIndexChanged
        idcurriculoLabel.Text = GridViewCVs.SelectedDataKey("idcurriculo")
        nomeLabel.Text = GridViewCVs.SelectedDataKey("nome")
        emailLabel.Text = GridViewCVs.SelectedDataKey("email")
        nomeResLabel.Text = GridViewCVs.SelectedDataKey("nomeRes")
        emailResLabel.Text = GridViewCVs.SelectedDataKey("emailRes")
        PanelFormEmail.Visible = True
    End Sub

    Protected Sub LinkButtonEnviarMensagem_Click(sender As Object, e As EventArgs) Handles LinkButtonEnviarMensagem.Click
        REM ** * ENVIAR E-MAIL
        Dim myEmailEmpresa As New user
        Dim emailEmpresa As String = myEmailEmpresa.GetEMAIL(Session("idCadastroEmpresa"))

        Dim myEmailProspect As New email
        Dim HTML_Usuario As String = ""
        HTML_Usuario = HTML_Usuario & "<p>Para " & nomeLabel.Text & ":<br></p>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p>Uma empresa entrou em contato com você pelo portal JobClick.<br /><br /><b>Veja abaixo a mensagem enviada:</b><br><br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<i>" & inpHideTextArea.Value & "</i>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p><b>ATENÇÃO: </b>Utilize o seguinte e-mail para resposta:<br><b>" & emailResLabel.Text & "</b>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />Aos cuidados de: <b>" & nomeResLabel.Text & "</b></p>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p>Agradecemos pela atenção,<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Sistema JobClick<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<b>Obs.:</b><br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Caso não tenha feita esta solicitação, pedimos para avisar o ocorrido para que possamos tomar as providências cabíveis.<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "helpdesk@jobclick.com.br<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "</p>" & Chr(10)

        Dim HTML_Comercial As String = ""
        HTML_Comercial = HTML_Comercial & "Foi utilizado o sistema JobClick para contato com candidato.<br />" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<strong>Nome do responsável:</strong> " & nomeResLabel.Text & "<br>" & Chr(10)

        myEmailProspect.EnviamensagemSQL(HTML_Usuario, nomeLabel.Text, emailLabel.Text, "Contato com candidato via sistema JobClick")
        myEmailProspect.EnviamensagemSQL(HTML_Comercial, "Contato com o candidato", "helpdesk@jobclick.com.br", "Contato com candidato via sistema JobClick.")

        AVISOLABEL.Text = "Sua mensagem foi enviada com sucesso!"
        ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
        PanelAviso.Visible = True

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        PanelFormEmail.Visible = False
        PanelAviso.Visible = False
    End Sub

End Class
