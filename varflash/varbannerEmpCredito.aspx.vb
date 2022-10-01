Imports Microsoft.VisualBasic
Imports System.Web.Security
Partial Class varflash_varbannerEmpCredito
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        DataListEmpresaFilha.DataBind()

        Dim NroUsuarios As String = Application("Hits").ToString
        Dim SInome As String = ""
        Dim SData As String = ""
        Dim SNomeEmpresa As String = ""
        Dim StatusLog As String = ""


        Select Case HttpContext.Current.User.Identity.Name.ToString
            Case "RHUser"
                StatusLog = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
            Case "Gestor"
                StatusLog = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
        End Select

        If Session("nome") <> "" Then
            SInome = Session("nome")
        Else
            SInome = "Anônimo"
        End If

        If Session("dataultimoacess") <> "" Then
            SData = "<b>Último acesso: </b>" & Session("dataultimoacess")
        Else
            SData = "Primeiro acesso..."
        End If

        If Session("nmempresa") <> "" Then
            SNomeEmpresa = "<b>Empresa: </b>" & Session("nmempresa")
        Else
            SNomeEmpresa = "<b>Atenção:</b> Informe os dados de sua empresa para iniciar os trabalhos..."
        End If

        varFlashBannerEmp.Text = "&username=<b>Usuário: </b>" + SInome + "&ip=" + "<b>IP:</b> " + Session("ip") + "&Ticket=" + "<b>Ticket:</b> " + Session("ticket") + "&msn=Dúvidas e sugestões sobre o site, use o FAQ para pesquisar dúvidas já feitas aos nossos operadores. Caso ainda sua não tenha sido feita então envie-nos que a responderemos.&nrouser=" + "<b>Usuários online:</b> " + NroUsuarios + "&dsempresa=" & SNomeEmpresa & "&acesso=" & SData & "&status=" & StatusLog & "&nomeEmpresa=" & Session("nomeEmpresaFilha") & "&"

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
