Imports email
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class _candidato_CandidatoPageJobClick
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        REM ** ************************************************************************************
        REM ** CANDIDATO PAGA (Session("candidatoPaga"))
        REM ** ************************************************************************************

        If Session("idCadastroEmpresa_Layout") = Nothing Then
            Session("idCadastroEmpresa_Layout") = 1
        Else
            Dim rs As SqlDataReader = Nothing
            Dim SQLquery As String
            Dim conn As SqlConnection

            conn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim SQLCommand As SqlCommand

            SQLquery = "SELECT ISNULL(candidatoPaga,0) as candidatoPaga FROM tbSetup WHERE (idcadastroempresa = '" & Session("idCadastroEmpresa_Layout") & "')"

            conn.Open()

            SQLCommand = New SqlCommand(SQLquery, conn)
            rs = SQLCommand.ExecuteReader()

            Try

                If rs.HasRows() Then
                    rs.Read()
                    Session("candidatoPaga") = rs("candidatoPaga")
                Else
                    Session("candidatoPaga") = 0
                End If

            Catch ex As Exception
            End Try

            rs.Close()
            conn.Close()

        End If

        REM ** ************************************************************************************
        REM ** [FIM] - ASSOCIADOS
        REM ** ************************************************************************************
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

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

        Dim css As HtmlGenericControl
        css = New HtmlGenericControl
        css.TagName = "style"
        css.Attributes.Add("type", "text/css")
        css.InnerHtml = Session("CustomCSS")
        Page.Header.Controls.Add(css)

        LinkButtonLogin.Text = "Logout"
        LinkButtonLogin.PostBackUrl = "/logout.aspx"

        Dim idCadastroUser As String = ""
        idCadastroUser = Session("idCadastroUser")
        ImageLogout_User.ImageUrl = Session("foto")
        ImageLogout_UserThumb.ImageUrl = Session("foto")
        LabelLogout_UserName.Text = Session("nome")
        LabelLogout_UserCurriculo.Text = Replace(Session("dscurriculo"), "<b>Curriculo:</b>", "")

        If idCadastroUser = "" Then
            Response.Redirect("/expirado.aspx")
        End If

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ContadorWEB As Int32 = 0
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spVagasWEB", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa_Layout")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            ContadorWEB = dr("Contador")
            HyperLinkHome.Text = "Vagas: " & ContadorWEB
            dr.Close()
        Catch ex As Exception
        End Try
        cn.Close()

    End Sub


    Protected Sub LinkButtonLogin_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLogin.Click
        TextBoxEmail.Focus()
        PanelLogin.CssClass = "LoginPanel"
        msn.Text = ""
        PanelLogin.Visible = True
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelLogin.CssClass = "LoginPanel"
        PanelLogin.Visible = False
        ImageButtonEnviarSenha.Visible = False
        ImageButtonLoginLogica.Visible = False
        LinkButtonLogin.Visible = False
        LinkButtonRecuperar.Visible = False
        Voltar.Visible = False
        tdDireito.Visible = True
        tdEsquerdo.Visible = True
        msn.Text = ""
    End Sub

    Protected Sub ImageButtonLoginLogica_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonLoginLogica.Click

        msn.CssClass = "msn"
        msn.Text = ""

        Dim p As New userJobClick
        Dim ReturnUrl As String = Request.QueryString("ReturnUrl")

        Dim txtusernameRES As String = ""
        Dim txtpwdRES As String = TextBoxSenha.Text
        Dim txtemailRES As String = TextBoxEmail.Text

        If String.IsNullOrEmpty(txtpwdRES) Or String.IsNullOrEmpty(txtemailRES) Then

            msn.Text = "[!] Por favor verifique o seu e-mail e sua senha. [Todos os campos são obrigatórios]."

        Else

            Dim candidato As userCandidato = New userCandidato
            candidato = userCandidatoService.GetDadoCandidato(TextBoxSenha.Text, TextBoxEmail.Text)

            If candidato.isCandidato = 0 Then

                Dim empresa As userEmpresa = New userEmpresa
                empresa = userEmpresaService.GetDadoEmpresa(TextBoxSenha.Text, TextBoxEmail.Text)

                Session("idUser") = empresa.idUser
                Session("idCadastroUser") = empresa.idCadastroUser
                Session("idCadastroEmpresa") = empresa.idCadastroEmpresa
                Session("dataultimoacess") = empresa.dataultimoacess
                Session("emailUser") = empresa.emailRes
                Session("email") = empresa.emailRes
                Session("ddd") = empresa.ddd
                Session("telefoneGestor") = empresa.telefoneGestor
                Session("nome") = empresa.nome
                Session("nomeRes") = empresa.nomeRes
                Session("idCadastroUser") = empresa.idCadastroUser
                Session("idRH_Gestor") = empresa.idRH_Gestor
                Session("idTypeUser") = empresa.idTypeUser
                Session("nmempresa") = empresa.nmempresa
                Session("idSetup") = empresa.idSetup
                Session("liberaQtdCad") = empresa.liberaQtdCad
                Session("idClient") = empresa.idClient_SMS
                Session("idProject") = empresa.idProject_SMS
                Session("userName_SMS") = empresa.userName_SMS
                Session("PWD_SMS") = empresa.PWD_SMS

                Session("bairro") = empresa.bairro
                Session("cidade") = empresa.Cidade
                Session("endereco") = empresa.Endereco
                Session("CEP") = empresa.CEP
                Session("cidade") = empresa.Cidade
                Session("uf") = empresa.uf
                Session("url") = empresa.url

                URLLabel.Text = empresa.url

                Dim idUserRES As String = Session("idUser")

                REM ** ENTENDO QUE AQUI O CLIENTE FOI IDENTIFICADO PELO LOGIN
                REM ** ******************************************************
                If idUserRES <> "0" Then

                    If ReturnUrl <> "" Then
                        Response.Redirect(ReturnUrl)
                    Else
                        msn.Text = "Acesso negado, verifique seu e-mail e senha."
                    End If

                    If URLLabel.Text <> "" Then
                        Response.Redirect(URLLabel.Text)
                    End If

                Else
                    msn.Text = "Acesso negado, verifique seu e-mail e senha."
                End If

            Else

                If candidato.nome Is DBNull.Value Then
                    Session("nome") = "Não informado!"
                Else
                    Session("nome") = candidato.nome
                End If

                Session("idUser") = candidato.idUser
                Session("idCadastroUser") = candidato.idCadastroUser
                Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                Session("dataultimoacess") = candidato.dataultimoacess
                Session("emailUser") = candidato.emailRes
                Session("idcurriculo") = candidato.idCurriculo
                Session("foto") = candidato.foto
                Session("dscurriculo") = candidato.dscurriculo

                If URLLabel.Text <> "" Then
                    ReturnUrl = URLLabel.Text
                Else
                    ReturnUrl = candidato.url
                End If

                Dim idUserRES As String = Session("idUser")

                REM ** ENTENDO QUE AQUI O CLIENTE FOI IDENTIFICADO PELO LOGIN
                REM ** ******************************************************
                If idUserRES <> "0" Then

                    If ReturnUrl <> "" Then
                        Response.Redirect(ReturnUrl)
                    Else
                        msn.Text = "Acesso negado, verifique seu e-mail e senha."
                    End If

                Else
                    msn.Text = "Acesso negado, verifique seu e-mail e senha."
                End If

            End If

        End If

    End Sub

    Protected Sub ImageButtonEnviarSenha_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonEnviarSenha.Click

        msn.Text = ""
        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim RecuperaConta As New email
        Dim dbBody As String = ""

        REM ** ***************************************************************************************************
        Dim MODELO As String = "Geral"
        REM ** ***************************************************************************************************

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE(idmensagem = '" & MODELO & "') AND (idsetup = " & Application("idsetup") & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()
                dbBody = oReader("sbody")
            Else
                dbBody = ""
            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Dim URL As String = Replace(Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, ""), Request.Url.Query, "")

        If RecuperaConta.RecuperaSenhaHot(dbBody, TextBoxEmail.Text, URL, Request.UserHostAddress, Application("idsetup")) Then
            msn.CssClass = "msnOK"
            msn.Text = "Foi enviado e-mail contendo todas as informações necessárias para efetuar o login no sistema JobClick, caso houver alguma dúvida entre em contato com nosso administrador"
        Else
            msn.CssClass = "msn"
            msn.Text = "Usuário não foi encontrado em nosso sistema, informe o e-mail utilizado na criação de sua conta."
        End If

    End Sub

    Protected Sub LinkButtonLembrete_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLembrete.Click
        msn.Text = ""
        PanelLogin.CssClass = "LembretePanel"
        ImageButtonEnviarSenha.Visible = False
        ImageButtonLoginLogica.Visible = False
        LinkButtonDoLogin.Visible = False
        LinkButtonRecuperar.Visible = True
        Voltar.Visible = True
        tdDireito.Visible = False
        tdEsquerdo.Visible = False
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

    Protected Sub LinkButtonDoLogin_Click(sender As Object, e As System.EventArgs) Handles LinkButtonDoLogin.Click
        msn.CssClass = "msn"
        msn.Text = ""

        Dim p As New userJobClick
        Dim ReturnUrl As String = Request.QueryString("ReturnUrl")

        Dim txtusernameRES As String = ""
        Dim txtpwdRES As String = TextBoxSenha.Text
        Dim txtemailRES As String = TextBoxEmail.Text

        If String.IsNullOrEmpty(txtpwdRES) Or String.IsNullOrEmpty(txtemailRES) Then

            msn.Text = "[!] Por favor verifique o seu e-mail e sua senha. [Todos os campos são obrigatórios]."

        Else

            Dim candidato As userCandidato = New userCandidato
            candidato = userCandidatoService.GetDadoCandidato(TextBoxSenha.Text, TextBoxEmail.Text)

            If candidato.isCandidato = 0 Then

                Dim empresa As userEmpresa = New userEmpresa
                empresa = userEmpresaService.GetDadoEmpresa(TextBoxSenha.Text, TextBoxEmail.Text)

                Session("idUser") = empresa.idUser
                Session("idCadastroUser") = empresa.idCadastroUser
                Session("idCadastroEmpresa") = empresa.idCadastroEmpresa
                Session("dataultimoacess") = empresa.dataultimoacess
                Session("emailUser") = empresa.emailRes
                Session("email") = empresa.emailRes
                Session("ddd") = empresa.ddd
                Session("telefoneGestor") = empresa.telefoneGestor
                Session("nome") = empresa.nome
                Session("nomeRes") = empresa.nomeRes
                Session("idCadastroUser") = empresa.idCadastroUser
                Session("idRH_Gestor") = empresa.idRH_Gestor
                Session("idTypeUser") = empresa.idTypeUser
                Session("nmempresa") = empresa.nmempresa
                Session("idSetup") = empresa.idSetup
                Session("liberaQtdCad") = empresa.liberaQtdCad
                Session("idClient") = empresa.idClient_SMS
                Session("idProject") = empresa.idProject_SMS
                Session("userName_SMS") = empresa.userName_SMS
                Session("PWD_SMS") = empresa.PWD_SMS

                Session("bairro") = empresa.bairro
                Session("cidade") = empresa.Cidade
                Session("endereco") = empresa.Endereco
                Session("CEP") = empresa.CEP
                Session("cidade") = empresa.Cidade
                Session("uf") = empresa.uf
                Session("url") = empresa.url

                URLLabel.Text = empresa.url

                Dim idUserRES As String = Session("idUser")

                REM ** ENTENDO QUE AQUI O CLIENTE FOI IDENTIFICADO PELO LOGIN
                REM ** ******************************************************
                If idUserRES <> "0" Then

                    If ReturnUrl <> "" Then
                        Response.Redirect(ReturnUrl)
                    Else
                        msn.Text = "Acesso negado, verifique seu e-mail e senha."
                    End If

                    If URLLabel.Text <> "" Then
                        Response.Redirect(URLLabel.Text)
                    End If

                Else
                    msn.Text = "Acesso negado, verifique seu e-mail e senha."
                End If

            Else

                If candidato.nome Is DBNull.Value Then
                    Session("nome") = "Não informado!"
                Else
                    Session("nome") = candidato.nome
                End If

                Session("idUser") = candidato.idUser
                Session("idCadastroUser") = candidato.idCadastroUser
                Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                Session("dataultimoacess") = candidato.dataultimoacess
                Session("emailUser") = candidato.emailRes
                Session("idcurriculo") = candidato.idCurriculo
                Session("foto") = candidato.foto
                Session("dscurriculo") = candidato.dscurriculo

                If URLLabel.Text <> "" Then
                    ReturnUrl = URLLabel.Text
                Else
                    ReturnUrl = candidato.url
                End If

                Dim idUserRES As String = Session("idUser")

                REM ** ENTENDO QUE AQUI O CLIENTE FOI IDENTIFICADO PELO LOGIN
                REM ** ******************************************************
                If idUserRES <> "0" Then

                    If ReturnUrl <> "" Then
                        Response.Redirect(ReturnUrl)
                    Else
                        msn.Text = "Acesso negado, verifique seu e-mail e senha."
                    End If

                Else
                    msn.Text = "Acesso negado, verifique seu e-mail e senha."
                End If

            End If

        End If
    End Sub

    Protected Sub LinkButtonRecuperar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonRecuperar.Click
        msn.Text = ""
        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim RecuperaConta As New email
        Dim dbBody As String = ""

        REM ** ***************************************************************************************************
        Dim MODELO As String = "Geral"
        REM ** ***************************************************************************************************

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE(idmensagem = '" & MODELO & "') AND (idsetup = " & Application("idsetup") & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()
                dbBody = oReader("sbody")
            Else
                dbBody = ""
            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

        Dim URL As String = Replace(Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, ""), Request.Url.Query, "")

        If RecuperaConta.RecuperaSenhaHot(dbBody, TextBoxEmail.Text, URL, Request.UserHostAddress, Application("idsetup")) Then
            msn.CssClass = "msnOK"
            msn.Text = "Foi enviado e-mail contendo todas as informações necessárias para efetuar o login no sistema JobClick, caso houver alguma dúvida entre em contato com nosso administrador"
        Else
            msn.CssClass = "msn"
            msn.Text = "Usuário não foi encontrado em nosso sistema, informe o e-mail utilizado na criação de sua conta."
        End If
    End Sub

    Protected Sub Voltar_Click(sender As Object, e As System.EventArgs) Handles Voltar.Click
        PanelLogin.CssClass = "LoginPanel"
        LinkButtonDoLogin.Visible = True
        LinkButtonRecuperar.Visible = False
        Voltar.Visible = False
        LinkButtonLembrete.Visible = True
        tdDireito.Visible = True
        tdEsquerdo.Visible = True
        msn.Text = ""
    End Sub
End Class

