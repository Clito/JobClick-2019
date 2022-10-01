Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _corporativo_setup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub

    Protected Sub SqlDataSourceADERENCIA_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourceADERENCIA.Updating
        e.Command.Parameters("@Protocolo").Value = TEXTOPESQUISALabel.Text
    End Sub

    Protected Sub SqlDataSourceADERENCIA_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceADERENCIA.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "Configurações salvas com sucesso!"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
        idPerfilVagaLabel.Text = ""
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As EventArgs)
        idPerfilVagaLabel.Text = TextBoxPesquisaPS.Text
        TEXTOPESQUISALabel.Text = ""
        TextBoxPesquisaPS.Text = ""
    End Sub

    Protected Sub LinkButtonENVIAR_Click(sender As Object, e As EventArgs) Handles LinkButtonENVIAR.Click

        Dim mySearchEnd As Int32

        mySearchEnd = InStr(1, TextBoxPesquisaPS.Text, "-", 1) + 1

        If TextBoxPesquisaPS.Text <> "" Then
            Dim COMPRIMENTOTEXTO As Int32 = Len(TextBoxPesquisaPS.Text)
            If COMPRIMENTOTEXTO >= 22 Then
                TEXTOPESQUISALabel.Text = Trim(Left(TextBoxPesquisaPS.Text, mySearchEnd))
            Else
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Informe o nome ou parte do nome do Processo Seletivo.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            End If
        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe o nome ou parte do nome do Processo Seletivo.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        End If
    End Sub

    Protected Sub LinkButtonLIMPAR_Click(sender As Object, e As EventArgs) Handles LinkButtonLIMPAR.Click
        TEXTOPESQUISALabel.Text = ""
        TextBoxPesquisaPS.Text = ""
    End Sub
End Class
