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

Partial Class _empresa_atualizacadastroCliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        Else
            idCadastroEmpresaFilhaLabel.Text = idCadastroEmpresaFilha
            idCadastroEmpresaLabel.Text = Session("IdCadastroEmpresa")
            If Not IsPostBack Then
                GetDadosEmpresa()
            End If
        End If
    End Sub

    Sub GetDadosEmpresa()


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
                nomeResTextBox.Text = dr("nomeRes")

                idUserEmpresaLabel.Text = dr("idUser")

                cepTextBox.Text = dr("cep")

                enderecoTextBox.Text = dr("endereco")

                bairroTextBox.Text = dr("bairro")
                cidadeTextBox.Text = dr("cidade")
                DDUf.SelectedValue = dr("uf")
                ddd.Text = dr("ddd")
                telefone.Text = dr("telefone")

                idAreaAtuacaoDropDownList.SelectedValue = dr("idAreaAtuacao")
                idPorteRadioButtonList.SelectedValue = dr("idPorte")

                Select Case dr("privacidade")
                    Case True
                        PrivacidadeRadioButtonList.SelectedValue = 1
                    Case False
                        PrivacidadeRadioButtonList.SelectedValue = 0
                End Select

                tempoexistenciaLabel.Text = dr("tempoexistencia")

                siteTextBox.Text = dr("site")

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
            lblmsn.Text = "Erro ao ler os dados da empresa."
        End Try

        cn.Close()

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

    Public Sub PesquisaCNPJ(ByVal sender As Object, ByVal e As System.EventArgs)

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

    End Sub

    Protected Sub paisDropDownList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles paisDropDownList.DataBound
        paisDropDownList.SelectedValue = "Brasil"
    End Sub

    Protected Sub GridViewCliente_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCliente.SelectedIndexChanged

        FormEmpresa.Visible = True

        idCadastroEmpresaLabel.Text = GridViewCliente.SelectedDataKey("idCadastroEmpresa_Pai")
        idCadastroEmpresaFilhaLabel.Text = GridViewCliente.SelectedDataKey("idCadastroEmpresa")
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text

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
                nomeResTextBox.Text = dr("nomeRes")

                idUserEmpresaLabel.Text = dr("idUser")

                cepTextBox.Text = dr("cep")

                enderecoTextBox.Text = dr("endereco")

                bairroTextBox.Text = dr("bairro")
                cidadeTextBox.Text = dr("cidade")
                DDUf.SelectedValue = dr("uf")
                ddd.Text = dr("ddd")
                telefone.Text = dr("telefone")

                idAreaAtuacaoDropDownList.SelectedValue = dr("idAreaAtuacao")
                idPorteRadioButtonList.SelectedValue = dr("idPorte")

                Select Case dr("privacidade")
                    Case True
                        PrivacidadeRadioButtonList.SelectedValue = 1
                    Case False
                        PrivacidadeRadioButtonList.SelectedValue = 0
                End Select


                tempoexistenciaLabel.Text = dr("tempoexistencia")

                siteTextBox.Text = dr("site")

                userNameTextBox.Text = dr("userName")
                userNameTextBox.Enabled = False
                passwordTextBox.Text = dr("password")
                passwordTextBox.Enabled = False
                fraseTextBox.Text = dr("frase")
                fraseTextBox.Enabled = False

                emailTextBox.Text = dr("email")
                emailTextBox.Enabled = False

                lblmsn.Text = ""

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

                REM **************************************************************************************
                REM ENDEREÇO DE COBRANÇA
                REM **************************************************************************************

            End If

            dr.Close()

        Catch ex As Exception
            lblmsn.Text = "Erro ao ler os dados da empresa."
        End Try

        cn.Close()

    End Sub

    Protected Sub paisDropDownList0_DataBound(sender As Object, e As System.EventArgs) Handles paisDropDownList0.DataBound
        paisDropDownList0.SelectedValue = "Brasil"
    End Sub

    Protected Sub ImageButtonSalvar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonSalvar.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spEmpresaUpdate", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresaFilha")

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
            dr.Close()

        Catch ex As Exception

            lblmsn.CssClass = "msn"
            lblmsn.Text = "Erro ao gravar os dados da empresa."

        End Try

        cn.Close()


        TextBoxCNPJ.Enabled = False
        userNameTextBox.Enabled = False
        passwordTextBox.Enabled = False
        fraseTextBox.Enabled = False
        emailTextBox.Enabled = False


    End Sub

    Protected Sub ImageButtonCancelar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCancelar.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub LinkButtonMesmo_Click(sender As Object, e As System.EventArgs) Handles LinkButtonMesmo.Click
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
End Class
