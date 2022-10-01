Imports contratoAtivo

Partial Class _parceiroJobClick_tabela
    Inherits System.Web.UI.Page

    Dim myContrato As New contratoAtivo
    Dim myContratoAtivo As String = ""

    Protected Sub ImageButtonP2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonP2.Click
        myContratoAtivo = myContrato.GetContrato(Session("idCadastroEmpresa"))
        If myContratoAtivo = "SEM CONTRATO" Then
            Response.Redirect("contratoOnline.aspx?plano=PAINEL DE VAGAS&valor=55")
        Else
            REM ** MOSTRA PAINEL
            AVISOLABEL.Text = "Sua empresa já possui ou solicitou um contrato<br><b>" & myContratoAtivo & "</b><br>Para mudar de plano entre em contato, <a href='ajuda.aspx' title='Alteração de plano'>Clique aqui</a>"
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End If
    End Sub

    Protected Sub ImageButtonP3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonP3.Click
        myContratoAtivo = myContrato.GetContrato(Session("idCadastroEmpresa"))
        If myContratoAtivo = "SEM CONTRATO" Then
            Response.Redirect("contratoOnline.aspx?plano=TRABALHE CONOSCO&valor=150")
        Else
            REM ** MOSTRA PAINEL
            AVISOLABEL.Text = "Sua empresa já possui ou solicitou um contrato<br><b>" & myContratoAtivo & "</b><br>Para mudar de plano entre em contato, <a href='ajuda.aspx' title='Alteração de plano'>Clique aqui</a>"
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End If
    End Sub
End Class
