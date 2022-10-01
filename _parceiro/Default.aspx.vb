Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports System.DBNull
Imports EmailSQL
Imports BodyEmail


Partial Class _parceiro_Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Session("idCadastroEmpresaFilha") = Session("idCadastroEmpresa")

    End Sub
End Class
