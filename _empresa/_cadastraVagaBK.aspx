<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_cadastraVaga.aspx.vb" Inherits="_empresa_cadastraVaga" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                                        <asp:Label ID="ResPSQLabel" runat="server" CssClass="tituloEmp"></asp:Label>
                <asp:Label ID="iddsempresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idvagaLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="FuncaoPesquisaLabel" runat="server" 
                        Visible="False"></asp:Label>
                                        <asp:Label ID="ProtocoloLabel" runat="server"></asp:Label>
                    <asp:Panel ID="PanelTrocaEmpresa" runat="server" DefaultButton="ButtonFechar">
                        <asp:DropDownList ID="DropDownListEmpresa" runat="server" AutoPostBack="True" CssClass="DropCad" 
    DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
    DataValueField="idCadastroEmpresa" Width="250px">
                        </asp:DropDownList>
                        <asp:Button ID="ButtonFechar" runat="server" CssClass="cur01st" Text="Fechar" 
                            CausesValidation="False" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26" valign="top">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButtonChange" runat="server" 
                                    ImageUrl="~/images/layout/trocaEmpresa.png" CausesValidation="False" />
                                <cc1:ModalPopupExtender ID="ImageButtonChange_ModalPopupExtender" 
                                    runat="server" BackgroundCssClass="backgroundFirstContent" 
                                    CancelControlID="ButtonFechar" DynamicServicePath="" Enabled="True" 
                                    PopupControlID="PanelTrocaEmpresa" TargetControlID="ImageButtonChange">
                                </cc1:ModalPopupExtender>
                            </td>
                            <td>
                <asp:DataList ID="DataListEmpresaFilha" runat="server" DataKeyField="idCadastroEmpresa" 
                    DataSourceID="SqlEmpresaFilha" Width="100%">
                    <ItemTemplate>
                        <asp:Label ID="EmpresaLabel" runat="server" 
                            Text="Você está trabalhando com a empresa: "></asp:Label>
                        <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                            Font-Bold="True" CssClass="msnOK" />
                    </ItemTemplate>
                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                    <br />
                <asp:Panel ID="PanelPSQ" runat="server" BackColor="#E6F0F0" 
                    BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" 
                    Width="580px" DefaultButton="ImageButtonPSQ">
                    <table id="Aviso" cellpadding="5" cellspacing="5">
                        <tr>
                            <td>
                                <asp:Label ID="LabelDica" runat="server" 
                                    Text="Informe o cargo que o Levantamento do Perfil da Vaga está recrutando, em seguida clique no botão &quot;Buscar por um Cargo&quot;. Será apresentado uma lista de cargos que mais se aproxima com o informado. Para fechar o campo de pesquisa clique no botão [X] ao lado."></asp:Label>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButtonClosePanel" runat="server" 
                                    ImageUrl="~/images/close.png" />
                            </td>
                        </tr>
                    </table>
                    <table id="PSQ" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TextBoxPsq" Display="Dynamic" 
                                    ErrorMessage="* Inicie sua pesquisa com no mínimo 7 caracteres" 
                                    ValidationGroup="PSQ">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ControlToValidate="TextBoxPsq" Display="Dynamic" 
                                    ErrorMessage="* Inicie sua pesquisa com no mínimo 7 caracteres" 
                                    SetFocusOnError="True" 
                                    ValidationExpression=".{7}.*" 
                                    ValidationGroup="PSQ">*</asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="TextBoxPsq" runat="server" CssClass="InputCad" 
                                    ValidationGroup="PSQ" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButtonPSQ" runat="server" 
                                    ImageUrl="~/images/empresa/btPesquisaCargo.png" ValidationGroup="PSQ" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                    <asp:Panel ID="PanelFormVaga" runat="server" Visible="False">
                        <asp:FormView ID="FormViewVaga" runat="server" DataKeyNames="idVaga" 
                    DataSourceID="SqlDataSourceVagaPublicadaForm" Width="100%" DefaultMode="Insert">
                            <EditItemTemplate>
                                <asp:Label ID="LabelPS3" runat="server" CssClass="titulo" 
                            Text="Formulário para Publicação de Vaga"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="ProtocoloLabel" runat="server" Text="Protocolo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCad" Enabled="False" 
                            Text='<%# Bind("Protocolo") %>'></asp:TextBox>
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="Informe o Consultor:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ErrorMessage="Selecione um Consultor" 
                            ControlToValidate="DropDownListConsultor">*</asp:RequiredFieldValidator>
                                <br />
<%--                                <asp:DropDownList ID="DropDownListConsultor" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlConsultoresTodos" DataTextField="nome" 
                            DataValueField="idRH_Gestor" ondatabound="DropDownListConsultor_DataBound" 
                            SelectedValue='<%# Bind("idRH_Gestor") %>'>
                                </asp:DropDownList>--%>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Apresentação:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ErrorMessage="Selecione uma Apresentação" 
                            ControlToValidate="DropDownListApresentacao">*</asp:RequiredFieldValidator>
                                <br />
<%--                                <asp:DropDownList ID="DropDownListApresentacao" runat="server" 
                            CssClass="DropCad" DataSourceID="SqlApresentacaoEmpresas" 
                            DataTextField="tituloDesEmpresa" DataValueField="iddsempresa" 
                            ondatabound="DropDownListApresentacao_DataBound" 
                            SelectedValue='<%# Bind("iddsAnuncioEmpresa") %>'>
                                </asp:DropDownList>--%>
                                <br />
                                <asp:Label ID="EstruturaLabel" runat="server" Text="Estrutura Organizacional:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ErrorMessage="Informe uma Estrutura Organizacional" 
                            ControlToValidate="DropDownListExtrutura">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="DropDownListExtrutura" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourceEstruturaOrganizacional" 
                            DataTextField="dsNivelHierarquico" DataValueField="idNivelHierarquico" 
                            SelectedValue='<%# Bind("idNivelHierarquico") %>'>
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="CodigoLabel" runat="server" Text="Código da Vaga / Protocolo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ErrorMessage="Código / Protocolo é obrigatório" 
                            ControlToValidate="codvagaTextBox">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="codvagaTextBox" runat="server" 
                            Text='<%# Bind("codvaga") %>' CssClass="InputCad" />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Início da Publicação:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ErrorMessage="Data de início é obrigatória" 
                            ControlToValidate="data_iniTextBox">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="data_iniTextBox" runat="server" 
                            Text='<%# Bind("data_ini") %>' CssClass="InputCad" Width="250px" />
                                <cc1:CalendarExtender ID="data_iniTextBox_CalendarExtender" runat="server" 
                            Enabled="True" PopupButtonID="ImageButtonC1" 
                            TargetControlID="data_iniTextBox">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:ImageButton ID="ImageButtonC1" runat="server" 
                            ImageUrl="~/images/candidato/buttonCalendario.png" 
                            CausesValidation="False" />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='Término da Publicação:' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ErrorMessage="Data de término é obrigatória" 
                            ControlToValidate="data_fimTextBox">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="data_fimTextBox" runat="server" 
                            Text='<%# Bind("data_fim") %>' CssClass="InputCad" Width="250px" />
                                <cc1:CalendarExtender ID="data_fimTextBox_CalendarExtender" runat="server" 
                            Enabled="True" PopupButtonID="ImageButtonC2" 
                            TargetControlID="data_fimTextBox">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:ImageButton ID="ImageButtonC2" runat="server" 
                            ImageUrl="~/images/candidato/buttonCalendario.png" 
                            CausesValidation="False" />
                                <br />
                                <asp:CheckBox ID="liberarEmailCheckBox" runat="server" 
                            Checked='<%# Bind("liberarEmail") %>' 
                            Text="Permitir envio de e-mail ao Consultor da vaga" />
                                <br />
                                <asp:CheckBox ID="publicarCheckBox" runat="server" 
                            Checked='<%# Bind("publicar") %>' Text="Publicar imediatamente a vaga" />
                                <br />
                                <br />
                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idCadastroEmpresa_FilhaTextBox" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa_Filha") %>' Visible="False" 
                            Width="5px" />
                                <asp:TextBox ID="iddsAnuncioEmpresaTextBox" runat="server" 
                            Text='<%# Bind("iddsAnuncioEmpresa") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idNivelHierarquicoTextBox" runat="server" 
                            Text='<%# Bind("idNivelHierarquico") %>' style="height: 22px" 
                            Visible="False" Width="5px" />
                                <asp:TextBox ID="idPerfilVagaTextBox" runat="server" 
                            Text='<%# Bind("idPerfilVaga") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idRH_GestorTextBox" runat="server" 
                            Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idRH_ConsultorTextBox" runat="server" 
                            Text='<%# Bind("idRH_Consultor") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idfuncaoTextBox" runat="server" 
                            Text='<%# Bind("idfuncao") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="dsfuncaoTextBox" runat="server" 
                            Text='<%# Bind("dsfuncao") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="ProtocoloTextBox" runat="server" 
                            Text='<%# Bind("Protocolo") %>' Visible="False" Width="5px" />
                                <asp:CheckBox ID="avisoCheckBox" runat="server" 
                            Checked='<%# Bind("aviso") %>' Visible="False" />
                                <br />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Atualizar dados da vaga" />
                                &nbsp;|
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                            onclick="UpdateCancelButton_Click" />
                                <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                            ShowMessageBox="True" />
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <br />
                                <asp:Label ID="LabelPS4" runat="server" CssClass="titulo" 
                            Text="Incluir nova vaga"></asp:Label>
                                <br />
                                <br />
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Incluir uma nova vaga" />
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <br />
                                <asp:Label ID="LabelPS5" runat="server" CssClass="titulo" 
                            Text="Formulário para Publicação de Vaga"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="ProtocoloLabel0" runat="server" Text="Protocolo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ErrorMessage="Selecione um Protocolo" 
                            ControlToValidate="DropDownListProtocolo">*</asp:RequiredFieldValidator>
                                <br />
<%--                                <asp:DropDownList ID="DropDownListProtocolo" runat="server" AutoPostBack="True" 
                            CssClass="DropCad" DataSourceID="SqlDataSourceProtocolo" 
                            DataTextField="Protocolo" DataValueField="idPerfilVaga" 
                            ondatabound="DropDownListProtocolo_DataBound" 
                            onselectedindexchanged="DropDownListProtocolo_SelectedIndexChanged">
                                </asp:DropDownList>--%>
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="Informe o Consultor:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                            ErrorMessage="Selecione um Consultor" 
                            ControlToValidate="DropDownListConsultor">*</asp:RequiredFieldValidator>
                                <br />
<%--                                <asp:DropDownList ID="DropDownListConsultor" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlConsultoresTodos" DataTextField="nome" 
                            DataValueField="idRH_Gestor" ondatabound="DropDownListConsultor_DataBound" 
                            SelectedValue='<%# Bind("idRH_Gestor") %>'>
                                </asp:DropDownList>--%>
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="Apresentação:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                            ErrorMessage="Selecione uma Apresentação" 
                            ControlToValidate="DropDownListApresentacao">*</asp:RequiredFieldValidator>
                                <br />
<%--                                <asp:DropDownList ID="DropDownListApresentacao" runat="server" 
                            CssClass="DropCad" DataSourceID="SqlApresentacaoEmpresas" 
                            DataTextField="tituloDesEmpresa" DataValueField="iddsempresa" 
                            SelectedValue='<%# Bind("iddsAnuncioEmpresa") %>' 
                            ondatabound="DropDownListApresentacao_DataBound">
                                </asp:DropDownList>--%>
                                <br />
                                <asp:Label ID="EstruturaLabel0" runat="server" Text="Estrutura Organizacional:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                            ErrorMessage="Informe uma Estrutura Organizacional" 
                            ControlToValidate="DropDownListExtrutura">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:DropDownList ID="DropDownListExtrutura" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourceEstruturaOrganizacional" 
                            DataTextField="dsNivelHierarquico" DataValueField="idNivelHierarquico" 
                            SelectedValue='<%# Bind("idNivelHierarquico") %>'>
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="CodigoLabel0" runat="server" Text="Código da Vaga / Protocolo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                            ErrorMessage="Código / Protocolo é obrigatório" 
                            ControlToValidate="codvagaTextBox">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="codvagaTextBox" runat="server" Text='<%# Bind("codvaga") %>' 
                            CssClass="InputCad" />
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="Início da Publicação:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                            ErrorMessage="Data de início é obrigatória" 
                            ControlToValidate="data_iniTextBox">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="data_iniTextBox" runat="server" 
                            Text='<%# Bind("data_ini") %>' CssClass="InputCad" Width="250px" />
                                <cc1:CalendarExtender ID="data_iniTextBox_CalendarExtender0" runat="server" 
                            Enabled="True" PopupButtonID="ImageButtonC3" 
                            TargetControlID="data_iniTextBox">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:ImageButton ID="ImageButtonC3" runat="server" 
                            ImageUrl="~/images/candidato/buttonCalendario.png" 
                            CausesValidation="False" />
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="Término da Publicação:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                            ErrorMessage="Data de término é obrigatória" 
                            ControlToValidate="data_fimTextBox">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="data_fimTextBox" runat="server" 
                            Text='<%# Bind("data_fim") %>' CssClass="InputCad" Width="250px" />
                                <cc1:CalendarExtender ID="data_fimTextBox_CalendarExtender0" runat="server" 
                            Enabled="True" PopupButtonID="ImageButtonC4" 
                            TargetControlID="data_fimTextBox">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:ImageButton ID="ImageButtonC4" runat="server" 
                            ImageUrl="~/images/candidato/buttonCalendario.png" 
                            CausesValidation="False" />
                                <br />
                                <asp:CheckBox ID="liberarEmailCheckBox0" runat="server" 
                            Checked='<%# Bind("liberarEmail") %>' 
                            Text="Permitir envio de e-mail ao Consultor da vaga" />
                                <br />
                                <asp:CheckBox ID="publicarCheckBox0" runat="server" 
                            Checked='<%# Bind("publicar") %>' Text="Publicar imediatamente a vaga" />
                                <br />
                                <br />
                                <asp:TextBox ID="idCadastroEmpresaTextBox0" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idCadastroEmpresa_FilhaTextBox0" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa_Filha") %>' Visible="False" 
                            Width="5px" />
                                <asp:TextBox ID="iddsAnuncioEmpresaTextBox0" runat="server" 
                            Text='<%# Bind("iddsAnuncioEmpresa") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idNivelHierarquicoTextBox0" runat="server" 
                            Text='<%# Bind("idNivelHierarquico") %>' style="height: 22px" 
                            Visible="False" Width="5px" />
                                <asp:TextBox ID="idPerfilVagaTextBox0" runat="server" 
                            Text='<%# Bind("idPerfilVaga") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idRH_GestorTextBox0" runat="server" 
                            Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idRH_ConsultorTextBox0" runat="server" 
                            Text='<%# Bind("idRH_Consultor") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idfuncaoTextBox0" runat="server" 
                            Text='<%# Bind("idfuncao") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="dsfuncaoTextBox0" runat="server" 
                            Text='<%# Bind("dsfuncao") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="ProtocoloTextBox0" runat="server" 
                            Text='<%# Bind("Protocolo") %>' Visible="False" Width="5px" />
                                <asp:CheckBox ID="avisoCheckBox0" runat="server" 
                            Checked='<%# Bind("aviso") %>' Visible="False" />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar dados da vaga" />
                                &nbsp;|
                                <asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                                    onclick="InsertCancelButton_Click" />
                                <asp:ValidationSummary ID="ValidationSummary4" runat="server" 
                            ShowMessageBox="True" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <br />
                                <asp:Label ID="LabelPS6" runat="server" CssClass="titulo" 
                            Text="Vaga selecionada"></asp:Label>
                                <br />
                                <asp:Label ID="ProtocoloLabel1" runat="server" Font-Bold="True" 
                            Text='<%# Bind("Protocolo") %>' />
                                <br />
                                <br />
                                <asp:Label ID="CargoLabel" runat="server" Font-Bold="True" Text="Cargo:"></asp:Label>
                                &nbsp;<asp:Label ID="dsfuncaoLabel" runat="server" 
                                    Text='<%# Bind("dsfuncao") %>' />
                                <br />
                                <br />
                                <asp:Label ID="data_iniLabel" runat="server" 
                            Text='<%# Bind("data_ini", "{0:d}") %>' />
                                &nbsp;-
                                <asp:Label ID="data_fimLabel" runat="server" 
                            Text='<%# Bind("data_fim", "{0:d}") %>' />
                                <br />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Editar dados da Vaga" />
                                &nbsp;|
                                <asp:LinkButton ID="LinkButtonCancelarVaga" runat="server" 
                            onclick="LinkButtonCancelarVaga_Click">Cancelar</asp:LinkButton>
                                &nbsp;|
                                <asp:HyperLink ID="HyperLinkPreView" runat="server" 
                            NavigateUrl="~/_empresa/previewVaga.aspx">Editar o Anúncio</asp:HyperLink>
                            </ItemTemplate>
                        </asp:FormView>
                    </asp:Panel>
                <br /><br />
                    <asp:Panel ID="PanelPesquisaNOVA" runat="server">
                        <asp:ImageButton ID="ImageButtonNovaPesquisa" runat="server" 
                            ImageUrl="~/images/layout/novapesquisa.png" />
                        <asp:GridView ID="GridViewPsqCargo" runat="server" AutoGenerateColumns="False" 
                            BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" 
                            DataKeyNames="idfuncao,dsfuncao" DataSourceID="SqlDataSourcePesquisa" 
                            Width="100%" AllowPaging="True" PageSize="100">
                            <Columns>
                                <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="idfuncao" 
                                    Visible="False" />
                                <asp:BoundField DataField="dsfuncao" HeaderText="dsfuncao" 
                                    SortExpression="dsfuncao" Visible="False" />
                                <asp:ButtonField CommandName="Select" DataTextField="dsfuncao" 
                                    HeaderText="Cargo(s) encontrado(s)" Text="Button">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:ButtonField>
                            </Columns>
                            <PagerSettings Position="TopAndBottom" />
                        </asp:GridView>
                    </asp:Panel>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="PSQ" />
                            <asp:SqlDataSource ID="SqlDataSourcePesquisa" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                SelectCommand="spPesquisaCadastraFuncao" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="FuncaoPesquisaLabel" Name="buscador" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                <cc1:DragPanelExtender ID="PanelPSQ_DragPanelExtender" runat="server" 
                    DragHandleID="PanelPSQ" Enabled="True" TargetControlID="PanelPSQ">
                </cc1:DragPanelExtender>
                </td>
            </tr>
        </table>
        <br />
                <asp:SqlDataSource ID="SqlApresentacaoEmpresas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_APRESENTACAO_ANUNCIO_VAGA" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:SessionParameter Name="idCadastroEmpresaFilha" 
                            SessionField="idCadastroEmpresaFilha" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <br />
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
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [idCadastroEmpresa_Pai] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceVagaPublicada" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [_tbVaga] WHERE [idVaga] = @idVaga" 
                    InsertCommand="INSERT INTO [_tbVaga] ([Protocolo], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [iddsAnuncioEmpresa], [idNivelHierarquico], [idPerfilVaga], [idRH_Gestor], [idRH_Consultor], [codvaga], [idfuncao], [dsfuncao], [data_ini], [data_fim], [liberarEmail], [xmlAnuncio], [publicar], [aviso]) VALUES (@Protocolo, @idCadastroEmpresa, @idCadastroEmpresa_Filha, @iddsAnuncioEmpresa, @idNivelHierarquico, @idPerfilVaga, @idRH_Gestor, @idRH_Consultor, @codvaga, @idfuncao, @dsfuncao, @data_ini, @data_fim, @liberarEmail, @xmlAnuncio, @publicar, @aviso)" 
                    SelectCommand="SELECT [idVaga], [Protocolo], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [iddsAnuncioEmpresa], [idNivelHierarquico], [idPerfilVaga], [idRH_Gestor], [idRH_Consultor], [codvaga], [idfuncao], [dsfuncao], [data_ini], [data_fim], [liberarEmail], [xmlAnuncio], [publicar], [aviso] FROM [_tbVaga] WHERE (([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha))" 
                    UpdateCommand="UPDATE [_tbVaga] SET [Protocolo] = @Protocolo, [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha, [iddsAnuncioEmpresa] = @iddsAnuncioEmpresa, [idNivelHierarquico] = @idNivelHierarquico, [idPerfilVaga] = @idPerfilVaga, [idRH_Gestor] = @idRH_Gestor, [idRH_Consultor] = @idRH_Consultor, [codvaga] = @codvaga, [idfuncao] = @idfuncao, [dsfuncao] = @dsfuncao, [data_ini] = @data_ini, [data_fim] = @data_fim, [liberarEmail] = @liberarEmail, [xmlAnuncio] = @xmlAnuncio, [publicar] = @publicar, [aviso] = @aviso WHERE [idVaga] = @idVaga">
                    <DeleteParameters>
                        <asp:Parameter Name="idVaga" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                        <asp:Parameter Name="iddsAnuncioEmpresa" Type="Int32" />
                        <asp:Parameter Name="idNivelHierarquico" Type="Int32" />
                        <asp:Parameter Name="idPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                        <asp:Parameter Name="idRH_Consultor" Type="Int32" />
                        <asp:Parameter Name="codvaga" Type="String" />
                        <asp:Parameter Name="idfuncao" Type="Int32" />
                        <asp:Parameter Name="dsfuncao" Type="String" />
                        <asp:Parameter Name="data_ini" Type="DateTime" />
                        <asp:Parameter Name="data_fim" Type="DateTime" />
                        <asp:Parameter Name="liberarEmail" Type="Boolean" />
                        <asp:Parameter Name="xmlAnuncio" Type="Object" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                        <asp:Parameter Name="aviso" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                            Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                        <asp:Parameter Name="iddsAnuncioEmpresa" Type="Int32" />
                        <asp:Parameter Name="idNivelHierarquico" Type="Int32" />
                        <asp:Parameter Name="idPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                        <asp:Parameter Name="idRH_Consultor" Type="Int32" />
                        <asp:Parameter Name="codvaga" Type="String" />
                        <asp:Parameter Name="idfuncao" Type="Int32" />
                        <asp:Parameter Name="dsfuncao" Type="String" />
                        <asp:Parameter Name="data_ini" Type="DateTime" />
                        <asp:Parameter Name="data_fim" Type="DateTime" />
                        <asp:Parameter Name="liberarEmail" Type="Boolean" />
                        <asp:Parameter Name="xmlAnuncio" Type="Object" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                        <asp:Parameter Name="aviso" Type="Boolean" />
                        <asp:Parameter Name="idVaga" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceVagaPublicadaForm" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [_tbVaga] WHERE [idVaga] = @idVaga" 
                    InsertCommand="INSERT INTO [_tbVaga] ([Protocolo], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [iddsAnuncioEmpresa], [idNivelHierarquico], [idPerfilVaga], [idRH_Gestor], [idRH_Consultor], [codvaga], [idfuncao], [dsfuncao], [data_ini], [data_fim], [liberarEmail], [publicar], [aviso]) VALUES (@Protocolo, @idCadastroEmpresa, @idCadastroEmpresa_Filha, @iddsAnuncioEmpresa, @idNivelHierarquico, @idPerfilVaga, @idRH_Gestor, @idRH_Consultor, @codvaga, @idfuncao, @dsfuncao, @data_ini, @data_fim, @liberarEmail, @publicar, @aviso)" 
                    SelectCommand="SELECT [idVaga], [Protocolo], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [iddsAnuncioEmpresa], [idNivelHierarquico], [idPerfilVaga], [idRH_Gestor], [idRH_Consultor], [codvaga], [idfuncao], [dsfuncao], [data_ini], [data_fim], [liberarEmail], [publicar], [aviso] FROM [_tbVaga] WHERE (([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha) AND ([idVaga] = @idVaga))" 
                    UpdateCommand="UPDATE [_tbVaga] SET [Protocolo] = @Protocolo, [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha, [iddsAnuncioEmpresa] = @iddsAnuncioEmpresa, [idNivelHierarquico] = @idNivelHierarquico, [idPerfilVaga] = @idPerfilVaga, [idRH_Gestor] = @idRH_Gestor, [idRH_Consultor] = @idRH_Consultor, [codvaga] = @codvaga, [idfuncao] = @idfuncao, [dsfuncao] = @dsfuncao, [data_ini] = @data_ini, [data_fim] = @data_fim, [liberarEmail] = @liberarEmail, [publicar] = @publicar, [aviso] = @aviso WHERE [idVaga] = @idVaga">
                    <DeleteParameters>
                        <asp:Parameter Name="idVaga" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                        <asp:Parameter Name="iddsAnuncioEmpresa" Type="Int32" />
                        <asp:Parameter Name="idNivelHierarquico" Type="Int32" />
                        <asp:Parameter Name="idPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                        <asp:Parameter Name="idRH_Consultor" Type="Int32" />
                        <asp:Parameter Name="codvaga" Type="String" />
                        <asp:Parameter Name="idfuncao" Type="Int32" />
                        <asp:Parameter Name="dsfuncao" Type="String" />
                        <asp:Parameter Name="data_ini" Type="DateTime" />
                        <asp:Parameter Name="data_fim" Type="DateTime" />
                        <asp:Parameter Name="liberarEmail" Type="Boolean" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                        <asp:Parameter Name="aviso" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                            Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="idvagaLabel" Name="idVaga" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                        <asp:Parameter Name="iddsAnuncioEmpresa" Type="Int32" />
                        <asp:Parameter Name="idNivelHierarquico" Type="Int32" />
                        <asp:Parameter Name="idPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                        <asp:Parameter Name="idRH_Consultor" Type="Int32" />
                        <asp:Parameter Name="codvaga" Type="String" />
                        <asp:Parameter Name="idfuncao" Type="Int32" />
                        <asp:Parameter Name="dsfuncao" Type="String" />
                        <asp:Parameter Name="data_ini" Type="DateTime" />
                        <asp:Parameter Name="data_fim" Type="DateTime" />
                        <asp:Parameter Name="liberarEmail" Type="Boolean" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                        <asp:Parameter Name="aviso" Type="Boolean" />
                        <asp:Parameter Name="idVaga" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEstruturaOrganizacional" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idNivelHierarquico], [dsNivelHierarquico] FROM [tbNivelHierarquico]">
                </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSourceProtocolo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                            
            SelectCommand="_USP_LISTA_LEVANTAMENTOS_APROVADOS_SEM_VAGAS_PUBLICADAS" 
            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idCadastroEmpresaFilha" 
                                                    SessionField="idCadastroEmpresaFilha" Type="Int32" />
                                                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                                    Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="perfil_vaga_aprovado" Type="String" />
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

