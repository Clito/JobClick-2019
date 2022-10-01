
Partial Class App_Include_bannerControlParceiro
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim liberaQtdCad As Int32 = 0

        If Session("dataultimoacess") <> "" Then
            SData.Text = "<b>Último acesso: </b>" & Session("dataultimoacess")
        Else
            SData.Text = "Primeiro acesso..."
        End If

        If Session("nome") <> "" Then
            SInome.Text = "<b>Usuário:</b> " & Session("nome")
        Else
            SInome.Text = "<b>Usuário:</b> Anônimo"
        End If

        If Session("nmempresa") <> "" Then
            EmpresaLabel.Text = "<b>Empresa: </b>" & Session("nmempresa")
        Else
            EmpresaLabel.Text = "<b>Atenção:</b> Informe os dados de sua empresa para iniciar os trabalhos..."
        End If

        Select Case HttpContext.Current.User.Identity.Name.ToString
            Case "RHUser"
                StatusLog.Text = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
            Case "Consultor"
                StatusLog.Text = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
            Case "Consultor Wizard"
                StatusLog.Text = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
            Case "Gestor"
                StatusLog.Text = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
        End Select

    End Sub

    Protected Sub DataListEmpresaFilha_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListEmpresaFilha.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim mynomeEmpresa As Label = CType(e.Item.FindControl("nmempresaLabel"), Label)
            Session("nomeEmpresaFilha") = "<b>Você está trabalhando com a empresa:</b> " & mynomeEmpresa.Text
        Else
            Session("nomeEmpresaFilha") = "Escolha uma empresa para trabalhar"
        End If
    End Sub

End Class
