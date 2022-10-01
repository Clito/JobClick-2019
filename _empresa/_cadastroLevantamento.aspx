<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="true" CodeFile="_cadastroLevantamento.aspx.vb" Inherits="_empresa_cadastroLevantamento" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
                        <asp:Label ID="msnLabel" runat="server" CssClass="msn"></asp:Label>
                        </td>
            </tr>
        </table>
    <br />
        <asp:Panel ID="PanelCabec" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="640">
                <tr>
                    <td width="26">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/h26.gif" />
                    </td>
                    <td width="614">
                        <asp:Label ID="Label1" runat="server" CssClass="tituloEmp" 
                            Text="Levantamento do Perfil de Vaga"></asp:Label>
                        <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False">0</asp:Label>
                        <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idCadastroEmpresaPaiLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="URLLabel" runat="server"></asp:Label>
                        <asp:Label ID="idUserEmpresaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idPerfilVagaFillLabel" runat="server" Visible="False"></asp:Label>
                        <asp:DataList ID="DataListEmpresaFilha" runat="server" 
                            DataKeyField="idCadastroEmpresa" DataSourceID="SqlEmpresaFilha" Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="EmpresaLabel0" runat="server" 
                                    Text="Você está trabalhando com a empresa: "></asp:Label>
                                <asp:Label ID="nmempresaLabel" runat="server" CssClass="msnOK" Font-Bold="True" 
                                    Text='<%# Eval("nmempresa") %>' />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label>
                        <asp:Label ID="urlLabelT" runat="server" Visible="False"></asp:Label>
                        <asp:GridView ID="GridViewListaPerfil" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" 
                            DataKeyNames="idPerfilVaga,idRH_Gestor,data_criacao,Protocolo" 
                            DataSourceID="SqlListaPerfil" PageSize="5" Width="100%">
                            <AlternatingRowStyle BackColor="#DDDDDD" />
                            <Columns>
                                <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                    SortExpression="Protocolo" Visible="False" />
                                <asp:ButtonField CommandName="Select" DataTextField="dsPerfilVaga" 
                                    HeaderText="Perfil (Título)" Text="Button" />
                                <asp:TemplateField HeaderText="idPerfilVaga" InsertVisible="False" 
                                    SortExpression="idPerfilVaga" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idPerfilVaga") %>' 
                                            Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idPerfilVaga") %>' 
                                            Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                    SortExpression="idCadastroEmpresa" Visible="False" />
                                <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                    HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                    Visible="False" />
                                <asp:BoundField DataField="idstatusvaga" HeaderText="Status Atual" 
                                    SortExpression="idstatusvaga" ReadOnly="True" />
                                <asp:BoundField DataField="dsPerfilVaga" HeaderText="Perfil (Título)" 
                                    SortExpression="dsPerfilVaga" Visible="False" />
                                <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" 
                                    Visible="False" />
                                <asp:BoundField DataField="nrovaga" HeaderText="nrovaga" 
                                    SortExpression="nrovaga" Visible="False" />
                                <asp:BoundField DataField="data_aprovacao" HeaderText="Data Aprovacao" 
                                    SortExpression="data_aprovacao" Visible="False" />
                                <asp:BoundField DataField="data_criacao" DataFormatString="{0:d}" 
                                    HeaderText="Criada em" SortExpression="data_criacao" ReadOnly="True" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Panel ID="PanelMODELO" runat="server" BackColor="#FFFFF9" Visible="False">
                            <table align="center" cellpadding="5" cellspacing="5" width="100%">
                                <tr>
                                    <td align="left">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="left">
                                                    <br />
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="ImageAviso" runat="server" 
                                                        ImageUrl="~/images/empresa/aviso.png" ToolTip="Aviso!" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelAviso" runat="server" 
                                                        Text="&lt;b&gt;Informação importante:&lt;/b&gt;&lt;br&gt;Utilize os Modelos de Levantamentos cadastrados."></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:HyperLink ID="MODELO" runat="server" NavigateUrl="_modelo.aspx?autoTit=Modelos de Levantamentos de Perfis de vagas" 
                                                        ToolTip="Criar ou Alterar um Modelo">Para criar um novo &quot;Modelo&quot; ou alterar o(s) existente(s) Clique aqui.</asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                                    <br />
                                                    <asp:Label ID="LabelCabecPree" runat="server" CssClass="tituloEmpresa" 
                                                        Text="Modelos disponíveis para preenchimento"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:GridView ID="GridViewMODELO" runat="server" AutoGenerateColumns="False" 
                                                        BorderStyle="None" DataKeyNames="idPerfilVagaFill" DataSourceID="SqlMODELO" 
                                                        GridLines="None" ShowHeader="False" Width="100%">
                                                        <AlternatingRowStyle BackColor="#DDDDDD" />
                                                        <Columns>
                                                            <asp:BoundField DataField="idPerfilVagaFill" HeaderText="idPerfilVagaFill" 
                                                                InsertVisible="False" ReadOnly="True" SortExpression="idPerfilVagaFill" 
                                                                Visible="False" />
                                                            <asp:TemplateField HeaderText="Modelo" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    •
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                                        CommandName="Select" Text='<%# Eval("dsPerfilVaga") %>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="dsPerfilVaga" HeaderText="Modelo" 
                                                                SortExpression="dsPerfilVaga" Visible="False">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                                                SortExpression="idCadastroEmpresa" Visible="False" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                                <td align="right" valign="top">
                                                    <asp:ImageButton ID="ImageButtonCloseA" runat="server" 
                                                        ImageUrl="~/images/close.png" ToolTip="Fechar a lista de modelos." />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </asp:Panel>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="SelectEmpresa" />
                        <br />
                        <table id="CadastraEmpresaTable" cellpadding="2" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="EmpresaLabel" runat="server" 
                                        Text="Confirme a vaga para uma das empresas listadas abaixo:"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                        ControlToValidate="DropDownListSelectEmpresa" ErrorMessage="Informe a Empresa." 
                                        ValidationGroup="SelectEmpresa">*</asp:RequiredFieldValidator>
                                    <br />
                                    <asp:DropDownList ID="DropDownListSelectEmpresa" runat="server" 
                                        CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                                        DataValueField="idCadastroEmpresa" ValidationGroup="SelectEmpresa" 
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                    <br />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
<%--                                    <asp:Button ID="ButtonCadastro" runat="server" CssClass="cur01st" 
                                        onclick="ButtonCadastro_Click" Text="Incluir uma nova empresa" 
                                        Visible="False" />--%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <table runat="server" id="NavActions" visible="false" border="0" 
    width="576" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="26">
                        <asp:Image ID="Image2" runat="server" 
                    ImageUrl="~/images/h26.gif" />
                    </td>
                    <td width="550">
                        <asp:ImageButton ID="ImageButtonDsL" runat="server" 
                    ImageUrl="~/images/empresa/descreverLevantamento.png" />
                        <asp:ImageButton ID="ImageButtonModelos" runat="server" 
                            ImageUrl="~/images/empresa/modelo.png" 
                            ToolTip="Clique aqui após selecionar a empresa que receberá o novo Levantamento da Vaga." />
                        <asp:LinkButton ID="LinkButtonCadastroEdit" runat="server" 
                            CausesValidation="False" Visible="False">Editar dados da empresa</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </asp:Panel>
<br />

                    <table cellpadding="0" cellspacing="0" runat="server" width="630" id="FormEmpresa" visible="false">
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
                                <asp:UpdatePanel ID="UpdatePanelCNPJ" runat="server" EnableViewState="False">
                                    <ContentTemplate>
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpdatePanelCEP" runat="server" EnableViewState="False">
                                    <ContentTemplate>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
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
                                                                <cc1:MaskedEditExtender ID="cepTextBox_MaskedEditExtender" runat="server" 
                                                                    ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="99999\-999" MaskType="Number" TargetControlID="cepTextBox" 
                                                                    InputDirection="RightToLeft">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                            <td>
<%--                                                                <asp:ImageButton ID="PesquisaCEP" runat="server" 
                                                                    ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click1" 
                                                                    ValidationGroup="CEP" />
                                                                </td>--%>
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
                                                                <asp:Image ID="Image3" runat="server" ImageUrl="../images/5px.gif" />
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
                                                                    SetFocusOnError="True" ValidationExpression="\d{2}">*</asp:RegularExpressionValidator>
                                                            </td>
                                                            <td>
                                                                Número<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                                    ControlToValidate="telefone" Display="Dynamic" 
                                                                    ErrorMessage="Telefone é obrigatório." SetFocusOnError="True" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                                    ControlToValidate="telefone" Display="Dynamic" 
                                                                    ErrorMessage="Informe o número do telefone." SetFocusOnError="True" 
                                                                    ValidationExpression="\d{4}(-\d{4})?">*</asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="ddd" runat="server" CssClass="InputCad" Width="50px" 
                                                                    ValidationGroup="cadEmpresa"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="ddd_MaskedEditExtender" runat="server" 
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
                                                                <cc1:MaskedEditExtender ID="telefone_MaskedEditExtender" runat="server" 
                                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="9999\-9999" MaskType="Number" TargetControlID="telefone" 
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
                                                    <asp:Label ID="LabelEx" runat="server" 
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
                                                    <asp:Button ID="ButtonAtualizar" runat="server" CssClass="cur01st" 
                                                        Text="Atualizar" Visible="False" />
                                                    <asp:Button ID="ButtonCadastroEmp" runat="server" CssClass="cur01st" 
                                                        Text="Cadastrar empresa" ValidationGroup="cadEmpresa" />
                                                    <asp:Button ID="ButtonCancelar" runat="server" CausesValidation="False" 
                                                        CssClass="cur01st" Text="Cancelar" />
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
    
    <table id="FormPerfilOut" runat="server" border="0" cellpadding="0" 
        cellspacing="0" visible="false">
        <tr>
            <td valign="top" width="26">
                <asp:Image ID="lateral1" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td valign="top" width="650">
                <asp:Label ID="LabelAtencao" runat="server" Font-Bold="True"></asp:Label>
                &nbsp;
                <asp:LinkButton ID="LinkButtonImprimir0" runat="server" 
                    CausesValidation="False">Download do Levantamento</asp:LinkButton>
                <br />
                <br />
                <asp:Label ID="ProtocoloLabel" runat="server" CssClass="tituloEmpresa"></asp:Label>
                &nbsp;
                <br />
                <asp:Label ID="FinanceiroCabecLabel" runat="server" CssClass="titulo" Visible="False" Text="Financeiro"></asp:Label>
                <table id="Financeiro" runat="server" visible="false" cellpadding="0" cellspacing="0" class="tableFormulario" 
                    width="100%">
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:Label ID="CestaLabel" runat="server" 
                                Text="Cesta? Se sim, informe qual Consultor:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:DropDownList ID="DropDownListCesta" runat="server" CssClass="DropCad" 
                                DataSourceID="SqlConsultoresTodos" DataTextField="nome" 
                                DataValueField="idRH_Gestor">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                                ControlToValidate="valorVagaTextBox" ErrorMessage="Valor da vaga obrigatório" 
                                ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                            <asp:Label ID="ValordaVagaLabel" runat="server" Text="Valor da Vaga:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:TextBox ID="valorVagaTextBox" runat="server" CssClass="InputCad"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="valorVagaTextBox_MaskedEditExtender" runat="server" 
                                ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                MaskType="Number" TargetControlID="valorVagaTextBox">
                            </cc1:MaskedEditExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                                ControlToValidate="valorAceiteTextBox" 
                                ErrorMessage="Valor do aceite é obrigatório" ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                            <asp:Label ID="valorAceiteLabel" runat="server" Text="Valor pago no aceite:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:TextBox ID="valorAceiteTextBox" runat="server" CssClass="InputCad"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="valorAceiteTextBox_MaskedEditExtender" 
                                runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                MaskType="Number" TargetControlID="valorAceiteTextBox">
                            </cc1:MaskedEditExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                                ControlToValidate="valorAprovadoTextBox" ErrorMessage="Valor da aprovação" 
                                ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                            <asp:Label ID="valorAprovadoLabel" runat="server" 
                                Text="Valor pago na aprovação:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:TextBox ID="valorAprovadoTextBox" runat="server" CssClass="InputCad"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="valorAprovadoTextBox_MaskedEditExtender" 
                                runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                MaskType="Number" TargetControlID="valorAprovadoTextBox">
                            </cc1:MaskedEditExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" 
                                ControlToValidate="nroParcelaTextBox" ErrorMessage="Parcelas é obrigatório" 
                                ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                            <asp:Label ID="nroParcelaLabel" runat="server" Text="Número de parcelas:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:TextBox ID="nroParcelaTextBox" runat="server" CssClass="InputCad" 
                                Width="100px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="nroParcelaTextBox_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                TargetControlID="nroParcelaTextBox">
                            </cc1:MaskedEditExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:Label ID="vencimentoLabel" runat="server" 
                                Text="Vencimento da primeira parcela:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:TextBox ID="vencimentoTextBox" runat="server" CssClass="InputCad"></asp:TextBox>
                            <cc1:CalendarExtender ID="vencimentoTextBox_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="vencimentoTextBox">
                            </cc1:CalendarExtender>
                            <cc1:MaskedEditExtender ID="vencimentoTextBox_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" 
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" 
                                TargetControlID="vencimentoTextBox">
                            </cc1:MaskedEditExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F4FBFB" class="tableFormulario" width="35%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" 
                                ControlToValidate="valorParcelaTextBox" 
                                ErrorMessage="Valor das parcelas é obrigatório" 
                                ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                            <asp:Label ID="ValorparcelasLabel" runat="server" Text="Valor das parcelas:"></asp:Label>
                        </td>
                        <td bgcolor="#F4FBFB" class="tableFormulario" width="65%">
                            <asp:TextBox ID="valorParcelaTextBox" runat="server" CssClass="InputCad"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="valorParcelaTextBox_MaskedEditExtender" 
                                runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                MaskType="Number" TargetControlID="valorParcelaTextBox">
                            </cc1:MaskedEditExtender>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="ConsultorCabecLabel0" runat="server" CssClass="titulo" 
                    Text="Consultor"></asp:Label>
                <br />
                <table id="CabecG0" cellpadding="0" cellspacing="0" class="tableFormulario" 
                    width="100%">
                    <tr>
                        <td class="tableFormulario" width="35%" align="right">
                            <asp:Label ID="LabelDataLev" runat="server" Text="Data do levantamento:"></asp:Label>
                        </td>
                        <td class="tableFormulario" width="65%">
                            <asp:Label ID="dataLevantamentoLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td id="Gestor_td0" runat="server" class="tableFormulario" width="35%" align="right">
                &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" 
                                ControlToValidate="DropDownListConsultor" 
                                ErrorMessage="Informe o Consultor da Vaga." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                            <asp:Label ID="nomeConsultorLabel" runat="server" Text="Atribuir ao Consultor:"></asp:Label>
                        </td>
                        <td id="Gestor_td1" runat="server" class="tableFormulario" width="65%">
                            <asp:DropDownList ID="DropDownListConsultor" runat="server" CssClass="DropCad" 
                                DataSourceID="SqlConsultor" DataTextField="nome" DataValueField="idRH_Gestor" 
                                Width="180px" ValidationGroup="PerfilVagaForm">
                            </asp:DropDownList>
                            <asp:Button ID="ButtonAtribuir" runat="server" CssClass="cur01st" 
                                Text="&lt; Atribuir ao Consultor selecionado" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tableFormulario" width="35%" align="right">
                            <asp:Label ID="ConsultorLabel" runat="server" Text="Consultor Responsável:"></asp:Label>
                        </td>
                        <td class="tableFormulario" width="65%">
                            <asp:Label ID="nomeLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableFormulario" width="35%" align="right">
                            <asp:Label ID="ConsultorLabel0" runat="server" Text="e-mail:"></asp:Label>
                        </td>
                        <td class="tableFormulario" width="65%">
                            <asp:Label ID="emailLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableFormulario" width="35%" align="right">
                            <asp:Label ID="ConsultorLabel1" runat="server" Text="Telefone:"></asp:Label>
                        </td>
                        <td class="tableFormulario" width="65%">
                            <asp:Label ID="telefoneLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="ValidationSummaryEmpresaSelect" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="EmpresaSelect" />
                <asp:Panel ID="PanelDadoDaEmpresa" runat="server" Width="100%">
                    <asp:ValidationSummary ID="ValidationSummaryFormPerfilVaga" runat="server" 
                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="PerfilVagaForm" />
                    <br />
                    <asp:Label ID="LabelGeral1" runat="server" CssClass="titulo" 
                        Text="Dados da Empresa"></asp:Label>
                        <br />
                            <table id="FormGeral0" cellpadding="0" cellspacing="0" 
                        class="tableFormulario" width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral2" runat="server" Text="Nome:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nomeEmpresaLabel0" runat="server" Font-Bold="True" 
                                            CssClass="msnOK"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral3" runat="server" Text="Endereço:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="enderecoEmpresaLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral5" runat="server" Text="Contato:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nomeResLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral4" runat="server" Text="Telefone:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="telefoneEmpresaLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral6" runat="server" Text="e-mail:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="emailEmpresaLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral7" runat="server" Text="Site http://:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="siteLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral8" runat="server" Text="Segmento de Atuação:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="atuacaoLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral9" runat="server" Text="Tempo de Existência:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="existenciaLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                    </table>
                            <br />
                            <asp:Label ID="LabelTituloVagas" runat="server" CssClass="titulo" 
                        Text="Dados da Vaga"></asp:Label>
                            <br />
                            <asp:Label ID="LegendaLabel" runat="server" 
                        Text="Legenda:&lt;br&gt;&lt;b&gt;PJ:&lt;/b&gt; Pessoa Jurídica | &lt;b&gt;CLT:&lt;/b&gt; Consolidação das Leis do Trabalho&lt;br&gt;&lt;b&gt;AQ:&lt;/b&gt; Aumento de Quadro | &lt;b&gt;S:&lt;/b&gt; Substituição "></asp:Label>
                    <table id="RelVaga0" cellpadding="0" cellspacing="0" class="tableFormulario" 
                        width="100%">
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                                    ControlToValidate="dsPerfilVagaTextBox" ErrorMessage="Título é obrigatório." 
                                    SetFocusOnError="True" ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="Label22" runat="server" Text="Título:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" CssClass="InputCad" 
                                    ValidationGroup="PerfilVagaForm" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                    ControlToValidate="dsfuncaoTextBox" ErrorMessage="Cargo é obrigatório." 
                                    SetFocusOnError="True" ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral10" runat="server" Text="Cargo:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="dsfuncaoTextBox" runat="server" CssClass="InputCad" 
                                    ValidationGroup="PerfilVagaForm" Width="300px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                    ControlToValidate="nrovagaTextBox" 
                                    ErrorMessage="Número de vagas é obrigatório." SetFocusOnError="True" 
                                    ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral11" runat="server" Text="Número de vagas:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="nrovagaTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("nrovaga") %>' Width="300px" 
                                    ValidationGroup="PerfilVagaForm" />
                                <asp:MaskedEditExtender ID="nrovagaTextBox_MaskedEditExtender" runat="server" 
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                    InputDirection="RightToLeft" Mask="999" MaskType="Number" 
                                    TargetControlID="nrovagaTextBox">
                                </asp:MaskedEditExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                    ControlToValidate="RadioButtonListconfidencial" 
                                    ErrorMessage="Confidencial é obrigatório." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral12" runat="server" Text="Confidencial:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:RadioButtonList ID="RadioButtonListconfidencial" runat="server" 
                                    RepeatDirection="Horizontal" 
                                    ValidationGroup="PerfilVagaForm">
                                    <asp:ListItem Value="True">Sim</asp:ListItem>
                                    <asp:ListItem Value="False">Não</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                    ControlToValidate="RadioButtonListTipoOportunidade" 
                                    ErrorMessage="Tipo de Vaga é obrigatório." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral13" runat="server" Text="Tipo de Vaga:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:RadioButtonList ID="RadioButtonListTipoOportunidade" runat="server" 
                                    DataSourceID="SqlTipoVaga" DataTextField="dsTipoVAga" 
                                    DataValueField="idTipoVaga" 
                                    ValidationGroup="PerfilVagaForm">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral14" runat="server" Text="Salário Base:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="RemuneracaoTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("Remuneracao") %>' Width="300px" 
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
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral15" runat="server" Text="Honorários: "></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="HonorarioTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("Honorario") %>' Width="300px" 
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
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral16" runat="server" 
                                    Text="Remuneração Variável/Bônus/PLR:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("RemuneracaoVariavel") %>' Width="300px" 
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
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral17" runat="server" Text="Benefícios:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:CheckBoxList ID="CheckBoxListBeneficio" 
                                    runat="server">
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
                                <asp:Label ID="Label23" runat="server" Text="Outros"></asp:Label>
                                <br />
                                <asp:TextBox ID="BeneficiosTextBox" runat="server" CssClass="InputCad" 
                                    Height="150px" Text='<%# Bind("Beneficios") %>' TextMode="MultiLine" 
                                    Width="300px" ValidationGroup="PerfilVagaForm" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                    ControlToValidate="LocalTrabalhoTextBox" 
                                    ErrorMessage="Local de Trabalho é obrigatório." 
                                    ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral18" runat="server" Text="Local de Trabalho: "></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <table id="Local" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("LocalTrabalho") %>' ValidationGroup="PerfilVagaForm" 
                                                Width="300px" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListUF" runat="server" 
                                                AppendDataBoundItems="True" CssClass="DropUF" DataSourceID="SqlUF" 
                                                DataTextField="uf" DataValueField="uf">
                                                <asp:ListItem Selected="True">SP</asp:ListItem>
                                                <asp:ListItem>-------</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                    ControlToValidate="PerspectivaTextBox" 
                                    ErrorMessage="Perspectiva de Carreira é obrigatório." 
                                    ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral19" runat="server" Text="Perspectiva de Carreira:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="PerspectivaTextBox" runat="server" CssClass="InputCad" 
                                    Height="150px" Text='<%# Bind("Perspectiva") %>' TextMode="MultiLine" 
                                    Width="300px" ValidationGroup="PerfilVagaForm" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:Label ID="LabelGeral20" runat="server" Text="Faixa Etária:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <table id="Faixa0" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" Text="De:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                                ControlToValidate="FaixaEtariaInicioTextBox" 
                                                ErrorMessage="Faixa (de) é obrigatório." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Até:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                                ControlToValidate="FaixaEtariaFimTextBox" 
                                                ErrorMessage="Faixa (até) é obrigatório." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("FaixaEtariaInicio") %>' Width="100px" 
                                                ValidationGroup="PerfilVagaForm" />
                                            <asp:MaskedEditExtender ID="FaixaEtariaInicioTextBox_MaskedEditExtender" 
                                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                TargetControlID="FaixaEtariaInicioTextBox">
                                            </asp:MaskedEditExtender>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("FaixaEtariaFim") %>' Width="100px" 
                                                ValidationGroup="PerfilVagaForm" />
                                            <asp:MaskedEditExtender ID="FaixaEtariaFimTextBox_MaskedEditExtender" 
                                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                TargetControlID="FaixaEtariaFimTextBox">
                                            </asp:MaskedEditExtender>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="anos"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                    ControlToValidate="RadioButtonListSexo" ErrorMessage="Sexo é obrigatório." 
                                    ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral21" runat="server" Text="Sexo:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" 
                                    RepeatDirection="Horizontal" ValidationGroup="PerfilVagaForm">
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    <asp:ListItem Value="I">Indiferente</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                    ControlToValidate="QualificacaoHabilidadesEspecificasTextBox" 
                                    ErrorMessage="Atribuições e Principais Responsabilidades é obrigatório." 
                                    ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral22" runat="server" 
                                    Text="Atribuições e Principais Responsabilidades: "></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:Label ID="Label5" runat="server" 
                                    Text="(Competências e habilidades específicas)"></asp:Label>
                                         <br />
                                         <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                                    CssClass="InputCad" Height="150px" Text='<%# Bind("Habilidades") %>' 
                                    TextMode="MultiLine" Width="300px" ValidationGroup="PerfilVagaForm" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                    ControlToValidate="PerfilComposicaoEquipeTextBox" 
                                    ErrorMessage="Perfil e Composição da equipe é obrigatório." 
                                    ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral23" runat="server" 
                                    Text="Perfil e Composição da equipe:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                                    CssClass="InputCad" Height="150px" Text='<%# Bind("PerfilComposicaoEquipe") %>' 
                                    TextMode="MultiLine" Width="300px" ValidationGroup="PerfilVagaForm" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="tableFormulario" width="35%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                    ControlToValidate="PerfilGestorTextBox" 
                                    ErrorMessage="Perfil do Gestor é obrigatório." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                <asp:Label ID="LabelGeral24" runat="server" Text="Perfil do Gestor:"></asp:Label>
                            </td>
                            <td class="tableFormulario" width="65%">
                                <asp:TextBox ID="PerfilGestorTextBox" runat="server" CssClass="InputCad" 
                                    Height="150px" Text='<%# Bind("PerfilGestor") %>' TextMode="MultiLine" 
                                    Width="300px" ValidationGroup="PerfilVagaForm" />
                            </td>
                        </tr>
                    </table>
                            <br />
                            <asp:Label ID="LabelTituloVagas0" runat="server" CssClass="titulo" 
                        Text="Perfil do Candidato"></asp:Label>

                            <br />
                            <table ID="PerfilCandidato0" cellpadding="0" cellspacing="0" 
                        width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                            ControlToValidate="DDownTipoFormacao" 
                                            ErrorMessage="Formação Acadêmica é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="LabelGeral25" runat="server" Text="Formação Acadêmica:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:DropDownList ID="DDownTipoFormacao" runat="server" CssClass="DropCad" 
                                            DataSourceID="SqlDataTipoFormacao" DataTextField="dsTipoFormacao" 
                                            DataValueField="idTipoFormacao" 
                                            Width="300px" ValidationGroup="PerfilVagaForm">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral26" runat="server" Text="Idiomas:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="idiomaTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" TextMode="MultiLine" Width="300px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral27" runat="server" Text="Informática:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="informaticaTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" TextMode="MultiLine" Width="300px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelGeral28" runat="server" Text="Cursos Específicos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="CursoEspecificoTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" Text='<%# Bind("CursoEspecifico") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                            ControlToValidate="ConhecimentoTextBox" 
                                            ErrorMessage="Conhecimentos é obrigatório." ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label6" runat="server" Text="Conhecimentos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="ConhecimentoTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" Text='<%# Bind("Conhecimento") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                            ControlToValidate="CompetenciaComportamentalTextBox" 
                                            ErrorMessage="Competências Comportamentais é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label7" runat="server" Text="Competências Comportamentais:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                                            CssClass="InputCad" Height="150px" 
                                            Text='<%# Bind("CompetenciaComportamental") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                            ControlToValidate="CompetenciaProfissionalTextBox" 
                                            ErrorMessage="Competências Profissionais é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label8" runat="server" Text="Competências Profissionais:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                                            CssClass="InputCad" Height="150px" Text='<%# Bind("CompetenciaProfissional") %>' 
                                            TextMode="MultiLine" Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                            ControlToValidate="AspectoCriticoTextBox" 
                                            ErrorMessage="Aspectos Críticos da Função é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label9" runat="server" Text="Aspectos Críticos da Função:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="AspectoCriticoTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" Text='<%# Bind("AspectoCritico") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                                            ControlToValidate="PrincipalDesafioTextBox" 
                                            ErrorMessage="Principais Desafios que o Profissional irá enfrentar é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label11" runat="server" 
                                            Text="Principais Desafios que o Profissional irá enfrentar:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" Text='<%# Bind("PrincipalDesafio") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                                            ControlToValidate="RelacionamentoInternoTextBox" 
                                            ErrorMessage="Relacionamentos Internos é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label12" runat="server" Text="Relacionamentos Internos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                                            CssClass="InputCad" Height="150px" Text='<%# Bind("RelacionamentoInterno") %>' 
                                            TextMode="MultiLine" Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" 
                                            ControlToValidate="RelacionamentoExternoTextBox" 
                                            ErrorMessage="Relacionamentos Externos é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label13" runat="server" Text="Relacionamentos Externos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                                            CssClass="InputCad" Height="150px" Text='<%# Bind("RelacionamentoExterno") %>' 
                                            TextMode="MultiLine" Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label14" runat="server" Text="Viagens:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:RadioButtonList ID="RadioButtonListviagens" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem Value="1">Sim</asp:ListItem>
                                            <asp:ListItem Value="0">Não</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label21" runat="server" Text="Comentários sobre viagens:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label15" runat="server" Text="Observações:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="ObsComplementaresTextBox" runat="server" CssClass="InputCad" 
                                            Height="150px" Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" 
                                            Width="300px" ValidationGroup="PerfilVagaForm" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                                            ControlToValidate="EstruturaOrganizacionalTextBox" 
                                            ErrorMessage="Estrutura Organizacional é obrigatório." 
                                            ValidationGroup="PerfilVagaForm">•</asp:RequiredFieldValidator>
                                        <asp:Label ID="Label16" runat="server" Text="Estrutura Organizacional:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:TextBox ID="EstruturaOrganizacionalTextBox" runat="server" 
                                            CssClass="InputCad" Height="150px" TextMode="MultiLine" Width="300px" 
                                            ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label17" runat="server" 
                                            Text="Quanto ao Levantamento de Perfil de Vaga:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:RadioButtonList ID="RadioButtonListAprovado" runat="server" 
                                            RepeatDirection="Horizontal" ValidationGroup="PerfilVagaForm">
                                            <asp:ListItem Value="1">Aprovado</asp:ListItem>
                                            <asp:ListItem Value="0">Não Aprovado</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="2">Em Análise</asp:ListItem>
                                            <asp:ListItem Value="3">Encerrado</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="Label18" runat="server" 
                                            
                                            Text="Canal de comunicação com o Gestor do Levantamento.&lt;br&gt;&lt;br&gt;Aqui o Gestor irá descrever o motivo pela não aprovação do levantamento:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                         <asp:TextBox ID="perfil_vaga_aprovado_comentarioTextBox" runat="server" 
                                             CssClass="InputCad" Height="150px" 
                                            TextMode="MultiLine" Width="300px" ValidationGroup="PerfilVagaForm"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        &nbsp;</td>
                                    <td class="tableFormulario" width="65%">
                                        <br />
                                        <asp:Label ID="Label10" runat="server" 
                                            Text="&lt;b&gt;Obs.:&lt;/b&gt; O Processo Seletivo inicia após aprovação do Levantamento de Perfil de Vaga."></asp:Label>
                                         <br />
                                         <br />
                                        <table ID="OutLookPerfil" runat="server" visible="false" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="mensagemLabel" runat="server" Text="Mensagem ao Gestor:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                                                        ControlToValidate="msnTextBox" 
                                                        ErrorMessage="Escreva a sua mensagem ao consultor." 
                                                        ValidationGroup="PerfilVagaFormMSN">*</asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="msnTextBox" runat="server" CssClass="InputCad" Height="150px" 
                                                        TextMode="MultiLine" ValidationGroup="PerfilVagaFormMSN"></asp:TextBox>
                                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="PerfilVagaFormMSN" />
                                                </td>
                                            </tr>
                                        </table>
                                         <br />
                                        <br />
                                         <br />
                                         |
                                         <asp:LinkButton ID="LinkButtonAlterar" runat="server" 
                                            ValidationGroup="PerfilVagaForm" Visible="False">Alterar Perfil</asp:LinkButton>
                                         <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Salvar Levantamento" 
                                            ValidationGroup="PerfilVagaForm" />
                                        &nbsp;|
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancelar" />
                                        &nbsp;<asp:Label ID="barraLabel" runat="server" Text="|" Visible="False"></asp:Label>
                                        &nbsp;<asp:LinkButton ID="LinkButtonAprGestor" runat="server" 
                                            ValidationGroup="PerfilVagaFormMSN" Visible="False">Enviar ao Gestor para aprovação</asp:LinkButton>
                                    </td>
                                </tr>
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
                    <asp:Panel ID="PanelMensagemEnviada" runat="server" 
    Visible="False">
                        <table cellpadding="0" cellspacing="0" ID="StatusMSN">
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                        ImageUrl="~/images/close.png" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="MSNEmail" runat="server" CssClass="msnOK"></asp:Label>
                                    <br />
                                    <asp:Image ID="ImageEmail" runat="server" 
                                        ImageUrl="~/images/emailEnviado.png" />
                                    <br />
                                </td>
                            </tr>
                        </table>
</asp:Panel>
<cc1:DragPanelExtender ID="PanelMensagemEnviada_DragPanelExtender" 
    runat="server" DragHandleID="PanelMensagemEnviada" Enabled="True" 
    TargetControlID="PanelMensagemEnviada">
</cc1:DragPanelExtender>
<br />
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
            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                SessionField="idCadastroEmpresaFilha" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConsultor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            
            
            SelectCommand="SELECT tbRH_Gestor.nome, tbRH_Gestor.idRH_Gestor, tbRH_Gestor.idCadastroEmpresa, tbuser.idTypeUser FROM tbRH_Gestor INNER JOIN tbuser ON tbRH_Gestor.idUser = tbuser.idUser WHERE (tbRH_Gestor.idCadastroEmpresa = @idCadastroEmpresa) AND ((tbuser.idTypeUser = @idTypeUser) OR (tbuser.idTypeUser = @idTypeUser1) OR (tbuser.idTypeUser = @idTypeUser2))">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="Consultor Wizard" Name="idTypeUser" />
            <asp:Parameter DefaultValue="Consultor" Name="idTypeUser1" />
            <asp:Parameter DefaultValue="RHUser" Name="idTypeUser2" />
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
    <br />
</asp:Content>

