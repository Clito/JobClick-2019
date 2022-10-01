<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="cadastroAssociado.aspx.vb" Inherits="_admin_cadastraEmpresa" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../js/mascara.js" type=text/javascript></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top">

<table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Label5" runat="server" Text="Sua empresa já é Associada?" 
                    CssClass="TituloBGText"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="RadioButtonListASSOCIADO" Display="Dynamic" ErrorMessage="Informe se sua empresa é ou não associada." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
        </tr>
    </table>
        <table runat="server" id="TableASSOCIADO" width="740" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="40"></td> 
            <td width="700">           
                <asp:RadioButtonList ID="RadioButtonListASSOCIADO" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Minha empresa já é associada.</asp:ListItem>
                    <asp:ListItem Value="0">Minha empresa &lt;b&gt;não&lt;/b&gt; é associada.</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        </table> 

    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Label4" runat="server" Text="Dados da Empresa" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>    
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" 
                    Height="39px" Width="40px" /></td>
            <td width="630" style="text-align: left">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
  
                <asp:UpdatePanel ID="UpdatePanelCNPJ" runat="server" EnableViewState="False">
                    <ContentTemplate>
                                                  <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec1" runat="server" 
                                                                    Text="Nome da empresa (Razão Social):"></asp:Label>
                                                                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="nmempresaTextBox" Display="Dynamic" ErrorMessage="Razão Social ou Nome Fantasia é obrigatório." 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="LabelCabec2" runat="server" Text="Nome do responsável:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                                    ControlToValidate="nomeResTextBox" Display="Dynamic" ErrorMessage="Nome completo do responsável é obrigatório." 
                                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="nmempresaTextBox" runat="server" CssClass="InputCad" 
                    Width="327px" ToolTip="Informe o nome de sua empresa."></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="nomeResTextBox" runat="server" CssClass="InputCad" 
                    Width="327px" ToolTip="Informe seu nome ou o nome do responsável pela empresa ou do departamento de recrutamento e seleção."></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" 
                                                                    Text="Tempo de Existência da Empresa (Anos):"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                                    ControlToValidate="tempoexistenciaTextBox" 
                                                                    ErrorMessage="Tempo de funcionamento da empresa.">*</asp:RequiredFieldValidator>

                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="LabelCabec4" runat="server" Text="Ramo de atividade da empresa:"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="tempoexistenciaTextBox" runat="server" CssClass="InputCad" 
                                                                    Width="327px" ToolTip="Tempo de existência da empresa."></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="tempoexistenciaTextBox_MaskedEditExtender0" 
                                                                    runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                                    TargetControlID="tempoexistenciaTextBox">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:DropDownList ID="idAreaAtuacaoDropDownList" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlAtividade0" DataTextField="dsAreaAtuacao" 
                    DataValueField="idAreaAtuacao" Width="334px">
                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec3" runat="server" Text="CNPJ:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                    ControlToValidate="TextBoxCNPJ" Display="Dynamic" 
                                                                    ErrorMessage="CNPJ é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text="Site da Empresa (se existir):"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="TextBoxCNPJ" runat="server" AutoPostBack="True" onkeyup="formataCNPJ(this,event);" style="text-align:left"
                                                                    CssClass="InputCad" ValidationGroup="CNPJ" Width="327px" ToolTip="Informe o CNPJ da empresa."></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:TextBox ID="siteTextBox" runat="server" CssClass="InputCad" Width="327px" ToolTip="Se sua empresa possui um site informe o endereço eletrônico."></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                <asp:Label ID="lblmsn" runat="server" CssClass="msn"></asp:Label>
                                                  <asp:Label ID="lblmsnOK" runat="server" CssClass="msnOK"></asp:Label>
                <br />
                <br />                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanelCEP" 
                    runat="server" EnableViewState="False">
                                                        <ContentTemplate>
                                                            <table cellpadding="0" 
    cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="LabelCabec6" runat="server" Text="CEP:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cepTextBox"
                Display="Dynamic" ErrorMessage="CEP é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True" ValidationGroup="CEP"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="cepTextBox"
                    ErrorMessage="* CEP 99999-999" ValidationExpression="\d{5}(-\d{3})?" 
                ValidationGroup="CEP"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="Image18" runat="server" ImageUrl="~/images/15px.gif" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" align="left">
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="cepTextBox" runat="server"  onkeyup="formataCEP(this,event);" style="text-align:left" CssClass="InputCad" Text='<%# Bind("cep") %>'
                            Width="307px" ValidationGroup="CEP" ToolTip="Informe o CEP do endereço de sua empresa, depois clique em (Pesquisar)"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="PesquisaCEP" runat="server" 
                            ImageUrl="~/images/layout/pesquisa.png" OnClick="PesquisaCEP_Click1" ValidationGroup="CEP" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="LabelCabec7" runat="server" Text="Endereço:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                                        ControlToValidate="enderecoTextBox" Display="Dynamic" 
                                                                                        ErrorMessage="Endereço é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                    <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="InputCad" 
                                                                                        Text='<%# Bind("endereco") %>' Width="273px" ToolTip="Informe o endereço da empresa."></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;</td>
                                                                                <td>
                                                                                    <asp:Label ID="Labelnro" runat="server" Text="Nº:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                                                        ControlToValidate="nrTextBox" ErrorMessage="Número é obrigatório.">*</asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                    <asp:TextBox ID="nrTextBox" runat="server" CssClass="InputCad" Width="40px" ToolTip="Informe o número do endereço de sua empresa."></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                        <asp:Label ID="LabelCabec11" runat="server" Text="Complemento:"></asp:Label>
                                                                        <br />
                                                                        <asp:TextBox ID="complementoTextBox" runat="server" CssClass="InputCad" 
                                                                            Width="327px" ToolTip="Caso houver necessidade, informe o complemento."></asp:TextBox>
                                                                        <br />
                                                                        <asp:Label ID="LabelCabec8" runat="server" Text="Bairro:"></asp:Label>
                                                                        <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="bairroTextBox"
                Display="Dynamic" ErrorMessage="Bairro é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' 
                CssClass="InputCad" Width="327px" ToolTip="Informe o bairro da sua empresa."></asp:TextBox>
                                                                        <br />
                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="LabelCabec9" runat="server" Text="Cidade:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="cidadeTextBox"
                            Display="Dynamic" ErrorMessage="Cidade é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="Image1" runat="server" 
                            ImageUrl="../images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    UF:</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="cidadeTextBox" runat="server" 
                            Text='<%# Bind("cidade") %>' CssClass="InputCad" Width="273px" ToolTip="Informe a cidade."></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="Image2" runat="server" 
                            ImageUrl="../images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DDUf" runat="server" CssClass="DropCad" 
                                DataSourceID="SqlUF0" DataTextField="uf" DataValueField="uf" Width="50px" ToolTip="Selecione a UF - Unidade Federativa.">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="paisDropDownList" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlPais0" DataTextField="pais" DataValueField="pais" 
                    Width="335px" ToolTip="Selecione o pais.">
                                                                        </asp:DropDownList>
                                                                        <br />
                                                                        <br />
                                                                        Telefone para contato: [99] [99999-9999]<table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    DDD<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                                                        ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Informe o DDD." 
                                                                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                                                                        ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Deve ser numérico." 
                                                                                        SetFocusOnError="True" ValidationExpression="\d{2}">*</asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td>
                                                                                    Número<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                                                        ControlToValidate="telefone" Display="Dynamic" ErrorMessage="Telefone é obrigatório." 
                                                                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                                                        ControlToValidate="telefone" Display="Dynamic" ErrorMessage="Informe o número do telefone." 
                                                                                        SetFocusOnError="True" ValidationExpression="([9_]{1})?\d{4}\-\d{4}">*</asp:RegularExpressionValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="ddd" runat="server" CssClass="InputCad" Width="50px" ToolTip="Informe o DDD do telefone para contato."></asp:TextBox>
                                                                                    <cc1:MaskedEditExtender ID="ddd_MaskedEditExtender0" runat="server" 
                                                                                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                        Mask="99" MaskType="Number" TargetControlID="ddd" 
                                                                                        InputDirection="RightToLeft">
                                                                                    </cc1:MaskedEditExtender>
                                                                                    <asp:Image ID="Image15" runat="server" ImageUrl="~/images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="telefone" runat="server" CssClass="InputCad" Width="262px" ToolTip="Informe o número para contato."></asp:TextBox>
                                                                                    <cc1:MaskedEditExtender ID="telefone_MaskedEditExtender0" runat="server" 
                                                                                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                        Mask="99999-9999" MaskType="Number" TargetControlID="telefone" 
                                                                                        InputDirection="RightToLeft">
                                                                                    </cc1:MaskedEditExtender>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/images/15px.gif" />
                                                                        <asp:Image ID="Image17" runat="server" ImageUrl="~/images/15px.gif" />
                                                                    </td>
                                                                    <td valign="middle" align="left">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                                            ControlToValidate="idPorteRadioButtonList" Display="Dynamic" 
                                                                            ErrorMessage="Porte da empresa é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="LabelCabec5" runat="server" Text="Porte da empresa:"></asp:Label>
                                                                        <asp:RadioButtonList ID="idPorteRadioButtonList" runat="server" CellPadding="0" 
                                                                            CellSpacing="0" DataSourceID="SqlPorte0" DataTextField="dsPorte" 
                                                                            DataValueField="idPorte" RepeatColumns="1" RepeatDirection="Horizontal" 
                                                                            Width="300px" ToolTip="Informe o porte da sua empresa.">
                                                                        </asp:RadioButtonList>
                                                                        <br />
                                                                        <br />
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                                            ControlToValidate="PrivacidadeRadioButtonList" Display="Dynamic" 
                                                                            ErrorMessage="Informe sobre a privacidade." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="LabelPrv" runat="server" Text="Privacidade:"></asp:Label>
                                                                        <asp:RadioButtonList ID="PrivacidadeRadioButtonList" runat="server" 
                                                                            CellPadding="0" CellSpacing="0" ToolTip="Você pode escolher se o nome de sua empresa será apresentado nos anúncios de emprego publicados.">
                                                                            <asp:ListItem Value="1">Nome da empresa não aparece nos anúncios</asp:ListItem>
                                                                            <asp:ListItem Value="0">Nome da empresa aparece nos anúncios</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:Image ID="Image16" runat="server" ImageUrl="~/images/15px.gif" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>

                <br />
                <asp:UpdateProgress ID="UpdateProgressCEP" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanelCEP" DisplayAfter="1">
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
                
                
                <cc1:AlwaysVisibleControlExtender ID="UpdateProgressCEP_AlwaysVisibleControlExtender" 
                    runat="server" Enabled="True" HorizontalSide="Center" 
                    TargetControlID="UpdateProgressCEP" VerticalOffset="50" 
                    VerticalSide="Middle" HorizontalOffset="50">
                </cc1:AlwaysVisibleControlExtender>

                <asp:UpdateProgress ID="UpdateProgressCNPJ" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanelCNPJ" DisplayAfter="1">
                    <ProgressTemplate>
                          <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image13" runat="server" 
                                        ImageUrl="~/images/layout/zwf4lc.jpg.gif" />
                                    <br />
                                    <asp:Label ID="lblPesquisandoCNPJ" runat="server" Text="Pesquisando..."></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <cc1:AlwaysVisibleControlExtender ID="UpdateProgressCNPJ_AlwaysVisibleControlExtender" 
                    runat="server" Enabled="True" HorizontalOffset="50" HorizontalSide="Center" 
                    TargetControlID="UpdateProgressCNPJ" VerticalOffset="50" VerticalSide="Middle">
                </cc1:AlwaysVisibleControlExtender>
                </td>
            </tr>
        </table>   
    
                  
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec1" runat="server" Text="Termos e Condições Gerais" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
        <table runat="server" id="TERMOS" width="740" cellpadding="0" 
        cellspacing="0" align="center">
        <tr>
            <td width="40"></td> 
            <td width="700">
                <asp:TextBox ID="TextBoxCondicoes" runat="server" CssClass="InputCad" 
                    Height="100px" TextMode="MultiLine" Width="687px" ToolTip="Leia os termos e condiçoes para utilizar o sistema."></asp:TextBox>
                </td>
        </tr>
        </table>              
                <br />
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Dados de Acesso" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>  
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/h26.gif" 
                    Height="39px" Width="40px" /></td>
            <td width="630" style="text-align: left">
<table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="E-mail:"></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Informe um e-mail válido!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="O e-mail é obrigatório!">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="Label7" runat="server" Text="Senha:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="Senha é obrigatória." 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" Width="327px" ToolTip="Informe o e-mail que será utilizado para seu acesso no sistema."></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                    Width="327px" TextMode="Password" ToolTip="Informe sua senha de acesso ao sistema. (Lembre-se: Não informe sua senha para nenhuma pessoa.)"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label8" runat="server" Text="Lembrete:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                    runat="server" ControlToValidate="fraseTextBox" Display="Dynamic" 
                    ErrorMessage="Lembrete é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="fraseTextBox" runat="server" CssClass="InputCad" Width="675px" ToolTip="Para recuperar sua senha o sistema poderá solicitar este lembrete."></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                <br />
            </td> 
        </tr>
    </table> 
    <table width="730px" cellpadding="0" cellspacing="0" id="CadastroTable">
       <tr>
            <td width="350px" align="center">
                <br />
            </td>
            <td align="center"><asp:Label ID="LabelCondicaoes" runat="server" 
                    
                    
                    Text="Ao clicar em [Cadastrar empresa], você declara ter lido e aceito as normas e condições de uso do sistema."></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="Cadastro" runat="server" Text="Cadastrar empresa" 
                    class="button" 
                    ToolTip="Preencha os dados do formulário acima, clique aqui para enviar seus dados."></asp:LinkButton>
                <br />
                <br />
                <br />
                </td>
        </tr>
    </table>
                
                <br />
                
    <asp:SqlDataSource ID="SqlAtividade0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
                    SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao] ORDER BY [dsAreaAtuacao]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPorte0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idPorte], [dsPorte] FROM [tbPorteEmpresa]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlUF0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPais0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    <br />
</td>
        </tr>
    </table>    
<br />
<asp:SqlDataSource ID="SqlAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPorte" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idPorte], [dsPorte] FROM [tbPorteEmpresa]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlUF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPais" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    </asp:Content>

