<%@ Page Title="" Language="VB" MasterPageFile="corporativoPage.master" AutoEventWireup="false" CodeFile="_atualizacadastroCliente.aspx.vb" Inherits="_empresa_atualizacadastroCliente" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                    ImageUrl="~/_gestor/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False">0</asp:Label>
                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaPaiLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="URLLabel" runat="server"></asp:Label>
                <asp:Label ID="idUserEmpresaLabel" runat="server" Visible="False"></asp:Label><br />
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" id="UpDateCadastro">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" runat="server" width="100%" 
                        id="FormEmpresa" visible="true" align="center">
                        <tr>
                            <td width="60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="text-align: left" width="540">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            Usuário (Master):<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                                                runat="server" ControlToValidate="userNameTextBox" Display="Dynamic" 
                                                ErrorMessage="Nome de usuário é obrigatório." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                ControlToValidate="passwordTextBox" Display="Dynamic" 
                                                ErrorMessage="Senha é obrigatória." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                ControlToValidate="emailTextBox" Display="Dynamic" 
                                                ErrorMessage="E-mail é obrigatório." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                ControlToValidate="emailTextBox" Display="Dynamic" 
                                                ErrorMessage="Informe e-mail válido." SetFocusOnError="True" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="userNameTextBox" runat="server" CssClass="InputCad" 
                                                Width="210px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/images/15px.gif" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                                                Width="210px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/images/15px.gif" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" Width="210px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            Lembrete:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                                                runat="server" ControlToValidate="fraseTextBox" Display="Dynamic" 
                                                ErrorMessage="Lembrete é obrigatório." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="fraseTextBox" runat="server" CssClass="InputCad" Width="673px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="cadEmpresa" />
                                <br />

                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelCabec1" runat="server" 
                                                        Text="Nome da empresa (Razão Social):"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                        ControlToValidate="nmempresaTextBox" Display="Dynamic" 
                                                        ErrorMessage="Razão Social ou Nome Fantasia é obrigatório." 
                                                        SetFocusOnError="True" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="LabelCabec2" runat="server" Text="Nome do responsável:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                        ControlToValidate="nomeResTextBox" Display="Dynamic" 
                                                        ErrorMessage="Nome completo do responsável é obrigatório." 
                                                        SetFocusOnError="True" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
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
                                                    <asp:Label ID="LabelCabec3" runat="server" Text="CNPJ:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                        ControlToValidate="TextBoxCNPJ" Display="Dynamic" 
                                                        ErrorMessage="CNPJ é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="LabelCabec4" runat="server" Text="Ramo de atividade da empresa:"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="TextBoxCNPJ" runat="server" AutoPostBack="True" 
                                                        CssClass="InputCad" ValidationGroup="CNPJ" Width="327px"></asp:TextBox>
                                                    <asp:MaskedEditExtender ID="TextBoxCNPJ_MaskedEditExtender" runat="server" 
                                                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                        Mask="99\.999\.999\/9999-99" MaskType="Number" 
                                                        TargetControlID="TextBoxCNPJ" InputDirection="RightToLeft">
                                                    </asp:MaskedEditExtender>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/images/15px.gif" />
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="idAreaAtuacaoDropDownList" runat="server" 
                                                        CssClass="DropCad" DataSourceID="SqlAtividade" DataTextField="dsAreaAtuacao" 
                                                        DataValueField="idAreaAtuacao" Width="334px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="lblmsn" runat="server" CssClass="msn"></asp:Label>
                                        <asp:Label ID="lblmsnOK" runat="server" CssClass="msnOK"></asp:Label>
                                        <br />


                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelCabec6" runat="server" Text="CEP:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                        ControlToValidate="cepTextBox" Display="Dynamic" 
                                                        ErrorMessage="CEP é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                        ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                                                        SetFocusOnError="True" ValidationGroup="CEP"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                        ControlToValidate="cepTextBox" ErrorMessage="* CEP 99999-999" 
                                                        ValidationExpression="\d{5}(-\d{3})?" ValidationGroup="CEP"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCad" 
                                                                    Text='<%# Bind("cep") %>' ValidationGroup="CEP" Width="307px"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="cepTextBox_MaskedEditExtender0" runat="server" 
                                                                    ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="99999\-999" MaskType="Number" TargetControlID="cepTextBox" 
                                                                    InputDirection="RightToLeft">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="PesquisaCEP" runat="server" 
                                                                    ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click1" 
                                                                    ValidationGroup="CEP" />
                                                                </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Label ID="LabelCabec7" runat="server" Text="Endereço:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="enderecoTextBox" Display="Dynamic" 
                                                        ErrorMessage="Endereço é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="InputCad" 
                                                        Text='<%# Bind("endereco") %>' Width="327px"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="LabelCabec8" runat="server" Text="Bairro:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                        ControlToValidate="bairroTextBox" Display="Dynamic" 
                                                        ErrorMessage="Bairro é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="bairroTextBox" runat="server" CssClass="InputCad" 
                                                        Text='<%# Bind("bairro") %>' Width="327px"></asp:TextBox>
                                                    <br />
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec9" runat="server" Text="Cidade:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                                    ControlToValidate="cidadeTextBox" Display="Dynamic" 
                                                                    ErrorMessage="Cidade é obrigatório." SetFocusOnError="True" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image16" runat="server" ImageUrl="../images/5px.gif" />
                                                            </td>
                                                            <td>UF:</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="cidadeTextBox" runat="server" CssClass="InputCad" 
                                                                    Text='<%# Bind("cidade") %>' Width="273px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image2" runat="server" ImageUrl="../images/5px.gif" />
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DDUf" runat="server" CssClass="DropCad" 
                                                                    DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" Width="50px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                    <br />
                                                    <asp:DropDownList ID="paisDropDownList" runat="server" CssClass="DropCad" 
                                                        DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" Width="335px">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    Telefone para contato: [99] [9999-9999]<table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                DDD<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                                    ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Informe o DDD." 
                                                                    SetFocusOnError="True" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                                                    ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Deve ser numérico." 
                                                                    SetFocusOnError="True" ValidationExpression="\d{2}" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                            </td>
                                                            <td>
                                                                Número<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                                    ControlToValidate="telefone" Display="Dynamic" 
                                                                    ErrorMessage="Telefone é obrigatório." SetFocusOnError="True" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                                    ControlToValidate="telefone" Display="Dynamic" 
                                                                    ErrorMessage="Informe o número do telefone." SetFocusOnError="True" 
                                                                    ValidationExpression="([9_]{1})?\d{4}\-\d{4}" ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="ddd" runat="server" CssClass="InputCad" Width="50px" 
                                                                    ValidationGroup="cadEmpresa"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="ddd_MaskedEditExtender0" runat="server" 
                                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    TargetControlID="ddd" ClearMaskOnLostFocus="False" 
                                                                    ClearTextOnInvalid="True" InputDirection="RightToLeft" Mask="99" 
                                                                    MaskType="Number">
                                                                </cc1:MaskedEditExtender>
                                                                <asp:Image ID="Image15" runat="server" ImageUrl="~/images/5px.gif" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="telefone" runat="server" CssClass="InputCad" Width="262px" 
                                                                    ValidationGroup="cadEmpresa"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="telefone_MaskedEditExtender0" runat="server" 
                                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="99999\-9999" MaskType="Number" TargetControlID="telefone" 
                                                                    ClearMaskOnLostFocus="False" InputDirection="RightToLeft">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image11" runat="server" ImageUrl="~/images/15px.gif" />
                                                </td>
                                                <td valign="middle">
                                                    <asp:Label ID="LabelCabec5" runat="server" Text="Porte da empresa:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                        ControlToValidate="idPorteRadioButtonList" Display="Dynamic" 
                                                        ErrorMessage="Porte da empresa é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:RadioButtonList ID="idPorteRadioButtonList" runat="server" CellPadding="0" 
                                                        CellSpacing="0" DataSourceID="SqlPorte" DataTextField="dsPorte" 
                                                        DataValueField="idPorte" RepeatColumns="1" RepeatDirection="Horizontal" 
                                                        Width="300px">
                                                    </asp:RadioButtonList>
                                                    <br />
                                                    <asp:Label ID="LabelPrv" runat="server" Text="Privacidade:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                        ControlToValidate="PrivacidadeRadioButtonList" Display="Dynamic" 
                                                        ErrorMessage="Informe sobre a privacidade." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <asp:RadioButtonList ID="PrivacidadeRadioButtonList" runat="server" 
                                                        CellPadding="0" CellSpacing="0">
                                                        <asp:ListItem Value="1">Nome da empresa não aparece nos anúncios</asp:ListItem>
                                                        <asp:ListItem Value="0">Nome da empresa aparece nos anúncios</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" 
                                                        Text="Tempo de existência da empresa: [Apenas números]"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                                                        ControlToValidate="tempoexistenciaLabel" 
                                                        ErrorMessage="Tempo de atividade da empresa" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    &nbsp;<br />
                                                    <asp:TextBox ID="tempoexistenciaLabel" runat="server" CssClass="InputCad" 
                                                        Width="327px"></asp:TextBox>
                                                    <asp:MaskedEditExtender ID="tempoexistenciaLabel_MaskedEditExtender" 
                                                        runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                        InputDirection="RightToLeft" Mask="9999" MaskType="Number" 
                                                        TargetControlID="tempoexistenciaLabel">
                                                    </asp:MaskedEditExtender>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td align="left" valign="bottom">
                                                    <asp:Label ID="Label20" runat="server" Text="Site da empresa:"></asp:Label>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                                        ControlToValidate="siteTextBox" ErrorMessage="Informe uma URL válida." 
                                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                                        ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                                                        ControlToValidate="siteTextBox" ErrorMessage="URL é obrigatório." 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="siteTextBox" runat="server" CssClass="InputCad" Width="327px"></asp:TextBox>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <br />
                                                    <br />
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td align="right" valign="bottom">
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                        <table cellpadding="0" cellspacing="0" width="700">
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="ButtonAtualizar" runat="server" CssClass="button" 
                                                        Text="Atualizar dados do Cliente" ValidationGroup="cadEmpresa" />
                                                    <asp:Button ID="ButtonCancelar" runat="server" CausesValidation="False" 
                                                        CssClass="button" Text="Cancelar" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />

                                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>
                                <br />
                            </td>
                        </tr>
                    </table>
    
                </td>
            </tr>
        </table>
        <br /><br />

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
        SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao]">
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
    SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTipoVaga" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoVaga], [idSetup], [dsTipoVAga] FROM [tbTipoVaga] WHERE ([idSetup] = @idSetup)">
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
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConsultor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspGestorSelectDropDownList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
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
        
</asp:Content>

