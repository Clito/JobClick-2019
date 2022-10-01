
Partial Class _empresaJC__layout_layout_Page001
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim idUser As String = Session("idUser")

        If idUser = "" Then

            Session.Abandon()
            Session.Clear()
            FormsAuthentication.SignOut()

            Dim aCookie As HttpCookie = New HttpCookie("userInfo")
            Dim i As Integer

            Dim limit As Integer = Request.Cookies.Count - 1
            For i = 0 To limit
                aCookie = Request.Cookies(i)
                aCookie.Expires = DateTime.Now.AddDays(-1)
                Response.Cookies.Add(aCookie)
            Next

            Response.Redirect("../")

        End If

        If Request.QueryString("menu") <> "" Then
            Select Case Request.QueryString("menu")
                Case "1" ' --> MENU PRINCIPAL
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "active")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    ACESSO_LI.Attributes.Add("Class", "")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "")
                    CANDIDATURA_LI.Attributes.Add("Class", "")
                    'LOJA_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "2" ' --> DADOS DA EMPRESA
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "active")
                    ACESSO_LI.Attributes.Add("Class", "")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "")
                    CANDIDATURA_LI.Attributes.Add("Class", "")
                    'LOJA_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "3"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    ACESSO_LI.Attributes.Add("Class", "active")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "")
                    CANDIDATURA_LI.Attributes.Add("Class", "")
                    'LOJA_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "4"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    ACESSO_LI.Attributes.Add("Class", "")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "active")
                    CANDIDATURA_LI.Attributes.Add("Class", "")
                    'LOJA_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "5"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    ACESSO_LI.Attributes.Add("Class", "")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "")
                    CANDIDATURA_LI.Attributes.Add("Class", "active")
                    'LOJA_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "6"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    ACESSO_LI.Attributes.Add("Class", "")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "")
                    CANDIDATURA_LI.Attributes.Add("Class", "")
                    'LOJA_LI.Attributes.Add("Class", "active")
                    LOGOUT_LI.Attributes.Add("Class", "")
                Case "7"
                    MENUPRINCIPAL_LI.Attributes.Add("Class", "")
                    DADOSEMPRESA_LI.Attributes.Add("Class", "")
                    ACESSO_LI.Attributes.Add("Class", "")
                    ABERTURAVAGA_LI.Attributes.Add("Class", "")
                    CANDIDATURA_LI.Attributes.Add("Class", "")
                    'LOJA_LI.Attributes.Add("Class", "")
                    LOGOUT_LI.Attributes.Add("Class", "active")
            End Select
        End If
    End Sub

End Class

