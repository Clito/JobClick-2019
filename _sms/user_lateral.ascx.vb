Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable
Imports System.IO

Partial Class _modulo_lateral
    Inherits System.Web.UI.UserControl


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblLateral.Text = Session("NavLateral")
    End Sub

End Class
