Imports email
Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie

Partial Class _zoya_Default
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogin.Click

        Dim p As New user
        Dim ReturnUrl As String = ""

        Dim txtusernameRES As String = Replace(txtusername.Text, "'", "")
        Dim txtpwdRES As String = Replace(txtpwd.Text, "'", "")
        Dim txtemailRES As String = Replace(txtemail.Text, "'", "")

        If String.IsNullOrEmpty(txtusername.Text) Or String.IsNullOrEmpty(txtpwd.Text) Or String.IsNullOrEmpty(txtemail.Text) Then

            lblError.Text = "[!] Por favor verifique o seu nome de usuário e sua senha. [Todos os campos são obrigatórios]."

        Else

            If p.validaUtilizador(txtusernameRES, txtpwdRES, txtemailRES) Then
                Session("idUser") = p.idUser(txtusernameRES, txtpwdRES, txtemailRES)
                SetUserData(Session("idUser"))

                Session("idCadastroUser") = p.idCadastroUser(Session("idUser"))
                Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                Session("dataultimoacess") = p.Contador(Session("idUser"))
                Session("emailUser") = txtemail.Text
                Session("idZoya") = p.ZoyaID(Session("idCadastroUser"))
                Session("idcurriculo") = p.ZoyaIDCV(Session("idCadastroUser"))

                If Session("idZoya") = "0" Then

                    If Session("idcurriculo") <> "" Then
                        CargaIdCurriculo(Session("idcurriculo"))
                        Response.Redirect("/_candidato/zoya.aspx")
                    Else
                        Response.Redirect("/_candidato")
                    End If

                Else

                    CargaIdCurriculo(Session("idcurriculo"))
                    Response.Redirect("/_zoya/zoya_profile.aspx?idZoyaC=" & Session("ticket") & Session("idCadastroUser") & "&idZoyaZ=" & Session("ticket") & Session("idZoya") & "&idUserZoya=" & Session("ticket") & Session("idUser") & "&idcurriculoZoya=" & Session("ticket") & Session("idcurriculo"))

                End If


            Else

                lblError.Text = "Acesso negado, verifique o nome de usuário e senha.<br>[<a href='/senha.aspx'>Clique aqui para recuperar sua senha...</a>]"
                    Dim TipoErro As String = "Login falhou! User: " & txtusernameRES & "Pwd: " & txtpwdRES & "Email: " & txtemailRES
                    Dim myEmail As New email
                    myEmail.enviarAdmin(TipoErro, Application("nomeAdmin"), Application("emailAdmin"), Application("idsetup"))

            End If

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtusername.Focus()
        Dim ReturnUrlto As String = "/_zoya"
        Dim p As New user

        Dim ReturnUrl As String = ReturnUrlto

        If p.statusUser() Then
            lblError.Text = "<b>Usuário autenticado</b>, acesso negado!<br>[Você não tem permissão de ver o conteúdo desta pasta, não tente acessar uma área restrita sem permissão.]"
        End If

    End Sub


    Protected Sub CargaIdCurriculo(ByVal idcurriculo)

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection
        Dim resposta As String = ""

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT dscurriculo FROM tbCurriculo WHERE (idcurriculo = " + idcurriculo + ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                dr.Read()
                resposta = dr("dscurriculo").ToString
            Else
                resposta = ""
            End If

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Session("dscurriculo") = "<b>Curriculo:</b> " + resposta

    End Sub

    Sub SetUserData(ByVal idUserRes)

        REM ** **********************************************************************
        REM ** ATUALIZA CONTADOR DE ACESSO E DATA DE ACESSO
        REM ** **********************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spGetUserName", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idUser").Value = idUserRes

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            If Not dr("nome") Is DBNull.Value Then
                Session("nome") = dr("nome")
            Else
                Session("nome") = "Anônimo"
            End If

            If Not dr("cadastroTipo") Is DBNull.Value Then
                Session("cadastroTipo") = dr("cadastroTipo")
            Else
                Session("cadastroTipo") = "Anônimo"
            End If

        End If

        dr.Close()
        cn.Close()

    End Sub

End Class
