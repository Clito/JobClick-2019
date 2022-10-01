Imports System.Web.HttpCookie
Imports System.Web.HttpCookieCollection

Partial Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Sub btnLogout_OnClick(ByVal Src As Object, ByVal E As EventArgs)

        If Session("urlEmpresa") <> "" Then
            FormsAuthentication.SignOut()
            Session.Abandon()
            Response.Redirect(Session("urlEmpresa"))
        End If

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

        Response.Redirect("/default.aspx")

    End Sub

End Class
