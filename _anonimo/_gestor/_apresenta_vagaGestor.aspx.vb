
Partial Class _anonimo_vagaGestor
    Inherits System.Web.UI.Page
    Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim SETLayout As String = Session("SETLayout_anonimo")

        If SETLayout <> "" Then
            MasterPageFile = "~/_anonimo/modulo_" & SETLayout & "/master/MasterPageGESTOR.master"
        Else
            MasterPageFile = "~/_anonimo/modulo_jobclick/master/MasterPageGESTOR.master"
        End If

    End Sub
End Class
