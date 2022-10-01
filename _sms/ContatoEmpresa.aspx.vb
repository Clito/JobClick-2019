''' <summary>
''' Cadastro no próprio site (Form) - Storage Procedure:
''' Importação de arquivo de mailing - Storage Procedure:
''' </summary>
''' <remarks></remarks>
Partial Class _modulo_ContatoEmpresa
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("tituloBanner") = "Contatos da empresa"
    End Sub
End Class
