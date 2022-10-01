Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresa_EmpresaPage
    Inherits System.Web.UI.MasterPage

    Dim ContTime As DateTime

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("idCadastroEmpresa_Layout") = Nothing Then
            Session("idCadastroEmpresa_Layout") = 1
            Session("CustomCSS") = "/* Padrão */"
        Else
            Dim rs As SqlDataReader = Nothing
            Dim SQLquery As String
            Dim conn As SqlConnection

            conn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim SQLCommand As SqlCommand

            SQLquery = "SELECT ISNULL(customcss, '/* Sem CSS Custom */') as CustomCSS FROM tbSetup WHERE (idcadastroempresa = '" & Session("idCadastroEmpresa_Layout") & "')"

            conn.Open()

            SQLCommand = New SqlCommand(SQLquery, conn)
            rs = SQLCommand.ExecuteReader()

            Try

                If rs.HasRows() Then
                    rs.Read()
                    Session("CustomCSS") = rs("CustomCSS")
                Else
                    Session("CustomCSS") = ""
                End If

            Catch ex As Exception
            End Try

            rs.Close()
            conn.Close()
        End If

        Dim idUser As String = Session("idUser")

        If idUser = "" Then

            Session.Abandon()
            Session.Clear()
            FormsAuthentication.SignOut()

            Dim aCookie As HttpCookie = New HttpCookie("userInfo")
            Dim i As Integer

            Dim limit As Integer = Request.Cookies.Count - 1
            For i = 0 To limit
                aCookie = Request.Cookies(i)
                aCookie.Expires = DateTime.Now.AddDays(-1)
                Response.Cookies.Add(aCookie)
            Next

            Response.Redirect("../")

        End If



    End Sub

End Class

