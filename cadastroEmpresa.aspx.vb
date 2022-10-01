Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ

Partial Class _anonimo_cadastroEmpresa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            emailTextBox.Focus()

            Dim myPROMOCODE As String = Session("PROMOCODE")

            If Session("PROMOCODE") <> "0" And myPROMOCODE <> "" Then
                LinkButtonPromocode.Text = "Ativar o meu PROMOCODE!"
                msnPROMOCODE.CssClass = "msnOK"
                msnPROMOCODE.Text = "Agora é só concluir seu cadastro!"
                PROMOCODETextBox.Text = Session("PROMOCODE")
            Else
                LinkButtonPromocode.Text = "PROMOCODE Ativo"
                LinkButtonPromocode.Enabled = False
                msnPROMOCODE.CssClass = "msn"
                msnPROMOCODE.Text = ""
                PROMOCODETextBox.Text = ""
            End If

        End If

        LBNormas.Visible = True


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
            nrTextBox.Focus()

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

            If ValidaCNPJres.ValidaCNPJ(Replace(TextBoxCNPJ.Text, "_", "0")) Then

                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("spBuscaCNPJ", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@CNPJ", SqlDbType.VarChar, 20)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                cmd.Parameters("@CNPJ").Value = TextBoxCNPJ.Text

                Try

                    cn.Open()

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

    Protected Sub LBNormas_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBNormas.Click

        Panel1.Visible = True
        LBNormas.Visible = False

        lblContrato.Text = ""

        Dim oSQL As String = "SELECT idContratoOnline, idSetup, ContratoOnLine, Modelo FROM tbContratoOnLine WHERE (Modelo = 'CadastroEmpresa') AND (idSetup = " & Session("idsetup") & ")"

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
    End Sub

    Protected Sub paisDropDownList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles paisDropDownList.DataBound
        paisDropDownList.SelectedValue = "Brasil"
    End Sub

 

    Sub LIBERAPROMOCODE(idCadastroEmpresa As Int32, IdStatus As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LIBERA_PROMOCODE_CARTAO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@IdStatus", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@PROMOCODE", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@IdStatus").Value = IdStatus
        cmd.Parameters("@PROMOCODE").Value = Session("PROMOCODE")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

        End If

        dr.Close()
        cn.Close()

        SomaSMS(idCadastroEmpresa, 200)
        ENVIAMENSAGEM()

    End Sub

    Sub ENVIAMENSAGEM()

        Dim BodyEmailRES As String = ""
        Dim MENSAGEMRES As String = ""
        MENSAGEMRES = "PROMOCODE_CARTAO"

        Dim myEnviaEmail As New EmailSQL
        Dim myBodyEmail As New BodyEmail

        BodyEmailRES = Replace(Replace(Replace(Replace(myBodyEmail.GetBodySetup(MENSAGEMRES, 1), "#1#", "Informações sobre a liberação do Promocode " & Session("PROMOCODE") & " JobClick e-Recruitment"), "#2#", Session("nmempresa")), "#3#", Session("nomeRes")), "#4#", "[Confirmação de liberação de seu Promocode JOBCLICK].")
        myEnviaEmail.EnviamensagemSQL(BodyEmailRES, Session("nomeRes"), Session("emailUser"), "Seu Promocode no JobClick e-Recruitment")

    End Sub
    Sub SomaSMS(idCadastroEmpresa As Int32, QTDCota As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CREDITO_SMS", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@QTDCota", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@QTDCota").Value = QTDCota

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub PROMOCODETextBox_TextChanged(sender As Object, e As System.EventArgs) Handles PROMOCODETextBox.TextChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROMOCODE_VERIFICA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@PROMOCODE", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@PROMOCODE").Value = PROMOCODETextBox.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            If dr("idCadastroEmpresa") = "0" Then
                Session("PROMOCODE") = dr("PROMOCODE")
                LinkButtonPromocode.Text = "Ativar o meu PROMOCODE!"
                msnPROMOCODE.CssClass = "msnOK"
                msnPROMOCODE.Text = "Agora é só concluir seu cadastro!"
            Else
                Session("PROMOCODE") = "0"
                LinkButtonPromocode.Text = "PROMOCODE Inválido"
                LinkButtonPromocode.Enabled = False
                msnPROMOCODE.CssClass = "msn"
                msnPROMOCODE.Text = "Promocode já utilizado!"
            End If
        Else
            Session("PROMOCODE") = "0"
            LinkButtonPromocode.Text = "PROMOCODE Ativo"
            LinkButtonPromocode.Enabled = False
            msnPROMOCODE.CssClass = "msn"
            msnPROMOCODE.Text = "O Código não está disponível!"
        End If

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub LinkButtonPromocode_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPromocode.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROMOCODE_VERIFICA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@PROMOCODE", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@PROMOCODE").Value = PROMOCODETextBox.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            If dr("idCadastroEmpresa") = "0" Then
                Session("PROMOCODE") = dr("PROMOCODE")
                LinkButtonPromocode.Text = "Ativar o meu PROMOCODE!"
                msnPROMOCODE.CssClass = "msnOK"
                msnPROMOCODE.Text = "Agora é só concluir seu cadastro!"
            Else
                Session("PROMOCODE") = "0"
                LinkButtonPromocode.Text = "PROMOCODE Inválido"
                LinkButtonPromocode.Enabled = False
                msnPROMOCODE.CssClass = "msn"
                msnPROMOCODE.Text = "Promocode já utilizado!"
            End If
        Else
            Session("PROMOCODE") = "0"
            LinkButtonPromocode.Text = "PROMOCODE Ativo"
            LinkButtonPromocode.Enabled = False
            msnPROMOCODE.CssClass = "msn"
            msnPROMOCODE.Text = "O Código não está disponível!"
        End If

        dr.Close()
        cn.Close()
    End Sub

    Protected Sub Cadastro_Click(sender As Object, e As System.EventArgs) Handles Cadastro.Click

        Dim PROMOCODE As String = Session("PROMOCODE")

        If PROMOCODE = "" Then
            REM ** O USUÁRIO NÃO FEZ PESQUISA SOBRE O PROMOCODE
            Session("PROMOCODE") = "0"
        End If

        Dim Protocolo As New geraProtocolo
        Dim ProtocoloEmpresa As String = Protocolo.getNrProtocoloEmpresa(Session("idSetup"))

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spGravaCadastroEmpresaCE", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@userName", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@userName").Value = ProtocoloEmpresa


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

        cmd.Parameters("@endereco").Value = enderecoTextBox.Text.ToString & " " & nrTextBox.Text


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


        prm = New SqlParameter("@privacidade", SqlDbType.Bit)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        Select Case PrivacidadeRadioButtonList.SelectedValue
            Case "1"
                cmd.Parameters("@privacidade").Value = 1
            Case "0"
                cmd.Parameters("@privacidade").Value = 0
        End Select


        prm = New SqlParameter("@tempoexistencia", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@tempoexistencia").Value = tempoexistenciaTextBox.Text


        prm = New SqlParameter("@site", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@site").Value = siteTextBox.Text


        prm = New SqlParameter("@PROMOCODE", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@PROMOCODE").Value = Session("PROMOCODE")

        prm = New SqlParameter("@idParceiro", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idParceiro").Value = idparceiro.Value


        If Session("VarError") Then

            Try

                cn.Open()

                Dim dr As SqlDataReader = cmd.ExecuteReader

                lblmsn.Text = "Empresa cadastrada no sistema JobClick..."

                dr.Close()

                Dim AutoLogon As New user

                Dim empresa As userEmpresa = New userEmpresa
                empresa = userEmpresaService.GetDadoEmpresa(passwordTextBox.Text, emailTextBox.Text)

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

                FormsAuthentication.SetAuthCookie(empresa.idTypeUser, False)

                REM ** *****************************************************************************************************
                REM ** CASO O CADASTRO TENHA SIDO CONCLUÍDO...
                REM ** *****************************************************************************************************

                If Session("PROMOCODE") <> "0" Then
                    LIBERAPROMOCODE(Session("idCadastroEmpresa"), 1)
                End If

                Response.Redirect(empresa.url)

                cn.Close()

            Catch ex As Exception

                lblmsn.Text = "Falha ao cadastrar a empresa no sistema JobClick."

            End Try


        Else

            lblmsn.Text = "Erro ao cadastrar sua empresa, CNPJ já cadastrado!"

        End If
    End Sub
End Class
