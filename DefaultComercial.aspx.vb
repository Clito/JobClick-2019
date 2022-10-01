
Partial Class comercial_Default
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
End Class
