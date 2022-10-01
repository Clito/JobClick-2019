Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ

Partial Class _admin_cadastraEmpresa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        paisDropDownList.SelectedValue = "Brasil"
        GetContrato()
    End Sub
    Protected Sub Cadastro_Click(sender As Object, e As System.EventArgs) Handles Cadastro.Click

        Session("PROMOCODE") = "0"

        Dim Protocolo As New geraProtocolo
        Dim ProtocoloEmpresa As String = Protocolo.getNrProtocoloEmpresa(Session("idSetup"))

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spGravaCadastroEmpresa_ASSOCIADO", cn)
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

        REM ** **************************************************************************************
        REM ** ASSOCIAÇÕES COMERCIAIS
        REM ** **************************************************************************************

        prm = New SqlParameter("@idCadastroEmpresa_Associacao", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa_Associacao").Value = Session("idCadastroEmpresa_layout")

        prm = New SqlParameter("@idCadastroEmpresa_Pai", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa_Pai").Value = Session("idCadastroEmpresa_layout")

        REM ** **************************************************************************************
        REM ** ASSOCIAÇÕES COMERCIAIS
        REM ** **************************************************************************************

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

        prm = New SqlParameter("@complemento", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@complemento").Value = Trim(complementoTextBox.Text)


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


        prm = New SqlParameter("@telefone", SqlDbType.VarChar, 10)
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

        cmd.Parameters("@idParceiro").Value = ""


        prm = New SqlParameter("@EmpresaAssociada", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@EmpresaAssociada").Value = RadioButtonListASSOCIADO.SelectedValue


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

                cn.Close()

                FormsAuthentication.SetAuthCookie(empresa.idTypeUser, False)
                Response.Redirect(empresa.url)

            Catch ex As Exception

                lblmsn.Text = "Falha ao cadastrar a empresa no sistema JobClick."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "Falha ao cadastrar o Associado no sistema."
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/images/buttonNOK.png"

            End Try


        Else

            lblmsn.Text = "Erro ao cadastrar sua empresa, CNPJ já cadastrado!"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao cadastrar o Associado, CNPJ já cadastrado!."
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/images/buttonNOK.png"

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
            paisDropDownList.SelectedValue = "Brasil"
            nrTextBox.Focus()

        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If

        dr.Close()
        cn.Close()

    End Sub


    Protected Sub TextBoxCNPJ_TextChanged(sender As Object, e As System.EventArgs) Handles TextBoxCNPJ.TextChanged
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
                        PanelAviso.Visible = True
                        AVISOLABEL.Text = "[" & dr("CNPJ") & "] já cadastrado no sistema."
                        AVISOLABEL.CssClass = "msn"
                        ImageAVISO.ImageUrl = "~/images/buttonNOK.png"
                    Else
                        Session("VarError") = True
                        lblmsnOK.Text = "[Ok!]"
                    End If

                    dr.Close()

                Catch ex As Exception
                    lblmsn.Text = "Erro ao pesquisar o CNPJ..."
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "Erro ao pesquisar o CNPJ..."
                    AVISOLABEL.CssClass = "msn"
                    ImageAVISO.ImageUrl = "~/images/buttonNOK.png"
                End Try

                cn.Close()
            Else
                lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "CNPJ não é válido, informe um CNPJ válido."
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/images/buttonNOK.png"
            End If

        End If
    End Sub

    Sub GetContrato()

        Dim idCadastroEmpresa_layout As String = Session("idCadastroEmpresa_layout")
        Dim oSQL As String
        If idCadastroEmpresa_layout <> "" Then
            oSQL = "SELECT dbo.tbContratoOnLine.idContratoOnline, dbo.tbContratoOnLine.idSetup, dbo.tbContratoOnLine.ContratoOnLine, dbo.tbContratoOnLine.Modelo, dbo.tbsetup.idCadastroEmpresa FROM dbo.tbContratoOnLine INNER JOIN dbo.tbsetup ON dbo.tbContratoOnLine.idSetup = dbo.tbsetup.idsetup WHERE (dbo.tbsetup.idCadastroEmpresa = " & Session("idCadastroEmpresa_layout") & ") AND (Modelo='CadastroEmpresa')"
        Else
            oSQL = "SELECT dbo.tbContratoOnLine.idContratoOnline, dbo.tbContratoOnLine.idSetup, dbo.tbContratoOnLine.ContratoOnLine, dbo.tbContratoOnLine.Modelo, dbo.tbsetup.idCadastroEmpresa FROM dbo.tbContratoOnLine INNER JOIN dbo.tbsetup ON dbo.tbContratoOnLine.idSetup = dbo.tbsetup.idsetup WHERE (dbo.tbsetup.idCadastroEmpresa = 1) AND (Modelo='CadastroEmpresa')"
        End If

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then
            oReader.Read()
            TextBoxCondicoes.Text = Replace(Replace(oReader("ContratoOnLine"), "<br />", Chr(10)), "<br>", Chr(10))
        End If

        oConnection.Close()

    End Sub

End Class
