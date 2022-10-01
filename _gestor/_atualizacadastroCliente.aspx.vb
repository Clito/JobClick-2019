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

        PanelAviso.Visible = False

        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa_Pai")
        idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresa_Filha")

        If Not IsPostBack Then
            GetEMPRESA()
        End If

    End Sub

    Sub GetEMPRESA()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spEmpresaSelect", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa_Filha")

        prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa_Pai").Value = Session("idCadastroEmpresa_Pai")

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

    Protected Sub ButtonAtualizar_Click(sender As Object, e As System.EventArgs) Handles ButtonAtualizar.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[spEmpresaGESTORUpdate]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaFilhaLabel.Text  'Session("idCadastroEmpresa_Filha")

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
        cmd.Parameters("@telefone").Value = Replace(telefone.Text, "_", "")

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
            ButtonCancelar.Text = "Ok (Continuar)"
            dr.Close()

            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Dados da empresa foram atualizados.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_gestor/images/buttonOK.png"

            GetEMPRESA()

        Catch ex As Exception

            lblmsn.CssClass = "msn"
            lblmsn.Text = "Erro ao gravar os dados da empresa." & Err.Description

            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Erro ao gravar os dados da empresa.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_gestor/images/buttonNOK.png"

        End Try

        cn.Close()


        TextBoxCNPJ.Enabled = False
        userNameTextBox.Enabled = False
        passwordTextBox.Enabled = False
        fraseTextBox.Enabled = False
        emailTextBox.Enabled = False


    End Sub

    Protected Sub ButtonCancelar_Click(sender As Object, e As System.EventArgs) Handles ButtonCancelar.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
