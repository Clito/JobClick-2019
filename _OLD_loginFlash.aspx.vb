Imports email
Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports System.DBNull

Partial Class loginFlash
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim p As New user
        Dim ReturnUrl As String = Request.QueryString("ReturnUrl")

        Dim txtusernameRES As String = Replace(Request.Form("var_login"), "'", "")
        Dim txtpwdRES As String = Replace(Request.Form("var_password"), "'", "")
        Dim txtemailRES As String = Replace(Request.Form("var_email"), "'", "")

        If String.IsNullOrEmpty(Request.Form("var_login")) Or String.IsNullOrEmpty(Request.Form("var_password")) Or String.IsNullOrEmpty(Request.Form("var_email")) Then

            Session("msnJob") = "[!] Por favor verifique o seu nome de usuário e sua senha. [Todos os campos são obrigatórios]."

        Else

            If p.validaUtilizador(txtusernameRES, txtpwdRES, txtemailRES) Then
                Session("idUser") = p.idUser(txtusernameRES, txtpwdRES, txtemailRES)
                Session("idCadastroUser") = p.idCadastroUser(Session("idUser"))
                Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                Session("dataultimoacess") = p.Contador(Session("idUser"))
                Session("emailUser") = txtemailRES
                Session("idcurriculo") = p.ZoyaIDCV(Session("idCadastroUser"))
                CargaIdCurriculo(Session("idcurriculo"))
                ReturnUrl = p.GetURL(Session("idUser"))

                Session("msnJob") = "Bem-vindo ao JobClick!"

                Response.Redirect(ReturnUrl)

            Else

                If UserTemp(txtemailRES) Then
                    Session("msnJob") = "<b>ATENÇÃO:</b><br>Sua conta ainda não está ativa, procure o e-mail enviado à você no momento da criação de sua conta."
                    Dim TipoErro As String = "Login falhou! User: " & txtusernameRES & "Pwd: " & txtpwdRES & "Email: " & txtemailRES & "<br><b>Conta não está ativa!</b>"
                    Dim myEmail As New email
                    myEmail.enviarAdmin(TipoErro, Application("nomeAdmin"), Application("emailAdmin"), Application("idsetup"))
                Else
                    Session("msnJob") = "Acesso negado, verifique o nome de usuário e senha.<br>[<a href='senha.aspx'>Clique aqui para recuperar sua senha...</a>]"
                    Dim TipoErro As String = "Login falhou! User: " & txtusernameRES & "Pwd: " & txtpwdRES & "Email: " & txtemailRES
                    Dim myEmail As New email
                    myEmail.enviarAdmin(TipoErro, Application("nomeAdmin"), Application("emailAdmin"), Application("idsetup"))
                End If


            End If

        End If

    End Sub


    Protected Sub CargaIdCurriculo(ByVal idcurriculo As String)

        Dim resposta As String = ""

        If idcurriculo <> "" Then

            Try

                Dim dr As SqlDataReader = Nothing
                Dim sSQL As String
                Dim Connection As SqlConnection

                Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                Dim command As SqlCommand

                sSQL = "SELECT dscurriculo FROM tbCurriculo WHERE (idcurriculo = " + idcurriculo + ")"



                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteReader()

                If dr.HasRows() Then
                    dr.Read()
                    resposta = dr("dscurriculo").ToString
                Else
                    resposta = ""
                End If

                dr.Close()
                Connection.Close()

                Session("dscurriculo") = "<b>Curriculo:</b> " + resposta

            Finally

            End Try

        End If

    End Sub

    Function UserTemp(ByVal email As String) As Boolean

        Dim status As Boolean = False
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spVerifyUserTemp", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@email").Value = email.ToString

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then
                status = True
            Else
                status = False
            End If

            dr.Close()

        Catch ex As Exception

        End Try


        cn.Close()

        Return status

    End Function


End Class
