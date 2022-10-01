
Partial Class _empresa_EmpresaPageDoc
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim DocName = Context.Items("Protocolo")
        Response.AppendHeader("Content-Type", "application/msword")
        Response.AppendHeader("Content-disposition", "attachment; filename=" & DocName & ".doc")
        Response.Charset = ""

    End Sub

End Class

