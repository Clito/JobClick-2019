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
Partial Class _empresa_cadastroCliente
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Request.QueryString("autoTit") <> "" Then
            LabelCabec.Text = Request.QueryString("autoTit")
        Else
            LabelCabec.Text = "Cadastro de uma nova Conta"
        End If

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")
        TextBoxIE.Text = "Isento"
    End Sub

    Sub GRAVA_EMPRESA()


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ

        Session("VarError") = False ' NÃO LIBERA O CADASTRO

        Dim LiberaParaGravar As Int32 = ContaGestor(passwordTextBoxCADASTROEMPRESA.Text, emailTextBoxCADASTROEMPRESA.Text, userNameTextBox.Text)

        If LiberaParaGravar = 0 Then

            REM ** ***************************************************************************************
            REM ** VERIFICA CNPJ
            REM ** ***************************************************************************************

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
                            lblmsn.Text = "CNPJ já cadastrado no sistema."
                            Session("VarError") = False
                        Else
                            lblmsnOK.Text = "[Verificado!]"
                            Session("VarError") = True
                        End If

                        dr.Close()

                    Catch ex As Exception
                        Session("VarError") = False
                        lblmsn.Text = "Erro ao pesquisar o CNPJ."
                    End Try

                    cn.Close()


                    REM ** ***************************************************************************************
                    REM ** [FIM] VERIFICA CNPJ
                    REM ** ***************************************************************************************

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

                    cmd.Parameters("@password").Value = passwordTextBoxCADASTROEMPRESA.Text.ToString


                    prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@email").Value = emailTextBoxCADASTROEMPRESA.Text.ToString


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

                    prm = New SqlParameter("@ie", SqlDbType.VarChar, 20)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@ie").Value = TextBoxIE.Text.ToString

                    prm = New SqlParameter("@emailRes", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@emailRes").Value = emailTextBoxCADASTROEMPRESA.Text.ToString

                    prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@nomeRes").Value = nomeResTextBox.Text.ToString

                    prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
                    prm.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(prm)

                    cmd.Parameters("@endereco").Value = enderecoTextBox.Text & numeroTextBox1.Text

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

                    If Session("VarError") Then
                        Try
                            cn.Open()
                            Dim dr As SqlDataReader = cmd.ExecuteReader
                            dr.Read()
                            Session("idCadastroEmpresaFilha") = dr("idCadastroEmpresa")
                            lblmsn.CssClass = "msnOK"
                            lblmsn.Text = "Empresa cadastrada no sistema!"
                            dr.Close()
                            cn.Close()

                        Catch ex As Exception
                            lblmsn.Text = "Falha ao cadastra a Empresa no sistema."
                            PanelAviso.Visible = True
                            AVISOLABEL.Text = "• Falha ao cadastra a Empresa no sistema.<br>"
                            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                        End Try
                    Else
                        lblmsn.Text = "Falha geral"
                        PanelAviso.Visible = True
                        AVISOLABEL.Text = "• Falha ao gravar a empresa!<br>"
                        AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                    End If

                Else
                    lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "• CNPJ não é válido, informe um CNPJ válido.<br>"
                    AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                    ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                End If

            Else
                lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• CNPJ não é válido, informe um CNPJ válido!<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
            End If

        Else
            lblmsn.Text = "Conta de acesso já existe!"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Conta de acesso já existe!<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
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

    Protected Sub paisDropDownList0_DataBound(sender As Object, e As System.EventArgs) Handles paisDropDownList0.DataBound
        paisDropDownList0.SelectedValue = "Brasil"
    End Sub

    Protected Sub LinkButtonMesmo_Click(sender As Object, e As System.EventArgs) Handles LinkButtonMesmo.Click
        nomeResTextBox0.Text = nomeResTextBox.Text
        cepTextBox0.Text = cepTextBox.Text
        enderecoTextBox0.Text = enderecoTextBox.Text
        bairroTextBox0.Text = bairroTextBox.Text
        cidadeTextBox0.Text = cidadeTextBox.Text
        DDUf0.SelectedValue = DDUf.SelectedValue
        paisDropDownList0.SelectedValue = paisDropDownList.SelectedValue
        ddd0.Text = ddd.Text
        telefone0.Text = telefone.Text
    End Sub

    Protected Sub LinkButtonCadastrarCliente_Click(sender As Object, e As EventArgs) Handles LinkButtonCadastrarCliente.Click
        GRAVA_EMPRESA()
    End Sub

    Protected Sub LinkButtonCancelarCliente_Click(sender As Object, e As EventArgs) Handles LinkButtonCancelarCliente.Click
        Response.Redirect("default.aspx")
    End Sub

    Function ContaGestor(passwordTextBox As String, emailTextBox As String, userNameTextBox As String) As Int32

        Dim LiberaParaGravar As Int32 = 1 ' NÂO LIBERA O CADASTRO

        REM ** ***************************************************************************************************
        REM ** VERIFICA SE EXISTE UMA CONTA JÁ CADASTRADA NO SISTEMA!!!
        REM ** ***************************************************************************************************

        If userNameTextBox = "" Or passwordTextBox = "" Or emailTextBox = "" Then
            CONTAMSN.Text = "Informe os dados de acesso para o Gestor desta Empresa!"
        End If

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_VERIFICA_CRIACAO_CONTA_DE_ACESSO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@userName", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@userName").Value = userNameTextBox REM ** EMBORA ENVIADO NÃO ESTÁ SENDO UTILIZADO NA SP

        prm = New SqlParameter("@password", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@password").Value = passwordTextBox

        prm = New SqlParameter("@email", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@email").Value = emailTextBox

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            If dr("VERIFICADOR") = 1 Then
                CONTAMSN.Text = "Esta conta já existe no sistema, favor mudar os dados de acesso do Gestor."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Esta conta já existe no sistema, favor mudar os dados de acesso do Gestor.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
                LiberaParaGravar = 1 '<- NÃO LIBERA PARA CADASTRO
            Else
                LiberaParaGravar = 0 '<- LIBERA PARA CADASTRO
            End If
        End If

        dr.Close()
        cn.Close()

        Return LiberaParaGravar

    End Function
End Class
