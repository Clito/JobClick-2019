
Partial Class App_Include_userinfo
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim nome As String = ""

        If Session("nome") <> "" Then
            nome = Session("nome")
        Else
            nome = "An�nimo"
        End If

        userinfo.Text = "<b>Usu�rio:</b> " + nome
    End Sub

End Class
