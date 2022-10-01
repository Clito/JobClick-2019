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

Partial Class criptografarDados
    Inherits System.Web.UI.Page

    Protected Sub LinkButtonCriptografar_Click(sender As Object, e As EventArgs) Handles LinkButtonCriptografar.Click
        'criptografadoLabel.Text = criptografia.CripSenha(criptografarTextBox.Text)
        Dim paraCriptografar As String = Trim(criptografarTextBox.Text)
        Dim i As Int32 = 0
        Dim nCar As String = ""
        Dim cCar As String = ""

        Dim ChavePar = 256
        Dim ChaveImpar = 255

        If ChavePar < 1 Or ChavePar > 255 Then ChavePar = 25
        If ChaveImpar < 1 Or ChaveImpar > 255 Then ChaveImpar = 33

        cCar = ""

        For i = 1 To Len(paraCriptografar)
            If i / 2 = Int(i / 2) Then
                nCar = Asc(Mid(paraCriptografar, i, 1)) Xor ChavePar
            Else
                nCar = Asc(Mid(paraCriptografar, i, 1)) Xor ChaveImpar
            End If
            cCar = cCar + Chr(nCar)
        Next

        criptografadoLabel.Text = cCar

    End Sub

End Class
