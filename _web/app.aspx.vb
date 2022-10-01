Imports appWS
Partial Class _web_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim myProduto As New appWS
        GridView1.DataSource = myProduto.RetornaDataSet(TextBox1.Text).Tables(0)
        GridView1.DataBind()
    End Sub

End Class
