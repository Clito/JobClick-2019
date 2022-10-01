Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ

Partial Class _parceiroJobClick_cadastro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        PanelAvisoSucesso.Visible = False

        If Not IsPostBack Then


            REM ** CARREGA OS DADOS DA EMPRESA
            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter


            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spEmpresaSelect", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            cn.Open()

            Try

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then
                    dr.Read()

                    TextBoxCNPJ.Text = dr("cnpj")
                    TextBoxCNPJ.Enabled = False

                    nmempresaTextBox.Text = dr("nmempresa")
                    nomeResTextBox.Text = dr("nomeRes")

                    idUserEmpresaLabel.Text = dr("idUser")

                    cepTextBox.Text = dr("cep")

                    enderecoTextBox.Text = dr("endereco")
                    nrTextBox.Text = dr("numero")
                    complementoTextBox.Text = dr("complemento")

                    bairroTextBox.Text = dr("bairro")
                    cidadeTextBox.Text = dr("cidade")
                    ddd.Text = dr("ddd")
                    telefone.Text = dr("telefone")

                    UFLabel.Text = dr("uf")
                    RamoatividadeLabel.Text = dr("idAreaAtuacao")
                    paisLabel.Text = dr("pais")
                    porteLabel.Text = dr("idPorte")
                    privacidadeLabel.Text = dr("privacidade")
                    emailResTextBox.Text = dr("emailRes")

                    emailANTESLabel.Text = dr("email")
                    pwdANTESLabel.Text = dr("password")

                    Select Case privacidadeLabel.Text
                        Case "True"
                            PrivacidadeRadioButtonList.SelectedValue = 1
                        Case "False"
                            PrivacidadeRadioButtonList.SelectedValue = 0
                        Case Else
                            PrivacidadeRadioButtonList.SelectedValue = 0
                    End Select

                    tempoexistenciaTextBox.Text = dr("tempoexistencia")

                    siteTextBox.Text = dr("site")

                End If

                dr.Close()

            Catch ex As Exception

            End Try

            cn.Close()

        End If

    End Sub

    Protected Sub LinkButtonSalvar_Click(sender As Object, e As EventArgs) Handles LinkButtonSalvar.Click


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spEmpresaUpdate", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa_Pai").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idAreaAtuacao", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idAreaAtuacao").Value = idAreaAtuacaoDropDownList.SelectedValue

        prm = New SqlParameter("@idPorte", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idPorte").Value = idPorteRadioButtonList.SelectedValue

        prm = New SqlParameter("@nmempresa", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nmempresa").Value = nmempresaTextBox.Text

        prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeRes").Value = nomeResTextBox.Text

        prm = New SqlParameter("@emailRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailRes").Value = emailResTextBox.Text

        prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@endereco").Value = enderecoTextBox.Text

        prm = New SqlParameter("@numero", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@numero").Value = nrTextBox.Text

        prm = New SqlParameter("@complemento", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@complemento").Value = complementoTextBox.Text

        prm = New SqlParameter("@cep", SqlDbType.VarChar, 10)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cep").Value = cepTextBox.Text

        prm = New SqlParameter("@bairro", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@bairro").Value = bairroTextBox.Text

        prm = New SqlParameter("@cidade", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cidade").Value = cidadeTextBox.Text

        prm = New SqlParameter("@uf", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@uf").Value = DDUf.SelectedValue

        prm = New SqlParameter("@pais", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@pais").Value = paisDropDownList.SelectedValue

        prm = New SqlParameter("@ddd", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ddd").Value = ddd.Text

        prm = New SqlParameter("@telefone", SqlDbType.VarChar, 10)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@telefone").Value = telefone.Text

        prm = New SqlParameter("@privacidade", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@privacidade").Value = PrivacidadeRadioButtonList.SelectedValue

        prm = New SqlParameter("@tempoexistencia", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@tempoexistencia").Value = tempoexistenciaTextBox.Text

        prm = New SqlParameter("@site", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@site").Value = siteTextBox.Text

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Read()
            dr.Close()

            PanelAvisoSucesso.Visible = True
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
            AvisoLabel.Text = "Suas alterações foram salvas com sucesso!"
        Catch ex As Exception
            PanelAvisoSucesso.Visible = True
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            AvisoLabel.Text = "Erro : Houve um erro de comunicação com nosso servidor, tente novamente mais tarde.<br>Descrição do erro: " & Err.Description
        End Try

        cn.Close()

        ATUALIZADADOS()

    End Sub

    Sub ATUALIZADADOS()

        REM ** ******************************************************************************
        REM ** CARREGA ALGUMAS VARIÁVEIS IMPORTANTES NO SISTEMA (DEMO)
        REM ** ******************************************************************************
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LOGIN_PARA_AD_PARCEIRO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            Session("idsetup") = dr("idSetup")
            Session("idUser") = dr("idUser")
            Session("idTypeUser") = dr("idTypeUser")
            Session("nome") = dr("nomeRes")
            Session("nmempresa") = dr("nmempresa")
            Session("idCadastroUser") = dr("idCadastroUser")
            Session("idCadastroEmpresa") = dr("idCadastroEmpresa")
            Session("emailRes") = dr("emailRes")
            Session("ddd") = dr("ddd")
            Session("telefone") = dr("telefone")

            REM ** **************************************************************************
            REM ** DADOS PARA EMISSÃO DE BOLETO
            REM ** **************************************************************************
            Session("cnpj") = dr("cnpj")
            Session("endereco") = dr("endereco")
            Session("complemento") = dr("complemento")
            Session("bairro") = dr("bairro")
            Session("cep") = dr("cep")
            Session("uf") = dr("uf")
            Session("numero") = dr("numero")
            Session("estado") = dr("dsuf")
            Session("cidade") = dr("cidade")
            Session("pais") = dr("pais")
            Session("emailAdmin") = dr("emailAdmin")

        End If

        dr.Close()
        cn.Close()

        REM ** ******************************************************************************
        REM ** [FIM]
        REM ** ******************************************************************************

    End Sub


    Protected Sub PesquisaCEP_Click1(sender As Object, e As ImageClickEventArgs) Handles PesquisaCEP.Click
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
            nrTextBox.Focus()

        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If

        dr.Close()
        cn.Close()
    End Sub


    Protected Sub LinkButtonAcesso_Click(sender As Object, e As EventArgs) Handles LinkButtonAcesso.Click
        PanelACESSO.Visible = True
    End Sub

    Protected Sub DDUf_DataBound(sender As Object, e As EventArgs) Handles DDUf.DataBound
        If UFLabel.Text <> "" Then
            DDUf.SelectedValue = UFLabel.Text
        Else
            DDUf.SelectedValue = "SP"
        End If

    End Sub

    Protected Sub paisDropDownList_DataBound(sender As Object, e As EventArgs) Handles paisDropDownList.DataBound
        If paisLabel.Text <> "" Then
            paisDropDownList.SelectedValue = paisLabel.Text
        Else
            paisDropDownList.SelectedValue = "Brasil"
        End If

    End Sub

    Protected Sub idAreaAtuacaoDropDownList_DataBound(sender As Object, e As EventArgs) Handles idAreaAtuacaoDropDownList.DataBound
        idAreaAtuacaoDropDownList.SelectedValue = RamoatividadeLabel.Text
    End Sub

    Protected Sub idPorteRadioButtonList_DataBound(sender As Object, e As EventArgs) Handles idPorteRadioButtonList.DataBound
        idPorteRadioButtonList.SelectedValue = porteLabel.Text
    End Sub

    Protected Sub LinkButtonSalvarACESSO_Click(sender As Object, e As EventArgs) Handles LinkButtonSalvarACESSO.Click
        If passwordTextBox.Text = "" Or emailTextBox.Text = "" Then
            PanelAvisoSucesso.Visible = True
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            AvisoLabel.Text = "Suas alterações não foram salvas, informe a sua senha de acesso e seu e-mail que será utilizado para acesso!"

        Else

            REM ** ALTERA OS DADOS DE ACESSO

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_ALTERA_SENHA_ACESSO_PARCEIRO", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@emailANTES", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@emailANTES").Value = emailANTESLabel.Text

            prm = New SqlParameter("@emailTROCA", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@emailTROCA").Value = emailTextBox.Text

            prm = New SqlParameter("@PWDANTES", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PWDANTES").Value = pwdANTESLabel.Text

            prm = New SqlParameter("@PWDTROCA", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PWDTROCA").Value = passwordTextBox.Text

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()

            If dr("TIPOMSN") <> "0" Then
                AvisoLabel.Text = dr("MSN")
                PanelAvisoSucesso.Visible = True
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
            Else
                AvisoLabel.Text = dr("MSN")
                PanelAvisoSucesso.Visible = True
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            End If

            dr.Read()
            dr.Close()
            cn.Close()

        End If
    End Sub

    Protected Sub LinkButtonFecharACESSO_Click(sender As Object, e As EventArgs) Handles LinkButtonFecharACESSO.Click
        PanelACESSO.Visible = False
    End Sub
End Class
