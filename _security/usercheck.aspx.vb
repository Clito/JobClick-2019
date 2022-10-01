Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports user

Partial Class _security_usercheck
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim key As String = ""

        TBSenha.Focus()

        If Request.QueryString("id") <> "" Then
            If Session("ip") <> Request.QueryString("ip") Then
                Response.Redirect("/")
            Else
                lblidUser.Text = Request.QueryString("id")
                Session("urlEmpresa") = Request.QueryString("url") & "/logout.aspx"
                lblkey.Text = Request.QueryString("key")
            End If
        Else
            Response.Redirect("/")
        End If
    End Sub


    Protected Sub IBConfirmeSenha_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBConfirmeSenha.Click

        Dim p As New user

        Dim txtgrupo As String
        Dim idUser As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim resposta As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo FROM vwuser WHERE (idUser = '" + lblidUser.Text + "') AND (password = '" + TBSenha.Text + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = True
                FormsAuthentication.SetAuthCookie(txtgrupo, True)

                Session("idUser") = lblidUser.Text
                Session("idCadastroUser") = p.idCadastroUser(Session("idUser"))
                Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                Session("dataultimoacess") = p.Contador(Session("idUser"))
                Session("emailUser") = dr("email")

                msn.Text = "Usuário autenticado!"


            Else

                msn.Text = "Acesso negado! ... Aguarde ..."

                REM ** PODE SER CONSULTOR ...

                resposta = CheckConsultor(lblidUser.Text, TBSenha.Text, lblkey.Text)

                If Not resposta Then
                    msn.Text = "Acesso negado!"
                End If

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        If resposta Then
            Response.Redirect("/_empresa/Default.aspx")
        End If

    End Sub

    Function CheckConsultor(ByVal idRH_Gestor As String, ByVal sPwd As String, ByVal key As String) As Boolean

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection
        Dim resposta As Boolean = False

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT tbuser.idUser, tbRH_Gestor.idRH_Gestor, tbRH_Gestor.idCadastroEmpresa, tbRH_Gestor.idRH, tbRH_Gestor.nome, tbRH_Gestor.password, tbRH_Gestor.email, tbRH_Gestor.bloquear, tbRH_Gestor.data, tbuser.idTypeUser FROM tbRH_Gestor INNER JOIN tbCadastroEmpresa ON tbRH_Gestor.idCadastroEmpresa = tbCadastroEmpresa.idCadastroEmpresa INNER JOIN tbuser ON tbCadastroEmpresa.idUser = tbuser.idUser WHERE (tbRH_Gestor.idRH_Gestor = '" + idRH_Gestor + "') AND (tbRH_Gestor.password = '" + sPwd + "') AND (tbCadastroEmpresa.idCadastroEmpresa = '" + key + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                resposta = True
                FormsAuthentication.SetAuthCookie(dr("idTypeUser"), True)

                Session("idRH_Gestor") = dr("idRH_Gestor").ToString
                Session("nomeGestor") = dr("nome").ToString

                Session("idUser") = dr("idUser").ToString
                Session("idCadastroEmpresa") = dr("idCadastroEmpresa").ToString
                Session("dataultimoacess") = dr("data").ToString
                Session("emailUser") = dr("email").ToString

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Return resposta

    End Function

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect(Session("urlEmpresa"))
    End Sub

    Protected Sub IBConfirmeSenha_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBSenha.TextChanged
        Dim p As New user

        Dim txtgrupo As String
        Dim idUser As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim resposta As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo FROM vwuser WHERE (idUser = '" + lblidUser.Text + "') AND (password = '" + TBSenha.Text + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = True
                FormsAuthentication.SetAuthCookie(txtgrupo, True)

                Session("idUser") = lblidUser.Text
                Session("idCadastroUser") = p.idCadastroUser(Session("idUser"))
                Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                Session("dataultimoacess") = p.Contador(Session("idUser"))
                Session("emailUser") = dr("email")

                msn.Text = "Usuário autenticado!"


            Else

                msn.Text = "Acesso negado! ... Aguarde ..."

                REM ** PODE SER CONSULTOR ...

                resposta = CheckConsultor(lblidUser.Text, TBSenha.Text, lblkey.Text)

                If Not resposta Then
                    msn.Text = "Acesso negado!"
                End If

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        If resposta Then
            Response.Redirect("/_empresa/Default.aspx")
        End If
    End Sub
End Class
