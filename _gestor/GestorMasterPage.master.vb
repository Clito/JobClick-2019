
Partial Class _empresa_EmpresaPage
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

    End Sub

End Class

