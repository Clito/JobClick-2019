Imports userJobClick
Imports geraProtocolo
Imports myValidaCPF
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _anonimo_cadastroCandidato
    Inherits System.Web.UI.Page
    Const LENGTH_TEXT As Integer = 2000

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        REM ** ************************************************************************************************
        REM ** MONTA OS RADIOBUTTONs
        REM ** ************************************************************************************************
        Disponibilidade.SelectedValue = "Integral"
        tipo.SelectedValue = "Candidato"
        estadocivil.SelectedValue = "Casado"
        origem.SelectedValue = "Outros"

        Dim lengthFunction As String = "function isMaxLength(resumoTextBox) {"
        lengthFunction += " if(resumoTextBox) { "
        lengthFunction += "     return ( resumoTextBox.value.length <=" & LENGTH_TEXT & ");"
        lengthFunction += " }"
        lengthFunction += "}"

        Me.resumoTextBox.Attributes.Add("onkeypress", "return isMaxLength(this);")
        ClientScript.RegisterClientScriptBlock(Me.[GetType](), "txtLength", lengthFunction, True)


        If Request.QueryString("ip") <> "" And Request.QueryString("ticket") <> "" And Request.QueryString("user") <> "" Then

            If Len(Request.QueryString("ticket")) <> 24 Then
                Response.Redirect("/")
            End If

            REM ** VERIFICA SE USUÁRIO EXISTE NO SISTEMA
            REM ** *************************************************************************************************

            Dim oSQL As String = "SELECT idUser, userName, password, email, frase, bloquear, data, ip, ticket FROM tbuser_ WHERE (userName = '" & Request.QueryString("user") & "') AND (ticket = '" & Request.QueryString("ticket") & "') AND (ip = '" & Request.QueryString("ip") & "')"

            Dim oReader As SqlDataReader = Nothing
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim oCommand As SqlCommand

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then
                oReader.Read()
                idUserRESLabel.Text = oReader("idUser")
                UserNameLabel.Text = oReader("userName")
                pwdLabel.Text = oReader("password")
                emailLabel.Text = oReader("email")
                fraseLabel.Text = oReader("frase")
            Else
                Response.Redirect("/_candidato")
            End If

            oConnection.Close()

            sendEmail.Visible = False
            CadastroContaAcesso.Visible = False
            sendCadastro.Visible = True
            dadospessoais.Visible = True

        End If

    End Sub

    Function VerificaUser(ByVal pwd As String, ByVal email As String) As Boolean

        Dim status As Boolean = False
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spVerifyUser", cn)
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

        lblText.Text = status.ToString

        Return status

    End Function


    Function VerificaUserTemp(ByVal userName As String, ByVal email As String) As Boolean

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

        lblText.Text = status.ToString

        Return status

    End Function
	
    Protected Sub Cadastro_Click(sender As Object, e As System.EventArgs) Handles Cadastro.Click

        AVISOLABEL0.Text = ""
        Dim ERRO As Int32 = 0

        REM ** *****************************************************************************************************************
        REM ** VERIFICA SE OS CAMPOS PRINCIPAIS ESTÃO PREENCHIDOS
        REM ** *****************************************************************************************************************

        If emailTextBox.Text = "" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Seu e-mail é muito importante, com ele o RH entrará em contato com você.<br>"
            ERRO = 1
        End If

        If passwordTextBox.Text = "" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Sua senha é muito importante, sem ela você não terá acesso ao JobClick.<br>"
            ERRO = 1
        End If

        If fraseTextBox.Text = "" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Sua frase é muito importante, sem ela você não poderá receber sua dica caso esqueça a sua senha.<br>"
            ERRO = 1
        End If

        If fraseTextBox.Text = "" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Seu nome é obrigatório.<br>"
            ERRO = 1
        End If

        If TextBoxCPF.Text = "___.___.___-__" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Seu CPF é obrigatório.<br>"
            ERRO = 1
        End If

        If cepTextBox.Text = "_____-___" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Seu CEP é obrigatório.<br>"
            ERRO = 1
        End If

        If nrdependenteTextBox.Text = "" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Informe (0) caso não tenha dependentes.<br>"
            ERRO = 1
        End If

        If interesseTextBox1.Text = "" Then
            AVISOLABEL0.Text = AVISOLABEL0.Text & "• Informe o cargo de interesse ele será utilizado nas [pesquisas de profissionais] na base.<br>"
            ERRO = 1
        End If



        REM ** *****************************************************************************************************************
        REM ** VERIFICA SE OS CAMPOS PRINCIPAIS ESTÃO PREENCHIDOS
        REM ** *****************************************************************************************************************


        If ERRO = 1 Then
            PanelAviso.Visible = True
            AVISOLABEL0.CssClass = "msn"
        Else


            Dim Protocolo As New geraProtocolo
            Dim ProtocoloCadidato As String = Protocolo.getNrProtocoloCandidato(Session("idSetup"))

            pwdLabel.Text = passwordTextBox.Text
            emailLabel.Text = emailTextBox.Text
            fraseLabel.Text = fraseTextBox.Text
            UserNameLabel.Text = ProtocoloCadidato


            Dim p As New userJobClick
            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter

            Dim status As Boolean = False
            Dim statusTemp As Boolean = False

            status = VerificaUser(Trim(passwordTextBox.Text.ToString), Trim(emailTextBox.Text.ToString))
            ' ! NÃO UTILIZADO A PARTIR DO DIA (16/10/2011) statusTemp = VerificaUserTemp(Trim(passwordTextBox.Text.ToString), Trim(emailTextBox.Text.ToString))


            If status Then
                lblText.Text = "* Este e-mail já foi cadastrado, caso tenha esquecido a sua senha [<a href='../senha.aspx'>clique aqui</a>].<br><br>"
                MaintainScrollPositionOnPostBack = False
                AvisoPanel.Visible = True
                emailTextBox.Focus()
                AvisoLabel.Text = lblText.Text
            Else
                lblText.Text = ""

                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("spGravaCadastroCandidatoCE", cn)
                cmd.CommandType = CommandType.StoredProcedure


                prm = New SqlParameter("@idUserRESform", SqlDbType.VarChar, 16)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idUserRESform").Value = Trim(idUserRESLabel.Text.ToString)


                prm = New SqlParameter("@userName", SqlDbType.VarChar, 50)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@userName").Value = Trim(UserNameLabel.Text.ToString)

                prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@password").Value = Trim(pwdLabel.Text.ToString)

                prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@email").Value = Trim(emailLabel.Text.ToString)

                prm = New SqlParameter("@frase", SqlDbType.VarChar, 60)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@frase").Value = Trim(fraseLabel.Text.ToString)


                prm = New SqlParameter("@areaAtuacao", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@areaAtuacao").Value = DropDownListAreaAtuacaoC.SelectedItem.Text

                prm = New SqlParameter("@interesse01", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@interesse01").Value = interesseTextBox1.Text

                prm = New SqlParameter("@interesse02", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@interesse02").Value = interesseTextBox2.Text

                prm = New SqlParameter("@interesse03", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@interesse03").Value = interesseTextBox3.Text


                prm = New SqlParameter("@cpf", SqlDbType.VarChar, 20)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@cpf").Value = Trim(TextBoxCPF.Text.ToString)

                prm = New SqlParameter("@nome", SqlDbType.VarChar, 200)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nome").Value = Trim(nomeTextBox.Text.ToString)

                prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@endereco").Value = Trim(enderecoTextBox.Text.ToString) & " " & NrTextBox.Text

                prm = New SqlParameter("@cep", SqlDbType.VarChar, 10)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@cep").Value = Trim(cepTextBox.Text.ToString)

                prm = New SqlParameter("@bairro", SqlDbType.VarChar, 180)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@bairro").Value = Trim(bairroTextBox.Text.ToString)

                prm = New SqlParameter("@cidade", SqlDbType.VarChar, 100)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@cidade").Value = Trim(cidadeTextBox.Text.ToString)

                prm = New SqlParameter("@uf", SqlDbType.Char, 2)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@uf").Value = Trim(DDUf.SelectedValue)

                prm = New SqlParameter("@pais", SqlDbType.VarChar, 100)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@pais").Value = Trim(pais.SelectedValue)

                prm = New SqlParameter("@nascimento", SqlDbType.DateTime)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nascimento").Value = Trim(nascimentoTextBox.Text)

                prm = New SqlParameter("@sexo", SqlDbType.VarChar, 10)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@sexo").Value = sexo.SelectedValue

                prm = New SqlParameter("@cadastroTipo", SqlDbType.VarChar, 100)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@cadastroTipo").Value = tipo.SelectedValue

                prm = New SqlParameter("@apresentar", SqlDbType.Bit)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@apresentar").Value = apresentarCheckBox.Checked

                prm = New SqlParameter("@estadocivil", SqlDbType.VarChar, 50)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@estadocivil").Value = estadocivil.SelectedValue

                prm = New SqlParameter("@nrdependente", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nrdependente").Value = nrdependenteTextBox.Text

                prm = New SqlParameter("@trabalhando", SqlDbType.Bit)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@trabalhando").Value = situacao.Checked

                prm = New SqlParameter("@resumo", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@resumo").Value = resumoTextBox.Text

                prm = New SqlParameter("@valorRemAtual", SqlDbType.Money)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                If valorRemAtualTextBox.Text = "" Or valorRemAtualTextBox.Text = "R$ __.___,__" Then
                    cmd.Parameters("@valorRemAtual").Value = 0
                Else
                    cmd.Parameters("@valorRemAtual").Value = Trim(Replace(Replace(Replace(valorRemAtualTextBox.Text, "_", "0"), "R$", ""), ".", ""))
                End If


                prm = New SqlParameter("@valorRemPretendida", SqlDbType.Money)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                If valorRemPretendidaTextBox.Text = "" Or valorRemPretendidaTextBox.Text = "R$ __.___,__" Then
                    cmd.Parameters("@valorRemPretendida").Value = 0
                Else
                    cmd.Parameters("@valorRemPretendida").Value = Trim(Replace(Replace(Replace(valorRemPretendidaTextBox.Text, "_", "0"), "R$", ""), ".", ""))
                End If

                prm = New SqlParameter("@localPreferencia", SqlDbType.VarChar, 100)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@localPreferencia").Value = localPreferencia.SelectedValue

                prm = New SqlParameter("@disponibilidade", SqlDbType.VarChar, 50)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@disponibilidade").Value = Disponibilidade.SelectedValue

                prm = New SqlParameter("@origem", SqlDbType.VarChar, 100)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@origem").Value = origem.SelectedValue

                prm = New SqlParameter("@data", SqlDbType.DateTime)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@data").Value = Now()

                prm = New SqlParameter("@dataultimoacess", SqlDbType.DateTime)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@dataultimoacess").Value = Now()

                prm = New SqlParameter("@contador", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@contador").Value = 0

                prm = New SqlParameter("@privacidade", SqlDbType.Bit)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@privacidade").Value = 0


                If portadorDef.SelectedValue = 1 Then

                    prm = New SqlParameter("@portadorDef", SqlDbType.Bit)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@portadorDef").Value = 1

                    prm = New SqlParameter("@idDefAuditiva", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefAuditiva").Value = idDefAuditivaTextBox.SelectedValue

                    prm = New SqlParameter("@idDefMotora", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefMotora").Value = idDefMotoraTextBox.SelectedValue

                    prm = New SqlParameter("@idDefFala", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefFala").Value = idDefFalaTextBox.SelectedValue

                    prm = New SqlParameter("@idDefMental", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefMental").Value = idDefMentalTextBox.SelectedValue

                    prm = New SqlParameter("@idDefVisual", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefVisual").Value = idDefVisualTextBox.SelectedValue

                    prm = New SqlParameter("@Obs", SqlDbType.Text)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@Obs").Value = ObsTextBox.Text

                Else

                    prm = New SqlParameter("@portadorDef", SqlDbType.Bit)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@portadorDef").Value = 0

                    prm = New SqlParameter("@idDefAuditiva", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefAuditiva").Value = 0

                    prm = New SqlParameter("@idDefMotora", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefMotora").Value = 0

                    prm = New SqlParameter("@idDefFala", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefFala").Value = 0

                    prm = New SqlParameter("@idDefMental", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefMental").Value = 0

                    prm = New SqlParameter("@idDefVisual", SqlDbType.Int)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@idDefVisual").Value = 0

                    prm = New SqlParameter("@Obs", SqlDbType.Text)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)
                    cmd.Parameters("@Obs").Value = ""

                End If


                Try

                    cn.Open()

                    Dim dr As SqlDataReader = cmd.ExecuteReader

                    lblText.Text = "Candidato cadastrado no sistema JobClick..."

                    dr.Close()

                    Dim pws As String = pwdLabel.Text
                    Dim userName As String = UserNameLabel.Text
                    Dim email As String = emailLabel.Text

                    cn.Close()

                    Dim AutoLogon As New user

                    Try

                        Session("idUser") = p.idUser(pws, email)
                        Session("idCadastroUser") = p.idCadastroUser(Session("idUser"))
                        Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
                        Session("dataultimoacess") = p.Contador(Session("idUser"))
                        Session("emailUser") = email
                        Session("idcurriculo") = p.ZoyaIDCV(Session("idCadastroUser"))

                        CargaIdCurriculo(Session("idcurriculo"))

                        enviaEmail(emailTextBox.Text)
                        Response.Redirect("/_candidato/objetivo.aspx")

                    Catch ex As Exception

                    End Try

                Catch ex As Exception
                    lblText.Text = "Erro ao cadastrar sua conta de acesso..."
                End Try

            End If

        End If

    End Sub

    Sub enviaEmail(ByVal email As String)

        Dim mensagemCandidato As New email

        REM ** ***************************************************************************************************
        Dim MODELO As String = "CadastroC"
        REM ** ***************************************************************************************************

        Dim URL As String = Replace(Request.Url.AbsoluteUri, Request.RawUrl, "")

        mensagemCandidato.enviarDB(MODELO, URL, UserNameLabel.Text, emailLabel.Text, Application("idsetup").ToString, UserNameLabel.Text, pwdLabel.Text, fraseLabel.Text, Session("ip"))

    End Sub

    Protected Sub LBNormas_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBNormas.Click

        Panel1.Visible = True
        LBNormas.Visible = False
        lblContrato.Text = ""

        Dim oSQL As String = "SELECT idContratoOnline, idSetup, ContratoOnLine, Modelo FROM tbContratoOnLine WHERE (Modelo = 'CadastroCandidato') AND (idSetup = " & Session("idsetup") & ")"

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then
            oReader.Read()
            lblContrato.Text = oReader("ContratoOnLine")
        End If

        oConnection.Close()

    End Sub

    Protected Sub FecharPanel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles FecharPanel.Click, LbFechar1.Click
        Panel1.Visible = False
        LBNormas.Visible = True
    End Sub

    Protected Sub IBenviarEmail_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBenviarEmail.Click

        Dim Protocolo As New geraProtocolo

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim ProtocoloCadidato As String = Protocolo.getNrProtocoloCandidato(Session("idSetup"))
        UserNameLabel.Text = ProtocoloCadidato

        Dim status As Boolean = False
        Dim statusTemp As Boolean = False

        status = VerificaUser(Trim(passwordTextBox.Text.ToString), Trim(emailTextBox.Text.ToString))
        statusTemp = VerificaUserTemp(Trim(passwordTextBox.Text.ToString), Trim(emailTextBox.Text.ToString))

        If statusTemp Or status Then
            If statusTemp Then
                lblText.Text = "Este e-mail já está cadastrado, porém não foi confirmado pelo usuário.<br>Para receber novamente o e-mail de confirmação [Clique aqui].<br><br>"
            End If
            If status Then
                lblText.Text = "* Este e-mail já está cadastrado, caso tenha esquecido a sua senha [<a href='../senha.aspx'>clique aqui</a>].<br><br>"
            End If

        Else

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spGravaCheckEmail", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@userName", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@userName").Value = ProtocoloCadidato


            prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@password").Value = Trim(passwordTextBox.Text.ToString)


            prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@email").Value = Trim(emailTextBox.Text.ToString)


            prm = New SqlParameter("@frase", SqlDbType.VarChar, 60)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@frase").Value = Trim(fraseTextBox.Text.ToString)


            prm = New SqlParameter("@ip", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@ip").Value = Session("ip")


            prm = New SqlParameter("@ticket", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@ticket").Value = Session("ticket")

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                cn.Close()

                Dim mensagemCandidato As New email
                REM ** ***************************************************************************************************
                Dim MODELO As String = "ContadeAcesso"
                REM ** ***************************************************************************************************
                Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")
                mensagemCandidato.enviarDB(MODELO, URL, ProtocoloCadidato, emailTextBox.Text, Application("idsetup").ToString, Session("ticket"), Session("ip"), UserNameLabel.Text, Session("ip"))

            Catch ex As Exception

            End Try

            sendEmail.Visible = False
            CadastroContaAcesso.Visible = False
            sendEmail.Visible = False
            sendCadastro.Visible = False
            dadospessoais.Visible = False

            mensagemEmail.Visible = True

        End If

    End Sub



    Protected Sub voltar(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_candidato")
    End Sub

    Protected Sub resumoTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        resumoTextBox.Text = Replace(resumoTextBox.Text, "<br>", "")
    End Sub


    Protected Sub PesquisaCPF(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBoxCPF.TextChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCPFres As New myValidaCPF

        If ValidaCPFres.ValidaCPF(TextBoxCPF.Text) Then

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spBuscaCPF", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@CPF", SqlDbType.VarChar, 20)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@CPF").Value = TextBoxCPF.Text

            Try

                cn.Open()

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then

                    dr.Read()

                    lblmsn.CssClass = "msn"
                    lblmsn.Text = "CPF já está cadastrado no sistema."

                Else

                    If TextBoxCPF.Text = "___.___.___-__" Then
                        lblmsn.Text = "..."
                    Else
                        lblmsn.CssClass = "msnOK"
                        lblmsn.Text = "[Verificado]"
                        cepTextBox.Focus()
                    End If

                End If

                dr.Close()

            Catch ex As Exception

                lblmsn.CssClass = "msn"
                lblmsn.Text = "Erro ao pesquisar o CPF..."

            End Try

            cn.Close()
        Else

            lblmsn.CssClass = "msn"
            lblmsn.Text = "CPF não é válido, informe um CPF válido."

        End If

    End Sub


    Function PesquisaCPFfn(ByVal CPF)

        Dim Status As Boolean = True

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCPFres As New myValidaCPF

        If ValidaCPFres.ValidaCPF(CPF) Then

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spBuscaCPF", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@CPF", SqlDbType.VarChar, 20)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@CPF").Value = CPF

            Try

                cn.Open()

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then

                    dr.Read()

                    Status = False

                End If

                dr.Close()

            Catch ex As Exception

                Status = False

            End Try

            cn.Close()
        Else

            Status = False

        End If

        Return Status

    End Function


    Protected Sub pais_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles pais.DataBound
        pais.SelectedValue = "Brasil"
    End Sub

    Protected Sub portadorDef_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles portadorDef.SelectedIndexChanged
        If portadorDef.SelectedValue = 1 Then
            def.Visible = True
        Else
            def.Visible = False
        End If
    End Sub




    Protected Sub CargaIdCurriculo(ByVal idcurriculo)

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


    Protected Sub PesquisaCEP_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles PesquisaCEP.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = Replace(cepTextBox.Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            enderecoTextBox.Text = dr("LOGRADOURO") & " " & dr("RUA") & ", "
            bairroTextBox.Text = dr("BAIRRO")
            cidadeTextBox.Text = dr("CIDADE")
            DDUf.SelectedValue = dr("UF")
            NrTextBox.Focus()

        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub DropDownListAreaAtuacaoC_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListAreaAtuacaoC.DataBound
        Try
            Dim myDropDownListAreaAtuacaoC As DropDownList = DropDownListAreaAtuacaoC
            myDropDownListAreaAtuacaoC.Items.Insert(0, New ListItem("-- Selecione --", ""))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub CheckBoxPrimeiroEmprego_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxPrimeiroEmprego.CheckedChanged
        If CheckBoxPrimeiroEmprego.Checked Then
            PanelRemuneraAtual.Visible = False
            valorRemAtualTextBox.Text = 0
        Else
            PanelRemuneraAtual.Visible = True
            valorRemAtualTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxACOMBINAR_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxACOMBINAR.CheckedChanged
        If CheckBoxACOMBINAR.Checked Then
            PanelRemuneraPret.Visible = False
            valorRemPretendidaTextBox.Text = 0
        Else
            PanelRemuneraPret.Visible = True
            valorRemPretendidaTextBox.Text = ""
        End If
    End Sub

    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFechar.Click
        AvisoPanel.Visible = False
        emailTextBox.Focus()
    End Sub

    Protected Sub LinkButtonFechar0_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFechar0.Click
        PanelAviso.Visible = False
        AVISOLABEL0.Text = ""
    End Sub

End Class
