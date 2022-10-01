<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="cadastroEmpresa.aspx.vb" Inherits="_anonimo_cadastroEmpresa" title="Publicar vagas" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        $('.idparceiro').val(parent.jobclick_config['idparceiro']);
    });
</script>
    <input id="idparceiro" class="idparceiro" name="idparceiro" type="hidden" value="" runat="server"/>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Cadastre sua empresa e publique suas vagas" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top">
        <table width="740" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40"></td> 
            <td width="700"> 
    <asp:Panel ID="Panel1" runat="server" CssClass="Contrato" Visible="False" 
        Width="630px">
        <asp:LinkButton ID="FecharPanel" runat="server" CausesValidation="False">Fechar</asp:LinkButton>

        <br />
        <asp:Label ID="lblContrato" runat="server"></asp:Label>

        <br />
        <br />
        <asp:LinkButton ID="LbFechar1" runat="server" CausesValidation="False">Fechar</asp:LinkButton>

    </asp:Panel>
    <cc1:DragPanelExtender ID="Panel1_DragPanelExtender" runat="server" 
        DragHandleID="Panel1" Enabled="False" TargetControlID="Panel1">
    </cc1:DragPanelExtender>
            </td>
        </tr>
        </table> 
            
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" 
                    Height="39px" Width="40px" /></td>
            <td width="630" style="text-align: left">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="E-mail é obrigatório." 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Informe e-mail válido." 
                    SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="Senha é obrigatória." 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" Width="327px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                    Width="327px" TextMode="Password"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                Lembrete:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                    runat="server" ControlToValidate="fraseTextBox" Display="Dynamic" 
                    ErrorMessage="Lembrete é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="fraseTextBox" runat="server" CssClass="InputCad" Width="675px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                <br />
                <asp:Image ID="Image5" runat="server" 
                    ImageUrl="~/images/dadosdaempresatitulo.gif" />
                    <br />
  
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
                    Width="327px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="nomeResTextBox" runat="server" CssClass="InputCad" 
                    Width="327px"></asp:TextBox>
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
                                                                    Width="327px"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="tempoexistenciaTextBox_MaskedEditExtender" 
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
                    DataSourceID="SqlAtividade" DataTextField="dsAreaAtuacao" 
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
                                                                <asp:TextBox ID="TextBoxCNPJ" runat="server" AutoPostBack="True" 
                                                                    CssClass="InputCad" ValidationGroup="CNPJ" Width="327px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:TextBox ID="siteTextBox" runat="server" CssClass="InputCad" Width="327px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                <cc1:MaskedEditExtender id="MaskedEditExtender1" 
                        runat="server"
                        TargetControlID="TextBoxCNPJ" 
                        Mask="99\.999\.999\/9999\-99" 
                        MaskType="Number"
                        MessageValidatorTip=true 
                        ErrorTooltipEnabled=true 
                        ClearMaskOnLostFocus=false InputDirection="RightToLeft" />
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
                                                                                    <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("cep") %>'
                            Width="307px" ValidationGroup="CEP"></asp:TextBox>
                                                                                    <cc1:MaskedEditExtender ID="cepTextBox_MaskedEditExtender" runat="server" 
                                                                                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                        Mask="99999-999" MaskType="Number" TargetControlID="cepTextBox" 
                                                                                        InputDirection="RightToLeft">
                                                                                    </cc1:MaskedEditExtender>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="PesquisaCEP" runat="server" 
                            ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click1" 
                            ValidationGroup="CEP" />
                                                                                    &nbsp;</td>
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
                                                                                        Text='<%# Bind("endereco") %>' Width="273px"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;</td>
                                                                                <td>
                                                                                    <asp:Label ID="Labelnro" runat="server" Text="Nº:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                                                        ControlToValidate="nrTextBox" ErrorMessage="Número é obrigatório.">*</asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                    <asp:TextBox ID="nrTextBox" runat="server" CssClass="InputCad" Width="40px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                        <asp:Label ID="LabelCabec8" runat="server" Text="Bairro:"></asp:Label>
                                                                        <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="bairroTextBox"
                Display="Dynamic" ErrorMessage="Bairro é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' 
                CssClass="InputCad" Width="327px"></asp:TextBox>
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
                            Text='<%# Bind("cidade") %>' CssClass="InputCad" Width="273px"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="Image2" runat="server" 
                            ImageUrl="../images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DDUf" runat="server" CssClass="DropUF" 
                                DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="paisDropDownList" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" 
                    Width="335px">
                                                                        </asp:DropDownList>
                                                                        <br />
                                                                        <br />
                                                                        Telefone para contato: [99] [9999-9999]<table cellpadding="0" cellspacing="0">
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
                                                                                        SetFocusOnError="True" ValidationExpression="\d{4}(-\d{4})?">*</asp:RegularExpressionValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="ddd" runat="server" CssClass="InputCad" Width="50px"></asp:TextBox>
                                                                                    <cc1:MaskedEditExtender ID="ddd_MaskedEditExtender" runat="server" 
                                                                                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                        Mask="99" MaskType="Number" TargetControlID="ddd" 
                                                                                        InputDirection="RightToLeft">
                                                                                    </cc1:MaskedEditExtender>
                                                                                    <asp:Image ID="Image15" runat="server" ImageUrl="~/images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="telefone" runat="server" CssClass="InputCad" Width="262px"></asp:TextBox>
                                                                                    <cc1:MaskedEditExtender ID="telefone_MaskedEditExtender" runat="server" 
                                                                                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                        Mask="9999-9999" MaskType="Number" TargetControlID="telefone" 
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
                                                                    <td valign="middle" align="center">
                                                                        <table ID="AtivaPROMOCODE" align="center" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="center">
                                                                                    <asp:Label ID="LabelAviso" runat="server" 
                                                                                        Text="Você ainda não recebeu o &lt;b&gt;Promocode JobClick?&lt;/b&gt;&lt;br&gt;Não se preocupe, preencha o formulário e clique em [Cadastrar minha empresa], no painel principal faça a sua solicitação de um Promocode gratuito, a liberação é imediata!!!"></asp:Label>
                                                                                    <br />
                                                                                    <table ID="PROMOCODE" runat="server" align="center" cellpadding="0" 
                                                                                        cellspacing="0" class="backgroundPROMOCODE" visible="True">
                                                                                        <tr>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 62px">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center">
                                                                                                <asp:TextBox ID="PROMOCODETextBox" runat="server" AutoPostBack="True" 
                                                                                                    CssClass="InputCadPROMOCODE"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:Label ID="msnPROMOCODE" runat="server" CssClass="msn"></asp:Label>
                                                                                    <br />
                                                                                    <br />
                                                                                    <asp:LinkButton ID="LinkButtonPromocode" runat="server" class="button" Text="Ativar o meu PROMOCODE!"></asp:LinkButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                                        <br />
                                                                        <asp:Label ID="LabelCabec5" runat="server" Text="Porte da empresa:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                                            ControlToValidate="idPorteRadioButtonList" Display="Dynamic" 
                                                                            ErrorMessage="Porte da empresa é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:RadioButtonList ID="idPorteRadioButtonList" runat="server" CellPadding="0" 
                                                                            CellSpacing="0" DataSourceID="SqlPorte" DataTextField="dsPorte" 
                                                                            DataValueField="idPorte" RepeatColumns="1" RepeatDirection="Horizontal" 
                                                                            Width="300px">
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="Image16" runat="server" ImageUrl="~/images/15px.gif" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        <br />
                                                                        <asp:Label ID="LabelPrv" runat="server" Text="Privacidade:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                                            ControlToValidate="PrivacidadeRadioButtonList" Display="Dynamic" 
                                                                            ErrorMessage="Informe sobre a privacidade." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:RadioButtonList ID="PrivacidadeRadioButtonList" runat="server" 
                                                                            CellPadding="0" CellSpacing="0">
                                                                            <asp:ListItem Value="1">Nome da empresa não aparece nos anúncios</asp:ListItem>
                                                                            <asp:ListItem Value="0">Nome da empresa aparece nos anúncios</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>

                <br />
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
                <br />

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
    <table width="730px" cellpadding="0" cellspacing="0" id="CadastroTable">
       <tr>
            <td width="350px" align="center">
                <asp:LinkButton ID="LBNormas" runat="server" CausesValidation="False">Leia as normas e condições de uso</asp:LinkButton>
                <br />
            </td>
            <td align="center"><asp:Label ID="LabelCondicaoes" runat="server" 
                    Text="Ao clicar em [Cadastrar minha empresa], você declara ter lido e aceito as normas e condições de uso da JobClick."></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="Cadastro" runat="server" Text="Cadastrar minha empresa" class="button"></asp:LinkButton>
                <br />
                <br />
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
    <br />
</td>
        </tr>
    </table>    
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    </asp:Content>


