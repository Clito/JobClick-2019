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
            StatusLog = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso est� [liberado] para publicar vagas na WEB.</b></font>"
        Else
            StatusLog = "<font color='#499300'><b>Bem-vindo ao sistema JobClick, seu acesso est� [liberado].</b></font>"
        End If

        If Session("nome") <> "" Then
            If Session("nomeGestor") <> "" Then
                SInome = Session("nome") & " | <b>Consultor:</b> " & Session("nomeGestor")
            Else
                SInome = Session("nome")
            End If
        Else
            SInome = "An�nimo"
        End If

        If Session("dataultimoacess") <> "" Then
            SData = "<b>�ltimo acesso: </b>" & Session("dataultimoacess")
        Else
            SData = "Primeiro acesso..."
        End If

        If Session("nmempresa") <> "" Then
            SNomeEmpresa = "<b>Empresa: </b>" & Session("nmempresa")
        Else
            SNomeEmpresa = "<b>Aten��o:</b> Informe os dados de sua empresa para iniciar os trabalhos..."
        End If

        varFlashBannerEmp.Text = "&username=<b>Usu�rio master: </b>" + SInome + "&ip=" + "<b>IP:</b> " + Session("ip") + "&Ticket=" + "<b>Ticket:</b> " + Session("ticket") + "&msn=D�vidas e sugest�es sobre o site, use o FAQ para pesquisar d�vidas j� feitas aos nossos operadores. Caso ainda sua n�o tenha sido feita ent�o envie-nos que a responderemos.&nrouser=" + "<b>Usu�rios online:</b> " + NroUsuarios + "&dsempresa=" & SNomeEmpresa & "&acesso=" & SData & "&status=" & StatusLog & "&"

    End Sub
End Class
