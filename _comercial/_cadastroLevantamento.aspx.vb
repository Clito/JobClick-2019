Imports user
Imports criptografia
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ
Imports email
Imports BodyEmail
Imports ReplaceForm

Partial Class _empresa_cadastroLevantamento
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Request.QueryString("autoTit") <> "" Then
                LabelCabec.Text = Request.QueryString("autoTit")
            Else
                LabelCabec.Text = "Emissão de cobrança (Nota Fiscal)"
            End If

            urlLabelT.Text = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

            Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

            If idCadastroEmpresaFilha = "" Then
                Response.Redirect("Default.aspx")
            Else
                idCadastroEmpresaFilhaLabel.Text = idCadastroEmpresaFilha
                idCadastroEmpresaLabel.Text = idCadastroEmpresaFilhaLabel.Text
                AtualizaEmpresa()
                NavActions.Visible = True
            End If

            idCadastroEmpresaPaiLabel.Text = Session("idCadastroEmpresa")
            idUserLabel.Text = Session("idUser")

            If HttpContext.Current.User.Identity.Name <> "RHUser" Then
                Gestor_td1.Visible = False
                Gestor_td0.Visible = False
            Else
                Gestor_td1.Visible = True
                Gestor_td0.Visible = True
            End If

            If Session("idRH_Gestor") <> "" Then
                idRH_GestorLabel.Text = Session("idRH_Gestor")
            Else
                idRH_GestorLabel.Text = "0"
            End If

        End If

    End Sub

    Protected Sub PesquisaCEP_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles PesquisaCEP.Click

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
            enderecoTextBox.Focus()

        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If

        dr.Close()
        cn.Close()

    End Sub

    Public Sub PesquisaCNPJ(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBoxCNPJ.TextChanged

        If Not IsPostBack Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim ValidaCNPJres As New myValidaCNPJ
            Session("VarError") = False

            If TextBoxCNPJ.Text <> "__.___.___/____-__" Then

                If ValidaCNPJres.ValidaCNPJ(TextBoxCNPJ.Text) Then

                    cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                    cmd = New SqlCommand("spBuscaCNPJ", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    prm = New SqlParameter("@CNPJ", SqlDbType.VarChar, 20)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@CNPJ").Value = TextBoxCNPJ.Text

                    cn.Open()

                    Try

                        Dim dr As SqlDataReader = cmd.ExecuteReader

                        If dr.HasRows() Then
                            dr.Read()
                            lblmsn.Text = "[" & dr("CNPJ") & "] já cadastrado no sistema."
                        Else
                            Session("VarError") = True
                            lblmsnOK.Text = "[Ok!]"
                        End If

                        dr.Close()

                    Catch ex As Exception
                        lblmsn.Text = "Erro ao pesquisar o CNPJ..."
                    End Try

                    cn.Close()
                Else
                    lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
                End If
            End If

        End If

    End Sub

    Protected Sub paisDropDownList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles paisDropDownList.DataBound
        paisDropDownList.SelectedValue = "Brasil"
    End Sub

    Protected Sub DropDownListSelectEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.DataBound
        Try
            Dim myDropDownListidCadEmpresa As DropDownList = DropDownListSelectEmpresa
            myDropDownListidCadEmpresa.Items.Insert(0, New ListItem("-- Selecione --", ""))
            myDropDownListidCadEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ButtonSelecionaEmpresa_Click(sender As Object, e As System.EventArgs) Handles ButtonSelecionaEmpresa.Click
        msn.Text = ""
        idCadastroEmpresaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
        NomeEmpresaLabel.Text = "<b>Empresa selecionada " & DropDownListSelectEmpresa.SelectedItem.Text & "</b>"
        NavActions.Visible = True
        FormPerfilOut.Visible = False
        FormEmpresa.Visible = False
        AtualizaEmpresa()
    End Sub

    Protected Sub ButtonCadastroEmp_Click(sender As Object, e As System.EventArgs)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spGravaCadastroEmpresa", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@userName", SqlDbType.VarChar, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@userName").Value = userNameTextBox.Text.ToString


        prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@password").Value = passwordTextBox.Text.ToString


        prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@email").Value = emailTextBox.Text.ToString


        prm = New SqlParameter("@frase", SqlDbType.VarChar, 60)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@frase").Value = fraseTextBox.Text.ToString

        REM *****************************************************************************************
        REM ** EMPRESA QUE IRÁ FAZER AS GESTÃO DOS PROCESSOS SELETIVOS

        prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa_Pai").Value = CInt(Session("idCadastroEmpresa"))
        REM *****************************************************************************************

        prm = New SqlParameter("@idAreaAtuacao", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idAreaAtuacao").Value = idAreaAtuacaoDropDownList.SelectedValue.ToString


        prm = New SqlParameter("@idPorte", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idPorte").Value = idPorteRadioButtonList.SelectedValue.ToString


        prm = New SqlParameter("@nmempresa", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@nmempresa").Value = nmempresaTextBox.Text.ToString


        prm = New SqlParameter("@cnpj", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cnpj").Value = TextBoxCNPJ.Text.ToString


        prm = New SqlParameter("@emailRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@emailRes").Value = emailTextBox.Text.ToString


        prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@nomeRes").Value = nomeResTextBox.Text.ToString


        prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@endereco").Value = enderecoTextBox.Text.ToString


        prm = New SqlParameter("@cep", SqlDbType.VarChar, 10)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cep").Value = cepTextBox.Text.ToString


        prm = New SqlParameter("@bairro", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@bairro").Value = bairroTextBox.Text.ToString


        prm = New SqlParameter("@cidade", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cidade").Value = cidadeTextBox.Text.ToString


        prm = New SqlParameter("@uf", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@uf").Value = DDUf.SelectedValue.ToString


        prm = New SqlParameter("@pais", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@pais").Value = paisDropDownList.SelectedValue.ToString

        prm = New SqlParameter("@ddd", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@ddd").Value = ddd.Text


        prm = New SqlParameter("@telefone", SqlDbType.VarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@telefone").Value = telefone.Text







        REM **********************************************************************************************
        REM **********************************************************************************************
        REM **********************************************************************************************

        prm = New SqlParameter("@ie", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ie").Value = TextBoxIE.Text.ToString

        prm = New SqlParameter("@emailCobranca", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailCobranca").Value = emailTextBox0.Text.ToString

        prm = New SqlParameter("@nomeResposavelCobranca", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeResposavelCobranca").Value = nomeResTextBox0.Text.ToString

        prm = New SqlParameter("@enderecoCobranca", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@endereco").Value = enderecoTextBox0.Text.ToString

        prm = New SqlParameter("@cepCobranca", SqlDbType.VarChar, 10)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cepCobranca").Value = cepTextBox0.Text.ToString

        prm = New SqlParameter("@bairroCobranca", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@bairroCobranca").Value = bairroTextBox0.Text.ToString

        prm = New SqlParameter("@cidadeCobranca", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cidadeCobranca").Value = cidadeTextBox0.Text.ToString

        prm = New SqlParameter("@ufCobranca", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ufCobranca").Value = DDUf0.SelectedValue.ToString

        prm = New SqlParameter("@paisCobranca", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@paisCobranca").Value = paisDropDownList0.SelectedValue.ToString

        prm = New SqlParameter("@dddCobranca", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dddCobranca").Value = ddd0.Text

        prm = New SqlParameter("@telefoneCobranca", SqlDbType.VarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@telefoneCobranca").Value = telefone0.Text

        REM **********************************************************************************************
        REM **********************************************************************************************
        REM **********************************************************************************************

        prm = New SqlParameter("@privacidade", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        Select Case PrivacidadeRadioButtonList.SelectedValue
            Case "1"
                cmd.Parameters("@privacidade").Value = 1
            Case "0"
                cmd.Parameters("@privacidade").Value = 0
        End Select

        prm = New SqlParameter("@tempoexistencia", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@tempoexistencia").Value = tempoexistenciaLabel.Text

        prm = New SqlParameter("@site", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@site").Value = siteTextBox.Text

        cn.Open()

        If Session("VarError") Then
            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader
                lblmsn.Text = "Empresa cadastrada no sistema!"
                DropDownListSelectEmpresa.DataBind()
                dr.Close()

            Catch ex As Exception
                lblmsn.Text = "Falha ao cadastra a Empresa no sistema." & ErrorToString()
            End Try
        Else
            lblmsn.Text = "Erro ao cadastrar sua empresa, CNPJ já cadastrado!"
        End If

        cn.Close()
    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelar.Click
        NavActions.Visible = False
        FormEmpresa.Visible = False
        FormPerfilOut.Visible = False
        DropDownListSelectEmpresa.DataBind()
        idCadastroEmpresaLabel.Text = ""
        idCadastroEmpresaFilhaLabel.Text = ""
        idPerfilVagaLabel.Text = ""
    End Sub

    Protected Sub LinkButtonCadastroEdit_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCadastroEdit.Click

        If IsPostBack Then

            ButtonAtualizar.Visible = True

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter


            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spEmpresaSelect", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text

            prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa_Pai").Value = Session("idCadastroEmpresa")

            cn.Open()

            Try

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then
                    dr.Read()

                    TextBoxCNPJ.Text = dr("cnpj")
                    TextBoxCNPJ.Enabled = False

                    nmempresaTextBox.Text = dr("nmempresa")
                    nomeEmpresaLabel0.Text = nmempresaTextBox.Text

                    nomeResTextBox.Text = dr("nomeRes")
                    nomeResLabel.Text = nomeResTextBox.Text

                    idUserEmpresaLabel.Text = dr("idUser")

                    cepTextBox.Text = dr("cep")
                    enderecoTextBox.Text = dr("endereco")
                    enderecoEmpresaLabel.Text = enderecoTextBox.Text
                    bairroTextBox.Text = dr("bairro")
                    cidadeTextBox.Text = dr("cidade")
                    DDUf.SelectedValue = dr("uf")
                    ddd.Text = dr("ddd")
                    telefone.Text = dr("telefone")

                    REM **************************************************************************************
                    REM ENDEREÇO DE COBRANÇA
                    REM **************************************************************************************
                    If dr("ie") Is DBNull.Value Then
                        TextBoxIE.Text = "Isento"
                    Else
                        TextBoxIE.Text = dr("ie")
                    End If

                    If dr("nomeResposavelCobranca") Is DBNull.Value Then
                        nomeResTextBox0.Text = ""
                    Else
                        nomeResTextBox0.Text = dr("nomeResposavelCobranca")
                    End If

                    If dr("emailCobranca") Is DBNull.Value Then
                        emailTextBox0.Text = ""
                    Else
                        emailTextBox0.Text = dr("emailCobranca")
                    End If

                    If dr("cepCobranca") Is DBNull.Value Then
                        cepTextBox0.Text = ""
                    Else
                        cepTextBox0.Text = dr("cepCobranca")
                    End If

                    If dr("enderecoCobranca") Is DBNull.Value Then
                        enderecoTextBox0.Text = ""
                    Else
                        enderecoTextBox0.Text = dr("enderecoCobranca")
                    End If

                    If dr("bairroCobranca") Is DBNull.Value Then
                        bairroTextBox0.Text = ""
                    Else
                        bairroTextBox0.Text = dr("bairroCobranca")
                    End If

                    If dr("cidadeCobranca") Is DBNull.Value Then
                        cidadeTextBox0.Text = ""
                    Else
                        cidadeTextBox0.Text = dr("cidadeCobranca")
                    End If

                    If dr("ufCobranca") Is DBNull.Value Then
                        DDUf0.SelectedValue = "SP"
                    Else
                        DDUf0.SelectedValue = dr("ufCobranca")
                    End If

                    If dr("dddCobranca") Is DBNull.Value Then
                        ddd0.Text = ""
                    Else
                        ddd0.Text = dr("dddCobranca")
                    End If

                    If dr("telefoneCobranca") Is DBNull.Value Then
                        telefone0.Text = ""
                    Else
                        telefone0.Text = dr("telefoneCobranca")
                    End If

                    If dr("paisCobranca") Is DBNull.Value Then
                        paisDropDownList0.SelectedValue = "Brasil"
                    Else
                        paisDropDownList0.SelectedValue = dr("paisCobranca")
                    End If


                    REM **************************************************************************************
                    REM ENDEREÇO DE COBRANÇA
                    REM **************************************************************************************

                    telefoneEmpresaLabel.Text = "[" & ddd.Text & "]" & telefone.Text

                    idAreaAtuacaoDropDownList.SelectedValue = dr("idAreaAtuacao")
                    idPorteRadioButtonList.SelectedValue = dr("idPorte")

                    Select Case dr("privacidade")
                        Case True
                            PrivacidadeRadioButtonList.SelectedValue = 1
                        Case False
                            PrivacidadeRadioButtonList.SelectedValue = 0
                    End Select

                    tempoexistenciaLabel.Text = dr("tempoexistencia")
                    existenciaLabel.Text = tempoexistenciaLabel.Text

                    siteTextBox.Text = dr("site")
                    siteLabel.Text = siteTextBox.Text

                    userNameTextBox.Text = dr("userName")
                    userNameTextBox.Enabled = False
                    passwordTextBox.Text = dr("password")
                    passwordTextBox.Enabled = False
                    fraseTextBox.Text = dr("frase")
                    fraseTextBox.Enabled = False

                    emailTextBox.Text = dr("email")

                    emailTextBox.Enabled = False

                    lblmsn.Text = ""


                End If

                dr.Close()

            Catch ex As Exception
                lblmsn.Text = "Erro ao ler os dados da empresa!" & ErrorToString()
            End Try

            cn.Close()

            ButtonAtualizar.Visible = True
            FormEmpresa.Visible = True
            FormPerfilOut.Visible = False

        End If

    End Sub


    Protected Sub ButtonAtualizar_Click(sender As Object, e As System.EventArgs) Handles ButtonAtualizar.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spEmpresaUpdate", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text

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

        prm = New SqlParameter("@emailRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailRes").Value = emailTextBox.Text

        prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeRes").Value = nomeResTextBox.Text

        prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@endereco").Value = enderecoTextBox.Text

        prm = New SqlParameter("@cep", SqlDbType.VarChar, 200)
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

        prm = New SqlParameter("@telefone", SqlDbType.VarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@telefone").Value = telefone.Text



        REM **********************************************************************************************
        REM **********************************************************************************************
        REM **********************************************************************************************

        prm = New SqlParameter("@ie", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ie").Value = TextBoxIE.Text.ToString

        prm = New SqlParameter("@emailCobranca", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailCobranca").Value = emailTextBox0.Text.ToString

        prm = New SqlParameter("@nomeResposavelCobranca", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeResposavelCobranca").Value = nomeResTextBox0.Text.ToString

        prm = New SqlParameter("@enderecoCobranca", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@enderecoCobranca").Value = enderecoTextBox0.Text.ToString

        prm = New SqlParameter("@cepCobranca", SqlDbType.VarChar, 10)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cepCobranca").Value = cepTextBox0.Text.ToString

        prm = New SqlParameter("@bairroCobranca", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@bairroCobranca").Value = bairroTextBox0.Text.ToString

        prm = New SqlParameter("@cidadeCobranca", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cidadeCobranca").Value = cidadeTextBox0.Text.ToString

        prm = New SqlParameter("@ufCobranca", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@ufCobranca").Value = DDUf0.SelectedValue.ToString

        prm = New SqlParameter("@paisCobranca", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@paisCobranca").Value = paisDropDownList0.SelectedValue.ToString

        prm = New SqlParameter("@dddCobranca", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dddCobranca").Value = ddd0.Text

        prm = New SqlParameter("@telefoneCobranca", SqlDbType.VarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@telefoneCobranca").Value = telefone0.Text

        REM **********************************************************************************************
        REM **********************************************************************************************
        REM **********************************************************************************************


        prm = New SqlParameter("@privacidade", SqlDbType.Bit)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        Select Case PrivacidadeRadioButtonList.SelectedValue
            Case "1"
                cmd.Parameters("@privacidade").Value = 1
            Case "0"
                cmd.Parameters("@privacidade").Value = 0
        End Select

        prm = New SqlParameter("@tempoexistencia", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@tempoexistencia").Value = tempoexistenciaLabel.Text

        prm = New SqlParameter("@site", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@site").Value = siteTextBox.Text

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader
            lblmsn.CssClass = "msnOK"
            lblmsn.Text = "Dados da empresa foram atualizados."
            AtualizaEmpresa()
            dr.Close()

        Catch ex As Exception

            lblmsn.CssClass = "msn"
            lblmsn.Text = "Erro ao gravar os dados da empresa." & ErrorToString()

        End Try

        cn.Close()

        ButtonAtualizar.Visible = False
        ButtonCancelar.Text = "Ok (Continuar)"

        TextBoxCNPJ.Enabled = False
        userNameTextBox.Enabled = False
        passwordTextBox.Enabled = False
        fraseTextBox.Enabled = False
        emailTextBox.Enabled = False

        DropDownListSelectEmpresa.DataBind()

    End Sub

    Protected Sub LinkButtonLevantamento_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLevantamento.Click

        FormPerfilOut.Visible = True
        FormEmpresa.Visible = False

        LabelAtencao.Text = "Este Perfil de vaga está sendo cadastrado em " & Now()
        dataLevantamentoLabel.Text = Now()
        nomeLabel.Text = Session("nome")
        emailLabel.Text = Session("emailUser")
        telefoneLabel.Text = Session("telefoneGestor")

        GetDadosConsultor(idRH_GestorLabel.Text)
        LimpadadosPerfil()

        urlLabelT.Text = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

    End Sub

    Sub LimpadadosPerfil()

        InsertButton.Visible = True
        LinkButtonAlterar.Visible = False

        DropDownListCesta.DataBind()

        valorAceiteTextBox.Text = ""
        valorAprovadoTextBox.Text = ""
        valorVagaTextBox.Text = ""
        valorParcelaTextBox.Text = ""
        nroParcelaTextBox.Text = 0
        vencimentoTextBox.Text = ""


        dsPerfilVagaTextBox.Text = ""
        dsfuncaoTextBox.Text = ""
        nrovagaTextBox.Text = ""
        RadioButtonListconfidencial.SelectedValue = False
        RemuneracaoTextBox.Text = ""
        HonorarioTextBox.Text = ""
        RemuneracaoVariavelTextBox.Text = ""
        BeneficiosTextBox.Text = ""
        LocalTrabalhoTextBox.Text = ""
        PerspectivaTextBox.Text = ""
        FaixaEtariaInicioTextBox.Text = ""
        FaixaEtariaFimTextBox.Text = ""
        RadioButtonListSexo.SelectedValue = "I"
        QualificacaoHabilidadesEspecificasTextBox.Text = ""
        PerfilComposicaoEquipeTextBox.Text = ""
        PerfilGestorTextBox.Text = ""
        idiomaTextBox.Text = ""
        informaticaTextBox.Text = ""
        CursoEspecificoTextBox.Text = ""
        ConhecimentoTextBox.Text = ""
        CompetenciaComportamentalTextBox.Text = ""
        CompetenciaProfissionalTextBox.Text = ""
        AspectoCriticoTextBox.Text = ""
        PrincipalDesafioTextBox.Text = ""
        RelacionamentoInternoTextBox.Text = ""
        RelacionamentoExternoTextBox.Text = ""
        RadioButtonListviagens.SelectedValue = "0"
        infoSobre_viagensTextBox.Text = ""
        ObsComplementaresTextBox.Text = ""
        EstruturaOrganizacionalTextBox.Text = ""
        RadioButtonListAprovado.SelectedValue = "2"
        perfil_vaga_aprovado_comentarioTextBox.Text = ""


    End Sub

    Sub AtualizaEmpresa()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spEmpresaSelect", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresaFilha")

        prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa_Pai").Value = Session("idCadastroEmpresa")

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then
                dr.Read()

                TextBoxCNPJ.Text = dr("cnpj")
                TextBoxCNPJ.Enabled = False

                nmempresaTextBox.Text = dr("nmempresa")
                nomeEmpresaLabel0.Text = nmempresaTextBox.Text

                nomeResTextBox.Text = dr("nomeRes")
                nomeResLabel.Text = nomeResTextBox.Text

                idUserEmpresaLabel.Text = dr("idUser")
                emailEmpresaLabel.Text = dr("emailRes")
                cepTextBox.Text = dr("cep")

                enderecoTextBox.Text = dr("endereco")
                enderecoEmpresaLabel.Text = enderecoTextBox.Text

                bairroTextBox.Text = dr("bairro")
                cidadeTextBox.Text = dr("cidade")
                DDUf.SelectedValue = dr("uf")
                ddd.Text = dr("ddd")
                telefone.Text = dr("telefone")

                telefoneEmpresaLabel.Text = "[" & ddd.Text & "]-" & telefone.Text

                REM **************************************************************************************
                REM ENDEREÇO DE COBRANÇA
                REM **************************************************************************************
                If dr("nomeResposavelCobranca") Is DBNull.Value Then
                    nomeResTextBox0.Text = ""
                Else
                    nomeResTextBox0.Text = dr("nomeResposavelCobranca")
                End If

                If dr("emailCobranca") Is DBNull.Value Then
                    emailTextBox0.Text = ""
                Else
                    emailTextBox0.Text = dr("emailCobranca")
                End If

                If dr("cepCobranca") Is DBNull.Value Then
                    cepTextBox0.Text = ""
                Else
                    cepTextBox0.Text = dr("cepCobranca")
                End If

                If dr("enderecoCobranca") Is DBNull.Value Then
                    enderecoTextBox0.Text = ""
                Else
                    enderecoTextBox0.Text = dr("enderecoCobranca")
                End If

                If dr("bairroCobranca") Is DBNull.Value Then
                    bairroTextBox0.Text = ""
                Else
                    bairroTextBox0.Text = dr("bairroCobranca")
                End If

                If dr("cidadeCobranca") Is DBNull.Value Then
                    cidadeTextBox0.Text = ""
                Else
                    cidadeTextBox0.Text = dr("cidadeCobranca")
                End If

                If dr("ufCobranca") Is DBNull.Value Then
                    DDUf0.SelectedValue = "SP"
                Else
                    DDUf0.SelectedValue = dr("ufCobranca")
                End If

                If dr("dddCobranca") Is DBNull.Value Then
                    ddd0.Text = ""
                Else
                    ddd0.Text = dr("dddCobranca")
                End If

                If dr("telefoneCobranca") Is DBNull.Value Then
                    telefone0.Text = ""
                Else
                    telefone0.Text = dr("telefoneCobranca")
                End If

                REM **************************************************************************************
                REM ENDEREÇO DE COBRANÇA
                REM **************************************************************************************

                idAreaAtuacaoDropDownList.SelectedValue = dr("idAreaAtuacao")
                idPorteRadioButtonList.SelectedValue = dr("idPorte")
                PrivacidadeRadioButtonList.SelectedValue = dr("privacidade")

                existenciaLabel.Text = dr("tempoexistencia") & " anos"
                siteLabel.Text = dr("site")

                atuacaoLabel.Text = dr("areaatuacao")


                userNameTextBox.Text = dr("userName")
                userNameTextBox.Enabled = False
                passwordTextBox.Text = dr("password")
                passwordTextBox.Enabled = False
                fraseTextBox.Text = dr("frase")
                fraseTextBox.Enabled = False

                emailTextBox.Text = dr("email")
                emailEmpresaLabel.Text = emailTextBox.Text

                emailTextBox.Enabled = False

                lblmsn.Text = ""

            End If

            dr.Close()

        Catch ex As Exception
            lblmsn.Text = "Erro ao ler os dados da empresa."
        End Try

        cn.Close()

    End Sub

    Protected Sub DDownTipoFormacao_DataBound(sender As Object, e As System.EventArgs) Handles DDownTipoFormacao.DataBound
        Try
            Dim myDDownTipoFormacao As DropDownList = DDownTipoFormacao
            myDDownTipoFormacao.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDDownTipoFormacao.SelectedValue = DDownTipoFormacao.Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListCesta_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListCesta.DataBound
        Try
            Dim myDropDownListCesta As DropDownList = DropDownListCesta
            myDropDownListCesta.Items.Insert(0, New ListItem("-- Selecione o Consultor --", 0))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As System.EventArgs) Handles InsertCancelButton.Click
        NavActions.Visible = False
        FormEmpresa.Visible = False
        FormPerfilOut.Visible = False
        DropDownListSelectEmpresa.DataBind()
        idCadastroEmpresaLabel.Text = ""
        idCadastroEmpresaFilhaLabel.Text = ""
        idPerfilVagaLabel.Text = ""
    End Sub

    Protected Sub InsertButton_Click(sender As Object, e As System.EventArgs) Handles InsertButton.Click

        REM *** ******************************************************************************************
        REM *** (GRAVAR) INSERT DO PERFIL DA VAGA
        REM *** ******************************************************************************************

        Dim myProtocolo As New geraProtocolo

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LEVANTAMENTO_PERFIL_VAGA_COMERCIAL", cn)
        cmd.CommandType = CommandType.StoredProcedure

        REM *** ******************************************************************************************
        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = myProtocolo.getNrProtocolo(Session("idSetup"))
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idCadastroEmpresa_Filha", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa_Filha").Value = idCadastroEmpresaFilhaLabel.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idstatusvaga", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idstatusvaga").Value = "Providenciar"
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@idTipoFormacao", SqlDbType.Int)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@idTipoFormacao").Value = DDownTipoFormacao.SelectedValue
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = DropDownListConsultor.SelectedValue 'Session("idRH_Gestor")
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idRH_Gestor_Filho", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor_Filho").Value = DropDownListCesta.SelectedValue
        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorVaga", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorVagaTextBox.Text = "" Or valorVagaTextBox.Text = "R$ __.___,__" Then
            cmd.Parameters("@valorVaga").Value = 0
        Else
            cmd.Parameters("@valorVaga").Value = Trim(Replace(Replace(Replace(valorVagaTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorAceite", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorAceiteTextBox.Text = "" Or valorAceiteTextBox.Text = "R$ __.___,__" Then
            cmd.Parameters("@valorAceite").Value = 0
        Else
            cmd.Parameters("@valorAceite").Value = Trim(Replace(Replace(Replace(valorAceiteTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@nroParcela", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nroParcela").Value = Replace(nroParcelaTextBox.Text, "_", "")
        REM *** ******************************************************************************************
        prm = New SqlParameter("@vencimento", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If vencimentoTextBox.Text = "" Or valorVagaTextBox.Text = "__/__/____" Then
            cmd.Parameters("@vencimento").Value = Now()
        Else
            cmd.Parameters("@vencimento").Value = vencimentoTextBox.Text
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorParcela", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorParcelaTextBox.Text = "" Or valorParcelaTextBox.Text = "R$ __.___,__" Then
            cmd.Parameters("@valorParcela").Value = 0
        Else
            cmd.Parameters("@valorParcela").Value = Trim(Replace(Replace(Replace(valorParcelaTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorAprovado", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorAprovadoTextBox.Text = "" Or valorAprovadoTextBox.Text = "R$ __.___,__" Then
            cmd.Parameters("@valorAprovado").Value = 0
        Else
            cmd.Parameters("@valorAprovado").Value = Trim(Replace(Replace(Replace(valorAprovadoTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        'prm = New SqlParameter("@FormacaoAcademica", SqlDbType.VarChar, 255)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@FormacaoAcademica").Value = DDownTipoFormacao.SelectedItem.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@dsPerfilVaga", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dsPerfilVaga").Value = dsfuncaoTextBox.Text 'dsPerfilVagaTextBox.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@Cargo", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Cargo").Value = dsfuncaoTextBox.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@nrovaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nrovaga").Value = nrovagaTextBox.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@nmresponsavel", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nmresponsavel").Value = nomeResLabel.Text
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@TipoOportunidade", SqlDbType.VarChar, 50)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@TipoOportunidade").Value = RadioButtonListTipoOportunidade.SelectedValue
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@QualificacaoHabilidadesEspecificas", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@QualificacaoHabilidadesEspecificas").Value = QualificacaoHabilidadesEspecificasTextBox.Text
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@Remuneracao", SqlDbType.Money)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)

        'If RemuneracaoTextBox.Text = "" Or RemuneracaoTextBox.Text = "R$ __.___,__" Then
        '    cmd.Parameters("@Remuneracao").Value = 0
        'Else
        '    cmd.Parameters("@Remuneracao").Value = Trim(Replace(Replace(Replace(RemuneracaoTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        'End If
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@RemuneracaoVariavel", SqlDbType.Money)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'If RemuneracaoVariavelTextBox.Text = "" Or RemuneracaoVariavelTextBox.Text = "R$ __.___,__" Then
        '    cmd.Parameters("@RemuneracaoVariavel").Value = 0
        'Else
        '    cmd.Parameters("@RemuneracaoVariavel").Value = Trim(Replace(Replace(Replace(RemuneracaoVariavelTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        'End If
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@Honorario", SqlDbType.Money)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'If HonorarioTextBox.Text = "" Or HonorarioTextBox.Text = "R$ __.___,__" Then
        '    cmd.Parameters("@Honorario").Value = 0
        'Else
        '    cmd.Parameters("@Honorario").Value = Trim(Replace(Replace(Replace(HonorarioTextBox.Text, "_", "0"), "R$", ""), ".", ""))
        'End If
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@LocalTrabalho", SqlDbType.VarChar, 50)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@LocalTrabalho").Value = LocalTrabalhoTextBox.Text
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@ObsComplementares", SqlDbType.VarChar, 4000)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@ObsComplementares").Value = ObsComplementaresTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@Beneficios", SqlDbType.VarChar, 4000)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@Beneficios").Value = BeneficiosTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@Perspectiva", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@Perspectiva").Value = PerspectivaTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@FaixaEtariaInicio", SqlDbType.Int)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@FaixaEtariaInicio").Value = FaixaEtariaInicioTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@FaixaEtariaFim", SqlDbType.Int)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@FaixaEtariaFim").Value = FaixaEtariaFimTextBox.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@Sexo", SqlDbType.VarChar, 1)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Sexo").Value = "I"
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@ConhecimentoIdioma", SqlDbType.VarChar, 255)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@ConhecimentoIdioma").Value = idiomaTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@PerfilComposicaoEquipe", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@PerfilComposicaoEquipe").Value = PerfilComposicaoEquipeTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@PerfilGestor", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@PerfilGestor").Value = PerfilGestorTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@CursoEspecifico", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@CursoEspecifico").Value = CursoEspecificoTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@Conhecimento", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@Conhecimento").Value = ConhecimentoTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@ConhecimentoInformatica", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@ConhecimentoInformatica").Value = informaticaTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@CompetenciaComportamental", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@CompetenciaComportamental").Value = CompetenciaComportamentalTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@CompetenciaProfissional", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@CompetenciaProfissional").Value = CompetenciaProfissionalTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@AspectoCritico", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@AspectoCritico").Value = AspectoCriticoTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@PrincipalDesafio", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@PrincipalDesafio").Value = PrincipalDesafioTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@RelacionamentoInterno", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@RelacionamentoInterno").Value = RelacionamentoInternoTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@RelacionamentoExterno", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@RelacionamentoExterno").Value = RelacionamentoExternoTextBox.Text
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@viagens", SqlDbType.Char, 1)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@viagens").Value = RadioButtonListviagens.SelectedValue
        'REM *** ******************************************************************************************
        'prm = New SqlParameter("@infoSobre_viagens", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@infoSobre_viagens").Value = infoSobre_viagensTextBox.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@confidencial", SqlDbType.Bit)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@confidencial").Value = 0
        REM *** ******************************************************************************************
        'prm = New SqlParameter("@EstruturaOrganizacional", SqlDbType.Text)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@EstruturaOrganizacional").Value = EstruturaOrganizacionalTextBox.Text
        'REM *** ******************************************************************************************

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
            msn.CssClass = "msnOK"
            msn.Text = "O Levantamento do Perfil da Vaga foi salvo com sucesso!"
            FormPerfilOut.Visible = False
        Catch ex As Exception
            msn.CssClass = "msn"
            msn.Text = "Falha ao salvar o Levantamento do Perfil da Vaga, avise o Administrador." & ErrorToString()
        End Try

        GridViewListaPerfil.DataBind()

    End Sub

    Protected Sub GridViewListaPerfil_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaPerfil.SelectedIndexChanged

        LimpadadosPerfil()

        msn.Text = ""
        idPerfilVagaLabel.Text = GridViewListaPerfil.SelectedDataKey("idPerfilVaga")
        ProtocoloLabel.Text = GridViewListaPerfil.SelectedDataKey("Protocolo")

        GetPerfilVaga(idPerfilVagaLabel.Text)
        FormPerfilOut.Visible = True
        InsertButton.Visible = False
        LinkButtonAlterar.Visible = True

        REM *** ******************************************************************************************
        REM *** DADOS DO CONSULTOR O PERFIL DA VAGA
        REM *** ******************************************************************************************


        idRH_GestorLabel.Text = GridViewListaPerfil.SelectedDataKey("idRH_Gestor")
        dataLevantamentoLabel.Text = GridViewListaPerfil.SelectedDataKey("data_criacao")

        GetDadosConsultor(idRH_GestorLabel.Text)
        AtualizaEmpresa()


        If idPerfilVagaLabel.Text <> "" Then

            LinkButtonAprGestor.Visible = True
            OutLookPerfil.Visible = True

        End If


    End Sub

    Sub GetDadosConsultor(idRH_Gestor As String)

        If idRH_Gestor <> "0" Then

            Dim dr As SqlDataReader = Nothing
            Dim sSQL As String
            Dim Connection As SqlConnection

            Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim command As SqlCommand

            sSQL = "SELECT idRH_Gestor, idCadastroEmpresa, idRH, nome, [password], email, bloquear, ddd, telefone, data FROM tbRH_Gestor WHERE (idRH_Gestor = '" + idRH_Gestor + "')"

            Try

                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteReader()

                If dr.HasRows() Then
                    dr.Read()

                    nomeLabel.Text = dr("nome")
                    emailLabel.Text = dr("email")
                    telefoneLabel.Text = "[" & dr("ddd") & "] " & dr("telefone")

                End If

            Catch ex As SqlClient.SqlException

            Finally

                dr.Close()
                Connection.Close()

            End Try

        Else

            nomeLabel.Text = Session("nome")
            emailLabel.Text = Session("emailUser")
            telefoneLabel.Text = Session("telefoneGestor")

        End If

    End Sub

    Sub GetPerfilVaga(idPerfilVagaLabel As Int32)

        REM *** ******************************************************************************************
        REM *** LISTA TODAS AS INFORMAÇÕES DO PERFIL DA VAGA (spPerfilVagaSelect_VIEW)
        REM *** ******************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spPerfilVagaSelect_VIEW", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idCadastroEmpresa_Filha", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa_Filha").Value = idCadastroEmpresaFilhaLabel.Text

        prm = New SqlParameter("@idPerfilVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            If dr("valorAceite") Is DBNull.Value Then
                valorAceiteTextBox.Text = "0,00"
            Else
                valorAceiteTextBox.Text = FormatCurrency(dr("valorAceite"))
            End If

            If dr("valorAprovado") Is DBNull.Value Then
                valorAprovadoTextBox.Text = "0,00"
            Else
                valorAprovadoTextBox.Text = FormatCurrency(dr("valorAprovado"))
            End If

            If dr("valorParcela") Is DBNull.Value Then
                valorParcelaTextBox.Text = "0,00"
            Else
                valorParcelaTextBox.Text = FormatCurrency(dr("valorParcela"))
            End If

            If dr("valorVaga") Is DBNull.Value Then
                valorVagaTextBox.Text = "0,00"
            Else
                valorVagaTextBox.Text = FormatCurrency(dr("valorVaga"))
            End If

            If dr("nroParcela") Is DBNull.Value Then
                nroParcelaTextBox.Text = "0,00"
            Else
                nroParcelaTextBox.Text = dr("nroParcela")
            End If

            If dr("vencimento") Is DBNull.Value Then
                vencimentoTextBox.Text = Now()
            Else
                vencimentoTextBox.Text = dr("vencimento")
            End If

            If dr("idRH_Gestor_Filho") Is DBNull.Value Then
            Else
                Try
                    DropDownListCesta.SelectedValue = dr("idRH_Gestor_Filho")
                Catch ex As Exception

                End Try
            End If

            dsPerfilVagaTextBox.Text = dr("dsPerfilVaga")
            dsfuncaoTextBox.Text = dr("Cargo")
            nrovagaTextBox.Text = dr("nrovaga")
            RadioButtonListconfidencial.SelectedValue = dr("confidencial")
            RadioButtonListTipoOportunidade.SelectedValue = dr("TipoOportunidade")

            If dr("Remuneracao") Is DBNull.Value Then
                RemuneracaoTextBox.Text = 0
            Else
                RemuneracaoTextBox.Text = FormatCurrency(dr("Remuneracao"))
            End If

            If dr("Honorario") Is DBNull.Value Then
                HonorarioTextBox.Text = 0
            Else
                HonorarioTextBox.Text = FormatCurrency(dr("Honorario"))
            End If

            If dr("RemuneracaoVariavel") Is DBNull.Value Then
                RemuneracaoVariavelTextBox.Text = 0
            Else
                RemuneracaoVariavelTextBox.Text = FormatCurrency(dr("RemuneracaoVariavel"))
            End If


            REM ** BeneficiosTextBox.Text = dr("Beneficios")
            REM ** LocalTrabalhoTextBox.Text = dr("LocalTrabalho")
            REM ** PerspectivaTextBox.Text = dr("Perspectiva")
            REM ** FaixaEtariaInicioTextBox.Text = dr("FaixaEtariaInicio")
            REM ** FaixaEtariaFimTextBox.Text = dr("FaixaEtariaFim")
            REM ** RadioButtonListSexo.SelectedValue = dr("sexo")
            REM ** QualificacaoHabilidadesEspecificasTextBox.Text = dr("QualificacaoHabilidadesEspecificas")
            REM ** PerfilComposicaoEquipeTextBox.Text = dr("PerfilComposicaoEquipe")
            REM ** PerfilGestorTextBox.Text = dr("PerfilGestor")
            REM ** DDownTipoFormacao.SelectedValue = dr("idTipoFormacao")
            REM ** idiomaTextBox.Text = dr("ConhecimentoIdioma")
            REM ** informaticaTextBox.Text = dr("ConhecimentoInformatica")
            REM ** CursoEspecificoTextBox.Text = dr("CursoEspecifico")
            REM ** ConhecimentoTextBox.Text = dr("Conhecimento")
            REM ** CompetenciaComportamentalTextBox.Text = dr("CompetenciaComportamental")
            REM ** CompetenciaProfissionalTextBox.Text = dr("CompetenciaProfissional")
            REM ** AspectoCriticoTextBox.Text = dr("AspectoCritico")
            REM ** PrincipalDesafioTextBox.Text = dr("PrincipalDesafio")
            REM ** RelacionamentoInternoTextBox.Text = dr("RelacionamentoInterno")
            REM ** RelacionamentoExternoTextBox.Text = dr("RelacionamentoExterno")
            REM ** RadioButtonListviagens.SelectedValue = dr("viagens")
            REM ** infoSobre_viagensTextBox.Text = dr("infoSobre_viagens")
            REM ** ObsComplementaresTextBox.Text = dr("ObsComplementares")
            REM ** EstruturaOrganizacionalTextBox.Text = dr("EstruturaOrganizacional")
            REM ** RadioButtonListAprovado.SelectedItem.Value = dr("perfil_vaga_aprovado")

            SqlConsultoresComercial.DataBind()
            DropDownListConsultor.DataBind()

            Try
                DropDownListConsultor.SelectedValue = dr("idRH_Gestor")
            Catch ex As Exception
                DropDownListConsultor.SelectedValue = ""
            End Try


            If dr("perfil_vaga_aprovado_comentario") Is DBNull.Value Then
                perfil_vaga_aprovado_comentarioTextBox.Text = ""
            Else
                perfil_vaga_aprovado_comentarioTextBox.Text = dr("perfil_vaga_aprovado_comentario")
            End If


        Else

            msn.Text = "Não encontrei o Perfil da Vaga."

        End If

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub LinkButtonAlterar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAlterar.Click
        REM *** ******************************************************************************************
        REM *** ALTERAR O PERFIL DA VAGA (UPDATE) (spPerfilVagaUpdate)
        REM *** ******************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spPerfilVagaUpdate_COMERCIAL", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idPerfilVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idstatusvaga", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idstatusvaga").Value = RadioButtonListAprovado.SelectedItem.Text
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = DropDownListConsultor.SelectedValue 'Session("idRH_Gestor")
        REM *** ******************************************************************************************
        prm = New SqlParameter("@idRH_Gestor_Filho", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor_Filho").Value = DropDownListCesta.SelectedValue
        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorVaga", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorVagaTextBox.Text = "" Or valorVagaTextBox.Text = "R$ __.___,__" Or valorVagaTextBox.Text = "R$ __.__0,00" Then
            cmd.Parameters("@valorVaga").Value = 0
        Else
            cmd.Parameters("@valorVaga").Value = Trim(Replace(Replace(Replace(valorVagaTextBox.Text, "_", ""), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorAceite", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorAceiteTextBox.Text = "" Or valorAceiteTextBox.Text = "R$ __.___,__" Or valorAceiteTextBox.Text = "R$ __.__0,00" Then
            cmd.Parameters("@valorAceite").Value = 0
        Else
            cmd.Parameters("@valorAceite").Value = Trim(Replace(Replace(Replace(valorAceiteTextBox.Text, "_", ""), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@nroParcela", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nroParcela").Value = nroParcelaTextBox.Text
        REM *** ******************************************************************************************

        prm = New SqlParameter("@vencimento", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If vencimentoTextBox.Text = "" Or valorVagaTextBox.Text = "__/__/____" Then
            cmd.Parameters("@vencimento").Value = DBNull.Value
        Else
            cmd.Parameters("@vencimento").Value = vencimentoTextBox.Text
        End If

        REM *** ******************************************************************************************

        prm = New SqlParameter("@valorParcela", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorParcelaTextBox.Text = "" Or valorParcelaTextBox.Text = "R$ __.___,__" Or valorParcelaTextBox.Text = "R$ __.__0,00" Then
            cmd.Parameters("@valorParcela").Value = 0
        Else
            cmd.Parameters("@valorParcela").Value = Trim(Replace(Replace(Replace(valorParcelaTextBox.Text, "_", ""), "R$", ""), ".", ""))
        End If

        REM *** ******************************************************************************************
        prm = New SqlParameter("@valorAprovado", SqlDbType.Money)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If valorAprovadoTextBox.Text = "" Or valorAprovadoTextBox.Text = "R$ __.___,__" Or valorAprovadoTextBox.Text = "R$ __.__0,00" Then
            cmd.Parameters("@valorAprovado").Value = 0
        Else
            cmd.Parameters("@valorAprovado").Value = Trim(Replace(Replace(Replace(valorAprovadoTextBox.Text, "_", ""), "R$", ""), ".", ""))
        End If

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteScalar
            cn.Close()
            msn.CssClass = "msnOK"
            msn.Text = "O Levantamento do Perfil da Vaga foi atualizado com sucesso!"
            FormPerfilOut.Visible = False
        Catch ex As Exception
            msn.CssClass = "msn"
            msn.Text = "Falha ao atualizar o Levantamento do Perfil da Vaga, avise o Administrador."
        End Try

        GridViewListaPerfil.DataBind()

    End Sub


    Protected Sub LinkButtonImprimir_Click(sender As Object, e As System.EventArgs)
        If idPerfilVagaLabel.Text <> "" Then
            Try
                Dim context As HttpContext = HttpContext.Current
                context.Items.Add("idCadastroEmpresaFilha", idCadastroEmpresaFilhaLabel.Text)
                context.Items.Add("idPerfilVaga", idPerfilVagaLabel.Text)
                context.Items.Add("idCadastroEmpresa", Session("idCadastroEmpresa"))
                context.Items.Add("Protocolo", ProtocoloLabel.Text)
                Server.Transfer("perfilVagaDoc.aspx", True)
            Catch ex As Exception

            End Try
        Else
            msn.CssClass = "msn"
            msn.Text = "Informe qual Levantamento de Perfil de Vaga deseja exportar para Word."
        End If
    End Sub

    Protected Sub LinkButtonAprGestor_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAprGestor.Click

        '[spIncPerfilVaga_EMPRESA]

        Dim UrlVerVagaDB As String = "/_anonimo/aprPerfilVaga.aspx?CammaleonFilhaCryp=" & criptografia.Criptografar(idCadastroEmpresaFilhaLabel.Text, "#!$a36?@") & "&CammaleonPerfilCryp=" & criptografia.Criptografar(idPerfilVagaLabel.Text, "#!$a36?@") & "&CammaleonEmpresaCryp=" & criptografia.Criptografar(idCadastroEmpresaPaiLabel.Text, "#!$a36?@") & "&CammaleonProtocoloCryp=" & criptografia.Criptografar(ProtocoloLabel.Text, "#!$a36?@")
        Dim UrlVerVaga As String = "/_anonimo/aprPerfilVaga.aspx?CammaleonFilhaCryp=" & criptografia.Criptografar(idCadastroEmpresaFilhaLabel.Text, "#!$a36?@") & "&CammaleonPerfilCryp=" & criptografia.Criptografar(idPerfilVagaLabel.Text, "#!$a36?@") & "&CammaleonEmpresaCryp=" & criptografia.Criptografar(idCadastroEmpresaPaiLabel.Text, "#!$a36?@") & "&CammaleonProtocoloCryp=" & criptografia.Criptografar(ProtocoloLabel.Text, "#!$a36?@") & "&CammaleonstatusCryp=" & criptografia.Criptografar(RadioButtonListAprovado.SelectedValue, "#!$a36?@") & "&CammaleonemailGestorCryp=" & criptografia.Criptografar(emailLabel.Text, "#!$a36?@")

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        'urlLabelT.Text
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim idpublica As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spIncPerfilVaga_EMPRESA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa").ToString


        prm = New SqlParameter("@idCadastroEmpresaFilha", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresaFilha").Value = idCadastroEmpresaFilhaLabel.Text

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@idRH_Gestor_Filho", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor_Filho").Value = DropDownListCesta.SelectedValue

        prm = New SqlParameter("@idUserEmpresa", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUserEmpresa").Value = idUserEmpresaLabel.Text

        prm = New SqlParameter("@mensagem", SqlDbType.VarChar, 2000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagem").Value = myReplace.ReplaceIn(msnTextBox.Text)

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = ProtocoloLabel.Text.ToString


        prm = New SqlParameter("@url", SqlDbType.VarChar, 2000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@url").Value = Application("urlapp") & UrlVerVagaDB


        prm = New SqlParameter("@dsVaga", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dsVaga").Value = dsfuncaoTextBox.Text


        prm = New SqlParameter("@apresentar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@apresentar").Value = 1

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            dr.Close()
        Catch ex As Exception

        End Try

        cn.Close()

        REM *** *********************************************************************************************
        REM *** ENVIA EMAIL AO GESTOR COM A URL CRYPTOGRAFADA



        Dim myEmail As New EmailSQL
        Dim myBody As New BodyEmail
        Dim Body As String = ""
        Dim sBody As String = ""
        Dim dbBody As String = ""
        Dim Status As Boolean = False



        Dim MODELO As String = "PerfilVaga"

        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>Consultor: " & Session("nome") & "<br>Protocolo de referência: " & ProtocoloLabel.Text & "<br>" & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>E-mail para contato: " & Session("emailUser") & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Clique no link abaixo para ver o Levantamento do Perfil de Vaga:<br>Para visualizar o Levantamento do Perfil de Vaga <a href='" & Application("urlapp") & UrlVerVaga & "'>[Clique aqui]</a>." & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBodySetup(MODELO, Application("idsetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)


        Status = myEmail.EnviamensagemSQL(sBody, nomeResLabel.Text, emailEmpresaLabel.Text, "Aprovação Levantamento Perfil de Vaga.")


        If Status Then
            FormPerfilOut.Visible = False
            PanelMensagemEnviada.Visible = True
            ImageEmail.ImageUrl = "~/images/emailEnviado.png"
            MSNEmail.Text = "Mensagem enviada com sucesso!"
        Else
            FormPerfilOut.Visible = False
            PanelMensagemEnviada.Visible = True
            ImageEmail.ImageUrl = "~/images/emailNaoEnviado.png"
            MSNEmail.Text = "Mensagem não foi enviada avise o administrador!"
            MSNEmail.CssClass = "msn"
        End If


        REM *** *********************************************************************************************

    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelMensagemEnviada.Visible = False
    End Sub

    Sub Check(sender As Object, e As EventArgs)
        BeneficiosTextBox.Text = ""
        Dim i As Int32
        For i = 0 To CheckBoxListBeneficio.Items.Count - 1
            If CheckBoxListBeneficio.Items(i).Selected Then
                BeneficiosTextBox.Text += CheckBoxListBeneficio.Items(i).Text + Chr(10)
            End If
        Next
    End Sub

    Protected Sub LinkButtonMesmo_Click(sender As Object, e As System.EventArgs) Handles LinkButtonMesmo.Click

        TextBoxCNPJ.Enabled = False

        ButtonAtualizar.Visible = True
        FormEmpresa.Visible = True
        FormPerfilOut.Visible = False

        nomeResTextBox0.Text = nomeResTextBox.Text
        emailTextBox0.Text = emailTextBox.Text
        cepTextBox0.Text = cepTextBox.Text
        enderecoTextBox0.Text = enderecoTextBox.Text
        bairroTextBox0.Text = bairroTextBox.Text
        cidadeTextBox0.Text = cidadeTextBox.Text
        DDUf0.SelectedValue = DDUf.SelectedValue
        paisDropDownList0.SelectedValue = paisDropDownList.SelectedValue
        ddd0.Text = ddd.Text
        telefone0.Text = telefone.Text

    End Sub

    Protected Sub DropDownListSelectEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.SelectedIndexChanged
        msn.Text = ""
        idCadastroEmpresaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
        NomeEmpresaLabel.Text = "<b>Empresa selecionada " & DropDownListSelectEmpresa.SelectedItem.Text & "</b>"
        NavActions.Visible = True
        FormPerfilOut.Visible = False
        AtualizaEmpresa()
    End Sub

    Protected Sub DropDownListConsultor_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListConsultor.DataBound
        Try
            Dim myDropDownListConsultor As DropDownList = DropDownListConsultor
            myDropDownListConsultor.Items.Insert(0, New ListItem("-- Selecione o Consultor --", ""))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ButtonCancelar_Click(sender As Object, e As System.EventArgs) Handles ButtonCancelar.Click
        Response.Redirect("/_comercial/_cadastroLevantamento.aspx?Info=30")
    End Sub
End Class
