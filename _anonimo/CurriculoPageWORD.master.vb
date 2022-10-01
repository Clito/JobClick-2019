Partial Class _anonimo_CurriculoPageWORD
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim DocName = Request.QueryString("DocName")
        Response.AppendHeader("Content-Type", "application/msword")
        Response.AppendHeader("Content-disposition", "attachment; filename=" & DocName & ".doc")
        Response.Charset = ""

    End Sub

End Class
