<%@ Page Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="vaga.aspx.vb" Inherits="_empresa__vaga_Default" title="Untitled Page" %>

<%@ Register Src="~/App_Include/personalizarV.ascx" TagName="personalizarV" TagPrefix="uc2" %>
<%@ Register Src="~/App_Include/idiomaV.ascx" TagName="idiomaV" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_vagas.gif" /><br />
    <table runat="server" id="VagaAdm" width="700" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="614">
                                        <asp:Label ID="ResPSQLabel" runat="server" CssClass="tituloEmp"></asp:Label>
                <asp:Label ID="iddsempresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idvagaLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="ProtocoloLabel" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LabelPS2" runat="server" 
                    Text="Selecione uma empresa:" CssClass="titulo"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListEmpresa" runat="server" AutoPostBack="True" 
                    CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                    DataValueField="idCadastroEmpresa">
                </asp:DropDownList>
                <br />
                                        <br />
                                        <br />
                            <asp:Image ID="ImageCAbec" runat="server" 
                                ImageUrl="~/images/empresa/titsitePublicaVagas.gif" />
                                        <br />
                            <table cellpadding="0" cellspacing="0" id="tbPSQ">
                                <tr>
                                    <td valign="top">
                                        <asp:ImageButton ID="ImageButtonAvisoPSQ" runat="server" 
                                            ImageUrl="~/images/empresa/btiniPesquisaCargo.png" />
                                    </td>
                                    <td>
                            <asp:Label ID="LabelAviso" runat="server" 
                                
                                            
                                            Text="Antes de iniciar a publicação, será necessário pesquisar uma [Função] para a vaga. A pesquisa irá vincular todos Candidatos que possuem a mesma [Função] em seus Currículos e convidá-los através de e-mails a se candidatar a sua vaga."></asp:Label>
                                        <asp:LinkButton ID="LinkButtonPSQ" runat="server">Iniciar pesquisa agora</asp:LinkButton>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                                        <br />
                <br />
                <asp:Label ID="LabelPS1" runat="server" 
                    Text="Apresentações da empresa trabalhada" CssClass="titulo"></asp:Label>
                <br />
                <asp:GridView ID="GridViewAnuncioApr" runat="server" 
                    AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                    BorderWidth="1px" DataKeyNames="iddsempresa" 
                    DataSourceID="SqlApresentacaoEmpresas" GridLines="Horizontal" Width="100%" 
                    AllowPaging="True" PageSize="5">
                    <AlternatingRowStyle BackColor="#EFEFEF" BorderStyle="None" />
                    <Columns>
                        <asp:BoundField DataField="iddsempresa" HeaderText="iddsempresa" 
                            InsertVisible="False" ReadOnly="True" SortExpression="iddsempresa" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresaFilha" 
                            HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="tituloDesEmpresa" 
                            Text="Button" />
                        <asp:BoundField DataField="tituloDesEmpresa" HeaderText="Apresentação" 
                            SortExpression="tituloDesEmpresa" Visible="False" />
                        <asp:BoundField DataField="dsempresaVaga" HeaderText="dsempresaVaga" 
                            SortExpression="dsempresaVaga" Visible="False" />
                        <asp:BoundField DataField="msnCandidato" HeaderText="msnCandidato" 
                            SortExpression="msnCandidato" Visible="False" />
                        <asp:BoundField DataField="msnCandidatoFim" HeaderText="msnCandidatoFim" 
                            SortExpression="msnCandidatoFim" Visible="False" />
                        <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                            SortExpression="nmempresa" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="LabelAviso" runat="server" 
                            Text="Selecione uma empresa para listar as apresentações publicadas."></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:FormView ID="FormViewApresentaAnuncio" runat="server" 
                    DataKeyNames="iddsempresa" DataSourceID="SqlApresentacaoEmpresasFORM" 
                    Width="100%">
                    <EditItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS2" runat="server" CssClass="titulo" 
                            Text="Atuallizar Apresentação"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Esta Apresentação é da Empresa?" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DropDownListEmpresa" ErrorMessage="Informe a Empresa">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListEmpresa" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourceListaEmpresa" DataTextField="nmempresa" 
                            DataValueField="idCadastroEmpresa" ondatabound="DropDownListEmpresa_DataBound" 
                            SelectedValue='<%# Bind("idCadastroEmpresaFilha") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="titAprLabel" runat="server" Text="Título da Apresentação:" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="tituloDesEmpresaTextBox" ErrorMessage="Título é obrigatório">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("tituloDesEmpresa") %>' />
                        <br />
                        <asp:Label ID="AprLabel" runat="server" Text="Apresentação no anúncio:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="dsempresaVagaTextBox" 
                            ErrorMessage="Apresentação é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsempresaVagaTextBox" runat="server" CssClass="InputCad" 
                            Height="150px" Text='<%# Bind("dsempresaVaga") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprIniLabel" runat="server" 
                            Text="Mensagem ao Candidato que apresentar seu CV:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="msnCandidatoTextBox" 
                            ErrorMessage="Mensagem ao candidato é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidato") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprFimLabel" runat="server" 
                            Text="Mensagem ao Candidato não classificado no Processo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="msnCandidatoFimTextBox" 
                            ErrorMessage="Mensagem ao candidato não selecionado é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoFimTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidatoFim") %>' TextMode="MultiLine" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Atualizar os dados informados" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        <br />
                        <br />
                        <asp:Image ID="ImageLinha" runat="server" ImageUrl="~/images/linhaEmp.gif" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <br />
                        <asp:Label ID="LabelPS2" runat="server" CssClass="titulo" 
                            Text="Formulário para novas Apresentações"></asp:Label>
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Incluir uma nova Apresentação" />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS2" runat="server" CssClass="titulo" 
                            Text="Nova Apresentação"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Esta Apresentação é da Empresa?"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DropDownListEmpresa" ErrorMessage="Informe a Empresa">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListEmpresa" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourceListaEmpresa" DataTextField="nmempresa" 
                            DataValueField="idCadastroEmpresa" ondatabound="DropDownListEmpresa_DataBound" 
                            SelectedValue='<%# Bind("idCadastroEmpresaFilha") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="titAprLabel" runat="server" Text="Título da Apresentação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="tituloDesEmpresaTextBox" ErrorMessage="Título é obrigatório">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("tituloDesEmpresa") %>' />
                        <br />
                        <asp:Label ID="AprLabel" runat="server" Text="Apresentação no anúncio:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="dsempresaVagaTextBox" 
                            ErrorMessage="Apresentação é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsempresaVagaTextBox" runat="server" CssClass="InputCad" 
                            Height="150px" Text='<%# Bind("dsempresaVaga") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprIniLabel" runat="server" 
                            Text="Mensagem ao Candidato que apresentar seu CV:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="msnCandidatoTextBox" 
                            ErrorMessage="Mensagem ao candidato é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidato") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprFimLabel" runat="server" 
                            Text="Mensagem ao Candidato não classificado no Processo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="msnCandidatoFimTextBox" 
                            ErrorMessage="Mensagem ao candidato não selecionado é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoFimTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidatoFim") %>' TextMode="MultiLine" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar Apresentação" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        <br />
                        <br />
                        <asp:Image ID="ImageLinha" runat="server" ImageUrl="~/images/linhaEmp.gif" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS2" runat="server" CssClass="titulo" 
                            Text="Formulário para novas apresentações"></asp:Label>
                        <br />
                        <asp:Label ID="tituloDesEmpresaLabel" runat="server" Font-Bold="True" 
                            Text='<%# Bind("tituloDesEmpresa") %>' />
                        <br />
                        <asp:Label ID="dsempresaVagaLabel" runat="server" 
                            Text='<%# Bind("dsempresaVaga") %>' />
                        <br />
                        <br />
                        <asp:Label ID="msnCandidatoLabel" runat="server" ForeColor="#006600" 
                            Text='<%# Bind("msnCandidato") %>' />
                        <br />
                        <br />
                        <asp:Label ID="msnCandidatoFimLabel" runat="server" ForeColor="#CC3300" 
                            Text='<%# Bind("msnCandidatoFim") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Editar Apresentação" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            onclientclick="return confirm(&quot;Tenha certeza de que não existe nenhuma vaga utilizando esta apresentação antes de excluir&quot;)" 
                            Text="Excluir Apresentação" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Nova Apresentação" />
                        |
                        <asp:LinkButton ID="FecharGridView" runat="server" 
                            onclick="FecharGridView_Click">Fechar</asp:LinkButton>
                        <br />
                        <br />
                        <asp:Image ID="ImageLinha" runat="server" ImageUrl="~/images/linhaEmp.gif" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:Label ID="LabelPS3" runat="server" 
                    Text="Vagas da empresa trabalhada" CssClass="titulo"></asp:Label>
                <br />
                <asp:GridView ID="GridViewVagasPublicadas" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                    BorderWidth="1px" DataKeyNames="idVaga" 
                    DataSourceID="SqlDataSourceVagaPublicada" GridLines="Horizontal" PageSize="5" 
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" InsertVisible="False" 
                            ReadOnly="True" SortExpression="idVaga" Visible="False" />
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                            HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                            Visible="False" />
                        <asp:BoundField DataField="iddsAnuncioEmpresa" HeaderText="iddsAnuncioEmpresa" 
                            SortExpression="iddsAnuncioEmpresa" Visible="False" />
                        <asp:BoundField DataField="idNivelHierarquico" HeaderText="idNivelHierarquico" 
                            SortExpression="idNivelHierarquico" Visible="False" />
                        <asp:BoundField DataField="idPerfilVaga" HeaderText="idPerfilVaga" 
                            SortExpression="idPerfilVaga" Visible="False" />
                        <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                            SortExpression="idRH_Gestor" Visible="False" />
                        <asp:BoundField DataField="idRH_Consultor" HeaderText="idRH_Consultor" 
                            SortExpression="idRH_Consultor" Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="codvaga" 
                            HeaderText="Código/Protocolo" Text="Button" />
                        <asp:BoundField DataField="codvaga" HeaderText="Código/Protocolo" 
                            SortExpression="codvaga" Visible="False" />
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                            SortExpression="idfuncao" Visible="False" />
                        <asp:BoundField DataField="dsfuncao" HeaderText="Cargo" 
                            SortExpression="dsfuncao" />
                        <asp:BoundField DataField="data_ini" HeaderText="Inicio" 
                            SortExpression="data_ini" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="data_fim" HeaderText="Encerramento" 
                            SortExpression="data_fim" DataFormatString="{0:d}" />
                        <asp:CheckBoxField DataField="liberarEmail" HeaderText="liberarEmail" 
                            SortExpression="liberarEmail" Visible="False" />
                        <asp:BoundField DataField="xmlAnuncio" HeaderText="xmlAnuncio" 
                            SortExpression="xmlAnuncio" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="publicar" 
                            SortExpression="publicar" Visible="False" />
                        <asp:CheckBoxField DataField="aviso" HeaderText="aviso" SortExpression="aviso" 
                            Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="LabelAviso" runat="server" 
                            Text="Selecione uma empresa para listar as vagas publicadas."></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:FormView ID="FormViewVaga" runat="server" DataKeyNames="idVaga" 
                    DataSourceID="SqlDataSourceVagaPublicadaForm" Visible="False" Width="100%">
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
                        <asp:DropDownList ID="DropDownListConsultor" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlConsultoresTodos" DataTextField="nome" 
                            DataValueField="idRH_Gestor" ondatabound="DropDownListConsultor_DataBound" 
                            SelectedValue='<%# Bind("idRH_Gestor") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Apresentação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ErrorMessage="Selecione uma Apresentação" 
                            ControlToValidate="DropDownListApresentacao">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListApresentacao" runat="server" 
                            CssClass="DropCad" DataSourceID="SqlApresentacaoEmpresas" 
                            DataTextField="tituloDesEmpresa" DataValueField="iddsempresa" 
                            ondatabound="DropDownListApresentacao_DataBound" 
                            SelectedValue='<%# Bind("iddsAnuncioEmpresa") %>'>
                        </asp:DropDownList>
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
                            Enabled="True" PopupButtonID="ImageButtonC1" TargetControlID="data_iniTextBox">
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
                            Enabled="True" PopupButtonID="ImageButtonC2" TargetControlID="data_fimTextBox">
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
                        &nbsp;| <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                            onclick="UpdateCancelButton_Click" />
                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                            ShowMessageBox="True" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <br />
                        <asp:Label ID="LabelPS3" runat="server" CssClass="titulo" 
                            Text="Incluir nova vaga"></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Incluir uma nova vaga" />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS3" runat="server" CssClass="titulo" 
                            Text="Formulário para Publicação de Vaga"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="ProtocoloLabel" runat="server" Text="Protocolo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ErrorMessage="Selecione um Protocolo" 
                            ControlToValidate="DropDownListProtocolo">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListProtocolo" runat="server" AutoPostBack="True" 
                            CssClass="DropCad" DataSourceID="SqlDataSourceProtocolo" 
                            DataTextField="Protocolo" DataValueField="idPerfilVaga" 
                            ondatabound="DropDownListProtocolo_DataBound" 
                            onselectedindexchanged="DropDownListProtocolo_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Informe o Consultor:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ErrorMessage="Selecione um Consultor" 
                            ControlToValidate="DropDownListConsultor">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListConsultor" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlConsultoresTodos" DataTextField="nome" 
                            DataValueField="idRH_Gestor" ondatabound="DropDownListConsultor_DataBound" 
                            SelectedValue='<%# Bind("idRH_Gestor") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Apresentação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ErrorMessage="Selecione uma Apresentação" 
                            ControlToValidate="DropDownListApresentacao">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListApresentacao" runat="server" 
                            CssClass="DropCad" DataSourceID="SqlApresentacaoEmpresas" 
                            DataTextField="tituloDesEmpresa" DataValueField="iddsempresa" 
                            SelectedValue='<%# Bind("iddsAnuncioEmpresa") %>' 
                            ondatabound="DropDownListApresentacao_DataBound">
                        </asp:DropDownList>
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
                        <asp:TextBox ID="codvagaTextBox" runat="server" Text='<%# Bind("codvaga") %>' 
                            CssClass="InputCad" />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Início da Publicação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ErrorMessage="Data de início é obrigatória" 
                            ControlToValidate="data_iniTextBox">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" 
                            Text='<%# Bind("data_ini") %>' CssClass="InputCad" Width="250px" />
                        <cc1:CalendarExtender ID="data_iniTextBox_CalendarExtender" runat="server" 
                            Enabled="True" PopupButtonID="ImageButtonC1" TargetControlID="data_iniTextBox">
                        </cc1:CalendarExtender>
&nbsp;<asp:ImageButton ID="ImageButtonC1" runat="server" 
                            ImageUrl="~/images/candidato/buttonCalendario.png" 
                            CausesValidation="False" />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Término da Publicação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ErrorMessage="Data de término é obrigatória" 
                            ControlToValidate="data_fimTextBox">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" 
                            Text='<%# Bind("data_fim") %>' CssClass="InputCad" Width="250px" />
                        <cc1:CalendarExtender ID="data_fimTextBox_CalendarExtender" runat="server" 
                            Enabled="True" PopupButtonID="ImageButtonC2" TargetControlID="data_fimTextBox">
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
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar dados da vaga" />
                        &nbsp;|
                        <asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                            ShowMessageBox="True" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS3" runat="server" CssClass="titulo" 
                            Text="Vaga selecionada"></asp:Label>
                        <br />
                        <asp:Label ID="ProtocoloLabel" runat="server" Font-Bold="True" 
                            Text='<%# Bind("Protocolo") %>' />
                        <br />
                        <br />
                        <asp:Label ID="CargoLabel" runat="server" Font-Bold="True" Text="Cargo:"></asp:Label>
&nbsp;<asp:Label ID="dsfuncaoLabel" runat="server" Text='<%# Bind("dsfuncao") %>' />
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
                <br />
                <asp:Image ID="ImageLinha" runat="server" ImageUrl="~/images/linhaEmp.gif" /><br />
                <table runat="server" id="psqFuncao" cellpadding="0" cellspacing="0" border="0" 
                    width="100%">
                    <tr>
                        <td>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table> 
                <asp:Panel ID="PanelPSQ" runat="server" BackColor="#E6F0F0" 
                    BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" Visible="False" 
                    Width="580px">
                    <table id="Aviso" cellpadding="5" cellspacing="5">
                        <tr>
                            <td>
                                <asp:Label ID="LabelDica" runat="server" 
                                    Text="Informe o cargo que o Levantamento do Perfil da Vaga está recrutando, em seguida clique no botão &quot;Buscar por um Cargo&quot;. Será apresentado uma lista de cargos que mais se aproxima com o informado. Para fechar o campo de pesquisa clique no botão [X] ao lado."></asp:Label>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/images/close.png" />
                            </td>
                        </tr>
                    </table>
                    <table ID="PSQ" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TextBoxPsq" Display="Dynamic" 
                                    ErrorMessage="* Inicie sua pesquisa com no mínimo 15 caracteres" 
                                    ValidationGroup="PSQ">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                    ControlToValidate="TextBoxPsq" Display="Dynamic" 
                                    ErrorMessage="* Inicie sua pesquisa com no mínimo 15 caracteres" 
                                    SetFocusOnError="True" 
                                    ValidationExpression="^[a-zA-Z0-9!¡$%&amp;/\()=?¿*+-_{};:,áéíóú'.\s][^&gt;][^&lt;]{15,50}$" 
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
                <cc1:DragPanelExtender ID="PanelPSQ_DragPanelExtender" runat="server" 
                    DragHandleID="PanelPSQ" Enabled="True" TargetControlID="PanelPSQ">
                </cc1:DragPanelExtender>
                <br />                   
                <table id="CabecInc" cellpadding="0" cellspacing="0" runat="server" 
                    visible="True" style="width: 100%">
                    <tr>
                        <td align="center">
                            <asp:GridView ID="GridViewPsqCargo" runat="server" AutoGenerateColumns="False" 
                                BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" 
                                DataKeyNames="idfuncao,dsfuncao" DataSourceID="SqlDataSourcePesquisa" 
                                Width="100%">
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
                            </asp:GridView>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="PSQ" />
                            <asp:SqlDataSource ID="SqlDataSourcePesquisa" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                SelectCommand="spPesquisaCadastraFuncao" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBoxPsq" Name="buscador" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                &nbsp;<br />
                <asp:SqlDataSource ID="SqlApresentacaoEmpresas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_APRESENTACAO_ANUNCIO_VAGA" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                            Name="idCadastroEmpresaFilha" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlApresentacaoEmpresasFORM" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbDescEmpresa_Vaga] WHERE [iddsempresa] = @iddsempresa" 
                    InsertCommand="INSERT INTO [tbDescEmpresa_Vaga] ([idCadastroEmpresa], [idCadastroEmpresaFilha], [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim]) VALUES (@idCadastroEmpresa, @idCadastroEmpresaFilha, @tituloDesEmpresa, @dsempresaVaga, @msnCandidato, @msnCandidatoFim)" 
                    SelectCommand="SELECT [iddsempresa], [idCadastroEmpresa], [idCadastroEmpresaFilha], [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim] FROM [tbDescEmpresa_Vaga] WHERE ([iddsempresa] = @iddsempresa)" 
                    UpdateCommand="UPDATE [tbDescEmpresa_Vaga] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresaFilha] = @idCadastroEmpresaFilha, [tituloDesEmpresa] = @tituloDesEmpresa, [dsempresaVaga] = @dsempresaVaga, [msnCandidato] = @msnCandidato, [msnCandidatoFim] = @msnCandidatoFim WHERE [iddsempresa] = @iddsempresa">
                    <DeleteParameters>
                        <asp:Parameter Name="iddsempresa" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
                        <asp:Parameter Name="tituloDesEmpresa" Type="String" />
                        <asp:Parameter Name="dsempresaVaga" Type="String" />
                        <asp:Parameter Name="msnCandidato" Type="String" />
                        <asp:Parameter Name="msnCandidatoFim" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="iddsempresaLabel" Name="iddsempresa" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
                        <asp:Parameter Name="tituloDesEmpresa" Type="String" />
                        <asp:Parameter Name="dsempresaVaga" Type="String" />
                        <asp:Parameter Name="msnCandidato" Type="String" />
                        <asp:Parameter Name="msnCandidatoFim" Type="String" />
                        <asp:Parameter Name="iddsempresa" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceListaEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [nmempresa], [idCadastroEmpresa_Pai], [idCadastroEmpresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
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
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [idCadastroEmpresa_Pai] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEstruturaOrganizacional" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idNivelHierarquico], [dsNivelHierarquico] FROM [tbNivelHierarquico]">
                </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSourceProtocolo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                            SelectCommand="SELECT [Protocolo], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [perfil_vaga_aprovado_comentario], [idPerfilVaga] FROM [_tbPerfilVaga] WHERE (([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha) AND ([perfil_vaga_aprovado] = @perfil_vaga_aprovado))">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                                    Type="Int32" />
                                                <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                                                    Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
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
                <br />
            </td> 
        </tr>
    </table> 
    <br />
    <br />
    <br />
    <br />
    </asp:Content>

