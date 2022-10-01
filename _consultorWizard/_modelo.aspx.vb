Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _consultor_modelo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LabelCabec.Text = Request.QueryString("autoTit")
        End If
    End Sub

    Protected Sub GridViewMODELO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewMODELO.SelectedIndexChanged
        idPerfilVagaFillLabel.Text = GridViewMODELO.SelectedDataKey("idPerfilVagaFill")
        FormViewModelo.ChangeMode(FormViewMode.Edit)
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        idPerfilVagaFillLabel.Text = ""
    End Sub

    Protected Sub SqlMODELOFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlMODELOFORM.Inserting

        If CType(FormViewModelo.FindControl("dsPerfilVagaTextBox"), TextBox).Text = "" Then
            MSN.Text = "Nome que será dado a este Modelo é obrigatório!"
            e.Cancel = True
        End If

        If CType(FormViewModelo.FindControl("CargoTextBox"), TextBox).Text = "" Then
            MSN.Text = "Nome que será dado ao Cargo é obrigatório!"
            e.Cancel = True
        End If

        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idCadastroEmpresa_Filha").Value = 0
        e.Command.Parameters("@idstatusvaga").Value = "Aprovado"
        e.Command.Parameters("@idTipoFormacao").Value = CType(FormViewModelo.FindControl("DropDownListFormacao"), DropDownList).SelectedValue
        e.Command.Parameters("@FormacaoAcademica").Value = CType(FormViewModelo.FindControl("DropDownListFormacao"), DropDownList).SelectedItem.Text

        If CType(FormViewModelo.FindControl("nrovagaTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@nrovaga").Value = 1
        Else
            e.Command.Parameters("@nrovaga").Value = CType(FormViewModelo.FindControl("nrovagaTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("BeneficiosTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@Beneficios").Value = " "
        Else
            e.Command.Parameters("@Beneficios").Value = CType(FormViewModelo.FindControl("BeneficiosTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("LocalTrabalhoTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@LocalTrabalho").Value = "São Paulo"
        Else
            e.Command.Parameters("@LocalTrabalho").Value = CType(FormViewModelo.FindControl("LocalTrabalhoTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("DropDownListUF"), DropDownList).SelectedValue = "  " Then
            e.Command.Parameters("@UF").Value = "SP"
        Else
            e.Command.Parameters("@UF").Value = CType(FormViewModelo.FindControl("DropDownListUF"), DropDownList).SelectedValue
        End If


        If CType(FormViewModelo.FindControl("RadioButtonListTipoOportunidade"), RadioButtonList).SelectedValue <> "" Then
            e.Command.Parameters("@TipoOportunidade").Value = CType(FormViewModelo.FindControl("RadioButtonListTipoOportunidade"), DropDownList).SelectedItem.Value
        Else
            e.Command.Parameters("@TipoOportunidade").Value = 2
        End If

        If CType(FormViewModelo.FindControl("RadioButtonListSexo"), RadioButtonList).SelectedValue <> "" Then
            e.Command.Parameters("@Sexo").Value = CType(FormViewModelo.FindControl("RadioButtonListSexo"), DropDownList).SelectedValue
        Else
            e.Command.Parameters("@Sexo").Value = "I"
        End If



        If CType(FormViewModelo.FindControl("QualificacaoHabilidadesEspecificasTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@QualificacaoHabilidadesEspecificas").Value = "."
        Else
            e.Command.Parameters("@QualificacaoHabilidadesEspecificas").Value = CType(FormViewModelo.FindControl("QualificacaoHabilidadesEspecificasTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("ObsComplementaresTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@ObsComplementares").Value = "."
        Else
            e.Command.Parameters("@ObsComplementares").Value = CType(FormViewModelo.FindControl("ObsComplementaresTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("PerfilGestorTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@PerfilGestor").Value = "."
        Else
            e.Command.Parameters("@PerfilGestor").Value = CType(FormViewModelo.FindControl("PerfilGestorTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("PerspectivaTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@Perspectiva").Value = "."
        Else
            e.Command.Parameters("@Perspectiva").Value = CType(FormViewModelo.FindControl("PerspectivaTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("ConhecimentoIdiomaTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@ConhecimentoIdioma").Value = "."
        Else
            e.Command.Parameters("@ConhecimentoIdioma").Value = CType(FormViewModelo.FindControl("ConhecimentoIdiomaTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("PerfilComposicaoEquipeTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@PerfilComposicaoEquipe").Value = "."
        Else
            e.Command.Parameters("@PerfilComposicaoEquipe").Value = CType(FormViewModelo.FindControl("PerfilComposicaoEquipeTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("CursoEspecificoTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@CursoEspecifico").Value = "."
        Else
            e.Command.Parameters("@CursoEspecifico").Value = CType(FormViewModelo.FindControl("CursoEspecificoTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("ConhecimentoTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@Conhecimento").Value = "."
        Else
            e.Command.Parameters("@Conhecimento").Value = CType(FormViewModelo.FindControl("ConhecimentoTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("ConhecimentoInformaticaTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@ConhecimentoInformatica").Value = "."
        Else
            e.Command.Parameters("@ConhecimentoInformatica").Value = CType(FormViewModelo.FindControl("ConhecimentoInformaticaTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("CompetenciaComportamentalTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@CompetenciaComportamental").Value = "."
        Else
            e.Command.Parameters("@CompetenciaComportamental").Value = CType(FormViewModelo.FindControl("CompetenciaComportamentalTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("CompetenciaProfissionalTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@CompetenciaProfissional").Value = "."
        Else
            e.Command.Parameters("@CompetenciaProfissional").Value = CType(FormViewModelo.FindControl("CompetenciaProfissionalTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("AspectoCriticoTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@AspectoCritico").Value = "."
        Else
            e.Command.Parameters("@AspectoCritico").Value = CType(FormViewModelo.FindControl("AspectoCriticoTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("PrincipalDesafioTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@PrincipalDesafio").Value = "."
        Else
            e.Command.Parameters("@PrincipalDesafio").Value = CType(FormViewModelo.FindControl("PrincipalDesafioTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("RelacionamentoInternoTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@RelacionamentoInterno").Value = "."
        Else
            e.Command.Parameters("@RelacionamentoInterno").Value = CType(FormViewModelo.FindControl("RelacionamentoInternoTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("RelacionamentoExternoTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@RelacionamentoExterno").Value = "."
        Else
            e.Command.Parameters("@RelacionamentoExterno").Value = CType(FormViewModelo.FindControl("RelacionamentoExternoTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("viagensTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@viagens").Value = "."
        Else
            e.Command.Parameters("@viagens").Value = CType(FormViewModelo.FindControl("viagensTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("infoSobre_viagensTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@infoSobre_viagens").Value = "."
        Else
            e.Command.Parameters("@infoSobre_viagens").Value = CType(FormViewModelo.FindControl("infoSobre_viagensTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("EstruturaOrganizacionalTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@EstruturaOrganizacional").Value = "."
        Else
            e.Command.Parameters("@EstruturaOrganizacional").Value = CType(FormViewModelo.FindControl("EstruturaOrganizacionalTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("FaixaEtariaInicioTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@FaixaEtariaInicio").Value = 30
        Else
            e.Command.Parameters("@FaixaEtariaInicio").Value = CType(FormViewModelo.FindControl("FaixaEtariaInicioTextBox"), TextBox).Text
        End If

        If CType(FormViewModelo.FindControl("FaixaEtariaFimTextBox"), TextBox).Text = "" Then
            e.Command.Parameters("@FaixaEtariaFim").Value = 40
        Else
            e.Command.Parameters("@FaixaEtariaFim").Value = CType(FormViewModelo.FindControl("FaixaEtariaFimTextBox"), TextBox).Text
        End If

        e.Command.Parameters("@perfil_vaga_aprovado_comentario").Value = "Modelo"

    End Sub

    Protected Sub SqlMODELOFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlMODELOFORM.Inserted
        GridViewMODELO.DataBind()
    End Sub

    Protected Sub SqlMODELOFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlMODELOFORM.Updated
        GridViewMODELO.DataBind()
        idPerfilVagaFillLabel.Text = ""
    End Sub

    Protected Sub SqlMODELOFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlMODELOFORM.Deleted
        GridViewMODELO.DataBind()
        idPerfilVagaFillLabel.Text = ""
    End Sub

    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFechar.Click
        PanelLevantamento.Visible = False
    End Sub

    Protected Sub LinkButtonCarga_Click(sender As Object, e As System.EventArgs)
        PanelLevantamento.Visible = True
    End Sub

    Protected Sub GridViewLevantamentoCad_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewLevantamentoCad.SelectedIndexChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CARGA_LEVANTAMENTO_MODELO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idPerfilVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idPerfilVaga").Value = GridViewLevantamentoCad.SelectedDataKey("idPerfilVaga")
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        cn.Close()

        GridViewMODELO.DataBind()
        idPerfilVagaFillLabel.Text = ""
        PanelLevantamento.Visible = False

    End Sub
End Class
