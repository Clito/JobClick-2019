Imports email
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class loginRemotoGeral
    Inherits System.Web.UI.Page


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

    Protected Sub LinkButtonLembrete_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLembrete.Click
        LinkButtonLogin.Visible = False
        LinkButtonRecuperar.Visible = True
        Voltar.Visible = True
        LinkButtonLembrete.Visible = False
        tdDireito.Visible = False
        tdEsquerdo.Visible = False
        msn.Text = ""
    End Sub

    Protected Sub LinkButtonLogin_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLogin.Click

        msn.Text = ""

        Dim p As New userJobClick
        Dim ReturnUrl As String = Request.QueryString("ReturnUrl")

        Dim txtusernameRES As String = ""
        Dim txtpwdRES As String = TextBoxSenha.Text
        Dim txtemailRES As String = TextBoxEmail.Text

        If String.IsNullOrEmpty(txtpwdRES) Or String.IsNullOrEmpty(txtemailRES) Then

            msn.Text = "[!] Por favor verifique o seu nome de usuário e sua senha. [Todos os campos são obrigatórios]."

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
                Session("emailConsultor") = empresa.emailConsultor
                Session("nomeConsultor") = empresa.nomeConsultor
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
                CargaIdCurriculo(Session("idcurriculo"))

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
            msn.Text = "Foi enviado e-mail contendo todas as informações<br>necessárias para efetuar o login no portal."
        Else
            msn.CssClass = "msn"
            msn.Text = "Usuário não foi encontrado em nosso sistema."
        End If

    End Sub

    Protected Sub Voltar_Click(sender As Object, e As System.EventArgs) Handles Voltar.Click
        LinkButtonLogin.Visible = True
        LinkButtonRecuperar.Visible = False
        Voltar.Visible = False
        LinkButtonLembrete.Visible = True
        tdDireito.Visible = True
        tdEsquerdo.Visible = True
        msn.Text = ""
    End Sub
End Class
