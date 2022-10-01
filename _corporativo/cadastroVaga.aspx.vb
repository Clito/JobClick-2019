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

        AutenticadoLabel.Text = HttpContext.Current.User.Identity.Name

        nomeGestorLabel.Text = Session("nomeGESTOR")
        emailGestorLabel.Text = Session("emailGESTOR")
        PanelPreviewVaga.Visible = False
        PanelAviso.Visible = False

        If Not IsPostBack Then

            If CheckBoxPerspectiva.Checked Then
                PerspectivaTextBox.Enabled = False
                PerspectivaTextBox.Height = "20"
                PerspectivaTextBox.Text = "Não informado"
            Else
                PerspectivaTextBox.Enabled = True
                PerspectivaTextBox.Height = "50"
                PerspectivaTextBox.Text = ""
            End If


            If CheckBoxPerfil.Checked Then
                PerfilComposicaoEquipeTextBox.Enabled = False
                PerfilComposicaoEquipeTextBox.Height = "20"
                PerfilComposicaoEquipeTextBox.Text = "Não informado"
            Else
                PerfilComposicaoEquipeTextBox.Enabled = True
                PerfilComposicaoEquipeTextBox.Height = "50"
                PerfilComposicaoEquipeTextBox.Text = ""
            End If

            If CheckBoxPerfilGestor.Checked Then
                PerfilGestorTextBox.Enabled = False
                PerfilGestorTextBox.Height = "20"
                PerfilGestorTextBox.Text = "Não informado"
            Else
                PerfilGestorTextBox.Enabled = True
                PerfilGestorTextBox.Height = "50"
                PerfilGestorTextBox.Text = ""
            End If

            If CheckBoxIdioma.Checked Then
                idiomaTextBox.Enabled = False
                PanelIDIOMA.Visible = False
                idiomaTextBox.Height = "20"
                idiomaTextBox.Text = "Não informado"
            Else
                idiomaTextBox.Enabled = True
                PanelIDIOMA.Visible = True
                idiomaTextBox.Height = "50"
                idiomaTextBox.Text = ""
            End If

            If CheckBoxInformatica.Checked Then
                informaticaTextBox.Enabled = False
                PanelInformatica.Visible = False
                informaticaTextBox.Height = "20"
                informaticaTextBox.Text = "Não informado"
            Else
                informaticaTextBox.Enabled = True
                PanelInformatica.Visible = True
                informaticaTextBox.Height = "50"
                informaticaTextBox.Text = ""
            End If

            If CheckBoxCurso.Checked Then
                CursoEspecificoTextBox.Enabled = False
                CursoEspecificoTextBox.Height = "20"
                CursoEspecificoTextBox.Text = "Não informado"
            Else
                CursoEspecificoTextBox.Enabled = True
                CursoEspecificoTextBox.Height = "50"
                CursoEspecificoTextBox.Text = ""
            End If

            If CheckBoxConhecimento.Checked Then
                ConhecimentoTextBox.Enabled = False
                ConhecimentoTextBox.Height = "20"
                ConhecimentoTextBox.Text = "Não informado"
            Else
                ConhecimentoTextBox.Enabled = True
                ConhecimentoTextBox.Height = "50"
                ConhecimentoTextBox.Text = ""
            End If

            If CheckBoxCompetencia.Checked Then
                CompetenciaComportamentalTextBox.Enabled = False
                PanelCOMPORTAMENTAL.Visible = False
                CompetenciaComportamentalTextBox.Height = "20"
                CompetenciaComportamentalTextBox.Text = "Não informado"
            Else
                CompetenciaComportamentalTextBox.Enabled = True
                PanelCOMPORTAMENTAL.Visible = True
                CompetenciaComportamentalTextBox.Height = "50"
                CompetenciaComportamentalTextBox.Text = ""
            End If

            If CheckBoxCProfissional.Checked Then
                CompetenciaProfissionalTextBox.Enabled = False
                PanelPROFISSIONAL.Visible = False
                CompetenciaProfissionalTextBox.Height = "20"
                CompetenciaProfissionalTextBox.Text = "Não informado"
            Else
                CompetenciaProfissionalTextBox.Enabled = True
                PanelPROFISSIONAL.Visible = True
                CompetenciaProfissionalTextBox.Height = "50"
                CompetenciaProfissionalTextBox.Text = ""
            End If

            If CheckBoxAspectos.Checked Then
                AspectoCriticoTextBox.Enabled = False
                AspectoCriticoTextBox.Height = "20"
                AspectoCriticoTextBox.Text = "Não informado"
            Else
                AspectoCriticoTextBox.Enabled = True
                AspectoCriticoTextBox.Height = "50"
                AspectoCriticoTextBox.Text = ""
            End If

            If CheckBoxDesafios.Checked Then
                PrincipalDesafioTextBox.Enabled = False
                PrincipalDesafioTextBox.Height = "20"
                PrincipalDesafioTextBox.Text = "Não informado"
            Else
                PrincipalDesafioTextBox.Enabled = True
                PrincipalDesafioTextBox.Height = "50"
                PrincipalDesafioTextBox.Text = ""
            End If

            If CheckBoxRelacionamentoI.Checked Then
                RelacionamentoInternoTextBox.Enabled = False
                RelacionamentoInternoTextBox.Height = "20"
                RelacionamentoInternoTextBox.Text = "Não informado"
            Else
                RelacionamentoInternoTextBox.Enabled = True
                RelacionamentoInternoTextBox.Height = "50"
                RelacionamentoInternoTextBox.Text = ""
            End If

            If CheckBoxRelacionamentoE.Checked Then
                RelacionamentoExternoTextBox.Enabled = False
                RelacionamentoExternoTextBox.Height = "20"
                RelacionamentoExternoTextBox.Text = "Não informado"
            Else
                RelacionamentoExternoTextBox.Enabled = True
                RelacionamentoExternoTextBox.Height = "50"
                RelacionamentoExternoTextBox.Text = ""
            End If

            If CheckBoxViagem.Checked Then
                infoSobre_viagensTextBox.Enabled = False
                infoSobre_viagensTextBox.Height = "20"
                infoSobre_viagensTextBox.Text = "Não informado"
            Else
                infoSobre_viagensTextBox.Enabled = True
                infoSobre_viagensTextBox.Height = "50"
                infoSobre_viagensTextBox.Text = ""
            End If

            If CheckBoxObservacao.Checked Then
                ObsComplementaresTextBox.Enabled = False
                ObsComplementaresTextBox.Height = "20"
                ObsComplementaresTextBox.Text = "Não informado"
            Else
                ObsComplementaresTextBox.Enabled = True
                ObsComplementaresTextBox.Height = "50"
                ObsComplementaresTextBox.Text = ""
            End If

            If CheckBoxExtrutura.Checked Then
                EstruturaOrganizacionalTextBox.Enabled = False
                EstruturaOrganizacionalTextBox.Height = "20"
                EstruturaOrganizacionalTextBox.Text = "Não informado"
            Else
                EstruturaOrganizacionalTextBox.Enabled = True
                EstruturaOrganizacionalTextBox.Height = "50"
                EstruturaOrganizacionalTextBox.Text = ""
            End If

            idRH_GestorLabel.Text = Session("idRH_Gestor")

            If Request.QueryString("idVagaAnuncioPREVIEW") <> "" Then
                ABRE_PREVIEW_VAGA(Request.QueryString("idVagaAnuncioPREVIEW"))
            Else
                CRIAPREVIEW_VAGA()
            End If

        End If

        msn.Text = ""

    End Sub

    REM ** **********************************************************************************************************************
    REM ** DESABILITA ALGUNS CAMPO 
    REM ** **********************************************************************************************************************
    Protected Sub CheckBoxPerspectiva_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxPerspectiva.CheckedChanged
        If CheckBoxPerspectiva.Checked Then
            PerspectivaTextBox.Enabled = False
            PerspectivaTextBox.Height = "20"
            PerspectivaTextBox.Text = "Não informado"
        Else
            PerspectivaTextBox.Focus()
            PerspectivaTextBox.Enabled = True
            PerspectivaTextBox.Height = "50"
            PerspectivaTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxPerfil_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxPerfil.CheckedChanged
        If CheckBoxPerfil.Checked Then
            PerfilComposicaoEquipeTextBox.Enabled = False
            PerfilComposicaoEquipeTextBox.Height = "20"
            PerfilComposicaoEquipeTextBox.Text = "Não informado"
        Else
            PerfilComposicaoEquipeTextBox.Focus()
            PerfilComposicaoEquipeTextBox.Enabled = True
            PerfilComposicaoEquipeTextBox.Height = "50"
            PerfilComposicaoEquipeTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxPerfilGestor_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxPerfilGestor.CheckedChanged
        If CheckBoxPerfilGestor.Checked Then
            PerfilGestorTextBox.Enabled = False
            PerfilGestorTextBox.Height = "20"
            PerfilGestorTextBox.Text = "Não informado"
        Else
            PerfilGestorTextBox.Focus()
            PerfilGestorTextBox.Enabled = True
            PerfilGestorTextBox.Height = "50"
            PerfilGestorTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxIdioma_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxIdioma.CheckedChanged
        If CheckBoxIdioma.Checked Then
            idiomaTextBox.Enabled = False
            PanelIDIOMA.Visible = False
            idiomaTextBox.Height = "20"
            idiomaTextBox.Text = "Não informado"
        Else
            idiomaTextBox.Focus()
            idiomaTextBox.Enabled = True
            PanelIDIOMA.Visible = True
            idiomaTextBox.Height = "50"
            idiomaTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxInformatica_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxInformatica.CheckedChanged
        If CheckBoxInformatica.Checked Then
            informaticaTextBox.Enabled = False
            PanelInformatica.Visible = False
            informaticaTextBox.Height = "20"
            informaticaTextBox.Text = "Não informado"
        Else
            informaticaTextBox.Focus()
            informaticaTextBox.Enabled = True
            PanelInformatica.Visible = True
            informaticaTextBox.Height = "50"
            informaticaTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxCurso_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxCurso.CheckedChanged
        If CheckBoxCurso.Checked Then
            CursoEspecificoTextBox.Enabled = False
            CursoEspecificoTextBox.Height = "20"
            CursoEspecificoTextBox.Text = "Não informado"
        Else
            CursoEspecificoTextBox.Focus()
            CursoEspecificoTextBox.Enabled = True
            CursoEspecificoTextBox.Height = "50"
            CursoEspecificoTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxConhecimento_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxConhecimento.CheckedChanged
        If CheckBoxConhecimento.Checked Then
            ConhecimentoTextBox.Enabled = False
            ConhecimentoTextBox.Height = "20"
            ConhecimentoTextBox.Text = "Não informado"
        Else
            ConhecimentoTextBox.Focus()
            ConhecimentoTextBox.Enabled = True
            ConhecimentoTextBox.Height = "50"
            ConhecimentoTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxCompetencia_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxCompetencia.CheckedChanged
        If CheckBoxCompetencia.Checked Then
            CompetenciaComportamentalTextBox.Enabled = False
            PanelCOMPORTAMENTAL.Visible = False
            CompetenciaComportamentalTextBox.Height = "20"
            CompetenciaComportamentalTextBox.Text = "Não informado"
        Else
            CompetenciaComportamentalTextBox.Focus()
            CompetenciaComportamentalTextBox.Enabled = True
            PanelCOMPORTAMENTAL.Visible = True
            CompetenciaComportamentalTextBox.Height = "50"
            CompetenciaComportamentalTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxCProfissional_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxCProfissional.CheckedChanged
        If CheckBoxCProfissional.Checked Then
            CompetenciaProfissionalTextBox.Enabled = False
            PanelPROFISSIONAL.Visible = False
            CompetenciaProfissionalTextBox.Height = "20"
            CompetenciaProfissionalTextBox.Text = "Não informado"
        Else
            CompetenciaProfissionalTextBox.Focus()
            CompetenciaProfissionalTextBox.Enabled = True
            PanelPROFISSIONAL.Visible = True
            CompetenciaProfissionalTextBox.Height = "50"
            CompetenciaProfissionalTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxAspectos_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxAspectos.CheckedChanged
        If CheckBoxAspectos.Checked Then
            AspectoCriticoTextBox.Enabled = False
            AspectoCriticoTextBox.Height = "20"
            AspectoCriticoTextBox.Text = "Não informado"
        Else
            AspectoCriticoTextBox.Focus()
            AspectoCriticoTextBox.Enabled = True
            AspectoCriticoTextBox.Height = "50"
            AspectoCriticoTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxDesafios_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxDesafios.CheckedChanged
        If CheckBoxDesafios.Checked Then
            PrincipalDesafioTextBox.Enabled = False
            PrincipalDesafioTextBox.Height = "20"
            PrincipalDesafioTextBox.Text = "Não informado"
        Else
            PrincipalDesafioTextBox.Focus()
            PrincipalDesafioTextBox.Enabled = True
            PrincipalDesafioTextBox.Height = "50"
            PrincipalDesafioTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxRelacionamentoI_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxRelacionamentoI.CheckedChanged
        If CheckBoxRelacionamentoI.Checked Then
            RelacionamentoInternoTextBox.Enabled = False
            RelacionamentoInternoTextBox.Height = "20"
            RelacionamentoInternoTextBox.Text = "Não informado"
        Else
            RelacionamentoInternoTextBox.Focus()
            RelacionamentoInternoTextBox.Enabled = True
            RelacionamentoInternoTextBox.Height = "50"
            RelacionamentoInternoTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxRelacionamentoE_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxRelacionamentoE.CheckedChanged
        If CheckBoxRelacionamentoE.Checked Then
            RelacionamentoExternoTextBox.Enabled = False
            RelacionamentoExternoTextBox.Height = "20"
            RelacionamentoExternoTextBox.Text = "Não informado"
        Else
            RelacionamentoExternoTextBox.Focus()
            RelacionamentoExternoTextBox.Enabled = True
            RelacionamentoExternoTextBox.Height = "50"
            RelacionamentoExternoTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxViagem_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxViagem.CheckedChanged
        If CheckBoxViagem.Checked Then
            infoSobre_viagensTextBox.Enabled = False
            infoSobre_viagensTextBox.Height = "20"
            infoSobre_viagensTextBox.Text = "Não informado"
        Else
            infoSobre_viagensTextBox.Focus()
            infoSobre_viagensTextBox.Enabled = True
            infoSobre_viagensTextBox.Height = "50"
            infoSobre_viagensTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxObservacao_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxObservacao.CheckedChanged
        If CheckBoxObservacao.Checked Then
            ObsComplementaresTextBox.Enabled = False
            ObsComplementaresTextBox.Height = "20"
            ObsComplementaresTextBox.Text = "Não informado"
        Else
            ObsComplementaresTextBox.Focus()
            ObsComplementaresTextBox.Enabled = True
            ObsComplementaresTextBox.Height = "50"
            ObsComplementaresTextBox.Text = ""
        End If
    End Sub

    Protected Sub CheckBoxExtrutura_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxExtrutura.CheckedChanged
        If CheckBoxExtrutura.Checked Then
            EstruturaOrganizacionalTextBox.Enabled = False
            EstruturaOrganizacionalTextBox.Height = "20"
            EstruturaOrganizacionalTextBox.Text = "Não informado"
        Else
            EstruturaOrganizacionalTextBox.Focus()
            EstruturaOrganizacionalTextBox.Enabled = True
            EstruturaOrganizacionalTextBox.Height = "50"
            EstruturaOrganizacionalTextBox.Text = ""
        End If
    End Sub


    Protected Sub dsfuncaoTextBox_TextChanged(sender As Object, e As System.EventArgs) Handles dsfuncaoTextBox.TextChanged
        CargoLabel.Text = dsfuncaoLabel.Text
    End Sub


    Sub ABRE_PREVIEW_VAGA(idVagaAnuncioPREVIEW As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PREVIEW_DO_ANUNCIO_SALVO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idVagaAnuncioPREVIEW", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaAnuncioPREVIEW").Value = idVagaAnuncioPREVIEW

        'Try

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            protocoloLabel.Text = dr("Protocolo")
            Session("protocolo") = protocoloLabel.Text
            idVagaAnuncioPREVIEWLabel.Text = dr("idVagaAnuncioPREVIEW")

            REM **************************************************************************************
            CheckBoxPNE.Checked = dr("pne")
            DDownTipoFormacao.SelectedItem.Text = dr("FormacaoAcademica")
            RadioButtonListFormacaoAcademica.SelectedValue = dr("FormacaoAcademica_Apresenta")
            dsPerfilVagaTextBox.Text = dr("dsPerfilVaga")
            RadioButtonListdsPerfilVaga.SelectedValue = dr("dsPerfilVaga_Apresenta")
            dsfuncaoLabel.Text = dr("Cargo")
            nrovagaTextBox.Text = dr("nrovaga")
            RadioButtonListnrovaga.SelectedItem.Value = dr("nrovaga_Apresenta")
            DropDownListTipoVaga.SelectedValue = dr("idTipoVaga")
            RadioButtonListTipoVaga.SelectedItem.Value = dr("TipoOportunidade_Apresenta")
            QualificacaoHabilidadesEspecificasTextBox.Text = myReplace.ReplaceIn(dr("QualificacaoHabilidadesEspecificas"))
            RemuneracaoTextBox.Text = dr("Remuneracao")
            RadioButtonListRemuneracao.SelectedValue = dr("Remuneracao_Apresenta")
            RemuneracaoVariavelTextBox.Text = dr("RemuneracaoVariavel")
            RadioButtonListRemuneracaoVariavel.SelectedValue = dr("RemuneracaoVariavel_Apresenta")
            HonorarioTextBox.Text = dr("Honorario")
            RadioButtonListHonorario.SelectedValue = dr("Honorario_Apresenta")
            LocalTrabalhoTextBox.Text = dr("LocalTrabalho")
            DropDownListUF.SelectedValue = dr("UF")
            ObsComplementaresTextBox.Text = dr("ObsComplementares")
            BeneficiosTextBox.Text = dr("Beneficios")
            RadioButtonListBeneficios.SelectedValue = dr("Beneficios_Apresenta")
            PerspectivaTextBox.Text = dr("Perspectiva")
            FaixaEtariaInicioTextBox.Text = dr("FaixaEtariaInicio")
            RadioButtonListFaixaEtariaInicio.SelectedValue = dr("FaixaEtariaInicio_Apresenta")
            FaixaEtariaFimTextBox.Text = dr("FaixaEtariaFim")
            RadioButtonListFaixaEtariaFim.SelectedValue = dr("FaixaEtariaFim_Apresenta")
            RadioButtonListSexo.SelectedItem.Text = dr("Sexo")
            RadioButtonListSexoRES.SelectedValue = dr("Sexo_Apresenta")
            idiomaTextBox.Text = dr("ConhecimentoIdioma")
            PerfilComposicaoEquipeTextBox.Text = dr("PerfilComposicaoEquipe")
            PerfilGestorTextBox.Text = dr("PerfilGestor")
            CursoEspecificoTextBox.Text = dr("CursoEspecifico")
            ConhecimentoTextBox.Text = dr("Conhecimento")
            informaticaTextBox.Text = dr("ConhecimentoInformatica")
            CompetenciaComportamentalTextBox.Text = dr("CompetenciaComportamental")
            CompetenciaProfissionalTextBox.Text = dr("CompetenciaProfissional")
            AspectoCriticoTextBox.Text = dr("AspectoCritico")
            PrincipalDesafioTextBox.Text = dr("PrincipalDesafio")
            RelacionamentoInternoTextBox.Text = dr("RelacionamentoInterno")
            RelacionamentoExternoTextBox.Text = dr("RelacionamentoExterno")
            RadioButtonListviagens.SelectedValue = dr("viagens")
            infoSobre_viagensTextBox.Text = dr("infoSobre_viagens")
            RadioButtonListconfidencial.SelectedValue = dr("confidencial")
            RadioButtonListconfidencialRES.SelectedValue = dr("confidencial_Apresenta")
            EstruturaOrganizacionalTextBox.Text = dr("EstruturaOrganizacional")
            idFuncaoLabel.Text = dr("idCBOOcupacao")
            dsfuncaoLabel.Text = dr("dsfuncao")
            dsfuncaoTextBox.Text = dsfuncaoLabel.Text
            idRH_GestorLabel.Text = dr("idRH_Gestor")
            idHabilidadeCompetenciaLabelRES.Text = dr("idHabilidadeCompetencia")
            idHabilidadeProfissionalRES.Text = dr("idHabilidadeProfissional")
            DDownTipoFormacao.SelectedValue = dr("idTipoFormacao")
            If Not dr("codvaga") Is DBNull.Value Then
                codvagaTextBox.Text = dr("codvaga")
            Else
                codvagaTextBox.Text = ""
            End If
            dataInicioTextBox.Text = dr("dataInicio")
            dataFimTextBox.Text = dr("dataFim")
            DropDownListiddsAnuncioEmpresa.SelectedValue = dr("iddsAnuncioEmpresa")
            DropDownListnivelhierarquico.SelectedValue = dr("idNivelHierarquico")
            RadioButtonListAprovado.SelectedValue = dr("idstatusvaga")

            If dr("replicar") > 0 Then
                CheckBoxREPLICA.Checked = True
            Else
                CheckBoxREPLICA.Checked = False
            End If

            REM **************************************************************************************

        End If
        cn.Close()

        'Catch ex As Exception
        'msn.Text = "Falha ao recuperar os dados de sua vaga: " & Err.Description
        'End Try

    End Sub

    Sub CRIAPREVIEW_VAGA()

        If Session("protocolo") = "" Then

            protocoloLabel.Text = ""

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PREVIEW_DO_ANUNCIO_VAGA", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idsetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idsetup").Value = Session("idSetup")

            If protocoloLabel.Text <> "" Then
                prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@Protocolo").Value = protocoloLabel.Text
            End If

            prm = New SqlParameter("@pne", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@pne").Value = 0

            prm = New SqlParameter("@FormacaoAcademica", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FormacaoAcademica").Value = "Superior Completo"

            prm = New SqlParameter("@dsPerfilVaga", SqlDbType.VarChar, 150)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsPerfilVaga").Value = "Preview Vaga"

            prm = New SqlParameter("@Cargo", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Cargo").Value = "Preview Vaga"

            prm = New SqlParameter("@nrovaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nrovaga").Value = 1

            prm = New SqlParameter("@nmresponsavel", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nmresponsavel").Value = Session("nmresponsavel")

            prm = New SqlParameter("@TipoOportunidade", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@TipoOportunidade").Value = "CLT"

            prm = New SqlParameter("@QualificacaoHabilidadesEspecificas", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@QualificacaoHabilidadesEspecificas").Value = "Preview Vaga"

            prm = New SqlParameter("@Remuneracao", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If RemuneracaoTextBox.Text = "" Or RemuneracaoTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@Remuneracao").Value = 0
            Else
                cmd.Parameters("@Remuneracao").Value = Trim(Replace(Replace(Replace(RemuneracaoTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If
            REM *** ******************************************************************************************
            prm = New SqlParameter("@RemuneracaoVariavel", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If RemuneracaoVariavelTextBox.Text = "" Or RemuneracaoVariavelTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@RemuneracaoVariavel").Value = 0
            Else
                cmd.Parameters("@RemuneracaoVariavel").Value = Trim(Replace(Replace(Replace(RemuneracaoVariavelTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If
            REM *** ******************************************************************************************
            prm = New SqlParameter("@Honorario", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If HonorarioTextBox.Text = "" Or HonorarioTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@Honorario").Value = 0
            Else
                cmd.Parameters("@Honorario").Value = Trim(Replace(Replace(Replace(HonorarioTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@LocalTrabalho", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@LocalTrabalho").Value = "São Paulo - SP"

            prm = New SqlParameter("@ObsComplementares", SqlDbType.VarChar, 4000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ObsComplementares").Value = ObsComplementaresTextBox.Text

            prm = New SqlParameter("@Beneficios", SqlDbType.VarChar, 4000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            Dim Beneficio As String = ""
            For Each li As ListItem In CheckBoxListBeneficio.Items
                If li.Selected Then
                    Beneficio += li.Text & "<br>"
                End If
            Next
            Beneficio += BeneficiosTextBox.Text
            cmd.Parameters("@Beneficios").Value = Beneficio

            prm = New SqlParameter("@Perspectiva", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Perspectiva").Value = PerspectivaTextBox.Text

            prm = New SqlParameter("@FaixaEtariaInicio", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaInicio").Value = 25

            prm = New SqlParameter("@FaixaEtariaFim", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaFim").Value = 35

            prm = New SqlParameter("@Sexo", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Sexo").Value = RadioButtonListSexo.SelectedItem.Text

            prm = New SqlParameter("@ConhecimentoIdioma", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ConhecimentoIdioma").Value = idiomaTextBox.Text

            prm = New SqlParameter("@PerfilComposicaoEquipe", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PerfilComposicaoEquipe").Value = PerfilComposicaoEquipeTextBox.Text

            prm = New SqlParameter("@PerfilGestor", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PerfilGestor").Value = PerfilGestorTextBox.Text

            prm = New SqlParameter("@CursoEspecifico", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CursoEspecifico").Value = CursoEspecificoTextBox.Text

            prm = New SqlParameter("@Conhecimento", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Conhecimento").Value = ConhecimentoTextBox.Text

            prm = New SqlParameter("@ConhecimentoInformatica", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ConhecimentoInformatica").Value = informaticaTextBox.Text

            prm = New SqlParameter("@CompetenciaComportamental", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CompetenciaComportamental").Value = CompetenciaComportamentalTextBox.Text

            prm = New SqlParameter("@CompetenciaProfissional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CompetenciaProfissional").Value = CompetenciaProfissionalTextBox.Text

            prm = New SqlParameter("@AspectoCritico", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@AspectoCritico").Value = AspectoCriticoTextBox.Text

            prm = New SqlParameter("@PrincipalDesafio", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PrincipalDesafio").Value = PrincipalDesafioTextBox.Text

            prm = New SqlParameter("@RelacionamentoInterno", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RelacionamentoInterno").Value = RelacionamentoInternoTextBox.Text

            prm = New SqlParameter("@RelacionamentoExterno", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RelacionamentoExterno").Value = RelacionamentoExternoTextBox.Text

            prm = New SqlParameter("@infoSobre_viagens", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@infoSobre_viagens").Value = infoSobre_viagensTextBox.Text

            prm = New SqlParameter("@confidencial", SqlDbType.Bit)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@confidencial").Value = RadioButtonListconfidencial.SelectedValue

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows() Then

                    dr.Read()
                    protocoloLabel.Text = dr("Protocolo")
                    Session("protocolo") = protocoloLabel.Text
                    idVagaAnuncioPREVIEWLabel.Text = dr("idVagaAnuncioPREVIEW")

                End If
                cn.Close()

            Catch ex As Exception
                msn.Text = "Falha ao gravar os dados no banco de dados: " & Err.Description
            End Try

        End If

    End Sub

    Protected Sub GridViewCOMPORTAMENTAL_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCOMPORTAMENTAL.SelectedIndexChanged
        COMPETENCIALabel.Text = GridViewCOMPORTAMENTAL.SelectedDataKey("HabilidadeCompetencia")
        idHabilidadeCompetenciaLabel.Text = GridViewCOMPORTAMENTAL.SelectedDataKey("idHabilidadeCompetencia")
    End Sub

    Protected Sub GridViewCOMPORTAMENTAL_RES_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCOMPORTAMENTAL_RES.SelectedIndexChanged
        idHabilidadeCompetenciaLabelRES.Text = GridViewCOMPORTAMENTAL_RES.SelectedDataKey("idHabilidadeCompetencia")
        CompetenciaComportamentalTextBox.Text = GridViewCOMPORTAMENTAL_RES.SelectedDataKey("dsHabilidadeCompetencia")
    End Sub

    Protected Sub GridViewPROFISSIONAL_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPROFISSIONAL.SelectedIndexChanged
        idHabilidadeProfissionalRES.Text = GridViewPROFISSIONAL.SelectedDataKey("idHabilidadeCompetencia")
        CompetenciaProfissionalTextBox.Text = GridViewPROFISSIONAL.SelectedDataKey("HabilidadeCompetencia") & " - " & GridViewPROFISSIONAL.SelectedDataKey("dsHabilidadeCompetencia")
    End Sub


    Protected Sub PUBLICAR_Click(sender As Object, e As System.EventArgs) Handles PUBLICAR.Click

        REM *** ******************************************************************************************
        REM *** PUBLICA A VAGA
        REM *** ******************************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim myProtocolo As New geraProtocolo

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        '[_USP_VAGA_ABERTURA_PROCESSO_SELETIVO]
        '_USP_VAGA_ABERTURA_PROCESSO_SELETIVO
        cmd = New SqlCommand("_USP_VAGA_ABERTURA_PROCESSO_SELETIVO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        REM *** ******************************************************************************************
        Dim Protocolo As String = myProtocolo.getNrProtocolo(Session("idSetup"))
        REM *** ******************************************************************************************

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = Protocolo

        prm = New SqlParameter("@idVagaAnuncioPREVIEW", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaAnuncioPREVIEW").Value = idVagaAnuncioPREVIEWLabel.Text

        prm = New SqlParameter("@protocoloPREVIEW", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@protocoloPREVIEW").Value = protocoloLabel.Text

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = Session("idUser")

        prm = New SqlParameter("@idsetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idsetup").Value = Session("idSetup")

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")


        REM *** ******************************************************************************************

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
            msn.CssClass = "textoProcessoSeletivoABERTO"
            msn.Text = "A Vaga foi publicada com sucesso!"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• A Vaga foi publicada com sucesso!<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

            BodyInterno.Visible = False
            PanelAvisoSucesso.Visible = True
            PanelVaga.Visible = False
            PanelVaga0.Visible = False
            PanelVaga1.Visible = False
            PanelVaga2.Visible = False
            PanelVaga3.Visible = False
            PanelVaga4.Visible = False
            PanelVaga5.Visible = False
            PanelVaga6.Visible = False

        Catch ex As Exception

            msn.CssClass = "textoProcessoSeletivoFECHADO"
            msn.Text = "Falha ao salvar a Vaga, avise o Administrador." & Err.Description
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Falha ao salvar a Vaga.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"

        End Try


    End Sub

    Protected Sub LinkButtonPREVIEW_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPREVIEW.Click
        REM ** ********************************************************************************************************
        REM ** LIBERA OS BOTÕES PUBLICAR / GRAVAR
        REM ** ********************************************************************************************************
        PUBLICAR.Visible = True
        LinkButtonGRAVAR.Visible = True
        REM ** ********************************************************************************************************
        REM ** LÓGICA PARA PEGAR O ID DO CARGO
        REM ** ********************************************************************************************************

        Dim tamanhoString As Int32 = Len(dsfuncaoTextBox.Text)
        Dim posicaoInicial As Int32 = InStr(1, dsfuncaoTextBox.Text, "[", 1)


        If posicaoInicial > 0 Then
            Dim pesquisa As Int32 = tamanhoString - posicaoInicial
            idFuncaoLabel.Text = Replace(Right(dsfuncaoTextBox.Text, pesquisa), "]", "")
            dsfuncaoTextBox.CssClass = "InputCadFormCandidatoCV_OK"
            dsfuncaoLabel.Text = Trim(Left(dsfuncaoTextBox.Text, posicaoInicial - 2))
        Else
            If idFuncaoLabel.Text = "" Then
                idFuncaoLabel.Text = "0"
            End If
            dsfuncaoLabel.Text = dsfuncaoTextBox.Text
            dsfuncaoTextBox.CssClass = "InputCadFormCandidatoCV_OK"
        End If



        If dataInicioTextBox.Text = "" Or dataFimTextBox.Text = "" Then
            msn.Text = "As datas de início e término da publicação da vaga devem ser informadas"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• As datas de início e término da publicação da vaga devem ser informadas.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        Else

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PREVIEW_DO_ANUNCIO_VAGA", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idsetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idsetup").Value = Session("idSetup")

            If protocoloLabel.Text <> "" Then
                prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@Protocolo").Value = protocoloLabel.Text
            End If

            prm = New SqlParameter("@pne", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If CheckBoxPNE.Checked Then
                cmd.Parameters("@pne").Value = 1
            Else
                cmd.Parameters("@pne").Value = 0
            End If


            prm = New SqlParameter("@FormacaoAcademica", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FormacaoAcademica").Value = DDownTipoFormacao.SelectedItem.Text

            prm = New SqlParameter("@FormacaoAcademica_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FormacaoAcademica_Apresenta").Value = RadioButtonListFormacaoAcademica.SelectedValue

            prm = New SqlParameter("@dsPerfilVaga", SqlDbType.VarChar, 150)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsPerfilVaga").Value = dsPerfilVagaTextBox.Text

            prm = New SqlParameter("@dsPerfilVaga_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsPerfilVaga_Apresenta").Value = RadioButtonListdsPerfilVaga.SelectedItem.Value

            prm = New SqlParameter("@Cargo", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Cargo").Value = dsfuncaoLabel.Text

            prm = New SqlParameter("@nrovaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nrovaga").Value = nrovagaTextBox.Text

            prm = New SqlParameter("@nrovaga_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nrovaga_Apresenta").Value = RadioButtonListnrovaga.SelectedItem.Value

            prm = New SqlParameter("@nmresponsavel", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nmresponsavel").Value = Session("nomeRes")

            prm = New SqlParameter("@TipoOportunidade", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@TipoOportunidade").Value = DropDownListTipoVaga.SelectedItem.Text

            prm = New SqlParameter("@TipoOportunidade_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@TipoOportunidade_Apresenta").Value = RadioButtonListTipoVaga.SelectedItem.Value

            prm = New SqlParameter("@QualificacaoHabilidadesEspecificas", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@QualificacaoHabilidadesEspecificas").Value = myReplace.ReplaceIn(QualificacaoHabilidadesEspecificasTextBox.Text)

            prm = New SqlParameter("@QualificacaoHabilidadesEspecificas_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@QualificacaoHabilidadesEspecificas_Apresenta").Value = 1

            prm = New SqlParameter("@Remuneracao", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If RemuneracaoTextBox.Text = "" Or RemuneracaoTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@Remuneracao").Value = 0
            Else
                cmd.Parameters("@Remuneracao").Value = Trim(Replace(Replace(Replace(RemuneracaoTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@Remuneracao_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Remuneracao_Apresenta").Value = RadioButtonListRemuneracao.SelectedItem.Value

            REM *** ******************************************************************************************
            prm = New SqlParameter("@RemuneracaoVariavel", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If RemuneracaoVariavelTextBox.Text = "" Or RemuneracaoVariavelTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@RemuneracaoVariavel").Value = 0
            Else
                cmd.Parameters("@RemuneracaoVariavel").Value = Trim(Replace(Replace(Replace(RemuneracaoVariavelTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@RemuneracaoVariavel_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RemuneracaoVariavel_Apresenta").Value = RadioButtonListRemuneracaoVariavel.SelectedItem.Value

            REM *** ******************************************************************************************
            prm = New SqlParameter("@Honorario", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If HonorarioTextBox.Text = "" Or HonorarioTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@Honorario").Value = 0
            Else
                cmd.Parameters("@Honorario").Value = Trim(Replace(Replace(Replace(HonorarioTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@Honorario_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Honorario_Apresenta").Value = RadioButtonListHonorario.SelectedItem.Value


            prm = New SqlParameter("@LocalTrabalho", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@LocalTrabalho").Value = LocalTrabalhoTextBox.Text

            prm = New SqlParameter("@LocalTrabalho_Apresenta", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@LocalTrabalho_Apresenta").Value = 1 REM ** LOCAL DE TRABALHO SEMPRE APRESENTA

            prm = New SqlParameter("@ObsComplementares", SqlDbType.VarChar, 4000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ObsComplementares").Value = ObsComplementaresTextBox.Text

            prm = New SqlParameter("@Beneficios", SqlDbType.VarChar, 4000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            Dim Beneficio As String = ""
            For Each li As ListItem In CheckBoxListBeneficio.Items
                If li.Selected Then
                    Beneficio += li.Text & "<br>"
                End If
            Next
            Beneficio += BeneficiosTextBox.Text
            cmd.Parameters("@Beneficios").Value = Beneficio

            prm = New SqlParameter("@Beneficios_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Beneficios_Apresenta").Value = RadioButtonListBeneficios.SelectedItem.Value

            prm = New SqlParameter("@Perspectiva", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Perspectiva").Value = PerspectivaTextBox.Text

            prm = New SqlParameter("@FaixaEtariaInicio", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaInicio").Value = FaixaEtariaInicioTextBox.Text

            prm = New SqlParameter("@FaixaEtariaInicio_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaInicio_Apresenta").Value = RadioButtonListFaixaEtariaInicio.SelectedItem.Value

            prm = New SqlParameter("@FaixaEtariaFim", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaFim").Value = FaixaEtariaFimTextBox.Text

            prm = New SqlParameter("@FaixaEtariaFim_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaFim_Apresenta").Value = RadioButtonListFaixaEtariaFim.SelectedItem.Value

            prm = New SqlParameter("@Sexo", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Sexo").Value = RadioButtonListSexo.SelectedItem.Text

            prm = New SqlParameter("@Sexo_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Sexo_Apresenta").Value = RadioButtonListSexoRES.SelectedItem.Value

            prm = New SqlParameter("@ConhecimentoIdioma", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ConhecimentoIdioma").Value = idiomaTextBox.Text

            prm = New SqlParameter("@PerfilComposicaoEquipe", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PerfilComposicaoEquipe").Value = PerfilComposicaoEquipeTextBox.Text

            prm = New SqlParameter("@PerfilGestor", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PerfilGestor").Value = PerfilGestorTextBox.Text

            prm = New SqlParameter("@CursoEspecifico", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CursoEspecifico").Value = CursoEspecificoTextBox.Text

            prm = New SqlParameter("@Conhecimento", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Conhecimento").Value = ConhecimentoTextBox.Text

            prm = New SqlParameter("@ConhecimentoInformatica", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ConhecimentoInformatica").Value = informaticaTextBox.Text

            prm = New SqlParameter("@CompetenciaComportamental", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CompetenciaComportamental").Value = CompetenciaComportamentalTextBox.Text

            prm = New SqlParameter("@CompetenciaProfissional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CompetenciaProfissional").Value = CompetenciaProfissionalTextBox.Text

            prm = New SqlParameter("@AspectoCritico", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@AspectoCritico").Value = AspectoCriticoTextBox.Text

            prm = New SqlParameter("@PrincipalDesafio", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PrincipalDesafio").Value = PrincipalDesafioTextBox.Text

            prm = New SqlParameter("@RelacionamentoInterno", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RelacionamentoInterno").Value = RelacionamentoInternoTextBox.Text

            prm = New SqlParameter("@RelacionamentoExterno", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RelacionamentoExterno").Value = RelacionamentoExternoTextBox.Text

            prm = New SqlParameter("@viagens", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@viagens").Value = RadioButtonListviagens.SelectedValue

            prm = New SqlParameter("@viagens_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@viagens_Apresenta").Value = 0 REM ** VIAGENS NUNCA APRESENTA É CAMPO PARA ADESÃO

            prm = New SqlParameter("@infoSobre_viagens", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@infoSobre_viagens").Value = infoSobre_viagensTextBox.Text

            prm = New SqlParameter("@confidencial", SqlDbType.Bit)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@confidencial").Value = RadioButtonListconfidencial.SelectedValue

            prm = New SqlParameter("@confidencial_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@confidencial_Apresenta").Value = RadioButtonListconfidencialRES.SelectedItem.Value

            prm = New SqlParameter("@EstruturaOrganizacional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@EstruturaOrganizacional").Value = EstruturaOrganizacionalTextBox.Text

            prm = New SqlParameter("@idCBOOcupacao", SqlDbType.VarChar, 6)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCBOOcupacao").Value = idFuncaoLabel.Text

            prm = New SqlParameter("@idfuncao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idfuncao").Value = 0

            prm = New SqlParameter("@dsfuncao", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsfuncao").Value = dsfuncaoLabel.Text

            prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRH_Gestor").Value = idRH_GestorLabel.Text

            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS (idRH_GestorREQUISITANTE)
            REM ** *****************************************************************************************

            If idDepartamento_Gestor.Text <> "" Then
                prm = New SqlParameter("@idRH_GestorREQUISITANTE", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idRH_GestorREQUISITANTE").Value = idDepartamento_Gestor.Text
            End If

            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS  
            REM ** *****************************************************************************************


            Dim idHabilidadeCompetencia As String = idHabilidadeCompetenciaLabelRES.Text
            If idHabilidadeCompetencia <> "" Then
                prm = New SqlParameter("@idHabilidadeCompetencia", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeCompetencia").Value = idHabilidadeCompetencia
            Else
                prm = New SqlParameter("@idHabilidadeCompetencia", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeCompetencia").Value = 0
            End If

            Dim idHabilidadeProfissional As String = idHabilidadeProfissionalRES.Text
            If idHabilidadeProfissional <> "" Then
                prm = New SqlParameter("@idHabilidadeProfissional", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeProfissional").Value = idHabilidadeProfissional
            Else
                prm = New SqlParameter("@idHabilidadeProfissional", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeProfissional").Value = 0
            End If

            prm = New SqlParameter("@UF", SqlDbType.Char, 2)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@UF").Value = DropDownListUF.SelectedItem.Text

            prm = New SqlParameter("@idTipoFormacao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idTipoFormacao").Value = DDownTipoFormacao.SelectedItem.Value

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@idCadastroEmpresa_Filha", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa_Filha").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@codvaga", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@codvaga").Value = codvagaTextBox.Text

            prm = New SqlParameter("@dataInicio", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dataInicio").Value = dataInicioTextBox.Text

            prm = New SqlParameter("@dataFim", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dataFim").Value = dataFimTextBox.Text

            prm = New SqlParameter("@iddsAnuncioEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@iddsAnuncioEmpresa").Value = DropDownListiddsAnuncioEmpresa.SelectedItem.Value

            prm = New SqlParameter("@idNivelHierarquico", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idNivelHierarquico").Value = DropDownListnivelhierarquico.SelectedItem.Value

            prm = New SqlParameter("@idTipoVaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idTipoVaga").Value = DropDownListTipoVaga.SelectedItem.Value

            prm = New SqlParameter("@gravar", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@gravar").Value = 0

            prm = New SqlParameter("@replicar", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If CheckBoxREPLICA.Checked Then
                cmd.Parameters("@replicar").Value = 1
            Else
                cmd.Parameters("@replicar").Value = 0
            End If

            prm = New SqlParameter("@idstatusvaga", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idstatusvaga").Value = RadioButtonListAprovado.SelectedItem.Value

            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS  
            REM ** *****************************************************************************************
            If idDepartamento_Gestor.Text <> "" Then
                prm = New SqlParameter("@idDepartamento", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idDepartamento").Value = idDepartamento_Gestor.Text
            End If
            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS  
            REM ** *****************************************************************************************

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows() Then

                    dr.Read()
                    protocoloLabel.Text = dr("Protocolo")
                    idVagaAnuncioPREVIEWLabel.Text = dr("idVagaAnuncioPREVIEW")
                    dataInicioLabel.Text = dr("dataInicio")
                    dataFimLabel.Text = dr("dataFim")
                    idFuncaoLabel.Text = dr("idCBOOcupacao")

                End If
                cn.Close()

            Catch ex As Exception

                MaintainScrollPositionOnPostBack = False
                msn.Text = "Falha ao montar o preview da vaga."
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Falha ao montar o preview da vaga.<br>" & Err.Description
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"

            End Try

            Try

                MaintainScrollPositionOnPostBack = False
                dataInicioTextBox.Text = FormatDateTime(dataInicioLabel.Text, DateFormat.ShortDate)
                dataFimTextBox.Text = FormatDateTime(dataFimLabel.Text, DateFormat.ShortDate)
                PanelPreviewVaga.Visible = True
                DataListPreviewVaga.DataBind()

            Catch ex As Exception

            End Try

            End If

    End Sub

    Protected Sub LinkButtonSalvaIdioma_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvaIdioma.Click


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PREVIEW_DO_ANUNCIO_IDIOMA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idVagaAnuncioPREVIEW", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaAnuncioPREVIEW").Value = idVagaAnuncioPREVIEWLabel.Text

        prm = New SqlParameter("@idTipoConhecimentoIdioma", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idTipoConhecimentoIdioma").Value = DropDownListIDIOMA.SelectedValue

        prm = New SqlParameter("@NivelConhecimento", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@NivelConhecimento").Value = DropDownListNIVEL.SelectedValue
        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

        Catch ex As Exception
            msn.Text = "Falha ao gravar os dados no banco de dados: " & Err.Description
        End Try

        GridViewIDIOMA.DataBind()

    End Sub

    Protected Sub LinkButtonSalvaInformatica_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvaInformatica.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PREVIEW_DO_ANUNCIO_INFORMATICA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idVagaAnuncioPREVIEW", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaAnuncioPREVIEW").Value = idVagaAnuncioPREVIEWLabel.Text

        prm = New SqlParameter("@idTipoConhecimentoInformatica", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idTipoConhecimentoInformatica").Value = DropDownListINFORMATICA.SelectedValue

        prm = New SqlParameter("@idTipoConhecimentoRel", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idTipoConhecimentoRel").Value = DropDownListINFORMATICAITENS.SelectedValue

        prm = New SqlParameter("@NivelConhecimento", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@NivelConhecimento").Value = RadioButtonListNIVEL.SelectedItem.Value
        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

        Catch ex As Exception
            msn.Text = "Falha ao gravar os dados no banco de dados: " & Err.Description
        End Try

        GridViewINFORMATICA.DataBind()

    End Sub

    Protected Sub LinkButtonGRAVAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonGRAVAR.Click

        REM ** ********************************************************************************************************
        REM ** LÓGICA PARA PEGAR O ID DO CARGO (GRAVAR VAGA) APENAS GRAVA O PREVIEW COM O FLAG GRAVAR = 1
        REM ** ********************************************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")
        Dim myLink As String = URL & "/_anonimo/default.aspx?jobclickCryp=" & criptografia.Criptografar(Session("SETLayout"), "#!$a36?@") & "&jobclickCrypID=" & criptografia.Criptografar(Session("idCadastroEmpresa"), "#!$a36?@") & "&jobclickProtocolo=" & criptografia.Criptografar(protocoloLabel.Text, "#!$a36?@")

        Dim tamanhoString As Int32 = Len(dsfuncaoTextBox.Text)
        Dim posicaoInicial As Int32 = InStr(1, dsfuncaoTextBox.Text, "[", 1)

        If posicaoInicial > 0 Then
            Dim pesquisa As Int32 = tamanhoString - posicaoInicial
            idFuncaoLabel.Text = Replace(Right(dsfuncaoTextBox.Text, pesquisa), "]", "")
            dsfuncaoTextBox.CssClass = "InputCadFormCandidatoCV_OK"
            dsfuncaoLabel.Text = Trim(Left(dsfuncaoTextBox.Text, posicaoInicial - 2))
        Else
            If idFuncaoLabel.Text = "" Then
                idFuncaoLabel.Text = "0"
            End If
            dsfuncaoLabel.Text = dsfuncaoTextBox.Text
            dsfuncaoTextBox.CssClass = "InputCadFormCandidatoCV_OK"
        End If


        If dataInicioTextBox.Text = "" Or dataFimTextBox.Text = "" Then
            msn.Text = "As datas de início e término da publicação da vaga devem ser informadas"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• As datas de início e término da publicação da vaga devem ser informadas.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"
        Else

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PREVIEW_DO_ANUNCIO_VAGA", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idsetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idsetup").Value = Session("idSetup")

            If protocoloLabel.Text <> "" Then
                prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@Protocolo").Value = protocoloLabel.Text
            End If

            prm = New SqlParameter("@pne", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If CheckBoxPNE.Checked Then
                cmd.Parameters("@pne").Value = 1
            Else
                cmd.Parameters("@pne").Value = 0
            End If


            prm = New SqlParameter("@FormacaoAcademica", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FormacaoAcademica").Value = DDownTipoFormacao.SelectedItem.Text

            prm = New SqlParameter("@FormacaoAcademica_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FormacaoAcademica_Apresenta").Value = RadioButtonListFormacaoAcademica.SelectedValue

            prm = New SqlParameter("@dsPerfilVaga", SqlDbType.VarChar, 150)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsPerfilVaga").Value = dsPerfilVagaTextBox.Text

            prm = New SqlParameter("@dsPerfilVaga_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsPerfilVaga_Apresenta").Value = RadioButtonListdsPerfilVaga.SelectedItem.Value

            prm = New SqlParameter("@Cargo", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Cargo").Value = dsfuncaoLabel.Text

            prm = New SqlParameter("@nrovaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nrovaga").Value = nrovagaTextBox.Text

            prm = New SqlParameter("@nrovaga_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nrovaga_Apresenta").Value = RadioButtonListnrovaga.SelectedItem.Value

            prm = New SqlParameter("@nmresponsavel", SqlDbType.VarChar, 180)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@nmresponsavel").Value = Session("nomeRes")

            prm = New SqlParameter("@TipoOportunidade", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@TipoOportunidade").Value = DropDownListTipoVaga.SelectedItem.Text

            prm = New SqlParameter("@TipoOportunidade_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@TipoOportunidade_Apresenta").Value = RadioButtonListTipoVaga.SelectedItem.Value

            prm = New SqlParameter("@QualificacaoHabilidadesEspecificas", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@QualificacaoHabilidadesEspecificas").Value = myReplace.ReplaceIn(QualificacaoHabilidadesEspecificasTextBox.Text)

            prm = New SqlParameter("@QualificacaoHabilidadesEspecificas_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@QualificacaoHabilidadesEspecificas_Apresenta").Value = 1

            prm = New SqlParameter("@Remuneracao", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If RemuneracaoTextBox.Text = "" Or RemuneracaoTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@Remuneracao").Value = 0
            Else
                cmd.Parameters("@Remuneracao").Value = Trim(Replace(Replace(Replace(RemuneracaoTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@Remuneracao_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Remuneracao_Apresenta").Value = RadioButtonListRemuneracao.SelectedItem.Value

            REM *** ******************************************************************************************
            prm = New SqlParameter("@RemuneracaoVariavel", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If RemuneracaoVariavelTextBox.Text = "" Or RemuneracaoVariavelTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@RemuneracaoVariavel").Value = 0
            Else
                cmd.Parameters("@RemuneracaoVariavel").Value = Trim(Replace(Replace(Replace(RemuneracaoVariavelTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@RemuneracaoVariavel_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RemuneracaoVariavel_Apresenta").Value = RadioButtonListRemuneracaoVariavel.SelectedItem.Value

            REM *** ******************************************************************************************
            prm = New SqlParameter("@Honorario", SqlDbType.Money)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            If HonorarioTextBox.Text = "" Or HonorarioTextBox.Text = "R$ __.___,__" Then
                cmd.Parameters("@Honorario").Value = 0
            Else
                cmd.Parameters("@Honorario").Value = Trim(Replace(Replace(Replace(HonorarioTextBox.Text, "_", "0"), "R$", ""), ".", ""))
            End If

            prm = New SqlParameter("@Honorario_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Honorario_Apresenta").Value = RadioButtonListHonorario.SelectedItem.Value


            prm = New SqlParameter("@LocalTrabalho", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@LocalTrabalho").Value = LocalTrabalhoTextBox.Text

            prm = New SqlParameter("@LocalTrabalho_Apresenta", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@LocalTrabalho_Apresenta").Value = 1 REM ** LOCAL DE TRABALHO SEMPRE APRESENTA

            prm = New SqlParameter("@ObsComplementares", SqlDbType.VarChar, 4000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ObsComplementares").Value = ObsComplementaresTextBox.Text

            prm = New SqlParameter("@Beneficios", SqlDbType.VarChar, 4000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            Dim Beneficio As String = ""
            For Each li As ListItem In CheckBoxListBeneficio.Items
                If li.Selected Then
                    Beneficio += li.Text & "<br>"
                End If
            Next
            Beneficio += BeneficiosTextBox.Text
            cmd.Parameters("@Beneficios").Value = Beneficio

            prm = New SqlParameter("@Beneficios_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Beneficios_Apresenta").Value = RadioButtonListBeneficios.SelectedItem.Value

            prm = New SqlParameter("@Perspectiva", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Perspectiva").Value = PerspectivaTextBox.Text

            prm = New SqlParameter("@FaixaEtariaInicio", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaInicio").Value = FaixaEtariaInicioTextBox.Text

            prm = New SqlParameter("@FaixaEtariaInicio_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaInicio_Apresenta").Value = RadioButtonListFaixaEtariaInicio.SelectedItem.Value

            prm = New SqlParameter("@FaixaEtariaFim", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaFim").Value = FaixaEtariaFimTextBox.Text

            prm = New SqlParameter("@FaixaEtariaFim_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@FaixaEtariaFim_Apresenta").Value = RadioButtonListFaixaEtariaFim.SelectedItem.Value

            prm = New SqlParameter("@Sexo", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Sexo").Value = RadioButtonListSexo.SelectedItem.Text

            prm = New SqlParameter("@Sexo_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Sexo_Apresenta").Value = RadioButtonListSexoRES.SelectedItem.Value

            prm = New SqlParameter("@ConhecimentoIdioma", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ConhecimentoIdioma").Value = idiomaTextBox.Text

            prm = New SqlParameter("@PerfilComposicaoEquipe", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PerfilComposicaoEquipe").Value = PerfilComposicaoEquipeTextBox.Text

            prm = New SqlParameter("@PerfilGestor", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PerfilGestor").Value = PerfilGestorTextBox.Text

            prm = New SqlParameter("@CursoEspecifico", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CursoEspecifico").Value = CursoEspecificoTextBox.Text

            prm = New SqlParameter("@Conhecimento", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Conhecimento").Value = ConhecimentoTextBox.Text

            prm = New SqlParameter("@ConhecimentoInformatica", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@ConhecimentoInformatica").Value = informaticaTextBox.Text

            prm = New SqlParameter("@CompetenciaComportamental", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CompetenciaComportamental").Value = CompetenciaComportamentalTextBox.Text

            prm = New SqlParameter("@CompetenciaProfissional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CompetenciaProfissional").Value = CompetenciaProfissionalTextBox.Text

            prm = New SqlParameter("@AspectoCritico", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@AspectoCritico").Value = AspectoCriticoTextBox.Text

            prm = New SqlParameter("@PrincipalDesafio", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@PrincipalDesafio").Value = PrincipalDesafioTextBox.Text

            prm = New SqlParameter("@RelacionamentoInterno", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RelacionamentoInterno").Value = RelacionamentoInternoTextBox.Text

            prm = New SqlParameter("@RelacionamentoExterno", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@RelacionamentoExterno").Value = RelacionamentoExternoTextBox.Text

            prm = New SqlParameter("@viagens", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@viagens").Value = RadioButtonListviagens.SelectedValue

            prm = New SqlParameter("@viagens_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@viagens_Apresenta").Value = 0 REM ** VIAGENS NUNCA APRESENTA É CAMPO PARA ADESÃO

            prm = New SqlParameter("@infoSobre_viagens", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@infoSobre_viagens").Value = infoSobre_viagensTextBox.Text

            prm = New SqlParameter("@confidencial", SqlDbType.Bit)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@confidencial").Value = RadioButtonListconfidencial.SelectedValue

            prm = New SqlParameter("@confidencial_Apresenta", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@confidencial_Apresenta").Value = RadioButtonListconfidencialRES.SelectedItem.Value

            prm = New SqlParameter("@EstruturaOrganizacional", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@EstruturaOrganizacional").Value = EstruturaOrganizacionalTextBox.Text

            prm = New SqlParameter("@idCBOOcupacao", SqlDbType.VarChar, 6)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCBOOcupacao").Value = idFuncaoLabel.Text

            prm = New SqlParameter("@idfuncao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idfuncao").Value = 0

            prm = New SqlParameter("@dsfuncao", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsfuncao").Value = dsfuncaoLabel.Text


            prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idRH_Gestor").Value = idRH_GestorLabel.Text


            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS (idRH_GestorREQUISITANTE)
            REM ** *****************************************************************************************

            If idDepartamento_Gestor.Text <> "" Then
                prm = New SqlParameter("@idRH_GestorREQUISITANTE", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idRH_GestorREQUISITANTE").Value = idDepartamento_Gestor.Text
            End If

            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS  
            REM ** *****************************************************************************************

            Dim idHabilidadeCompetencia As String = idHabilidadeCompetenciaLabelRES.Text
            If idHabilidadeCompetencia <> "" Then
                prm = New SqlParameter("@idHabilidadeCompetencia", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeCompetencia").Value = idHabilidadeCompetencia
            Else
                prm = New SqlParameter("@idHabilidadeCompetencia", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeCompetencia").Value = 0
            End If

            Dim idHabilidadeProfissional As String = idHabilidadeProfissionalRES.Text
            If idHabilidadeProfissional <> "" Then
                prm = New SqlParameter("@idHabilidadeProfissional", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeProfissional").Value = idHabilidadeProfissional
            Else
                prm = New SqlParameter("@idHabilidadeProfissional", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idHabilidadeProfissional").Value = 0
            End If

            prm = New SqlParameter("@UF", SqlDbType.Char, 2)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@UF").Value = DropDownListUF.SelectedItem.Text

            prm = New SqlParameter("@idTipoFormacao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idTipoFormacao").Value = DDownTipoFormacao.SelectedItem.Value

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@idCadastroEmpresa_Filha", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa_Filha").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@codvaga", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@codvaga").Value = codvagaTextBox.Text

            prm = New SqlParameter("@dataInicio", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dataInicio").Value = dataInicioTextBox.Text

            prm = New SqlParameter("@dataFim", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dataFim").Value = dataFimTextBox.Text

            prm = New SqlParameter("@iddsAnuncioEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@iddsAnuncioEmpresa").Value = DropDownListiddsAnuncioEmpresa.SelectedItem.Value

            prm = New SqlParameter("@idNivelHierarquico", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idNivelHierarquico").Value = DropDownListnivelhierarquico.SelectedItem.Value

            prm = New SqlParameter("@idTipoVaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idTipoVaga").Value = DropDownListTipoVaga.SelectedItem.Value

            prm = New SqlParameter("@gravar", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@gravar").Value = 1

            prm = New SqlParameter("@replicar", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If CheckBoxREPLICA.Checked Then
                cmd.Parameters("@replicar").Value = 1
            Else
                cmd.Parameters("@replicar").Value = 0
            End If

            prm = New SqlParameter("@idstatusvaga", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idstatusvaga").Value = RadioButtonListAprovado.SelectedItem.Text


            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS (idRH_GestorREQUISITANTE)
            REM ** *****************************************************************************************

            If idDepartamento_Gestor.Text <> "" Then
                prm = New SqlParameter("@idDepartamento", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@idDepartamento").Value = idDepartamento_Gestor.Text
            End If

            REM ** *****************************************************************************************
            REM ** REQUISITANTE DO AUMENTO DE QUADRO DE FUNCIONARIOS  
            REM ** *****************************************************************************************



            REM ** O HISTÓRICO SERÁ GRAVADO NO NOME DO ANALISA OU CONSULTOR?
            Dim Authentic As String = HttpContext.Current.User.Identity.Name

            Dim emailConsultorAnalista As String = ""
            Dim nomeConsultorAnalista As String = ""

            Select Case Authentic
                Case "Consultor"
                    nomeConsultorAnalista = Session("nomeConsultor")
                    emailConsultorAnalista = Session("emailConsultor")
                Case "Corporativo"
                    nomeConsultorAnalista = Session("nomeRes")
                    emailConsultorAnalista = Session("emailUser")
                Case Else
                    nomeConsultorAnalista = Session("nomeConsultor")
                    emailConsultorAnalista = Session("emailConsultor")
            End Select

            If opener.Checked Then

                prm = New SqlParameter("@enviaEmail", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@enviaEmail").Value = 1

                prm = New SqlParameter("@nomeGESTOR", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nomeGESTOR").Value = DropDownListGESTOR.SelectedItem.Text

                prm = New SqlParameter("@emailGESTOR", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@emailGESTOR").Value = DropDownListGESTOR.SelectedItem.Value

                prm = New SqlParameter("@nomeANALISTA_CONSULTOR", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@nomeANALISTA_CONSULTOR").Value = nomeConsultorAnalista 'Session("nomeRes")

                prm = New SqlParameter("@emailANALISTA_CONSULTOR", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@emailANALISTA_CONSULTOR").Value = emailConsultorAnalista 'Session("emailUser")

                prm = New SqlParameter("@mensagemHistorico", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@mensagemHistorico").Value = EmailTextTextBox.Text

                prm = New SqlParameter("@parecerAnalista_Consultor", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@parecerAnalista_Consultor").Value = perfil_vaga_aprovado_comentarioTextBox.Text

                prm = New SqlParameter("@URL", SqlDbType.Text)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@URL").Value = myLink

            Else

                prm = New SqlParameter("@enviaEmail", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@enviaEmail").Value = 0

            End If

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows() Then

                    dr.Read()
                    protocoloLabel.Text = dr("Protocolo")
                    idVagaAnuncioPREVIEWLabel.Text = dr("idVagaAnuncioPREVIEW")
                    dataInicioLabel.Text = dr("dataInicio")
                    dataFimLabel.Text = dr("dataFim")
                    idFuncaoLabel.Text = dr("idCBOOcupacao")

                    msnemail.CssClass = "textoProcessoSeletivoABERTO"
                    msnemail.Text = "... e-mail enviado com sucesso!"

                End If

                cn.Close()

                REM *** ******************************************************************************************
                REM *** ENVIA EMAIL PARA O CONSULTOR DA VAGA
                REM *** ******************************************************************************************

                msn.Text = "Vaga foi gravada e pronta para edição e publicação."
                msn.CssClass = "textoProcessoSeletivoABERTO"

                MaintainScrollPositionOnPostBack = False
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Vaga foi gravada e pronta para edição e publicação.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

            Catch ex As Exception
                msn.Text = "Falha ao gravar o preview da vaga." & Err.Description

                MaintainScrollPositionOnPostBack = False
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Falha ao gravar o preview da vaga.<br>"
                AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
                ImageAVISO.ImageUrl = "~/_corporativo/images/buttonNOK.png"

            End Try

            Try
                dataInicioTextBox.Text = FormatDateTime(dataInicioLabel.Text, DateFormat.ShortDate)
                dataFimTextBox.Text = FormatDateTime(dataFimLabel.Text, DateFormat.ShortDate)
                PanelPreviewVaga.Visible = False
                DataListPreviewVaga.DataBind()
            Catch ex As Exception

            End Try

        End If

    End Sub

    Protected Sub LinkButtonMPAV_Click(sender As Object, e As System.EventArgs) Handles LinkButtonMPAV.Click


        Dim PROTOCOLO As String = Session("protocolo")

        If PROTOCOLO <> "" Then
            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PREVIEW_DO_ANUNCIO_VAGA_DELETE", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Protocolo").Value = PROTOCOLO

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                cn.Close()
            Catch ex As Exception

            End Try

            Session("protocolo") = ""
        End If


        Response.Redirect("Default.aspx")

    End Sub

    Protected Sub GridViewDEPARTAMENTO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewDEPARTAMENTO.SelectedIndexChanged
        DropDownListGESTOR.SelectedValue = GridViewDEPARTAMENTO.SelectedDataKey("email_departamento")
        idDepartamento_Gestor.Text = GridViewDEPARTAMENTO.SelectedDataKey("ID")
    End Sub

    Protected Sub opener_CheckedChanged(sender As Object, e As EventArgs) Handles opener.CheckedChanged
        If opener.Checked Then
            OutLookPerfildiv.Visible = True
        Else
            OutLookPerfildiv.Visible = False
        End If
    End Sub
End Class
