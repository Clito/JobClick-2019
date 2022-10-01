Imports System.Xml
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports System.Data.SqlClient.SqlDataReader

Partial Class App_Include_MenuControl
    Inherits System.Web.UI.UserControl

    Dim UserNivel As String = HttpContext.Current.User.Identity.Name

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        XmlDataSourceGeral.DataFile = "~/xml/menu" & UserNivel & ".xml"
        Menu.DataBind()
    End Sub

End Class
