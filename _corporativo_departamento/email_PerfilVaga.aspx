<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_corporativo_departamento/corporativoPage.master" AutoEventWireup="false" CodeFile="email_PerfilVaga.aspx.vb" Inherits="_anonimo_aprPerfilVaga" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>

<input id="ActiveAccordeon" type="hidden" runat="server"  value="0" />
        <table cellpadding="0" cellspacing="0" align="center" 
            width="100%">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" 
                        align="center">
                        <tr>
                            <td align="left">
    <asp:Panel ID="PanelDocumento" runat="server">
        <asp:Panel ID="PanelAviso" runat="server" Visible="False">
            <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                <tr>
                    <td align="center">
                        <asp:Image ID="ImageAVISO" runat="server" ImageUrl="~/_corporativo/images/buttonOK.png" />
                    </td>
                    <td align="center">
                        <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="statusLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="emailGestorLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="emailGESTORMSNLabel" runat="server"></asp:Label>
        <asp:Label ID="nomeGestorLabel" runat="server"></asp:Label>
        <asp:Panel ID="PanelANUNCIO" runat="server" Visible="False">
            <br />
            <asp:DataList ID="DataListPREVIEWVAGA" runat="server" DataKeyField="idVagaAnuncio" DataSourceID="SqlDataSourcePreviewVaga" Width="100%">
                <ItemTemplate>
                    <table id="PreViewVaga0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="ProtocoloLabel0" runat="server" CssClass="tituloProcessoSeletivo" Text='<%# Bind("Protocolo") %>' />
                                <br />
                                <table id="CABECANUNCIOTABLE" cellpadding="10" cellspacing="10" width="100%">
                                    <tr>
                                        <td align="left">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Image ID="ImagePNE" runat="server" ImageUrl="~/_corporativo/images/pne.png" Visible='<%# Eval("pne") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LabelANUNCIO" runat="server" CssClass="textoResumoVAGA" Text='<%# Eval("dsempresaVaga") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table id="PREVIEW" align="center" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td id="FormacaoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("FormacaoAcademica_Apresenta") %>' width="40%">
                                            <asp:Label ID="FormacaoAcademica_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("FormacaoAcademica_Label") %>' Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                        </td>
                                        <td id="FormacaoTD4" runat="server" class="tableFormulario" visible='<%# Eval("FormacaoAcademica_Apresenta") %>'>
                                            <asp:Label ID="FormacaoAcademicaLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("FormacaoAcademica") %>' Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="PerfilVagaTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("dsPerfilVaga_Apresenta") %>' width="40%">
                                            <asp:Label ID="dsPerfilVaga_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("dsPerfilVaga_Label") %>' Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                        </td>
                                        <td id="PerfilVagaTD4" runat="server" class="tableFormulario" visible='<%# Eval("dsPerfilVaga_Apresenta") %>'>
                                            <asp:Label ID="dsPerfilVagaLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("dsPerfilVaga") %>' Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="CargoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Cargo_Apresenta") %>' width="40%">
                                            <asp:Label ID="Cargo_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Cargo_Label") %>' Visible='<%# Eval("Cargo_Apresenta") %>' />
                                        </td>
                                        <td id="CargoTD4" runat="server" class="tableFormulario" visible='<%# Eval("Cargo_Apresenta") %>'>
                                            <asp:Label ID="CargoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Cargo") %>' Visible='<%# Eval("Cargo_Apresenta") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="nrovagaTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("nrovaga_Apresenta") %>' width="40%">
                                            <asp:Label ID="nrovaga_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("nrovaga_Label") %>' />
                                        </td>
                                        <td id="nrovagaTD4" runat="server" class="tableFormulario" visible='<%# Eval("nrovaga_Apresenta") %>'>
                                            <asp:Label ID="nrovagaLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("nrovaga") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="nmresponsavelTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("nmresponsavel_Apresenta") %>' width="40%">
                                            <asp:Label ID="nmresponsavel_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("nmresponsavel_Label") %>' />
                                        </td>
                                        <td id="nmresponsavelTD4" runat="server" class="tableFormulario" visible='<%# Eval("nmresponsavel_Apresenta") %>'>
                                            <asp:Label ID="nmresponsavelLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("nmresponsavel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="TipoOportunidadeTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("TipoOportunidade_Apresenta") %>' width="40%">
                                            <asp:Label ID="TipoOportunidade_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("TipoOportunidade_Label") %>' />
                                        </td>
                                        <td id="TipoOportunidadeTD4" runat="server" class="tableFormulario" visible='<%# Eval("TipoOportunidade_Apresenta") %>'>
                                            <asp:Label ID="TipoOportunidadeLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("TipoOportunidade") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="QualificacaoHabilidadesEspecificasTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>' width="40%">
                                            <asp:Label ID="QualificacaoHabilidadesEspecificas_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                        </td>
                                        <td id="QualificacaoHabilidadesEspecificasTD4" runat="server" class="tableFormulario" visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                            <asp:Label ID="QualificacaoHabilidadesEspecificasLabel0" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="Remuneracao_LabelTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Remuneracao_Apresenta") %>' width="40%">
                                            <asp:Label ID="Remuneracao_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Remuneracao_Label") %>' />
                                        </td>
                                        <td id="Remuneracao_LabelTD4" runat="server" class="tableFormulario" visible='<%# Eval("Remuneracao_Apresenta") %>'>
                                            <asp:Label ID="RemuneracaoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Remuneracao", "{0:C}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="RemuneracaoVariavelTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>' width="40%">
                                            <asp:Label ID="RemuneracaoVariavel_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                        </td>
                                        <td id="RemuneracaoVariavelTD4" runat="server" class="tableFormulario" visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>'>
                                            <asp:Label ID="RemuneracaoVariavelLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("RemuneracaoVariavel", "{0:C}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="HonorarioTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Honorario_Apresenta") %>' width="40%">
                                            <asp:Label ID="Honorario_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Honorario_Label") %>' />
                                        </td>
                                        <td id="HonorarioTD4" runat="server" class="tableFormulario" visible='<%# Eval("Honorario_Apresenta") %>'>
                                            <asp:Label ID="HonorarioLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Honorario", "{0:C}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="LocalTrabalhoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("LocalTrabalho_Apresenta") %>' width="40%">
                                            <asp:Label ID="LocalTrabalho_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("LocalTrabalho_Label") %>' />
                                        </td>
                                        <td id="LocalTrabalhoTD4" runat="server" class="tableFormulario" visible='<%# Eval("LocalTrabalho_Apresenta") %>'>
                                            <asp:Label ID="LocalTrabalhoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("LocalTrabalho") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="ObsComplementaresTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("ObsComplementares_Apresenta") %>' width="40%">
                                            <asp:Label ID="ObsComplementares_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("ObsComplementares_Label") %>' />
                                        </td>
                                        <td id="ObsComplementaresTD4" runat="server" class="tableFormulario" visible='<%# Eval("ObsComplementares_Apresenta") %>'>
                                            <asp:Label ID="ObsComplementaresLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("ObsComplementares") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="BeneficiosTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Beneficios_Apresenta") %>' width="40%">
                                            <asp:Label ID="Beneficios_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Beneficios_Label") %>' />
                                        </td>
                                        <td id="BeneficiosTD4" runat="server" class="tableFormulario" visible='<%# Eval("Beneficios_Apresenta") %>'>
                                            <asp:Label ID="BeneficiosLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Beneficios") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="PerspectivaTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Perspectiva_Apresenta") %>' width="40%">
                                            <asp:Label ID="Perspectiva_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Perspectiva_Label") %>' />
                                        </td>
                                        <td id="PerspectivaTD4" runat="server" class="tableFormulario" visible='<%# Eval("Perspectiva_Apresenta") %>'>
                                            <asp:Label ID="PerspectivaLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Perspectiva") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="FaixaEtariaInicioTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>' width="40%">
                                            <asp:Label ID="FaixaEtariaInicio_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                        </td>
                                        <td id="FaixaEtariaInicioTD4" runat="server" class="tableFormulario" visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>'>
                                            <asp:Label ID="FaixaEtariaInicioLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("FaixaEtariaInicio", "{0} anos") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="FaixaEtariaFimTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>' width="40%">
                                            <asp:Label ID="FaixaEtariaFim_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                        </td>
                                        <td id="FaixaEtariaFimTD4" runat="server" class="tableFormulario" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>'>
                                            <asp:Label ID="FaixaEtariaFimLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("FaixaEtariaFim", "{0} anos") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="SexoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Sexo_Apresenta") %>' width="40%">
                                            <asp:Label ID="Sexo_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Sexo_Label") %>' />
                                        </td>
                                        <td id="SexoTD4" runat="server" class="tableFormulario" visible='<%# Eval("Sexo_Apresenta") %>'>
                                            <asp:Label ID="SexoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Sexo") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="ConhecimentoIdiomaTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>' width="40%">
                                            <asp:Label ID="ConhecimentoIdioma_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                        </td>
                                        <td id="ConhecimentoIdiomaTD4" runat="server" class="tableFormulario" visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>'>
                                            <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("ConhecimentoIdioma") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="PerfilComposicaoEquipeTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>' width="40%">
                                            <asp:Label ID="PerfilComposicaoEquipe_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                        </td>
                                        <td id="PerfilComposicaoEquipeTD4" runat="server" class="tableFormulario" visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>'>
                                            <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="PerfilGestorTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("PerfilGestor_Apresenta") %>' width="40%">
                                            <asp:Label ID="PerfilGestor_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("PerfilGestor_Label") %>' />
                                        </td>
                                        <td id="PerfilGestorTD4" runat="server" class="tableFormulario" visible='<%# Eval("PerfilGestor_Apresenta") %>'>
                                            <asp:Label ID="PerfilGestorLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("PerfilGestor") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="CursoEspecificoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("CursoEspecifico_Apresenta") %>' width="40%">
                                            <asp:Label ID="CursoEspecifico_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("CursoEspecifico_Label") %>' />
                                        </td>
                                        <td id="CursoEspecificoTD4" runat="server" class="tableFormulario" visible='<%# Eval("CursoEspecifico_Apresenta") %>'>
                                            <asp:Label ID="CursoEspecificoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("CursoEspecifico") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="ConhecimentoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("Conhecimento_Apresenta") %>' width="40%">
                                            <asp:Label ID="Conhecimento_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("Conhecimento_Label") %>' />
                                        </td>
                                        <td id="ConhecimentoTD4" runat="server" class="tableFormulario" visible='<%# Eval("Conhecimento_Apresenta") %>'>
                                            <asp:Label ID="ConhecimentoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("Conhecimento") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="ConhecimentoInformaticaTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>' width="40%">
                                            <asp:Label ID="ConhecimentoInformatica_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                        </td>
                                        <td id="ConhecimentoInformaticaTD4" runat="server" class="tableFormulario" visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>'>
                                            <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("ConhecimentoInformatica") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="CompetenciaComportamentalTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("CompetenciaComportamental_Apresenta") %>' width="40%">
                                            <asp:Label ID="CompetenciaComportamental_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                        </td>
                                        <td id="CompetenciaComportamentalTD4" runat="server" class="tableFormulario" visible='<%# Eval("CompetenciaComportamental_Apresenta") %>'>
                                            <asp:Label ID="CompetenciaComportamentalLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("CompetenciaComportamental") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="CompetenciaProfissionalTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("CompetenciaProfissional_Apresenta") %>' width="40%">
                                            <asp:Label ID="CompetenciaProfissional_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                        </td>
                                        <td id="CompetenciaProfissionalTD4" runat="server" class="tableFormulario" visible='<%# Eval("CompetenciaProfissional_Apresenta") %>'>
                                            <asp:Label ID="CompetenciaProfissionalLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("CompetenciaProfissional") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="AspectoCriticoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("AspectoCritico_Apresenta") %>' width="40%">
                                            <asp:Label ID="AspectoCritico_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("AspectoCritico_Label") %>' />
                                        </td>
                                        <td id="AspectoCriticoTD4" runat="server" class="tableFormulario" visible='<%# Eval("AspectoCritico_Apresenta") %>'>
                                            <asp:Label ID="AspectoCriticoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("AspectoCritico") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="PrincipalDesafioTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("PrincipalDesafio_Apresenta") %>' width="40%">
                                            <asp:Label ID="PrincipalDesafio_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                        </td>
                                        <td id="PrincipalDesafioTD4" runat="server" class="tableFormulario" visible='<%# Eval("PrincipalDesafio_Apresenta") %>'>
                                            <asp:Label ID="PrincipalDesafioLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("PrincipalDesafio") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="RelacionamentoInternoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("RelacionamentoInterno_Apresenta") %>' width="40%">
                                            <asp:Label ID="RelacionamentoInterno_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                        </td>
                                        <td id="RelacionamentoInternoTD4" runat="server" class="tableFormulario" visible='<%# Eval("RelacionamentoInterno_Apresenta") %>'>
                                            <asp:Label ID="RelacionamentoInternoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("RelacionamentoInterno") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="RelacionamentoExternoTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("RelacionamentoExterno_Apresenta") %>' width="40%">
                                            <asp:Label ID="RelacionamentoExterno_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                        </td>
                                        <td id="RelacionamentoExternoTD4" runat="server" class="tableFormulario" visible='<%# Eval("RelacionamentoExterno_Apresenta") %>'>
                                            <asp:Label ID="RelacionamentoExternoLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("RelacionamentoExterno") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="infoSobre_viagensTD3" runat="server" align="right" class="tableFormulario" valign="top" visible='<%# Eval("infoSobre_viagens_Apresenta") %>' width="40%">
                                            <asp:Label ID="infoSobre_viagens_LabelLabel" runat="server" CssClass="textoResumoVAGA" Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                        </td>
                                        <td id="infoSobre_viagensTD4" runat="server" class="tableFormulario" visible='<%# Eval("infoSobre_viagens_Apresenta") %>'>
                                            <asp:Label ID="infoSobre_viagensLabel" runat="server" CssClass="textoResumoConteudoCV" Text='<%# Bind("infoSobre_viagens") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:FormView ID="FormViewMENSAGEM" runat="server" DataKeyNames="idVagaAnuncio_PREVIEW_Historico" DataSourceID="SqlOUTLOOK_FORM" DefaultMode="Edit">
                <EditItemTemplate>
                    <table id="COMUNICADOR0" cellpadding="2" cellspacing="2" width="100%">
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label5" runat="server" Text="Protocolo da vaga salva:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="protocoloLabel1" runat="server" Text='<%# Bind("protocolo") %>' />
                                <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel" runat="server" Text='<%# Eval("idVagaAnuncio_PREVIEW_Historico") %>' Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label6" runat="server" Text="Protocolo da vaga:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="protocoloVagaLabel" runat="server" Text='<%# Bind("protocoloVaga") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="#FFFFEC" valign="top" width="300">
                                <asp:Label ID="Label7" runat="server" Text="Histórico das mensagens:"></asp:Label>
                            </td>
                            <td bgcolor="#FFFFEC">
                                <asp:Label ID="historicoLabel" runat="server" CssClass="textoNone" Text='<%# Bind("historico") %>' />
                                <br />
                                <asp:Label ID="Label12" runat="server" Text="Sua mensagem:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBoxMensagem" ErrorMessage="• Escreva a mensagem a ser enviada." ValidationGroup="MENSAGEM"></asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="TextBoxMensagem" runat="server" CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" ValidationGroup="MENSAGEM" Width="500px"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label14" runat="server" Text="Comentário (Será apresentado no histórico):"></asp:Label>
                                <br />
                                <asp:TextBox ID="parecerAnalista_ConsultorMTextBox" runat="server" CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" ValidationGroup="MENSAGEM" Width="500px"></asp:TextBox>
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListSMS" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">Enviar SMS e e-mail</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="0">Enviar apenas e-mail</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label8" runat="server" Text="Observações:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="parecerAnalista_ConsultorLabel" runat="server" CssClass="textoNone" Text='<%# Bind("parecerAnalista_Consultor") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label9" runat="server" Text="Gestor:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="nomeGESTORLabel" runat="server" Text='<%# Bind("nomeGESTOR") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label10" runat="server" Text="e-mail:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="emailGESTORLabel" runat="server" Text='<%# Bind("emailGESTOR") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label11" runat="server" Text="Criação da vaga em:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="dataCriacaoLabel" runat="server" Text='<%# Bind("dataCriacao") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">&nbsp;</td>
                            <td align="right">
                                <br />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" width="100%">
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="EditButton0" runat="server" CommandName="Update" CssClass="button" Text="Enviar mensagem" ToolTip="Clique aqui para enviar mensagem" ValidationGroup="MENSAGEM" />
                                <asp:LinkButton ID="LinkButtonCancelar" runat="server" CssClass="button" OnClick="LinkButtonCancelar_Click">Cancelar o envio</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <asp:TextBox ID="idRH_GestorTextBox" runat="server" Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="protocoloTextBox" runat="server" Text='<%# Bind("protocolo") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="protocoloVagaTextBox" runat="server" Text='<%# Bind("protocoloVaga") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="historicoTextBox0" runat="server" Text='<%# Bind("historico") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="parecerAnalista_ConsultorTextBox" runat="server" Text='<%# Bind("parecerAnalista_Consultor") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="nomeGESTORTextBox" runat="server" Text='<%# Bind("nomeGESTOR") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="emailGESTORTextBox" runat="server" Text='<%# Bind("emailGESTOR") %>' Visible="False" Width="10px" />
                    <asp:TextBox ID="dataCriacaoTextBox" runat="server" Text='<%# Bind("dataCriacao") %>' Visible="False" Width="10px" />
                    <br />
                    &nbsp;
                </EditItemTemplate>
                <InsertItemTemplate>
                    idRH_Gestor:
                    <asp:TextBox ID="idRH_GestorTextBox0" runat="server" Text='<%# Bind("idRH_Gestor") %>' />
                    <br />
                    protocolo:
                    <asp:TextBox ID="protocoloTextBox0" runat="server" Text='<%# Bind("protocolo") %>' />
                    <br />
                    protocoloVaga:
                    <asp:TextBox ID="protocoloVagaTextBox0" runat="server" Text='<%# Bind("protocoloVaga") %>' />
                    <br />
                    historico:
                    <asp:TextBox ID="historicoTextBox1" runat="server" Text='<%# Bind("historico") %>' />
                    <br />
                    parecerAnalista_Consultor:
                    <asp:TextBox ID="parecerAnalista_ConsultorTextBox0" runat="server" Text='<%# Bind("parecerAnalista_Consultor") %>' />
                    <br />
                    nomeGESTOR:
                    <asp:TextBox ID="nomeGESTORTextBox0" runat="server" Text='<%# Bind("nomeGESTOR") %>' />
                    <br />
                    emailGESTOR:
                    <asp:TextBox ID="emailGESTORTextBox0" runat="server" Text='<%# Bind("emailGESTOR") %>' />
                    <br />
                    dataCriacao:
                    <asp:TextBox ID="dataCriacaoTextBox0" runat="server" Text='<%# Bind("dataCriacao") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel2" runat="server" Text='<%# Eval("idVagaAnuncio_PREVIEW_Historico") %>' Visible="False" />
                    <asp:Label ID="idRH_GestorLabel" runat="server" Text='<%# Bind("idRH_Gestor") %>' Visible="False" />
                    <br />
                    <table id="COMUNICADOR" cellpadding="2" cellspacing="2" width="800">
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label15" runat="server" Text="Protocolo da vaga salva:"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="protocoloLabel2" runat="server" Text='<%# Bind("protocolo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label16" runat="server" Text="Protocolo da vaga:"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="protocoloVagaLabel0" runat="server" Text='<%# Bind("protocoloVaga") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label17" runat="server" Text="Histórico das mensagens:"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="historicoLabel1" runat="server" Text='<%# Bind("historico") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label18" runat="server" Text="Observações:" Visible="False"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="parecerAnalista_ConsultorLabel0" runat="server" Text='<%# Bind("parecerAnalista_Consultor") %>' Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label19" runat="server" Text="Gestor:"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="nomeGESTORLabel0" runat="server" Text='<%# Bind("nomeGESTOR") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label20" runat="server" Text="e-mail:"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="emailGESTORLabel1" runat="server" Text='<%# Bind("emailGESTOR") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">
                                <asp:Label ID="Label21" runat="server" Text="Criação da vaga em:"></asp:Label>
                            </td>
                            <td width="500">
                                <asp:Label ID="dataCriacaoLabel0" runat="server" Text='<%# Bind("dataCriacao") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="300">&nbsp;</td>
                            <td align="right" width="500">
                                <br />
                                <asp:LinkButton ID="EditButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="button" Text="Enviar mensagem" ToolTip="Clique aqui para enviar mensagem" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
        </asp:Panel>
        <br />
        <table ID="RelatorioPerfilVaga" cellpadding="5" cellspacing="5" width="100%">
            <tr>
                <td>
                    <asp:Label ID="LabelCabec" runat="server" CssClass="h1" Text="Comunicação interna"></asp:Label>
                    <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                    <br />

                    <asp:DataList ID="DataListHISTORICO" runat="server" DataKeyField="idVaga" DataSourceID="SqlDataSourceHISTORICO">
                     <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="nomeprocessoLabel" runat="server" CssClass="tituloProcessoSeletivo" Text='<%# Eval("dsfuncao") %>'></asp:Label>
                                        <asp:Label ID="HifenLabel" runat="server" CssClass="tituloProcessoSeletivo" Text=" -"></asp:Label>
                                        <asp:Label ID="ProtocoloDBLabel" runat="server" CssClass="tituloProcessoSeletivo" Text='<%# Eval("ProtocoloVaga") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" width="800px">
                                            <tr>
                                                <td align="center" cellpadding="0" valign="top" width="70px">
                                                    <asp:ImageButton ID="ImageButtonVaga" runat="server" CommandName="Select" ImageUrl="~/_corporativo/images/holomatica/EDITAR.png" ToolTip="Clique aqui para falar com os Analistas" CommandArgument='<%# Eval("idVagaAnuncio_PREVIEW_Historico") %>' />
                                                </td>
                                                <td width="790px">
                                                    <table id="RES1" cellpadding="2" cellspacing="2" width="100%">
                                                        <tr>
                                                            <td align="right" bgcolor="#EEEEEE" valign="top" width="140">
                                                                <asp:Label ID="AberturaLabel" runat="server" CssClass="textoBold" Text="Data Publicação:"></asp:Label>
                                                            </td>
                                                            <td bgcolor="#EEEEEE">
                                                                <asp:Label ID="DataInicialProcessoDBLabel" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("dataCriacao") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="140">
                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" Text="Requisitante:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="RequisitanteLabel" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("nomeANALISTA_CONSULTOR") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" bgcolor="#EEEEEE" valign="top" width="140">
                                                                <asp:Label ID="AnalistaResLabel" runat="server" CssClass="textoBold" Text="Analista Responsável:"></asp:Label>
                                                            </td>
                                                            <td bgcolor="#EEEEEE">
                                                                <asp:Label ID="ConsultorResponsavelDBLabel" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("nomeGESTOR") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="140">
                                                                <asp:Label ID="StatusLabel" runat="server" CssClass="textoBold" Text="Status:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="FechadoLabel" runat="server" CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("VagaSTATUS") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="top" width="140">&nbsp;</td>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="LabelCANDIDATURA" runat="server" CssClass="textoBold" Text="Candidaturas:"></asp:Label>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                        <td>
                                                                            <asp:Label ID="TotalCandidaturasLabel" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("contador") %>' />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" valign="top" width="1px">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
 

                        </ItemTemplate>
                    </asp:DataList>

                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceHISTORICO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_HISTORICO_PROCESSO_SELETIVO" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
                            <asp:SessionParameter DefaultValue="" Name="idRH_GestorREQUISITANTE" SessionField="idRH_Gestor" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlOUTLOOK_FORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_OUTLOOK_VAGA_SALVA_HISTORICO_SELECT" UpdateCommand="_USP_OUTLOOK_VAGA_SALVA_HISTORICO_ENVIA" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idVagaAnuncio_PREVIEW_HistoricoLabel" Name="idVagaAnuncio_PREVIEW_Historico" PropertyName="Text" Type="Int32" />
                            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idVagaAnuncio_PREVIEW_Historico" Type="Int32" />
                            <asp:Parameter Name="Protocolo" Type="String" />
                            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                            <asp:Parameter Name="enviaEmail" Type="Int32" />
                            <asp:Parameter Name="nomeGESTOR" Type="String" />
                            <asp:Parameter Name="emailGESTOR" Type="String" />
                            <asp:Parameter Name="nomeANALISTA_CONSULTOR" Type="String" />
                            <asp:Parameter Name="emailANALISTA_CONSULTOR" Type="String" />
                            <asp:Parameter Name="SMS" Type="Int32" />
                            <asp:Parameter Name="mensagemHistorico" Type="String" />
                            <asp:Parameter Name="historico" Type="String" />
                            <asp:Parameter Name="parecerAnalista_Consultor" Type="String" />
                            <asp:Parameter Name="dataCriacao" Type="DateTime" />
                            <asp:Parameter Name="protocoloVaga" Type="String" />
                            <asp:Parameter Name="URL" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourcePreviewVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [_tbVagaAnuncio] WHERE [idVagaAnuncio] = @idVagaAnuncio" InsertCommand="INSERT INTO [_tbVagaAnuncio] ([Protocolo], [FormacaoAcademica_Label], [FormacaoAcademica], [FormacaoAcademica_Apresenta], [dsPerfilVaga_Label], [dsPerfilVaga], [dsPerfilVaga_Apresenta], [Cargo_Label], [Cargo], [Cargo_Apresenta], [nrovaga_Label], [nrovaga], [nrovaga_Apresenta], [nmresponsavel_Label], [nmresponsavel], [nmresponsavel_Apresenta], [TipoOportunidade_Label], [TipoOportunidade], [TipoOportunidade_Apresenta], [QualificacaoHabilidadesEspecificas_Label], [QualificacaoHabilidadesEspecificas], [QualificacaoHabilidadesEspecificas_Apresenta], [Remuneracao_Label], [Remuneracao], [Remuneracao_Apresenta], [RemuneracaoVariavel_Label], [RemuneracaoVariavel], [RemuneracaoVariavel_Apresenta], [Honorario_Label], [Honorario], [Honorario_Apresenta], [LocalTrabalho_Label], [LocalTrabalho], [LocalTrabalho_Apresenta], [ObsComplementares_Label], [ObsComplementares], [ObsComplementares_Apresenta], [Beneficios_Label], [Beneficios], [Beneficios_Apresenta], [Perspectiva_Label], [Perspectiva], [Perspectiva_Apresenta], [FaixaEtariaInicio_Label], [FaixaEtariaInicio], [FaixaEtariaInicio_Apresenta], [FaixaEtariaFim_Label], [FaixaEtariaFim], [FaixaEtariaFim_Apresenta], [Sexo_Label], [Sexo], [Sexo_Apresenta], [ConhecimentoIdioma_Label], [ConhecimentoIdioma], [ConhecimentoIdioma_Apresenta], [PerfilComposicaoEquipe_Label], [PerfilComposicaoEquipe], [PerfilComposicaoEquipe_Apresenta], [PerfilGestor_Label], [PerfilGestor], [PerfilGestor_Apresenta], [CursoEspecifico_Label], [CursoEspecifico], [CursoEspecifico_Apresenta], [Conhecimento_Label], [Conhecimento], [Conhecimento_Apresenta], [ConhecimentoInformatica_Label], [ConhecimentoInformatica], [ConhecimentoInformatica_Apresenta], [CompetenciaComportamental_Label], [CompetenciaComportamental], [CompetenciaComportamental_Apresenta], [CompetenciaProfissional_Label], [CompetenciaProfissional], [CompetenciaProfissional_Apresenta], [AspectoCritico_Label], [AspectoCritico], [AspectoCritico_Apresenta], [PrincipalDesafio_Label], [PrincipalDesafio], [PrincipalDesafio_Apresenta], [RelacionamentoInterno_Label], [RelacionamentoInterno], [RelacionamentoInterno_Apresenta], [RelacionamentoExterno_Label], [RelacionamentoExterno], [RelacionamentoExterno_Apresenta], [infoSobre_viagens_Label], [infoSobre_viagens], [infoSobre_viagens_Apresenta], [confidencial_Label], [confidencial], [confidencial_Apresenta]) VALUES (@Protocolo, @FormacaoAcademica_Label, @FormacaoAcademica, @FormacaoAcademica_Apresenta, @dsPerfilVaga_Label, @dsPerfilVaga, @dsPerfilVaga_Apresenta, @Cargo_Label, @Cargo, @Cargo_Apresenta, @nrovaga_Label, @nrovaga, @nrovaga_Apresenta, @nmresponsavel_Label, @nmresponsavel, @nmresponsavel_Apresenta, @TipoOportunidade_Label, @TipoOportunidade, @TipoOportunidade_Apresenta, @QualificacaoHabilidadesEspecificas_Label, @QualificacaoHabilidadesEspecificas, @QualificacaoHabilidadesEspecificas_Apresenta, @Remuneracao_Label, @Remuneracao, @Remuneracao_Apresenta, @RemuneracaoVariavel_Label, @RemuneracaoVariavel, @RemuneracaoVariavel_Apresenta, @Honorario_Label, @Honorario, @Honorario_Apresenta, @LocalTrabalho_Label, @LocalTrabalho, @LocalTrabalho_Apresenta, @ObsComplementares_Label, @ObsComplementares, @ObsComplementares_Apresenta, @Beneficios_Label, @Beneficios, @Beneficios_Apresenta, @Perspectiva_Label, @Perspectiva, @Perspectiva_Apresenta, @FaixaEtariaInicio_Label, @FaixaEtariaInicio, @FaixaEtariaInicio_Apresenta, @FaixaEtariaFim_Label, @FaixaEtariaFim, @FaixaEtariaFim_Apresenta, @Sexo_Label, @Sexo, @Sexo_Apresenta, @ConhecimentoIdioma_Label, @ConhecimentoIdioma, @ConhecimentoIdioma_Apresenta, @PerfilComposicaoEquipe_Label, @PerfilComposicaoEquipe, @PerfilComposicaoEquipe_Apresenta, @PerfilGestor_Label, @PerfilGestor, @PerfilGestor_Apresenta, @CursoEspecifico_Label, @CursoEspecifico, @CursoEspecifico_Apresenta, @Conhecimento_Label, @Conhecimento, @Conhecimento_Apresenta, @ConhecimentoInformatica_Label, @ConhecimentoInformatica, @ConhecimentoInformatica_Apresenta, @CompetenciaComportamental_Label, @CompetenciaComportamental, @CompetenciaComportamental_Apresenta, @CompetenciaProfissional_Label, @CompetenciaProfissional, @CompetenciaProfissional_Apresenta, @AspectoCritico_Label, @AspectoCritico, @AspectoCritico_Apresenta, @PrincipalDesafio_Label, @PrincipalDesafio, @PrincipalDesafio_Apresenta, @RelacionamentoInterno_Label, @RelacionamentoInterno, @RelacionamentoInterno_Apresenta, @RelacionamentoExterno_Label, @RelacionamentoExterno, @RelacionamentoExterno_Apresenta, @infoSobre_viagens_Label, @infoSobre_viagens, @infoSobre_viagens_Apresenta, @confidencial_Label, @confidencial, @confidencial_Apresenta)" SelectCommand="_USP_EDITOR_PESQUISA_VAGA" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [_tbVagaAnuncio] SET [Protocolo] = @Protocolo, [FormacaoAcademica_Label] = @FormacaoAcademica_Label, [FormacaoAcademica] = @FormacaoAcademica, [FormacaoAcademica_Apresenta] = @FormacaoAcademica_Apresenta, [dsPerfilVaga_Label] = @dsPerfilVaga_Label, [dsPerfilVaga] = @dsPerfilVaga, [dsPerfilVaga_Apresenta] = @dsPerfilVaga_Apresenta, [Cargo_Label] = @Cargo_Label, [Cargo] = @Cargo, [Cargo_Apresenta] = @Cargo_Apresenta, [nrovaga_Label] = @nrovaga_Label, [nrovaga] = @nrovaga, [nrovaga_Apresenta] = @nrovaga_Apresenta, [nmresponsavel_Label] = @nmresponsavel_Label, [nmresponsavel] = @nmresponsavel, [nmresponsavel_Apresenta] = @nmresponsavel_Apresenta, [TipoOportunidade_Label] = @TipoOportunidade_Label, [TipoOportunidade] = @TipoOportunidade, [TipoOportunidade_Apresenta] = @TipoOportunidade_Apresenta, [QualificacaoHabilidadesEspecificas_Label] = @QualificacaoHabilidadesEspecificas_Label, [QualificacaoHabilidadesEspecificas] = @QualificacaoHabilidadesEspecificas, [QualificacaoHabilidadesEspecificas_Apresenta] = @QualificacaoHabilidadesEspecificas_Apresenta, [Remuneracao_Label] = @Remuneracao_Label, [Remuneracao] = @Remuneracao, [Remuneracao_Apresenta] = @Remuneracao_Apresenta, [RemuneracaoVariavel_Label] = @RemuneracaoVariavel_Label, [RemuneracaoVariavel] = @RemuneracaoVariavel, [RemuneracaoVariavel_Apresenta] = @RemuneracaoVariavel_Apresenta, [Honorario_Label] = @Honorario_Label, [Honorario] = @Honorario, [Honorario_Apresenta] = @Honorario_Apresenta, [LocalTrabalho_Label] = @LocalTrabalho_Label, [LocalTrabalho] = @LocalTrabalho, [LocalTrabalho_Apresenta] = @LocalTrabalho_Apresenta, [ObsComplementares_Label] = @ObsComplementares_Label, [ObsComplementares] = @ObsComplementares, [ObsComplementares_Apresenta] = @ObsComplementares_Apresenta, [Beneficios_Label] = @Beneficios_Label, [Beneficios] = @Beneficios, [Beneficios_Apresenta] = @Beneficios_Apresenta, [Perspectiva_Label] = @Perspectiva_Label, [Perspectiva] = @Perspectiva, [Perspectiva_Apresenta] = @Perspectiva_Apresenta, [FaixaEtariaInicio_Label] = @FaixaEtariaInicio_Label, [FaixaEtariaInicio] = @FaixaEtariaInicio, [FaixaEtariaInicio_Apresenta] = @FaixaEtariaInicio_Apresenta, [FaixaEtariaFim_Label] = @FaixaEtariaFim_Label, [FaixaEtariaFim] = @FaixaEtariaFim, [FaixaEtariaFim_Apresenta] = @FaixaEtariaFim_Apresenta, [Sexo_Label] = @Sexo_Label, [Sexo] = @Sexo, [Sexo_Apresenta] = @Sexo_Apresenta, [ConhecimentoIdioma_Label] = @ConhecimentoIdioma_Label, [ConhecimentoIdioma] = @ConhecimentoIdioma, [ConhecimentoIdioma_Apresenta] = @ConhecimentoIdioma_Apresenta, [PerfilComposicaoEquipe_Label] = @PerfilComposicaoEquipe_Label, [PerfilComposicaoEquipe] = @PerfilComposicaoEquipe, [PerfilComposicaoEquipe_Apresenta] = @PerfilComposicaoEquipe_Apresenta, [PerfilGestor_Label] = @PerfilGestor_Label, [PerfilGestor] = @PerfilGestor, [PerfilGestor_Apresenta] = @PerfilGestor_Apresenta, [CursoEspecifico_Label] = @CursoEspecifico_Label, [CursoEspecifico] = @CursoEspecifico, [CursoEspecifico_Apresenta] = @CursoEspecifico_Apresenta, [Conhecimento_Label] = @Conhecimento_Label, [Conhecimento] = @Conhecimento, [Conhecimento_Apresenta] = @Conhecimento_Apresenta, [ConhecimentoInformatica_Label] = @ConhecimentoInformatica_Label, [ConhecimentoInformatica] = @ConhecimentoInformatica, [ConhecimentoInformatica_Apresenta] = @ConhecimentoInformatica_Apresenta, [CompetenciaComportamental_Label] = @CompetenciaComportamental_Label, [CompetenciaComportamental] = @CompetenciaComportamental, [CompetenciaComportamental_Apresenta] = @CompetenciaComportamental_Apresenta, [CompetenciaProfissional_Label] = @CompetenciaProfissional_Label, [CompetenciaProfissional] = @CompetenciaProfissional, [CompetenciaProfissional_Apresenta] = @CompetenciaProfissional_Apresenta, [AspectoCritico_Label] = @AspectoCritico_Label, [AspectoCritico] = @AspectoCritico, [AspectoCritico_Apresenta] = @AspectoCritico_Apresenta, [PrincipalDesafio_Label] = @PrincipalDesafio_Label, [PrincipalDesafio] = @PrincipalDesafio, [PrincipalDesafio_Apresenta] = @PrincipalDesafio_Apresenta, [RelacionamentoInterno_Label] = @RelacionamentoInterno_Label, [RelacionamentoInterno] = @RelacionamentoInterno, [RelacionamentoInterno_Apresenta] = @RelacionamentoInterno_Apresenta, [RelacionamentoExterno_Label] = @RelacionamentoExterno_Label, [RelacionamentoExterno] = @RelacionamentoExterno, [RelacionamentoExterno_Apresenta] = @RelacionamentoExterno_Apresenta, [infoSobre_viagens_Label] = @infoSobre_viagens_Label, [infoSobre_viagens] = @infoSobre_viagens, [infoSobre_viagens_Apresenta] = @infoSobre_viagens_Apresenta, [confidencial_Label] = @confidencial_Label, [confidencial] = @confidencial, [confidencial_Apresenta] = @confidencial_Apresenta WHERE [idVagaAnuncio] = @idVagaAnuncio">
                        <DeleteParameters>
                            <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Protocolo" Type="String" />
                            <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                            <asp:Parameter Name="FormacaoAcademica" Type="String" />
                            <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                            <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                            <asp:Parameter Name="dsPerfilVaga" Type="String" />
                            <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Cargo_Label" Type="String" />
                            <asp:Parameter Name="Cargo" Type="String" />
                            <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                            <asp:Parameter Name="nrovaga_Label" Type="String" />
                            <asp:Parameter Name="nrovaga" Type="Int32" />
                            <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                            <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                            <asp:Parameter Name="nmresponsavel" Type="String" />
                            <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                            <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                            <asp:Parameter Name="TipoOportunidade" Type="String" />
                            <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                            <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                            <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                            <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Remuneracao_Label" Type="String" />
                            <asp:Parameter Name="Remuneracao" Type="Decimal" />
                            <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                            <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                            <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                            <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Honorario_Label" Type="String" />
                            <asp:Parameter Name="Honorario" Type="Decimal" />
                            <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                            <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                            <asp:Parameter Name="LocalTrabalho" Type="String" />
                            <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                            <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                            <asp:Parameter Name="ObsComplementares" Type="String" />
                            <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Beneficios_Label" Type="String" />
                            <asp:Parameter Name="Beneficios" Type="String" />
                            <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Perspectiva_Label" Type="String" />
                            <asp:Parameter Name="Perspectiva" Type="String" />
                            <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                            <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                            <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Sexo_Label" Type="String" />
                            <asp:Parameter Name="Sexo" Type="String" />
                            <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                            <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                            <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                            <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                            <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                            <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                            <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                            <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                            <asp:Parameter Name="PerfilGestor" Type="String" />
                            <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                            <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                            <asp:Parameter Name="CursoEspecifico" Type="String" />
                            <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Conhecimento_Label" Type="String" />
                            <asp:Parameter Name="Conhecimento" Type="String" />
                            <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                            <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                            <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                            <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                            <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                            <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                            <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                            <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                            <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                            <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                            <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                            <asp:Parameter Name="AspectoCritico" Type="String" />
                            <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                            <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                            <asp:Parameter Name="PrincipalDesafio" Type="String" />
                            <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                            <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                            <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                            <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                            <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                            <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                            <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                            <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                            <asp:Parameter Name="infoSobre_viagens" Type="String" />
                            <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                            <asp:Parameter Name="confidencial_Label" Type="String" />
                            <asp:Parameter Name="confidencial" Type="Boolean" />
                            <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Protocolo" Type="String" />
                            <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                            <asp:Parameter Name="FormacaoAcademica" Type="String" />
                            <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                            <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                            <asp:Parameter Name="dsPerfilVaga" Type="String" />
                            <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Cargo_Label" Type="String" />
                            <asp:Parameter Name="Cargo" Type="String" />
                            <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                            <asp:Parameter Name="nrovaga_Label" Type="String" />
                            <asp:Parameter Name="nrovaga" Type="Int32" />
                            <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                            <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                            <asp:Parameter Name="nmresponsavel" Type="String" />
                            <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                            <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                            <asp:Parameter Name="TipoOportunidade" Type="String" />
                            <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                            <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                            <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                            <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Remuneracao_Label" Type="String" />
                            <asp:Parameter Name="Remuneracao" Type="Decimal" />
                            <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                            <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                            <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                            <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Honorario_Label" Type="String" />
                            <asp:Parameter Name="Honorario" Type="Decimal" />
                            <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                            <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                            <asp:Parameter Name="LocalTrabalho" Type="String" />
                            <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                            <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                            <asp:Parameter Name="ObsComplementares" Type="String" />
                            <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Beneficios_Label" Type="String" />
                            <asp:Parameter Name="Beneficios" Type="String" />
                            <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Perspectiva_Label" Type="String" />
                            <asp:Parameter Name="Perspectiva" Type="String" />
                            <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                            <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                            <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                            <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Sexo_Label" Type="String" />
                            <asp:Parameter Name="Sexo" Type="String" />
                            <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                            <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                            <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                            <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                            <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                            <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                            <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                            <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                            <asp:Parameter Name="PerfilGestor" Type="String" />
                            <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                            <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                            <asp:Parameter Name="CursoEspecifico" Type="String" />
                            <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                            <asp:Parameter Name="Conhecimento_Label" Type="String" />
                            <asp:Parameter Name="Conhecimento" Type="String" />
                            <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                            <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                            <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                            <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                            <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                            <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                            <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                            <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                            <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                            <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                            <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                            <asp:Parameter Name="AspectoCritico" Type="String" />
                            <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                            <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                            <asp:Parameter Name="PrincipalDesafio" Type="String" />
                            <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                            <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                            <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                            <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                            <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                            <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                            <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                            <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                            <asp:Parameter Name="infoSobre_viagens" Type="String" />
                            <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                            <asp:Parameter Name="confidencial_Label" Type="String" />
                            <asp:Parameter Name="confidencial" Type="Boolean" />
                            <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                            <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    </td>
            </tr>
        </table>
    </asp:Panel>
                    <table ID="FormGestor" cellpadding="10" cellspacing="0" width="100%" runat="server" visible="false">
                        <tr>
                            <td align="left">
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table> 
</asp:Content>

