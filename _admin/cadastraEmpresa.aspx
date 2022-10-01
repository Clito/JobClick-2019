<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cadastraEmpresa.aspx.vb" Inherits="_admin_cadastraEmpresa" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

.Contrato
{
	padding: 27px;
    width: 400px;
        float: none;
        z-index: 500;
        position: static;
        cursor: auto;
        background-color: #FAFAFA;
        filter: alpha(opacity=90);
        opacity: 1;
    top: 170px;
    left: 38%;
}

.TituloBG
{
    width: 745px;
	height: 37px;    
	background-image: url( '/images/layoutNew/bgTituloGeralLoading.png' );
	background-repeat: no-repeat; 	
}
.TituloBGText {font-family: Tahoma;font-size: 16pt;color: #939393;text-indent:80px;}

.msnOK
{
	font-size: 3mm;
	color: #006600;
	font-family: Verdana;
	text-decoration: none;
	font-weight: bold;
}

.backgroundPROMOCODE 
{
    width: 280px;
	height: 185px;    
	background-image: url( '/images/layoutNew/PROMOCODE.png' );
	background-repeat: no-repeat; 	
}

.InputCadPROMOCODE
{
	background-color: #ffffff;
	font-size: 8pt;
	color: #000000;
	font-family: Verdana;
	text-decoration: none;
	text-align: center;
	border-right: #cccccc 1px solid;
	border-top: #cccccc 1px solid;
	border-left: #cccccc 1px solid;
	border-bottom: #cccccc 1px solid;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	font-weight: normal;
	width: 180px;
	height: 18px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridViewEmpresaSetup" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlTODASEMPRESAS" AllowPaging="True" 
        DataKeyNames="idCadastroEmpresa_CE" Width="100%">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:TemplateField ShowHeader="False" Visible="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" 
                        onclientclick="return confirm(&quot;Deseja aplicar a carga completa para esta empresa?&quot;)" 
                        Text="Carga"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="80px" />
            </asp:TemplateField>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" 
                ReadOnly="True" SortExpression="idsetup" Visible="False" />
            <asp:BoundField DataField="empresa" HeaderText="empresa" 
                SortExpression="empresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
            <asp:BoundField DataField="nmempresa" HeaderText="Empresa(s) que utilizam a versão gratuita" 
                SortExpression="nmempresa" />
            <asp:BoundField DataField="idCadastroEmpresa_CE" 
                HeaderText="idCadastroEmpresa_CE" InsertVisible="False" ReadOnly="True" 
                SortExpression="idCadastroEmpresa_CE" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa_Pai" 
                HeaderText="idCadastroEmpresa_Pai" SortExpression="idCadastroEmpresa_Pai" 
                Visible="False" />
            <asp:BoundField DataField="painelParceiro" HeaderText="painelParceiro" 
                SortExpression="painelParceiro" Visible="False" />
            <asp:BoundField DataField="liberaQtdCad" HeaderText="liberaQtdCad" 
                SortExpression="liberaQtdCad" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <table cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top">
    <br />
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Dados da Empresa" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>    
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" 
                    Height="39px" Width="40px" /></td>
            <td width="630" style="text-align: left">
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
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
                <cc1:MaskedEditExtender id="MaskedEditExtender2" 
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
                                                                                    <cc1:MaskedEditExtender ID="cepTextBox_MaskedEditExtender0" runat="server" 
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
                            ImageUrl="~/images/layout/pesquisa.png" OnClick="PesquisaCEP_Click1" 
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
                                                                                    <asp:DropDownList ID="DDUf" runat="server" CssClass="DropCad" 
                                DataSourceID="SqlUF0" DataTextField="uf" DataValueField="uf" Width="50px">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="paisDropDownList" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlPais0" DataTextField="pais" DataValueField="pais" 
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
                                                                                    <asp:TextBox ID="telefone" runat="server" CssClass="InputCad" Width="262px"></asp:TextBox>
                                                                                    <cc1:MaskedEditExtender ID="telefone_MaskedEditExtender0" runat="server" 
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
                                                                    <td valign="middle" align="center" style="visibility: hidden">
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
                                                                            CellSpacing="0" DataSourceID="SqlPorte0" DataTextField="dsPorte" 
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
                <br />
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
                <br />
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
                
    <asp:SqlDataSource ID="SqlAtividade0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
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
    <asp:SqlDataSource ID="SqlTODASEMPRESAS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT     dbo.tbsetup.idsetup, dbo.tbsetup.empresa, dbo.tbsetup.idCadastroEmpresa, dbo.tbCadastroEmpresa.nmempresa, 
                      dbo.tbCadastroEmpresa.idCadastroEmpresa AS idCadastroEmpresa_CE, dbo.tbCadastroEmpresa.idCadastroEmpresa_Pai, dbo.tbCadastroEmpresa.painelParceiro, 
                      dbo.tbCadastroEmpresa.liberaQtdCad
FROM         dbo.tbsetup RIGHT OUTER JOIN
                      dbo.tbCadastroEmpresa ON dbo.tbsetup.idCadastroEmpresa = dbo.tbCadastroEmpresa.idCadastroEmpresa
WHERE     (dbo.tbsetup.idsetup IS NULL) AND (dbo.tbCadastroEmpresa.idCadastroEmpresa_Pai IS NULL)">
    </asp:SqlDataSource>
</asp:Content>

