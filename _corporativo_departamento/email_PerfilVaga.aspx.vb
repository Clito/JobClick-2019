Imports user
Imports criptografia
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ
Imports email
Imports BodyEmail
Imports ReplaceForm


Partial Class _anonimo_aprPerfilVaga
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelANUNCIO.Visible = False
    End Sub

    Protected Sub DataListHISTORICO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DataListHISTORICO.SelectedIndexChanged
        idVagaLabel.Text = DataListHISTORICO.SelectedValue
        PanelANUNCIO.Visible = True
    End Sub

    Protected Sub SqlDataSourceHISTORICO_FORM_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlOUTLOOK_FORM.Updating


        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim myLink As String = URL & "/_anonimo/default.aspx?jobclickCryp=" & criptografia.Criptografar(Session("SETLayout"), "#!$a36?@") & "&jobclickCrypID=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&jobclickProtocolo=" & criptografia.Criptografar(ProtocoloLabel.Text, "#!$a36?@")

        REM ** O HISTÓRICO SERÁ GRAVADO NO NOME DO ANALISA OU CONSULTOR?
        Dim Authentic As String = HttpContext.Current.User.Identity.Name

        Dim emailConsultorAnalista As String = ""
        Dim nomeConsultorAnalista As String = ""

        Select Case Authentic
            Case "Consultor"
                nomeConsultorAnalista = Session("nomeConsultor")
                emailConsultorAnalista = Session("emailConsultor")
            Case "Corporativo"
                nomeConsultorAnalista = Session("nomeRes")
                emailConsultorAnalista = Session("emailUser")
            Case Else
                nomeConsultorAnalista = Session("nomeConsultor")
                emailConsultorAnalista = Session("emailConsultor")
        End Select

        e.Command.Parameters("@idVagaAnuncio_PREVIEW_Historico").Value = idVagaAnuncio_PREVIEW_HistoricoLabel.Text
        e.Command.Parameters("@enviaEmail").Value = 1
        e.Command.Parameters("@mensagemHistorico").Value = CType(FormViewMENSAGEM.FindControl("TextBoxMensagem"), TextBox).Text
        e.Command.Parameters("@parecerAnalista_Consultor").Value = CType(FormViewMENSAGEM.FindControl("parecerAnalista_ConsultorMTextBox"), TextBox).Text
        e.Command.Parameters("@Protocolo").Value = DBNull.Value
        e.Command.Parameters("@nomeANALISTA_CONSULTOR").Value = nomeConsultorAnalista 'Session("nomeRes")
        e.Command.Parameters("@emailANALISTA_CONSULTOR").Value = emailConsultorAnalista 'Session("emailUser")
        e.Command.Parameters("@SMS").Value = CType(FormViewMENSAGEM.FindControl("RadioButtonListSMS"), RadioButtonList).SelectedValue
        e.Command.Parameters("@nomeGESTOR").Value = CType(FormViewMENSAGEM.FindControl("nomeGESTORLabel"), Label).Text
        e.Command.Parameters("@emailGESTOR").Value = CType(FormViewMENSAGEM.FindControl("emailGESTORLabel"), Label).Text
        e.Command.Parameters("@URL").Value = myLink
        e.Command.Parameters("@dataCriacao").Value = Now()

        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Sua mensagem foi enviada com sucesso.<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

    End Sub

    Protected Sub GetID(source As Object, e As DataListCommandEventArgs) Handles DataListHISTORICO.ItemCommand
        idVagaAnuncio_PREVIEW_HistoricoLabel.Text = e.CommandArgument
    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As EventArgs)
        PanelANUNCIO.Visible = False
    End Sub
End Class
