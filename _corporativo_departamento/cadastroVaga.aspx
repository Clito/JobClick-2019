<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="false" MasterPageFile="~/_corporativo_departamento/corporativoPage.master" AutoEventWireup="true" CodeFile="cadastroVaga.aspx.vb" Inherits="_empresa_cadastroLevantamento" %> 
 
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <link href="../scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="../scripts/jquery.leaveNotice.min.js"></script> 

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=dsfuncaoTextBox.ClientID%>").autocomplete("AutocompleteCargoData.ashx");
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoSucesso.ClientID%>").dialog({ closeText: '', width: '500', title: "Publicação de vaga", height: '388', position: "top", show: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "Default.aspx" } });
        });
	</script>
    
<%--    <script type="text/javascript">

    	$(function() {
    	    $("#<%=OutLookPerfildiv.ClientID%>").dialog({
			autoOpen: false,
			show: "blind",
			closeText: '',
			width: '500', 
            title: "Enviar e-mail sobre a vaga"
		});

        $("#<%=opener.ClientID%>").click(function () {
            $("#<%=OutLookPerfildiv.ClientID%>").dialog("open");
		});
	});
	</script>--%>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelPreviewVaga.ClientID%>").dialog({ closeText: '', width: '850', title: "Veja o anúncio da vaga", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
    <br />
    <div>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

        <table cellpadding="0" cellspacing="0" align="center" width="930px" id="MasterFORMOportunidades" runat="server">
            <tr>
                <td>
    <table id="BodyInterno" runat="server" border="0" cellpadding="0" cellspacing="0" visible="true" align="center" width="930px">
        <tr>
            <td valign="top" width="30">
                <asp:Image ID="lateral1" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td valign="top" width="900" align="left">
                            <asp:Label ID="msn" runat="server" CssClass="textoProcessoSeletivoFECHADO"></asp:Label><br />
                            <asp:Label ID="LabelTituloVagas" runat="server" CssClass="tituloProcessoSeletivo" Text="Dados da Vaga"></asp:Label>
                            <asp:Label ID="CargoLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idFuncaoLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="protocoloLabel" runat="server" CssClass="tituloProcessoSeletivo"></asp:Label>
                            <asp:Label ID="idVagaAnuncioPREVIEWLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idHabilidadeCompetenciaLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idHabilidadeCompetenciaLabelRES" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idHabilidadeProfissionalRES" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="dataFimLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="dataInicioLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="emailGestorLabel" runat="server"></asp:Label>
                            <asp:Label ID="nomeGestorLabel" runat="server"></asp:Label>
                            <asp:Label ID="AutenticadoLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idDepartamento_Gestor" runat="server" Visible="False"></asp:Label>
                            <br />
                    <table ID="RelVaga0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="Label24" runat="server" CssClass="textoProcessoSeletivo" 
                                    Text="Vaga para PNE:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <asp:CheckBox ID="CheckBoxPNE" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" Text="Sim, esta vaga é para PNEs" 
                                    ToolTip="PNE: Pessoas com necessidades especiais" Width="450px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Image ID="ImageDUVIDA0" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA0_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetY="-30" PopDelay="5" 
                                    PopupControlID="PanelVaga" TargetControlID="ImageDUVIDA0" OffsetX="30">
                                </cc1:HoverMenuExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                                    ControlToValidate="dsPerfilVagaTextBox" ErrorMessage="Título é obrigatório." 
                                    SetFocusOnError="True" ValidationGroup="PerfilVagaForm" 
                                    CssClass="msnERROR">•</asp:RequiredFieldValidator>
                                <asp:Label ID="Label22" runat="server" Text="Título:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    ValidationGroup="PerfilVagaForm" Width="450px"></asp:TextBox>
                                <asp:Image ID="ImageObrigatorio" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListdsPerfilVaga" runat="server">
                                                <asp:ListItem Selected="True" Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%" valign="top">
                                <asp:Image ID="ImageDUVIDA1" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA1_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga0" TargetControlID="ImageDUVIDA1">
                                </cc1:HoverMenuExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                    ControlToValidate="dsfuncaoTextBox" ErrorMessage="Cargo é obrigatório." 
                                    SetFocusOnError="True" ValidationGroup="PerfilVagaForm" 
                                    CssClass="msnERROR">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral10" runat="server" Text="Cargo (CBO):" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <asp:UpdatePanel ID="UpdatePanelCargo" runat="server" EnableViewState="False">
                                    <ContentTemplate>
                                        <table ID="PESQUISACARGO" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="dsfuncaoTextBox" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" ValidationGroup="PerfilVagaForm" 
                                                        Width="450px" />
                                                </td>
                                                <td>&nbsp;<asp:Image ID="ImageObrigatorio0" runat="server" 
                                                        ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                                            ControlToValidate="DropDownListnivelhierarquico" CssClass="msnERROR" 
                                            ErrorMessage="Informe o nível hierárquico da vaga" 
                                            ValidationGroup="PerfilVagaForm" Display="Dynamic" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelComunicacao4" runat="server" 
                                            Text="Nível Profissional:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                        <asp:DropDownList ID="DropDownListnivelhierarquico" runat="server" 
                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlNIVELHIERARQUICO" DataTextField="dsNivelProfissional" 
                                            DataValueField="idNivelProfissional" ValidationGroup="PerfilVagaForm" 
                                            Width="455px">
                                            <asp:ListItem Value=" ">-- Escolha o nível profissional --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Image ID="ImageObrigatorio7" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                    ControlToValidate="nrovagaTextBox" 
                                    ErrorMessage="Número de vagas é obrigatório." SetFocusOnError="True" 
                                    ValidationGroup="PerfilVagaForm" CssClass="msnERROR">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral11" runat="server" Text="Número de vagas:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                <asp:TextBox ID="nrovagaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Text='<%# Bind("nrovaga") %>' Width="450px" 
                                    ValidationGroup="PerfilVagaForm" />
                                <asp:Image ID="ImageObrigatorio1" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                <cc1:MaskedEditExtender ID="nrovagaTextBox_MaskedEditExtender" runat="server" 
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                    InputDirection="RightToLeft" Mask="999" MaskType="Number" 
                                    TargetControlID="nrovagaTextBox">
                                </cc1:MaskedEditExtender>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListnrovaga" runat="server">
                                                <asp:ListItem Selected="True" Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral12" runat="server" Text="Confidencial:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="470px">
                                <asp:RadioButtonList ID="RadioButtonListconfidencial" runat="server" 
                                    RepeatDirection="Horizontal" 
                                    ValidationGroup="PerfilVagaForm" CssClass="textoProcessoSeletivo">
                                    <asp:ListItem Value="True">Sim</asp:ListItem>
                                    <asp:ListItem Value="False" Selected="True">Não</asp:ListItem>
                                </asp:RadioButtonList>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListconfidencialRES" runat="server">
                                                <asp:ListItem Selected="True" Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%" valign="top">
                                <asp:Image ID="ImageDUVIDA2" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA2_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga1" TargetControlID="ImageDUVIDA2">
                                </cc1:HoverMenuExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                    ControlToValidate="DropDownListTipoVaga" 
                                    ErrorMessage="Tipo de Vaga é obrigatório." 
                                    ValidationGroup="PerfilVagaForm" CssClass="msnERROR" 
                                    SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral13" runat="server" Text="Tipo de Vaga:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                <asp:DropDownList ID="DropDownListTipoVaga" runat="server" 
                                    CssClass="DropCadFormCandidatoCV" DataSourceID="SqlTipoVaga" 
                                    DataTextField="dsTipoVAga" DataValueField="idTipoVaga" Width="455px" 
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Value=" ">-- Selecione --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Image ID="ImageObrigatorio2" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListTipoVaga" runat="server">
                                                <asp:ListItem Selected="True" Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            <asp:Label ID="LegendaLabel" runat="server" 
                        
                                    Text="&lt;b&gt;Legenda:&lt;/b&gt;&lt;br&gt;&lt;b&gt;PJ:&lt;/b&gt; Pessoa Jurídica | &lt;b&gt;CLT:&lt;/b&gt; Consolidação das Leis do Trabalho &lt;b&gt;AQ:&lt;/b&gt; Aumento de Quadro | &lt;b&gt;S:&lt;/b&gt; Substituição"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral14" runat="server" Text="Salário Base:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="470">
                                <asp:TextBox ID="RemuneracaoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Text='<%# Bind("Remuneracao") %>' Width="450px" 
                                    ValidationGroup="PerfilVagaForm" />
                                <cc1:MaskedEditExtender ID="RemuneracaoTextBox_MaskedEditExtender" 
                                    runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                    Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                    MaskType="Number" TargetControlID="RemuneracaoTextBox">
                                </cc1:MaskedEditExtender>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListRemuneracao" runat="server">
                                                <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral15" runat="server" Text="Honorários: " 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="470">
                                <asp:TextBox ID="HonorarioTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Text='<%# Bind("Honorario") %>' Width="450px" 
                                    ValidationGroup="PerfilVagaForm" />
                                <cc1:MaskedEditExtender ID="HonorarioTextBox_MaskedEditExtender" runat="server" 
                                    ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                    Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                    MaskType="Number" TargetControlID="HonorarioTextBox">
                                </cc1:MaskedEditExtender>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListRemuneracaoVariavel" runat="server">
                                                <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral16" runat="server" 
                                    Text="Remuneração Variável/Bônus/PLR:" CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="470">
                                <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Text='<%# Bind("RemuneracaoVariavel") %>' Width="450px" 
                                    ValidationGroup="PerfilVagaForm" />
                                <cc1:MaskedEditExtender ID="RemuneracaoVariavelTextBox_MaskedEditExtender" 
                                    runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                    Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                    MaskType="Number" TargetControlID="RemuneracaoVariavelTextBox">
                                </cc1:MaskedEditExtender>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListHonorario" runat="server">
                                                <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%" valign="top">
                                <asp:Label ID="LabelGeral17" runat="server" Text="Benefícios:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <asp:CheckBoxList ID="CheckBoxListBeneficio" 
                                    runat="server" RepeatColumns="2" CssClass="textoProcessoSeletivo">
                                    <asp:ListItem>Assistência Médica / Medicina em grupo</asp:ListItem>
                                    <asp:ListItem>Assistência Odontológica</asp:ListItem>
                                    <asp:ListItem>Auxílio Creche</asp:ListItem>
                                    <asp:ListItem>Carro fornecido pela empresa</asp:ListItem>
                                    <asp:ListItem>Celular fornecido pela empresa</asp:ListItem>
                                    <asp:ListItem>Cesta básica</asp:ListItem>
                                    <asp:ListItem>Combustível</asp:ListItem>
                                    <asp:ListItem>Convênio com farmácia</asp:ListItem>
                                    <asp:ListItem>Curso de idiomas</asp:ListItem>
                                    <asp:ListItem>Estacionamento</asp:ListItem>
                                    <asp:ListItem>Estudo de faculdade</asp:ListItem>
                                    <asp:ListItem>Estudo de pós-graduação / MBA</asp:ListItem>
                                    <asp:ListItem>Participação nos lucros</asp:ListItem>
                                    <asp:ListItem>Previdência privada</asp:ListItem>
                                    <asp:ListItem>Restaurante na empresa</asp:ListItem>
                                    <asp:ListItem>Seguro de vida em grupo</asp:ListItem>
                                    <asp:ListItem>Seguro saúde</asp:ListItem>
                                    <asp:ListItem>Tíquete-alimentação</asp:ListItem>
                                    <asp:ListItem>Tíquete-refeição</asp:ListItem>
                                    <asp:ListItem>Transporte fornecido pela empresa</asp:ListItem>
                                    <asp:ListItem>Vale-transporte</asp:ListItem>
                                </asp:CheckBoxList>
                                <asp:Label ID="Label23" runat="server" Text="Outros" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="470">
                                <asp:TextBox ID="BeneficiosTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Height="50px" Text='<%# Bind("Beneficios") %>' TextMode="MultiLine" 
                                    Width="450px" ValidationGroup="PerfilVagaForm" />
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListBeneficios" runat="server">
                                                <asp:ListItem Selected="True" Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Image ID="ImageDUVIDA7" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA7_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga2" TargetControlID="ImageDUVIDA7">
                                </cc1:HoverMenuExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                    ControlToValidate="LocalTrabalhoTextBox" 
                                    ErrorMessage="Local de Trabalho é obrigatório." 
                                    ValidationGroup="PerfilVagaForm" CssClass="msnERROR" 
                                    SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral18" runat="server" Text="Local de Trabalho: " 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table ID="Local" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                Text='<%# Bind("LocalTrabalho") %>' ValidationGroup="PerfilVagaForm" 
                                                Width="350px" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListUF" runat="server" 
                                                AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" DataSourceID="SqlUF" 
                                                DataTextField="uf" DataValueField="uf" Width="100px">
                                                <asp:ListItem Selected="True">SP</asp:ListItem>
                                                <asp:ListItem>-------</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Image ID="ImageObrigatorio3" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Image ID="ImageDUVIDA8" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA8_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga3" TargetControlID="ImageDUVIDA8">
                                </cc1:HoverMenuExtender>
                                <asp:Label ID="LabelGeral19" runat="server" Text="Perspectiva de Carreira:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left" valign="top">
                                <asp:TextBox ID="PerspectivaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Height="50px" Text='<%# Bind("Perspectiva") %>' TextMode="MultiLine" 
                                    Width="450px" ValidationGroup="PerfilVagaForm" />
                                <asp:CheckBox ID="CheckBoxPerspectiva" runat="server" AutoPostBack="True" 
                                    Text="Não informar" Checked="True" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral20" runat="server" Text="Faixa Etária:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table ID="Faixa0" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" Text="De:" 
                                                CssClass="textoProcessoSeletivo"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                                ControlToValidate="FaixaEtariaInicioTextBox" 
                                                ErrorMessage="Faixa (de) é obrigatório." ValidationGroup="PerfilVagaForm" 
                                                CssClass="msnERROR" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Até:" 
                                                CssClass="textoProcessoSeletivo"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                                ControlToValidate="FaixaEtariaFimTextBox" 
                                                ErrorMessage="Faixa (até) é obrigatório." ValidationGroup="PerfilVagaForm" 
                                                CssClass="msnERROR" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                Text='<%# Bind("FaixaEtariaInicio") %>' Width="100px" 
                                                ValidationGroup="PerfilVagaForm" />
                                            <cc1:MaskedEditExtender ID="FaixaEtariaInicioTextBox_MaskedEditExtender" 
                                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                TargetControlID="FaixaEtariaInicioTextBox">
                                            </cc1:MaskedEditExtender>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                Text='<%# Bind("FaixaEtariaFim") %>' Width="100px" 
                                                ValidationGroup="PerfilVagaForm" />
                                            <cc1:MaskedEditExtender ID="FaixaEtariaFimTextBox_MaskedEditExtender" 
                                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                TargetControlID="FaixaEtariaFimTextBox">
                                            </cc1:MaskedEditExtender>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="anos" 
                                                CssClass="textoProcessoSeletivo"></asp:Label>
                                            <asp:Image ID="ImageObrigatorio4" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListFaixaEtariaInicio" runat="server">
                                                <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListFaixaEtariaFim" runat="server">
                                                <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral21" runat="server" Text="Sexo:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="470">
                                <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" 
                                    RepeatDirection="Horizontal" ValidationGroup="PerfilVagaForm" 
                                    CssClass="textoProcessoSeletivo">
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    <asp:ListItem Value="I" Selected="True">Indiferente</asp:ListItem>
                                </asp:RadioButtonList>
                                        </td>
                                        <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListSexoRES" runat="server">
                                                <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0" Selected="True">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                                    ControlToValidate="QualificacaoHabilidadesEspecificasTextBox" 
                                    ErrorMessage="Atribuições e Principais Responsabilidades é obrigatório." 
                                    ValidationGroup="PerfilVagaForm" CssClass="msnERROR" 
                                    SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral22" runat="server" 
                                    Text="Atribuições e Principais Responsabilidades: " 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <asp:Label ID="Label5" runat="server" 
                                    Text="(Competências e habilidades específicas)" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                                         <br />
                                         <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" Height="50px" Text='<%# Bind("Habilidades") %>' 
                                    TextMode="MultiLine" Width="450px" ValidationGroup="PerfilVagaForm" />
                                            <asp:Image ID="ImageObrigatorio6" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral23" runat="server" 
                                    Text="Perfil e Composição da equipe:" CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" Height="50px" Text='<%# Bind("PerfilComposicaoEquipe") %>' 
                                    TextMode="MultiLine" Width="450px" ValidationGroup="PerfilVagaForm" />
                                <asp:CheckBox ID="CheckBoxPerfil" runat="server" AutoPostBack="True" 
                                    Text="Não informar" Checked="True" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral24" runat="server" Text="Perfil do Gestor:" 
                                    CssClass="textoProcessoSeletivo"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%" align="left">
                                <asp:TextBox ID="PerfilGestorTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                    Height="50px" Text='<%# Bind("PerfilGestor") %>' TextMode="MultiLine" 
                                    Width="450px" ValidationGroup="PerfilVagaForm" />
                                <asp:CheckBox ID="CheckBoxPerfilGestor" runat="server" AutoPostBack="True" 
                                    Text="Não informar" Checked="True" />
                            </td>
                        </tr>
                    </table>
                            <br />
                            <asp:Label ID="LabelTituloVagas0" runat="server" CssClass="tituloProcessoSeletivo" Text="Perfil do Candidato"></asp:Label><br />
                            <table ID="PerfilCandidato0" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                            ControlToValidate="DDownTipoFormacao" 
                                            ErrorMessage="Formação Acadêmica é obrigatório." 
                                            ValidationGroup="PerfilVagaForm" CssClass="msnERROR">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelGeral25" runat="server" Text="Formação Acadêmica:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                        <asp:DropDownList ID="DDownTipoFormacao" runat="server" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlDataTipoFormacao" DataTextField="dsTipoFormacao" 
                                            DataValueField="idTipoFormacao" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" AppendDataBoundItems="True">
                                            <asp:ListItem Value=" ">-- Selecione --</asp:ListItem>
                                        </asp:DropDownList>
                                                </td>
                                                <td>
                                        <asp:Image ID="ImageObrigatorio5" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                                </td>
                                                <td bgcolor="#FFFFEA">
                                            <asp:RadioButtonList ID="RadioButtonListFormacaoAcademica" runat="server">
                                                <asp:ListItem Selected="True" Value="1">Apresentar</asp:ListItem>
                                                <asp:ListItem Value="0">Ocultar</asp:ListItem>
                                            </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%" id="IDIOMA">
                                        <asp:Label ID="LabelGeral26" runat="server" Text="Idiomas:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:Panel ID="PanelIDIOMA" runat="server" Visible="False" Width="450px" 
                                            BackColor="#FFFFEA">
                                            <table cellpadding="0" cellspacing="0" ID="IDIOMA" width="100%">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="infoIdioma" runat="server" CssClass="textoBold" 
                                                            Text="Informe qual idioma:"></asp:Label>
                                                        <br />
                                                        <asp:DropDownList ID="DropDownListIDIOMA" runat="server" 
                                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                                            DataSourceID="SqlIDIOMA" DataTextField="dsTipoConhecimentoIdioma" 
                                                            DataValueField="idTipoConhecimentoIdioma" Width="450px">
                                                            <asp:ListItem Value="0">-- Selecione um idioma --</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="infoIdioma0" runat="server" CssClass="textoBold" 
                                                            Text="Informe qual proficiência:"></asp:Label>
                                                        <br />
                                                        <asp:DropDownList ID="DropDownListNIVEL" runat="server" 
                                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                                            DataSourceID="SqlIDIOMANIVEL" DataTextField="dsGrauExperiencia" 
                                                            DataValueField="idGrauExperiencia" Width="450px">
                                                            <asp:ListItem Value="0">-- Selecione uma proficiência --</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:GridView ID="GridViewIDIOMA" runat="server" AutoGenerateColumns="False" 
                                                            BorderStyle="None" DataKeyNames="idConhecimentoIdiomaVAGA" 
                                                            DataSourceID="SqlListaIdiomaSelecionado" GridLines="Horizontal" Width="100%">
                                                            <AlternatingRowStyle BackColor="#FFFFCC" />
                                                            <Columns>
                                                                <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
                                                                <asp:BoundField DataField="idConhecimentoIdiomaVAGA" 
                                                                    HeaderText="idConhecimentoIdiomaVAGA" InsertVisible="False" ReadOnly="True" 
                                                                    SortExpression="idConhecimentoIdiomaVAGA" Visible="False" />
                                                                <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                                                    Visible="False" />
                                                                <asp:BoundField DataField="idTipoConhecimentoIdioma" 
                                                                    HeaderText="idTipoConhecimentoIdioma" SortExpression="idTipoConhecimentoIdioma" 
                                                                    Visible="False" />
                                                                <asp:BoundField DataField="NivelConhecimento" HeaderText="NivelConhecimento" 
                                                                    SortExpression="NivelConhecimento" Visible="False" />
                                                                <asp:BoundField DataField="idVagaAnuncioPREVIEW" 
                                                                    HeaderText="idVagaAnuncioPREVIEW" SortExpression="idVagaAnuncioPREVIEW" 
                                                                    Visible="False" />
                                                                <asp:BoundField DataField="dsGrauExperiencia" HeaderText="Nível" 
                                                                    SortExpression="dsGrauExperiencia">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="dsTipoConhecimentoIdioma" HeaderText="Idioma" 
                                                                    SortExpression="dsTipoConhecimentoIdioma">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <br />
                                                        <asp:LinkButton ID="LinkButtonSalvaIdioma" runat="server" CssClass="button">Adicionar (+)</asp:LinkButton>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:TextBox ID="idiomaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" TextMode="MultiLine" Width="450px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                        <asp:CheckBox ID="CheckBoxIdioma" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                                            ControlToValidate="RadioButtonListNIVEL" CssClass="msnERROR" 
                                            ErrorMessage="Informe o nível de conhecimento." ValidationGroup="INFORMATICA">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelGeral27" runat="server" Text="Informática:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:Panel ID="PanelInformatica" runat="server" BackColor="#FFFFEA" 
                                            Visible="False" Width="450px">
                                            <table cellpadding="0" cellspacing="0" ID="INFORMATICA" align="center" 
                                                width="100%">
                                                <tr>
                                                    <td align="left">
                                                        <asp:DropDownList ID="DropDownListINFORMATICA" runat="server" 
                                                            AppendDataBoundItems="True" AutoPostBack="True" 
                                                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlINFORMATICA" 
                                                            DataTextField="dsTipoConhecimento" DataValueField="idTipoConhecimento" 
                                                            Width="450px">
                                                            <asp:ListItem Value="0">-- Selecione --</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:DropDownList ID="DropDownListINFORMATICAITENS" runat="server" 
                                                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlINFORMATICAITENS" 
                                                            DataTextField="dsTipoConhecimentoRel" DataValueField="idTipoConhecimentoRel" 
                                                            Width="450px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:RadioButtonList ID="RadioButtonListNIVEL" runat="server" 
                                                            DataSourceID="SqlNIVELINFORMATICA" DataTextField="dsGrauExperiencia" 
                                                            DataValueField="idGrauExperiencia" RepeatDirection="Horizontal" 
                                                            ValidationGroup="INFORMATICA" Width="100%">
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:GridView ID="GridViewINFORMATICA" runat="server" 
                                                            AutoGenerateColumns="False" BorderStyle="None" 
                                                            DataKeyNames="idConhecimentoInformaticaVAGA" 
                                                            DataSourceID="SqlINFORMATICASELECT" GridLines="Horizontal" Width="100%">
                                                            <AlternatingRowStyle BackColor="#FFFFCC" />
                                                            <Columns>
                                                                <asp:CommandField ShowDeleteButton="True" />
                                                                <asp:BoundField DataField="idConhecimentoInformaticaVAGA" 
                                                                    HeaderText="idConhecimentoInformaticaVAGA" InsertVisible="False" 
                                                                    ReadOnly="True" SortExpression="idConhecimentoInformaticaVAGA" 
                                                                    Visible="False" />
                                                                <asp:BoundField DataField="dsTipoConhecimento" HeaderText="Conhecimento" 
                                                                    SortExpression="dsTipoConhecimento">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="NivelConhecimento" HeaderText="Nivel" 
                                                                    SortExpression="NivelConhecimento" Visible="False" />
                                                                <asp:BoundField DataField="dsGrauExperiencia" HeaderText="Experiência" 
                                                                    SortExpression="dsGrauExperiencia">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="idVagaAnuncioPREVIEW" 
                                                                    HeaderText="idVagaAnuncioPREVIEW" SortExpression="idVagaAnuncioPREVIEW" 
                                                                    Visible="False" />
                                                                <asp:BoundField DataField="dsTipoConhecimentoRel" HeaderText="Sobre" 
                                                                    SortExpression="dsTipoConhecimentoRel">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <br />
                                                        <asp:LinkButton ID="LinkButtonSalvaInformatica" runat="server" 
                                                            CssClass="button">Adicionar (+)</asp:LinkButton>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:TextBox ID="informaticaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" TextMode="MultiLine" Width="450px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                        <asp:CheckBox ID="CheckBoxInformatica" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral28" runat="server" Text="Cursos Específicos:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="CursoEspecificoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text='<%# Bind("CursoEspecifico") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxCurso" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label6" runat="server" Text="Conhecimentos:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="ConhecimentoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text='<%# Bind("Conhecimento") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxConhecimento" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                <asp:Image ID="ImageDUVIDA9" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA9_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga4" TargetControlID="ImageDUVIDA9">
                                </cc1:HoverMenuExtender>
                                        <asp:Label ID="Label7" runat="server" Text="Competências Comportamentais:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:Panel ID="PanelCOMPORTAMENTAL" runat="server" BackColor="#FFFFEA" 
                                            Width="450px">
                                            <table cellpadding="0" cellspacing="0" ID="COMPORTAMENTAL" width="100%">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="COMPETENCIALabel0" runat="server" CssClass="textoBold" 
                                                            Text="Competências Comportamentais"></asp:Label>
                                                        <asp:GridView ID="GridViewCOMPORTAMENTAL" runat="server" 
                                                            AutoGenerateColumns="False" BorderStyle="None" 
                                                            DataKeyNames="idHabilidadeCompetencia,HabilidadeCompetencia" 
                                                            DataSourceID="SqlCOMPORTAMENTAL" GridLines="Horizontal" ShowHeader="False" 
                                                            Width="100%">
                                                            <AlternatingRowStyle BackColor="#FFFFCC" BorderStyle="None" />
                                                            <Columns>
                                                                <asp:BoundField DataField="idHabilidadeCompetencia" 
                                                                    HeaderText="idHabilidadeCompetencia" InsertVisible="False" ReadOnly="True" 
                                                                    SortExpression="idHabilidadeCompetencia" Visible="False" />
                                                                <asp:BoundField DataField="idHabilidadeCompetencia_Pai" 
                                                                    HeaderText="idHabilidadeCompetencia_Pai" 
                                                                    SortExpression="idHabilidadeCompetencia_Pai" Visible="False" />
                                                                <asp:BoundField DataField="idHabilidadeCompetencia_Filha" 
                                                                    HeaderText="idHabilidadeCompetencia_Filha" 
                                                                    SortExpression="idHabilidadeCompetencia_Filha" Visible="False" />
                                                                <asp:BoundField DataField="HabilidadeCompetencia" 
                                                                    HeaderText="HabilidadeCompetencia" SortExpression="HabilidadeCompetencia" 
                                                                    Visible="False">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="dsHabilidadeCompetencia" 
                                                                    HeaderText="dsHabilidadeCompetencia" SortExpression="dsHabilidadeCompetencia" 
                                                                    Visible="False" />
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                            CommandName="Select" Text='<%# Eval("HabilidadeCompetencia") %>' 
                                                                            ToolTip='<%# Eval("dsHabilidadeCompetencia") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <br />
                                                        <asp:Label ID="COMPETENCIALabel" runat="server" CssClass="textoBold"></asp:Label>
                                                        <asp:GridView ID="GridViewCOMPORTAMENTAL_RES" runat="server" 
                                                            AutoGenerateColumns="False" BorderStyle="None" 
                                                            DataKeyNames="idHabilidadeCompetencia,HabilidadeCompetencia,dsHabilidadeCompetencia" 
                                                            DataSourceID="SqlCOMPORTAMENTAL_RES" GridLines="Horizontal" ShowHeader="False" 
                                                            Width="100%">
                                                            <AlternatingRowStyle BackColor="#FFFFCC" BorderStyle="None" />
                                                            <Columns>
                                                                <asp:BoundField DataField="idHabilidadeCompetencia" 
                                                                    HeaderText="idHabilidadeCompetencia" InsertVisible="False" ReadOnly="True" 
                                                                    SortExpression="idHabilidadeCompetencia" Visible="False" />
                                                                <asp:BoundField DataField="idHabilidadeCompetencia_Pai" 
                                                                    HeaderText="idHabilidadeCompetencia_Pai" 
                                                                    SortExpression="idHabilidadeCompetencia_Pai" Visible="False" />
                                                                <asp:BoundField DataField="idHabilidadeCompetencia_Filha" 
                                                                    HeaderText="idHabilidadeCompetencia_Filha" 
                                                                    SortExpression="idHabilidadeCompetencia_Filha" Visible="False" />
                                                                <asp:BoundField DataField="HabilidadeCompetencia" 
                                                                    HeaderText="HabilidadeCompetencia" SortExpression="HabilidadeCompetencia" 
                                                                    Visible="False" />
                                                                <asp:BoundField DataField="dsHabilidadeCompetencia" 
                                                                    HeaderText="dsHabilidadeCompetencia" SortExpression="dsHabilidadeCompetencia" 
                                                                    Visible="False" />
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                            CommandName="Select" Text='<%# Eval("HabilidadeCompetencia") %>' 
                                                                            ToolTip='<%# Eval("dsHabilidadeCompetencia") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Height="50px" 
                                            Text='<%# Bind("CompetenciaComportamental") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxCompetencia" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                <asp:Image ID="ImageDUVIDA10" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA10_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga5" TargetControlID="ImageDUVIDA10">
                                </cc1:HoverMenuExtender>
                                        <asp:Label ID="Label8" runat="server" Text="Competências Profissionais:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:Panel ID="PanelPROFISSIONAL" runat="server" BackColor="#FFFFEA" 
                                            Width="450px">
                                            <table cellpadding="0" cellspacing="0" ID="PROFISSIONAL" width="100%">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="COMPETENCIALabel1" runat="server" CssClass="textoBold" 
                                                            Text="Competências Profissionais"></asp:Label>
                                                        <asp:GridView ID="GridViewPROFISSIONAL" runat="server" 
                                                            AutoGenerateColumns="False" BorderStyle="None" 
                                                            DataKeyNames="idHabilidadeCompetencia,HabilidadeCompetencia,dsHabilidadeCompetencia" 
                                                            DataSourceID="SqlPROFISSIONAL" GridLines="Horizontal" ShowHeader="False" 
                                                            Width="100%">
                                                            <AlternatingRowStyle BackColor="#FFFFCC" BorderStyle="None" />
                                                            <Columns>
                                                                <asp:BoundField DataField="idHabilidadeCompetencia" 
                                                                    HeaderText="idHabilidadeCompetencia" InsertVisible="False" ReadOnly="True" 
                                                                    SortExpression="idHabilidadeCompetencia" Visible="False" />
                                                                <asp:BoundField DataField="idHabilidadeCompetencia_Pai" 
                                                                    HeaderText="idHabilidadeCompetencia_Pai" 
                                                                    SortExpression="idHabilidadeCompetencia_Pai" Visible="False" />
                                                                <asp:BoundField DataField="idHabilidadeCompetencia_Filha" 
                                                                    HeaderText="idHabilidadeCompetencia_Filha" 
                                                                    SortExpression="idHabilidadeCompetencia_Filha" Visible="False" />
                                                                <asp:BoundField DataField="HabilidadeCompetencia" 
                                                                    HeaderText="HabilidadeCompetencia" SortExpression="HabilidadeCompetencia" 
                                                                    Visible="False">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="dsHabilidadeCompetencia" 
                                                                    HeaderText="dsHabilidadeCompetencia" SortExpression="dsHabilidadeCompetencia" 
                                                                    Visible="False" />
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                                            CommandName="Select" Text='<%# Eval("HabilidadeCompetencia") %>' 
                                                                            ToolTip='<%# Eval("dsHabilidadeCompetencia") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Height="50px" Text='<%# Bind("CompetenciaProfissional") %>' 
                                            TextMode="MultiLine" Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxCProfissional" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label9" runat="server" Text="Aspectos Críticos da Função:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="AspectoCriticoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text='<%# Bind("AspectoCritico") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxAspectos" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label11" runat="server" 
                                            Text="Principais Desafios:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text='<%# Bind("PrincipalDesafio") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxDesafios" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label12" runat="server" Text="Relacionamentos Internos:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Height="50px" Text='<%# Bind("RelacionamentoInterno") %>' 
                                            TextMode="MultiLine" Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxRelacionamentoI" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label13" runat="server" Text="Relacionamentos Externos:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Height="50px" Text='<%# Bind("RelacionamentoExterno") %>' 
                                            TextMode="MultiLine" Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxRelacionamentoE" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label14" runat="server" Text="Viagens:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:RadioButtonList ID="RadioButtonListviagens" runat="server" 
                                            RepeatDirection="Horizontal" CssClass="textoProcessoSeletivo">
                                            <asp:ListItem Value="1">Sim</asp:ListItem>
                                            <asp:ListItem Value="0" Selected="True">Não</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label21" runat="server" Text="Comentários sobre viagens:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxViagem" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label15" runat="server" Text="Observações:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="ObsComplementaresTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" 
                                            Width="450px" ValidationGroup="PerfilVagaForm" />
                                        <asp:CheckBox ID="CheckBoxObservacao" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                <asp:Image ID="ImageDUVIDA11" runat="server" ImageAlign="Left" 
                                    ImageUrl="~/_corporativo/images/holomatica/DUVIDA.png" />
                                <cc1:HoverMenuExtender ID="ImageDUVIDA11_HoverMenuExtender" runat="server" 
                                    DynamicServicePath="" Enabled="True" OffsetX="30" OffsetY="-30" 
                                    PopupControlID="PanelVaga6" TargetControlID="ImageDUVIDA11">
                                </cc1:HoverMenuExtender>
                                        <asp:Label ID="Label16" runat="server" Text="Estrutura Organizacional:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:TextBox ID="EstruturaOrganizacionalTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Height="50px" TextMode="MultiLine" Width="450px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                        <asp:CheckBox ID="CheckBoxExtrutura" runat="server" AutoPostBack="True" 
                                            Text="Não informar" Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" 
                                            ControlToValidate="RadioButtonListAprovado" CssClass="msnERROR" 
                                            Display="Dynamic" ErrorMessage="Informe a situação da vaga" 
                                            ValidationGroup="MENSAGEM">•</asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" 
                                            ControlToValidate="RadioButtonListAprovado" CssClass="msnERROR" 
                                            Display="Dynamic" ErrorMessage="Informe a situação da vaga" 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label17" runat="server" 
                                            Text="Quanto a Vaga:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                        <asp:RadioButtonList ID="RadioButtonListAprovado" runat="server" 
                                            RepeatDirection="Horizontal" ValidationGroup="PerfilVagaForm" 
                                            CssClass="textoProcessoSeletivo" DataSourceID="SqlStatusVaga" 
                                            DataTextField="idstatusvaga" DataValueField="idstatusvaga">
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGestor" runat="server" 
                                            
                                            
                                            Text="Histórico das solicitações feitas:" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" align="left">
                                         <asp:Label ID="LabelComunicacao" runat="server" 
                                             Text="Observações referentes a abertura da vaga:"></asp:Label>
                                         <br />
                                         <asp:TextBox ID="perfil_vaga_aprovado_comentarioTextBox" runat="server" 
                                             CssClass="InputCadFormCandidatoCV" Height="50px" 
                                            TextMode="MultiLine" Width="450px" ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        &nbsp;</td>
                                    <td class="tableFormulario" width="65%" align="left">
                                         <br />
                                        <asp:CheckBox ID="opener" runat="server" 
                                            Text="Quero enviar e-mail ao responsável pela vaga." 
                                            AutoPostBack="True" Checked="True" Visible="False" />
                                         <br />
                                        <asp:Panel id="OutLookPerfildiv" runat="server">
                                            <table ID="OutLookPerfil" runat="server" visible="true" cellpadding="5" 
                                                cellspacing="5" width="100%" bgcolor="#FFFFEA">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelSelAnalista" runat="server" CssClass="textoProcessoSeletivo" Text="Selecione o Analista responsável pela Requisição:"></asp:Label>
                                                        <br />
                                                        <asp:GridView ID="GridViewDEPARTAMENTO" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="ID,email_departamento,nome_departamento" DataSourceID="SqlGESTORCONSULTORIA" GridLines="Horizontal" Width="455px">
                                                            <AlternatingRowStyle BorderStyle="None" />
                                                            <Columns>
                                                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                                                                <asp:ButtonField CommandName="Select" DataTextField="email_departamento" HeaderText="E-mail" Text="Button" />
                                                                <asp:BoundField DataField="email_departamento" HeaderText="email_departamento" SortExpression="email_departamento" Visible="False" />
                                                                <asp:BoundField DataField="nome_departamento" HeaderText="Responsável" SortExpression="nome_departamento" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="DropDownListGESTOR" ErrorMessage="• Informe o destinatário." ValidationGroup="MENSAGEM"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:DropDownList ID="DropDownListGESTOR" runat="server" DataSourceID="SqlGESTORCONSULTORIA" 
                                                            DataTextField="nome_departamento" DataValueField="email_departamento" 
                                                            CssClass="DropCadFormCandidatoCV" Width="455px" AppendDataBoundItems="True" Enabled="False">
                                                            <asp:ListItem></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="mensagemLabel" runat="server" Text="Mensagem: (Analista):" 
                                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" 
                                                            ControlToValidate="EmailTextTextBox" ErrorMessage="• A mensagem é obrigatória." 
                                                            ValidationGroup="MENSAGEM"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="EmailTextTextBox" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Height="50px" TextMode="MultiLine" 
                                                            Width="450px" ValidationGroup="MENSAGEM"></asp:TextBox>
                                                        <asp:ValidationSummary ID="ValidationSummary5" runat="server" 
                                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="MENSAGEM" />
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                         <br />
                                         <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" 
                                            ControlToValidate="DropDownListiddsAnuncioEmpresa" CssClass="msnERROR" 
                                            ErrorMessage="Informe qual o título de anúncio" 
                                            ValidationGroup="PerfilVagaForm" Display="Dynamic" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelComunicacao3" runat="server" 
                                            Text="Informe qual o título de anúncio:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListiddsAnuncioEmpresa" runat="server" 
                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlTituloAnuncio" DataTextField="tituloDesEmpresa" 
                                            DataValueField="iddsempresa" ValidationGroup="PerfilVagaForm" Width="455px">
                                            <asp:ListItem Value=" ">-- Informe título do anúncio --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Image ID="ImageObrigatorio8" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                         <br />
                                        <asp:Label ID="LabelComunicacao0" runat="server" 
                                            Text="Informe o código deste &lt;b&gt;anúncio&lt;/b&gt; em outras mídias (Jornais, Revistas, Web e outros.)."></asp:Label>
                                        <br />
                                        <asp:TextBox ID="codvagaTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Width="450px"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" 
                                            ControlToValidate="dataInicioTextBox" CssClass="msnERROR" Display="Dynamic" 
                                            ErrorMessage="Data de início da publicação é obrigatório." 
                                            SetFocusOnError="True" ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelComunicacao1" runat="server" 
                                            Text="Informe a data do &lt;b&gt;início&lt;/b&gt; da publicação:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="dataInicioTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Width="450px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                        <cc1:CalendarExtender ID="dataInicioTextBox_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="dataInicioTextBox">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="ImageObrigatorio9" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" 
                                            ControlToValidate="dataFimTextBox" CssClass="msnERROR" Display="Dynamic" 
                                            ErrorMessage="Data de término da publicação é obrigatório." 
                                            SetFocusOnError="True" ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelComunicacao2" runat="server" 
                                            Text="Informe a data do &lt;b&gt;término&lt;/b&gt; da publicação:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="dataFimTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Width="450px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                        <cc1:CalendarExtender ID="dataFimTextBox_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="dataFimTextBox">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="ImageObrigatorio10" runat="server" 
                                            ImageUrl="~/_corporativo/images/holomatica/OBRIGATORIO.png" />
                                        <br />
                                         <br />
                                        <asp:Label ID="Label10" runat="server" 
                                            
                                            Text="&lt;b&gt;AVISO:&lt;/b&gt;&lt;br&gt;O Processo Seletivo será iniciado após a aprovação do Perfil da Vaga pelo Gestor" 
                                            CssClass="textoProcessoSeletivo"></asp:Label>
                                         <br />
                                        <br />
                                        <asp:CheckBox ID="CheckBoxREPLICA" runat="server" Text="Gravar esta vaga para ser utilizada como modelo de replica." />
                                        <br />
                                        <br />
                                        <br />
                                        &nbsp;<asp:LinkButton ID="LinkButtonPREVIEW" runat="server" CssClass="button" 
                                            ToolTip="Veja como ficará a publicação (Anúncio) da vaga" 
                                            ValidationGroup="PerfilVagaForm">Preview</asp:LinkButton>
                                        <asp:LinkButton ID="PUBLICAR" runat="server" CssClass="button" 
                                            ToolTip="Salvar, publicar e divulgar a vaga" 
                                            ValidationGroup="PerfilVagaForm" 
                                            
                                            onclientclick="return confirm(&quot;Você está para publicar esta vaga, está certo disso?&quot;)" 
                                            Visible="False">Publicar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonGRAVAR" runat="server" 
                                            CssClass="button" 
                                            
                                            ToolTip="Clique aqui para gravar a vaga, em outro momento você poderá terminar esta publicação." 
                                            ValidationGroup="MENSAGEM" Visible="False">Gravar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonMPAV" runat="server" CausesValidation="False" 
                                            CssClass="button" ToolTip="Voltar para a página inicial">Menu Principal</asp:LinkButton>
                                        <asp:ValidationSummary ID="ValidationSummary4" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                    </table>

                <br />
            </td>
        </tr>
    </table>
                </td>
            </tr>
        </table>
    </div>
                    <asp:Panel ID="PanelAvisoSucesso" runat="server" 
        Visible="False">
                        <table cellpadding="0" cellspacing="0" ID="StatusMSN" align="center">
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="imageVoltar" runat="server" 
                                        ImageUrl="~/_corporativo/images/holomatica/AVISOSUCESSO.png" 
                                        PostBackUrl="~/_corporativo/Default.aspx" 
                                        ToolTip="Vaga publicada com sucesso!" />
                                    <br />
                                    <asp:Label ID="AvisoSucesso" runat="server" 
                                        Text="Vaga publicada nas mídias sociais, portal de vagas do JobClick e de sua empresa e em listas de e-mails "></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="msnemail" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
</asp:Panel>
<cc1:DragPanelExtender ID="PanelAvisoSucesso_DragPanelExtender" 
    runat="server" DragHandleID="PanelMensagemEnviada" Enabled="True" 
    TargetControlID="PanelAvisoSucesso">
</cc1:DragPanelExtender>
                <asp:Panel ID="PanelVaga" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem0" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente" runat="server" 
                                                
                                                Text="&lt;b&gt;Título:&lt;/b&gt;&lt;br&gt;Campo obrigatório, será utilizado como &lt;b&gt;título do anúncio&lt;/b&gt;. Poderá ou não ser publicada no anúncio da vaga, fica a critério da equipe, poderá ser utilizada internamente para localização rápida de um processo seletivo ou anúncio publicado." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelVaga0" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb1" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem1" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente0" runat="server" 
                                                
                                                Text="&lt;b&gt;Cargo: (CBO)&lt;/b&gt;&lt;br&gt;Campo obrigatório, é utilizado para refinar a pesquisa de candidatos e aplicar a aderência de [vaga x candidato].&lt;br&gt;Inicie a pesquisa escrevendo o cargo da vaga, através do sistema &quot;auto complete&quot; será apresentando os cargos pré-cadastrados, selecione o mais indicado para a vaga que está sendo criada, caso não exista o cargo desejado não se preocupe que no momento de publicar a vaga o sistema irá cadastrar automaticamente o cargo informado.&lt;br&gt;&lt;br&gt;Não altere o campo numérico que é apresentado junto com o cargo, isso poderá prejudicar o sistema.&lt;br&gt;&lt;br&gt; Estamos em acordo com a Classificação Brasileira de Ocupações - CBO, instituída por portaria ministerial nº. 397, de 9 de outubro de 2002." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelVaga1" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb2" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem2" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente1" runat="server" 
                                                
                                                Text="&lt;b&gt;Tipo de Vaga:&lt;/b&gt;&lt;br&gt;Campo obrigatório, formas de contratações possíveis.&lt;br&gt;&lt;b&gt;PJ:&lt;/b&gt; Pessoa Jurídica;&lt;br&gt;&lt;b&gt;CLT:&lt;/b&gt; Consolidação das Leis do Trabalho;&lt;br&gt;&lt;b&gt;AQ:&lt;/b&gt; Aumento de Quadro;&lt;br&gt;&lt;b&gt;S:&lt;/b&gt; Substituição." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelVaga2" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb3" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem3" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente2" runat="server" 
                                                
                                                Text="&lt;b&gt;Local de Trabalho:&lt;/b&gt;&lt;br&gt;Campo obrigatório, local onde se dará a contratação, lugar em que o trabalhador se encontra ou deva dirigir-se em virtude do seu trabalho.&lt;br&gt;&lt;b&gt;Forma de preenchimento:&lt;/b&gt;&lt;br&gt;Informe a cidade e apenas se necessário informe o bairro também, selecione o estado." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelVaga3" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb4" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem4" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente3" runat="server" 
                                                
                                                Text="&lt;b&gt;Perspectiva de Carreira:&lt;/b&gt;&lt;br&gt;Campo não é obrigatório, perspectiva de carreira é uma série de passos que você pode ou não informar aos candidatos, programa de treinamento, avalição ou estudo." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
<br />
                <asp:Panel ID="PanelVaga4" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb5" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem5" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente4" runat="server" 
                                                
                                                Text="&lt;b&gt;Competências Comportamentais:&lt;/b&gt;&lt;br&gt;Campo não é obrigatório, porém é utilizado na adesão à vaga.&lt;br&gt;São todas aquelas que possibilitam maior probabilidade de obtenção de sucesso na execução de determinadas atividades, podem ser inerentes às características de personalidade de um indivíduo, ou obtidas no convívio social, bem como podem ser obtidas e aprimoradas através de treinamentos e auto-desenvolvimento. Subdividido essas competências em cinco grupos: Intelectuais, Comunicativas, Sociais, Comportamentais e Organizacionais." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelVaga5" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb6" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem6" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente5" runat="server" 
                                                
                                                Text="&lt;b&gt;Competências Profissionais:&lt;/b&gt;&lt;br&gt;Campo não é obrigatório, porém é utilizado na adesão à vaga.&lt;br&gt;Conhecimentos essenciais para o pleno desenvolvimento das atribuições do cargo, obtidos através da escolaridade e treinamentos realizados e aplicados e aprimorados em experiência profissional." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelVaga6" runat="server" CssClass="tbAvisoPanel">
                    <table ID="AvisoClienteTb7" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem7" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="AvisoCliente6" runat="server" 
                                                
                                                Text="&lt;b&gt;Estrutura Organizacional:&lt;/b&gt;&lt;br&gt;Campo não é obrigatório, será utilizado apenas nos registros do &lt;b&gt;levantamento do perfil da vaga&lt;/b&gt;.&lt;br&gt;A Estrutura Organizacional constitui o elo de ligação entre as orientações estratégicas da organização e a sua actuação no mercado e pode ser dividida em macro-estrutura (relacionada com a totalidade das divisões da organização) e micro-estrutura (relacionada com a organização das actividades dentro de uma divisão)." 
                                                CssClass="textoResumoCV"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                    <br />
                    <br />
                                              
                    <asp:UpdateProgress ID="UpdateProgressAGUARDE" runat="server" 
                        AssociatedUpdatePanelID="UpdatePanelCargo" 
        DisplayAfter="1">
                        <ProgressTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image12" runat="server" 
                                        ImageUrl="~/images/layout/zwf4lc.jpg.gif" />
                                    <br />
                                    <asp:Label ID="lblPesquisando" runat="server" Text="Pesquisando..."></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                                              
                    <cc1:AlwaysVisibleControlExtender ID="UpdateProgressAGUARDE_AlwaysVisibleControlExtender" 
                        runat="server" Enabled="True" HorizontalSide="Center" 
                        TargetControlID="UpdateProgressAGUARDE" VerticalSide="Middle" 
                        HorizontalOffset="50" VerticalOffset="50">
                    </cc1:AlwaysVisibleControlExtender>
                    
                    <br />
    <asp:Panel ID="PanelPreviewVaga" runat="server" 
        Visible="False">
        <table align="center" cellpadding="0" cellspacing="0" width="800px">
            <tr>
                <td>
                    <asp:DataList ID="DataListPreviewVaga" runat="server" 
                        DataSourceID="SqlDataSourcePreviewVaga" Width="100%" BackColor="#FFFFE8">
                        <ItemTemplate>
                            &nbsp;<table ID="TITULO" align="center" cellpadding="5" cellspacing="5" 
                                width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="ProtocoloLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                            Text='<%# Eval("Protocolo") %>' />
                                    </td>
                                    <td align="right">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <table ID="CABECANUNCIOTABLE" cellpadding="10" cellspacing="10" width="100%">
                                <tr>
                                    <td align="left">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top">
                                                    <asp:Image ID="ImagePNE" runat="server" 
                                                        ImageUrl="~/_corporativo/images/pne.png" Visible='<%# Eval("pne") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelANUNCIO" runat="server" CssClass="textoResumoVAGA" 
                                                        Text='<%# Eval("dsempresaVaga") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table ID="Form" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td ID="FormacaoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("FormacaoAcademica_Apresenta") %>' width="40%">
                                        <asp:Label ID="FormacaoAcademica_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("FormacaoAcademica_Label") %>' 
                                            Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                    </td>
                                    <td ID="FormacaoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("FormacaoAcademica_Apresenta") %>' align="left">
                                        <asp:Label ID="FormacaoAcademicaLabel" runat="server" 
                                            Text='<%# Bind("FormacaoAcademica") %>' 
                                            Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerfilVagaTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("dsPerfilVaga_Apresenta") %>' width="40%">
                                        <asp:Label ID="dsPerfilVaga_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("dsPerfilVaga_Label") %>' 
                                            Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                    </td>
                                    <td ID="PerfilVagaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("dsPerfilVaga_Apresenta") %>' align="left">
                                        <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                            Text='<%# Bind("dsPerfilVaga") %>' 
                                            Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CargoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Cargo_Apresenta") %>' width="40%">
                                        <asp:Label ID="Cargo_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Cargo_Label") %>' Visible='<%# Eval("Cargo_Apresenta") %>' />
                                    </td>
                                    <td ID="CargoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Cargo_Apresenta") %>' align="left">
                                        <asp:Label ID="CargoLabel" runat="server" Text='<%# Bind("Cargo") %>' 
                                            Visible='<%# Eval("Cargo_Apresenta") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="nrovagaTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("nrovaga_Apresenta") %>' width="40%">
                                        <asp:Label ID="nrovaga_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("nrovaga_Label") %>' />
                                    </td>
                                    <td ID="nrovagaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("nrovaga_Apresenta") %>' align="left">
                                        <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Bind("nrovaga") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="nmresponsavelTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("nmresponsavel_Apresenta") %>' width="40%">
                                        <asp:Label ID="nmresponsavel_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("nmresponsavel_Label") %>' />
                                    </td>
                                    <td ID="nmresponsavelTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("nmresponsavel_Apresenta") %>' align="left">
                                        <asp:Label ID="nmresponsavelLabel" runat="server" 
                                            Text='<%# Bind("nmresponsavel") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="TipoOportunidadeTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("TipoOportunidade_Apresenta") %>' width="40%">
                                        <asp:Label ID="TipoOportunidade_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("TipoOportunidade_Label") %>' />
                                    </td>
                                    <td ID="TipoOportunidadeTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("TipoOportunidade_Apresenta") %>' align="left">
                                        <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                            Text='<%# Bind("TipoOportunidade") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="QualificacaoHabilidadesEspecificasTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>' 
                                        width="40%">
                                        <asp:Label ID="QualificacaoHabilidadesEspecificas_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                    </td>
                                    <td ID="QualificacaoHabilidadesEspecificasTD2" runat="server" 
                                        class="tableFormulario" 
                                        visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>' 
                                        align="left">
                                        <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="Remuneracao_LabelTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("Remuneracao_Apresenta") %>' width="40%">
                                        <asp:Label ID="Remuneracao_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Remuneracao_Label") %>' />
                                    </td>
                                    <td ID="Remuneracao_LabelTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Remuneracao_Apresenta") %>' align="left">
                                        <asp:Label ID="RemuneracaoLabel" runat="server" 
                                            Text='<%# Bind("Remuneracao", "{0:C}") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="RemuneracaoVariavelTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>' width="40%">
                                        <asp:Label ID="RemuneracaoVariavel_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                    </td>
                                    <td ID="RemuneracaoVariavelTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>' align="left">
                                        <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                            Text='<%# Bind("RemuneracaoVariavel", "{0:C}") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="HonorarioTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Honorario_Apresenta") %>' width="40%">
                                        <asp:Label ID="Honorario_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Honorario_Label") %>' />
                                    </td>
                                    <td ID="HonorarioTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Honorario_Apresenta") %>' align="left">
                                        <asp:Label ID="HonorarioLabel" runat="server" 
                                            Text='<%# Bind("Honorario", "{0:C}") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="LocalTrabalhoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("LocalTrabalho_Apresenta") %>' width="40%">
                                        <asp:Label ID="LocalTrabalho_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("LocalTrabalho_Label") %>' />
                                    </td>
                                    <td ID="LocalTrabalhoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("LocalTrabalho_Apresenta") %>' align="left">
                                        <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                            Text='<%# Bind("LocalTrabalho") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ObsComplementaresTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("ObsComplementares_Apresenta") %>' width="40%">
                                        <asp:Label ID="ObsComplementares_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("ObsComplementares_Label") %>' />
                                    </td>
                                    <td ID="ObsComplementaresTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("ObsComplementares_Apresenta") %>' align="left">
                                        <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                            Text='<%# Bind("ObsComplementares") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="BeneficiosTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Beneficios_Apresenta") %>' width="40%">
                                        <asp:Label ID="Beneficios_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Beneficios_Label") %>' />
                                    </td>
                                    <td ID="BeneficiosTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Beneficios_Apresenta") %>' align="left">
                                        <asp:Label ID="BeneficiosLabel" runat="server" 
                                            Text='<%# Bind("Beneficios") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerspectivaTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Perspectiva_Apresenta") %>' width="40%">
                                        <asp:Label ID="Perspectiva_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Perspectiva_Label") %>' />
                                    </td>
                                    <td ID="PerspectivaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Perspectiva_Apresenta") %>' align="left">
                                        <asp:Label ID="PerspectivaLabel" runat="server" 
                                            Text='<%# Bind("Perspectiva") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="FaixaEtariaInicioTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>' width="40%">
                                        <asp:Label ID="FaixaEtariaInicio_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                    </td>
                                    <td ID="FaixaEtariaInicioTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>' align="left">
                                        <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                            Text='<%# Bind("FaixaEtariaInicio", "{0} anos") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="FaixaEtariaFimTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>' width="40%">
                                        <asp:Label ID="FaixaEtariaFim_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                    </td>
                                    <td ID="FaixaEtariaFimTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("FaixaEtariaFim_Apresenta") %>' align="left">
                                        <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                            Text='<%# Bind("FaixaEtariaFim", "{0} anos") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="SexoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Sexo_Apresenta") %>' width="40%">
                                        <asp:Label ID="Sexo_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Sexo_Label") %>' />
                                    </td>
                                    <td ID="SexoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Sexo_Apresenta") %>' align="left">
                                        <asp:Label ID="SexoLabel" runat="server" Text='<%# Bind("Sexo") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ConhecimentoIdiomaTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>' width="40%">
                                        <asp:Label ID="ConhecimentoIdioma_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                    </td>
                                    <td ID="ConhecimentoIdiomaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>' align="left">
                                        <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                            Text='<%# Bind("ConhecimentoIdioma") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerfilComposicaoEquipeTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>' width="40%">
                                        <asp:Label ID="PerfilComposicaoEquipe_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                    </td>
                                    <td ID="PerfilComposicaoEquipeTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>' align="left">
                                        <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                            Text='<%# Bind("PerfilComposicaoEquipe") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerfilGestorTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("PerfilGestor_Apresenta") %>' width="40%">
                                        <asp:Label ID="PerfilGestor_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("PerfilGestor_Label") %>' />
                                    </td>
                                    <td ID="PerfilGestorTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("PerfilGestor_Apresenta") %>' align="left">
                                        <asp:Label ID="PerfilGestorLabel" runat="server" 
                                            Text='<%# Bind("PerfilGestor") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CursoEspecificoTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("CursoEspecifico_Apresenta") %>' width="40%">
                                        <asp:Label ID="CursoEspecifico_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("CursoEspecifico_Label") %>' />
                                    </td>
                                    <td ID="CursoEspecificoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("CursoEspecifico_Apresenta") %>' align="left">
                                        <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                            Text='<%# Bind("CursoEspecifico") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ConhecimentoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Conhecimento_Apresenta") %>' width="40%">
                                        <asp:Label ID="Conhecimento_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Conhecimento_Label") %>' />
                                    </td>
                                    <td ID="ConhecimentoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Conhecimento_Apresenta") %>' align="left">
                                        <asp:Label ID="ConhecimentoLabel" runat="server" 
                                            Text='<%# Bind("Conhecimento") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ConhecimentoInformaticaTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>' width="40%">
                                        <asp:Label ID="ConhecimentoInformatica_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                    </td>
                                    <td ID="ConhecimentoInformaticaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>' align="left">
                                        <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                            Text='<%# Bind("ConhecimentoInformatica") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CompetenciaComportamentalTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("CompetenciaComportamental_Apresenta") %>' width="40%">
                                        <asp:Label ID="CompetenciaComportamental_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                    </td>
                                    <td ID="CompetenciaComportamentalTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("CompetenciaComportamental_Apresenta") %>' align="left">
                                        <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                            Text='<%# Bind("CompetenciaComportamental") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CompetenciaProfissionalTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("CompetenciaProfissional_Apresenta") %>' width="40%">
                                        <asp:Label ID="CompetenciaProfissional_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                    </td>
                                    <td ID="CompetenciaProfissionalTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("CompetenciaProfissional_Apresenta") %>' align="left">
                                        <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                            Text='<%# Bind("CompetenciaProfissional") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="AspectoCriticoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("AspectoCritico_Apresenta") %>' width="40%">
                                        <asp:Label ID="AspectoCritico_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("AspectoCritico_Label") %>' />
                                    </td>
                                    <td ID="AspectoCriticoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("AspectoCritico_Apresenta") %>' align="left">
                                        <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                            Text='<%# Bind("AspectoCritico") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PrincipalDesafioTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("PrincipalDesafio_Apresenta") %>' width="40%">
                                        <asp:Label ID="PrincipalDesafio_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                    </td>
                                    <td ID="PrincipalDesafioTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("PrincipalDesafio_Apresenta") %>' align="left">
                                        <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                            Text='<%# Bind("PrincipalDesafio") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="RelacionamentoInternoTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("RelacionamentoInterno_Apresenta") %>' width="40%">
                                        <asp:Label ID="RelacionamentoInterno_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                    </td>
                                    <td ID="RelacionamentoInternoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("RelacionamentoInterno_Apresenta") %>' align="left">
                                        <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                            Text='<%# Bind("RelacionamentoInterno") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="RelacionamentoExternoTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("RelacionamentoExterno_Apresenta") %>' width="40%">
                                        <asp:Label ID="RelacionamentoExterno_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                    </td>
                                    <td ID="RelacionamentoExternoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("RelacionamentoExterno_Apresenta") %>' align="left">
                                        <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                            Text='<%# Bind("RelacionamentoExterno") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="infoSobre_viagensTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("infoSobre_viagens_Apresenta") %>' width="40%">
                                        <asp:Label ID="infoSobre_viagens_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                    </td>
                                    <td ID="infoSobre_viagensTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("infoSobre_viagens_Apresenta") %>' align="left">
                                        <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                            Text='<%# Bind("infoSobre_viagens") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSourcePreviewVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PREVIEW_DO_ANUNCIO_VAGA_SELECT" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="protocoloLabel" Name="Protocolo" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
                    
                    <br />
                    <asp:SqlDataSource ID="SqlPorte" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idPorte], [dsPorte] FROM [tbPorteEmpresa]">
                    </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourcePsq" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="spPesquisaFuncao" 
        SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="CargoLabel" DefaultValue="" Name="buscador" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlUF" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlPais" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlStatusVaga" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idstatusvaga] FROM [tbStatusVaga] ORDER BY [idstatusvaga]">
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) OR (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTipoFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao] ORDER BY [dsTipoFormacao]">
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
    SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTipoVaga" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            
            
        SelectCommand="SELECT idTipoVaga, idSetup, dsTipoVAga FROM tbTipoVaga WHERE (idSetup = @idSetup) ORDER BY dsTipoVAga">
        <SelectParameters>
            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlListaPerfil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="spPerfilVagaSelect_DataGrid" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                SessionField="idCadastroEmpresaFilha" Type="Int32" />
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConsultor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            
            SelectCommand="SELECT tbRH_Gestor.nome, tbRH_Gestor.idRH_Gestor, tbRH_Gestor.idCadastroEmpresa, tbuser.idTypeUser FROM tbRH_Gestor INNER JOIN tbuser ON tbRH_Gestor.idUser = tbuser.idUser WHERE (tbRH_Gestor.idCadastroEmpresa = @idCadastroEmpresa) AND ((tbuser.idTypeUser = @idTypeUser) OR (tbuser.idTypeUser = @idTypeUser1))">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="Consultor Wizard" Name="idTypeUser" />
            <asp:Parameter DefaultValue="Consultor" Name="idTypeUser1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConsultoresTodos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspGestorSelectDropDownList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresaFilha" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) AND (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlMODELO" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            
            SelectCommand="SELECT [idPerfilVagaFill], [dsPerfilVaga], [idCadastroEmpresa] FROM [_tbPerfilVagaModelo] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa) OR ([idCadastroEmpresa] = 0)">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlIDIOMA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        
    SelectCommand="SELECT [idTipoConhecimentoIdioma], [dsTipoConhecimentoIdioma] FROM [tbConhecimentoIdioma] ORDER BY [dsTipoConhecimentoIdioma]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlIDIOMANIVEL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idGrauExperiencia], [dsGrauExperiencia] FROM [tbExperienciaIdiomaNivel]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlListaIdiomaSelecionado" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="_USP_PREVIEW_DO_ANUNCIO_IDIOMA_DELETE" 
        DeleteCommandType="StoredProcedure" 
        SelectCommand="_USP_PREVIEW_DO_ANUNCIO_IDIOMA" 
        SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="idConhecimentoIdiomaVAGA" Type="Int32" />
            <asp:Parameter Name="idTipoConhecimentoIdioma" Type="Int32" />
            <asp:Parameter Name="NivelConhecimento" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idVagaAnuncioPREVIEWLabel" 
                Name="idVagaAnuncioPREVIEW" PropertyName="Text" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idTipoConhecimentoIdioma" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="NivelConhecimento" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlINFORMATICA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoConhecimento], [dsTipoConhecimento] FROM [tbConhecimentoInformatica]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlINFORMATICAITENS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoConhecimentoRel], [idTipoConhecimento], [dsTipoConhecimentoRel] FROM [tbTipoConhecimentoRel] WHERE ([idTipoConhecimento] = @idTipoConhecimento)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListINFORMATICA" 
                Name="idTipoConhecimento" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlINFORMATICASELECT" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="_USP_PREVIEW_DO_ANUNCIO_INFORMATICA_DELETE" 
        DeleteCommandType="StoredProcedure" 
        SelectCommand="_USP_PREVIEW_DO_ANUNCIO_INFORMATICA" 
        SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="idConhecimentoInformaticaVAGA" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idVagaAnuncioPREVIEWLabel" 
                Name="idVagaAnuncioPREVIEW" PropertyName="Text" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idTipoConhecimentoInformatica" 
                Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idTipoConhecimentoRel" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="NivelConhecimento" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlNIVELINFORMATICA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idGrauExperiencia], [dsGrauExperiencia] FROM [tbExperienciaInfoNivel]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCOMPORTAMENTAL" runat="server" 
    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
    SelectCommand="_USP_PREVIEW_DO_ANUNCIO_COMPETENCIA_COMPORTAMENTAL" 
    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="37" Name="idHabilidadeCompetencia" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idHabilidadeCompetencia_Filha" 
                Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlCOMPORTAMENTAL_RES" runat="server" 
    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
    SelectCommand="_USP_PREVIEW_DO_ANUNCIO_COMPETENCIA_COMPORTAMENTAL" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="idHabilidadeCompetencia" Type="Int32" />
        <asp:ControlParameter ControlID="GridViewCOMPORTAMENTAL" DefaultValue="" 
            Name="idHabilidadeCompetencia_Filha" PropertyName="SelectedValue" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlPROFISSIONAL" runat="server" 
    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
    SelectCommand="_USP_PREVIEW_DO_ANUNCIO_COMPETENCIA_COMPORTAMENTAL" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="31" Name="idHabilidadeCompetencia" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="idHabilidadeCompetencia_Filha" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTituloAnuncio" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_TITULO_ANUNCIO_ABERTURA_VAGA" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlNIVELHIERARQUICO" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_APRESENTACAO_NIVEL_HIERARQUICO_ANUNCIO_VAGA" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlGESTORCONSULTORIA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_GESTORES_CONSULTORIA" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:ControlParameter ControlID="AutenticadoLabel" Name="idTypeUser" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>






