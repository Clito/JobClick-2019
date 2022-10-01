Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Security.Cryptography
Imports System.Text
Imports criptografia

Partial Class crypLoginJobClick
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        CaminhoFisicoLabel.Text = Request.PhysicalApplicationPath

        If Request.QueryString("status") <> "" Then
            Select Case Request.QueryString("status")
                Case "logout"
                    URL.Text = "Sessão encerrada pelo usuário."
                Case "error"
                    URL.Text = "Cartão não está cadastrado no sistema."
            End Select

        End If
    End Sub

    Protected Sub ButtonRecPWD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonRecPWD.Click
        Dim ACAO As Integer = RadioButtonList1.SelectedValue

        Select Case ACAO
            Case 0
                Response.Redirect("/_anonimo/aprPerfilVaga.aspx?CammaleonFilhaCryp=" & criptografia.Criptografar(CartaoTextBox.Text, "#!$a36?@") & "&CammaleonPerfilCryp=" & criptografia.Criptografar(URLTextBoxCartao.Text, "#!$a36?@") & "&CammaleonEmpresaCryp=" & criptografia.Criptografar(MergulhoTextBox.Text, "#!$a36?@") & "&CammaleonProtocoloCryp=" & criptografia.Criptografar(MergulhoTextBox.Text, "#!$a36?@"))
            Case 1
                URL.Text = "/login.aspx?CammaleonCartaoCryp=" & criptografia.Criptografar(CartaoTextBox.Text, "#!$a36?@") & "&CammaleonURLCryp=" & criptografia.Criptografar(URLTextBoxCartao.Text, "#!$a36?@") & "&CammaleonMergulhoCryp=" & criptografia.Criptografar(MergulhoTextBox.Text, "#!$a36?@")
                DescryLabel.Text = criptografia.Descriptografar(campoDes.Text, "#!$a36?@")
            Case 2
                URL.Text = "/login.aspx?CammaleonCartaoCryp=" & CartaoTextBox.Text & "&CammaleonURLCryp=" & URLTextBoxCartao.Text & "&CammaleonMergulhoCryp=" & MergulhoTextBox.Text
        End Select

        decryptoLabel.Text = criptografia.Descriptografar(TextBoxCrypt.Text, "#!$a36?@")

    End Sub

End Class
