
Partial Class _user_Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RefDataNow.Text = "Referencial do mês " & Month(Now()) & "/" & Year(Now())
    End Sub

End Class
