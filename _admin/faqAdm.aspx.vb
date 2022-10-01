
Partial Class _admin_faqAdm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Label1.Text = Request.QueryString("idFAQ")
        Label2.Text = Request.QueryString("idFAQ")

        If Request.QueryString("idFAQr") <> "" Then
            GridView2.Visible = True
        Else
            GridView2.Visible = False
        End If
    End Sub

    Sub OnChangeFaq(ByVal source As Object, ByVal e As SqlDataSourceStatusEventArgs)

        If e.AffectedRows > 0 Then
            Response.Redirect("faqAdm.aspx?idFAQ=" + Label1.Text)
        End If

    End Sub

    Protected Sub mudaForm(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView2.DefaultMode = FormViewMode.ReadOnly
    End Sub

    Protected Sub mudaFormA(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.DefaultMode = FormViewMode.ReadOnly
    End Sub

End Class
