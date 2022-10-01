
Partial Class empresa
    Inherits System.Web.UI.Page

    Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs)
        If Session("SETLayout") <> "" Then
            MasterPageFile = "~/App_Modulo/modulo_" & Session("SETLayout") & "/master/User_Page.master"
        Else
            Response.Redirect("/default.aspx")
        End If
    End Sub

End Class
