Imports criptografia

Partial Class _anonimo_MasterPageGESTOR
    Inherits System.Web.UI.MasterPage

    Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Request.QueryString("menu") <> "" Then
            Select Case Request.QueryString("menu")
                Case "1" ' --> MENU PRINCIPAL
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "active")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    INDICACAO_LI.Attributes.Add("Class", "")
                    MENSAGEM_LI.Attributes.Add("Class", "")
                    COMPANHAMENTO_LI.Attributes.Add("Class", "")
                    'FINANCEIRO_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "2" ' --> DADOS DA EMPRESA
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "active")
                    INDICACAO_LI.Attributes.Add("Class", "")
                    MENSAGEM_LI.Attributes.Add("Class", "")
                    COMPANHAMENTO_LI.Attributes.Add("Class", "")
                    'FINANCEIRO_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "3"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    INDICACAO_LI.Attributes.Add("Class", "active")
                    MENSAGEM_LI.Attributes.Add("Class", "")
                    COMPANHAMENTO_LI.Attributes.Add("Class", "")
                    'FINANCEIRO_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "4"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    INDICACAO_LI.Attributes.Add("Class", "")
                    MENSAGEM_LI.Attributes.Add("Class", "active")
                    COMPANHAMENTO_LI.Attributes.Add("Class", "")
                    'FINANCEIRO_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "5"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    INDICACAO_LI.Attributes.Add("Class", "")
                    MENSAGEM_LI.Attributes.Add("Class", "")
                    COMPANHAMENTO_LI.Attributes.Add("Class", "active")
                    'FINANCEIRO_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "6"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    INDICACAO_LI.Attributes.Add("Class", "")
                    MENSAGEM_LI.Attributes.Add("Class", "")
                    COMPANHAMENTO_LI.Attributes.Add("Class", "")
                    'FINANCEIRO_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "active")
            End Select
        End If

    End Sub
End Class

