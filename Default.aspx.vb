Imports System.Web.HttpRuntime
Imports System.Web.HttpException
Imports System.Web
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull



Partial Class Default2
    Inherits System.Web.UI.Page

    Sub Page_PreInit(ByVal sender As Object, ByVal e As EventArgs) _
    Handles Me.PreInit

        Dim p As New userJobClick

        If (UserLogado() = True) And (p.GetURL(Session("idUser")) = "/_candidato") Then
            Me.MasterPageFile = "~/_candidato/CandidatoPageJobClick.master"
        Else
            Me.MasterPageFile = "~/MasterPageJobClick.master"
        End If
    End Sub

    Public Function UserLogado() As String
        If Session("idUser") = 0 Then
            Return False
        Else
            Return True
        End If
    End Function

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPSQ.Click
        Response.Redirect("/_anonimo/sponsoredAD.aspx?pesquisa=" & TextBoxPsq.Text)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("PROMOCODE") = 0
    End Sub

    Protected Sub LinkButton_PSQ_Click(sender As Object, e As System.EventArgs) Handles LinkButton_PSQ.Click
        Response.Redirect("/_anonimo/sponsoredAD.aspx?pesquisa=" & TextBoxPsq.Text)
    End Sub
End Class
