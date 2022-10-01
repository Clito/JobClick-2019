Imports Microsoft.VisualBasic
Imports System.Web.Security

Partial Class varflash_varbannerEmp
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim NroUsuarios As String = Application("Hits").ToString
        Dim SInome As String = ""
        Dim SData As String = ""
        Dim SNomeEmpresa As String = ""
        Dim StatusLog As String = ""

        If HttpContext.Current.User.Identity.Name.ToString <> "RHUser" Then
            StatusLog = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado] para publicar vagas na WEB.</b></font>"
        Else
            StatusLog = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso está [liberado].</b></font>"
        End If

        If Session("nome") <> "" Then
            If Session("nomeGestor") <> "" Then
                SInome = Session("nome") & " | <b>Consultor:</b> " & Session("nomeGestor")
            Else
                SInome = Session("nome")
            End If
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

        varFlashBannerEmp.Text = "&username=<b>Usuário master: </b>" + SInome + "&ip=" + "<b>IP:</b> " + Session("ip") + "&Ticket=" + "<b>Ticket:</b> " + Session("ticket") + "&msn=Dúvidas e sugestões sobre o site, use o FAQ para pesquisar dúvidas já feitas aos nossos operadores. Caso ainda sua não tenha sido feita então envie-nos que a responderemos.&nrouser=" + "<b>Usuários online:</b> " + NroUsuarios + "&dsempresa=" & SNomeEmpresa & "&acesso=" & SData & "&status=" & StatusLog & "&"

    End Sub
End Class
