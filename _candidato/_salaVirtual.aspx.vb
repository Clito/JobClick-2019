Imports gravaEntrevistaVirtual
Partial Class _candidato_salaVirtual
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        idCurriculoLabel.Text = Session("idcurriculo")
        Cabec.Text = "Sala " & Request.QueryString("sala")

        PanelCVCandidato.Visible = False

        If Application("nomeParticipante" & Request.QueryString("sala")) <> Session("nome") Then
            Application("nomeParticipante" & Request.QueryString("sala")) = Session("nome")
        End If

        Application(Request.QueryString("sala")) = Request.QueryString("sala")

        JaxterChatENTREVISTA.RoomName = Application(Request.QueryString("sala"))
        JaxterChatENTREVISTA.UserName = Application("nomeParticipante" & Request.QueryString("sala"))
        Session("idEntrevistaVirtual") = Request.QueryString("id")

    End Sub

    Protected Sub JaxterChatENTREVISTA_MessagePosted(o As Object, e As WebFurbish.JaxterMessageEventArgs) Handles JaxterChatENTREVISTA.MessagePosted
        Dim Gravador As New gravaEntrevistaVirtual
        Gravador.GravaEntrevista_CANDIDATO(e.RoomName, e.Message, e.UserName, e.MessageHTML)
    End Sub

    Protected Sub LinkButtonDadosPessoais_Click(sender As Object, e As System.EventArgs) Handles LinkButtonDadosPessoais.Click
        PanelCVCandidato.Visible = True
    End Sub

End Class
