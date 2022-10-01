<%@ Page Language="VB" MasterPageFile="~/_empresaJC/EmpresaPage.master" AutoEventWireup="false" CodeFile="vaga.aspx.vb" Inherits="_empresa__vaga_Default" title=":. Sistema JobClick .:" %>

<%@ Register Src="~/App_Include/personalizarV.ascx" TagName="personalizarV" TagPrefix="uc2" %>
<%@ Register Src="~/App_Include/idiomaV.ascx" TagName="idiomaV" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_vagas.gif" /><br />
    <table runat="server" id="VagaAdm" width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="614">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="iddsempresa" DataSourceID="SqlDataSource3"
                    GridLines="None" Width="614px">
                    <Columns>
                        <asp:BoundField DataField="iddsempresa" HeaderText="iddsempresa" InsertVisible="False"
                            ReadOnly="True" SortExpression="iddsempresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa"
                            Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="iddsempresa" DataNavigateUrlFormatString="vaga.aspx?iddsempresa={0}"
                            DataTextField="tituloDesEmpresa" 
                            HeaderText="Informa&#231;&#245;es referentes &#224; empresa (ser&#225; utilizado nos an&#250;ncios)" />
                        <asp:BoundField DataField="tituloDesEmpresa" HeaderText="Apresenta&#231;&#227;o geral da empresa (ser&#225; utilizado nos an&#250;ncios)"
                            SortExpression="tituloDesEmpresa" Visible="False" />
                        <asp:BoundField DataField="dsempresaVaga" HeaderText="dsempresaVaga" SortExpression="dsempresaVaga"
                            Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="lblApr" runat="server" CssClass="tituloEmp" Text="Apresentação geral da empresa."></asp:Label><br />
                        Esta apresentação será utililzada em todos os anúncios publicados por sua empresa.<br />
                        Você também poderá criar mais que uma apresentação, uma para cada vaga se assim
                        for necessário.&nbsp;
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="iddsempresa" DataSourceID="SqlDataSource4"
                    DefaultMode="Edit" Width="614px">
                    <EditItemTemplate>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'
                            Visible="False" Width="16px"></asp:TextBox><br />
                        Escreva um título para sua apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="tituloDesEmpresaTextBox" Display="Dynamic"
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("tituloDesEmpresa") %>'></asp:TextBox><br />
                        Informações referentes à empresa:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="dsempresaVagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsempresaVagaTextBox" runat="server" CssClass="InputCadEmp" Height="120px"
                            Text='<%# Bind("dsempresaVaga") %>' TextMode="MultiLine" OnDataBinding="dsempresaVagaTextBox_DataBinding"></asp:TextBox><br />
                        Mensagem para quem se candidatar à estas vagas:<asp:RequiredFieldValidator ID="RequiredFieldValidator18"
                            runat="server" ControlToValidate="TBmsnCandidato" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="TBmsnCandidato" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("msnCandidato") %>' TextMode="MultiLine" OnDataBinding="TBmsnCandidato_DataBinding"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar Apresentação" ValidationGroup="FormView2"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer excluir esta apresentação?")' Text="Excluir Apresentação"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            OnClick="GoBack" Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Crie uma apresentação para sua empresa"></asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'
                            Visible="False" Width="1px"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataIdCadEmp" DataTextField="idCadastroEmpresa" DataValueField="idCadastroEmpresa"
                                SelectedValue='<%# Bind("idCadastroEmpresa") %>' Visible="False">
                            </asp:DropDownList><br />
                        Escreva um título para sua apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="tituloDesEmpresaTextBox" Display="Dynamic"
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("tituloDesEmpresa") %>'></asp:TextBox><br />
                        Informações referentes à empresa:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="dsempresaVagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsempresaVagaTextBox" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("dsempresaVaga") %>' TextMode="MultiLine"></asp:TextBox><br />
                        Mensagem para quem se candidatar à estas vagas:<asp:RequiredFieldValidator ID="RequiredFieldValidator18"
                            runat="server" ControlToValidate="TBmsnCandidato" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="TBmsnCandidato" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("msnCandidato") %>' TextMode="MultiLine"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar Apresentação" ValidationGroup="FormView2"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            OnClick="GoBack" Text="Cancelar"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        iddsempresa:
                        <asp:Label ID="iddsempresaLabel" runat="server" Text='<%# Eval("iddsempresa") %>'></asp:Label><br />
                        idCadastroEmpresa:
                        <asp:Label ID="idCadastroEmpresaLabel" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'></asp:Label><br />
                        tituloDesEmpresa:
                        <asp:Label ID="tituloDesEmpresaLabel" runat="server" Text='<%# Bind("tituloDesEmpresa") %>'></asp:Label><br />
                        dsempresaVaga:
                        <asp:Label ID="dsempresaVagaLabel" runat="server" Text='<%# Bind("dsempresaVaga") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/linhaEmp.gif" /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idVaga"
                    DataSourceID="SqlDataSource1" Width="614px" BorderStyle="None" GridLines="None" CellPadding="0" AllowSorting="True" TabIndex="10">
                    <Columns>
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa"
                            Visible="False" />
                        <asp:BoundField DataField="codvaga" HeaderText="C&#243;digo" SortExpression="codvaga" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="idCadastroEmpresa,idVaga" DataNavigateUrlFormatString="vaga.aspx?idCadastroEmpresa={0}&amp;idVaga={1}"
                            DataTextField="codvaga" HeaderText="C&#243;digo" />
                        <asp:BoundField DataField="dsfuncao" HeaderText="Cargo" SortExpression="dsfuncao" />
                        <asp:BoundField DataField="nrovaga" HeaderText="Nr" SortExpression="nrovaga" />
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" SortExpression="idfuncao"
                            Visible="False" />
                        <asp:TemplateField HeaderText="In&#237;cio" SortExpression="data_ini" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("data_ini") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("data_ini", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="T&#233;rmino" SortExpression="data_fim">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("data_fim") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("data_fim", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nropedido" HeaderText="nropedido" SortExpression="nropedido"
                            Visible="False" />
                        <asp:BoundField DataField="nmresponsavel" HeaderText="nmresponsavel" SortExpression="nmresponsavel"
                            Visible="False" />
                        <asp:BoundField DataField="centrodecusto" HeaderText="centrodecusto" SortExpression="centrodecusto"
                            Visible="False" />
                        <asp:BoundField DataField="dsvaga" HeaderText="dsvaga" SortExpression="dsvaga" Visible="False" />
                        <asp:BoundField DataField="idstatusvaga" HeaderText="idstatusvaga" SortExpression="idstatusvaga"
                            Visible="False" />
                        <asp:BoundField DataField="iddsempresa" HeaderText="iddsempresa" SortExpression="iddsempresa"
                            Visible="False" />
                        <asp:BoundField DataField="nome" HeaderText="Gestor" SortExpression="nome" />
                        <asp:TemplateField HeaderText="P" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandName="Select"
                                    ImageUrl="~/images/ckPublica_off.gif" Text="Publicar" TabIndex="2" ToolTip="Publicar vaga" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="publicar" SortExpression="publicar" />
                        <asp:BoundField DataField="idVaga" InsertVisible="False" ReadOnly="True"
                            SortExpression="idVaga" />
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        <asp:Label ID="lblPvagas" runat="server" CssClass="tituloEmp" Text="Publicação de vagas"></asp:Label><br />
                        Para iniciar crie uma apresentação geral de sua empresa (link acima), depois será necessário fazer uma pesquisa em nossa base de dados informando
                        o (Cargo) da vaga.
                        <br />
                        <b>Obs.:</b><br />
                        Você pode utilizar parte do nome de uma função, para que a pesquisa retorne as várias
                        funções cadastradas em nosso banco de dados.<br />
                        Pode ser que a função não esteja cadastrada em nosso banco de dados, pedimos para
                        enviar um formulário informando a função desejada que iremos incluir em nosso sistema.<br />
                        <b>Obrigado.</b>&nbsp;
                    </EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                <table runat="server" id="psqFuncao" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <br />
                            <asp:Image ID="Image3" runat="server" 
                                ImageUrl="~/images/titsitePublicaVagas.gif" />
                            <br />
                            <br />
                            Para incluir uma vaga será necessário pesquisar a função ou cargo da vaga...<br />
                            Pesquise os cargos aqui. (função/cargo)&nbsp;<br />
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" CssClass="InputCadEmp"
                    MaxLength="255" Width="256px" CausesValidation="True" TabIndex="1"></asp:TextBox><asp:Image ID="Image2" runat="server" ImageUrl="~/images/5px.gif" /></td>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/layout/btpesquisar.gif" TabIndex="1" /></td>
                                </tr>
                            </table>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox1"
                                Display="Dynamic" ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"
                                SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9!¡$%&/\()=?¿*+-_{};:,áéíóú'.\s][^>][^<]{3,50}$"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                                    ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"></asp:RequiredFieldValidator><br />
                            <br />
                            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderStyle="None" DataKeyNames="idfuncao" DataSourceID="SqlDataSourcePsq" GridLines="None"
                    Width="614px" ShowHeader="False" CellPadding="0">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="idfuncao" DataNavigateUrlFormatString="teste.aspx?idfuncao={0}"
                            DataTextField="dsfuncao" Visible="False" />
                        <asp:BoundField DataField="dsfuncao" ReadOnly="True" SortExpression="dsfuncao" />
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" InsertVisible="False"
                            SortExpression="idfuncao" Visible="False" />
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/selectRow.gif" SelectText=""
                            ShowSelectButton="True">
                            <ItemStyle Width="40px" />
                        </asp:CommandField>
                    </Columns>
                    <AlternatingRowStyle BackColor="Azure" />
                    <HeaderStyle HorizontalAlign="Left" />
                                <PagerSettings Position="Top" />
                </asp:GridView>
                <asp:Label ID="resTxt" runat="server" CssClass="msn" Visible="False"></asp:Label><asp:SqlDataSource ID="SqlDataSourcePsq" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="spGetFunction" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="buscador" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        </td>
                    </tr>
                </table> 
                <br />                   
                <table id="CabecInc" cellpadding="0" cellspacing="0" runat="server" visible="false" style="width: 100%">
                    <tr>
                        <td style="width: 100%; height: 15px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DropDownList6"
                                Display="Dynamic" ErrorMessage="É necessário criar uma apresentação!<br>Veja em [Crie uma apresentação para sua empresa] acima... "
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                <asp:Label ID="Label1" runat="server" Text="Função (Cargo):" Visible="False"></asp:Label><br />
                <asp:DropDownList ID="IdFuncaoDropDown" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSearchFuncao"
                    DataTextField="dsfuncao" DataValueField="dsfuncao" Visible="False">
                </asp:DropDownList><br />
                <asp:Label ID="Label2" runat="server" Text="Status da vaga:" Visible="False"></asp:Label><br />
                <asp:DropDownList ID="DropDownList5" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataStatusVaga"
                    DataTextField="idstatusvaga" DataValueField="idstatusvaga" Visible="False">
                </asp:DropDownList><br />
                <asp:Label ID="Label3" runat="server" Text="Informações referentes à empresa: (Selecione)" Visible="False"></asp:Label><br />
                <asp:DropDownList ID="DropDownList6" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataDesEmp"
                    DataTextField="tituloDesEmpresa" DataValueField="iddsempresa" Visible="False">
                </asp:DropDownList><br />
                            Nível hierárquico:<br />
                            <asp:DropDownList ID="DDownNivelHierarquico" runat="server" CssClass="DropCadEmp"
                                DataSourceID="SqlDataNivelHierarquico" DataTextField="dsNivelHierarquico" DataValueField="idNivelHierarquico" Visible="False">
                            </asp:DropDownList><br />
                            Tipo de oportunidade:<br />
                            <asp:DropDownList ID="DDownTipoOportunidade" runat="server" CssClass="DropCadEmp"
                                DataSourceID="SqlDataTipoOportunidade" DataTextField="idTipoOportunidade" DataValueField="idTipoOportunidade" Visible="False">
                            </asp:DropDownList><br />
                            Formação Acadêmica:
                            <br />
                            <asp:DropDownList ID="DDownTipoFormacao" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataTipoFormacao"
                                DataTextField="dsTipoFormacao" DataValueField="idTipoFormacao" Visible="False">
                            </asp:DropDownList><br />
                            Atribuição: (Consultor responsável pela vaga)<asp:RangeValidator ID="RangeValidator1"
                                runat="server" ControlToValidate="DDownListConsultor" Display="Dynamic" ErrorMessage=" * Obrigatório"
                                MaximumValue="99999999999" MinimumValue="1" SetFocusOnError="True"></asp:RangeValidator><br />
                            <asp:DropDownList ID="DDownListConsultor" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataConsultor"
                                DataTextField="nome" DataValueField="idRH_Gestor" Visible="False">
                            </asp:DropDownList><br />
                        </td>
                    </tr>
                </table>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idVaga" DataSourceID="SqlDataSource2"
                    DefaultMode="Edit">
                    <EditItemTemplate>
                        <uc1:idiomaV ID="IdiomaV1" runat="server" IdiomaV='<%# Bind("idVaga") %>' />
                        <br />
                        <uc2:personalizarV ID="PersonalizarV1" runat="server" personalizarV='<%# Bind("idVaga") %>' />
                        <br />
                        <br />
                        Status da vaga:
                        <asp:TextBox ID="idstatusvagaTextBox" runat="server" Text='<%# Bind("idstatusvaga") %>' Visible="False" Width="1px"></asp:TextBox>
                        <asp:TextBox ID="idfuncaoTextBox" runat="server" Text='<%# Bind("idfuncao") %>' Visible="False" Width="8px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataIdCadEmp"
                            DataTextField="idCadastroEmpresa" DataValueField="idCadastroEmpresa" SelectedValue='<%# Bind("idCadastroEmpresa") %>'
                            Visible="False">
                        </asp:DropDownList>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="8px"></asp:TextBox>
                        <asp:TextBox ID="idvagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' 
                            Visible="False" Width="50px"></asp:TextBox>
                        <asp:Label ID="lblidRH_Gestor" runat="server" Text='<%# Eval("idRH_Gestor") %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataStatusVaga"
                            DataTextField="idstatusvaga" DataValueField="idstatusvaga" SelectedValue='<%# Bind("idstatusvaga") %>'>
                        </asp:DropDownList><br />
                        Informações referentes à empresa:
                        <asp:TextBox ID="iddsempresaTextBox" runat="server" Text='<%# Bind("iddsempresa") %>' Visible="False" Width="1px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataDesEmp"
                            DataTextField="tituloDesEmpresa" DataValueField="iddsempresa" SelectedValue='<%# Bind("iddsempresa") %>'>
                        </asp:DropDownList><br />
                        Nível hierárquico:<br />
                        <asp:DropDownList ID="DDownNivelHierarquico" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataNivelHierarquico"
                            DataTextField="dsNivelHierarquico" DataValueField="idNivelHierarquico" SelectedValue='<%# Bind("idNivelHierarquico") %>'>
                        </asp:DropDownList><br />
                        Tipo de oportunidade:<br />
                        <asp:DropDownList ID="DDownTipoOportunidade" runat="server" CssClass="DropCadEmp"
                            DataSourceID="SqlDataTipoOportunidade" DataTextField="idTipoOportunidade" DataValueField="idTipoOportunidade"
                            SelectedValue='<%# Bind("TipoOportunidade") %>'>
                        </asp:DropDownList><br />
                        Formação Acadêmica:
                        <br />
                        <asp:DropDownList ID="DDownTipoFormacao" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataTipoFormacao"
                            DataTextField="dsTipoFormacao" DataValueField="idTipoFormacao" SelectedValue='<%# Bind("idTipoFormacao") %>'>
                        </asp:DropDownList><br />
                        Atribuição: (Consultor responsável pela vaga)<asp:RangeValidator ID="RangeValidator1"
                            runat="server" ControlToValidate="DDownListConsultor" Display="Dynamic" ErrorMessage=" * Obrigatório"
                            MaximumValue="99999999999" MinimumValue="1" SetFocusOnError="True"></asp:RangeValidator><br />
                        <asp:DropDownList ID="DDownListConsultor" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataConsultor"
                            DataTextField="nome" DataValueField="idRH_Gestor"
                            SelectedValue='<%# Bind("idRH_Gestor") %>' ondatabinding="SetConsultor">
                        </asp:DropDownList><br />
                        Código da vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="codvagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="codvagaTextBox" runat="server" Text='<%# Bind("codvaga") %>' CssClass="InputCadEmp" Enabled="False"></asp:TextBox><br />
                        Função:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dsfuncaoTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsfuncaoTextBox" runat="server" Text='<%# Bind("dsfuncao") %>' CssClass="InputCadEmp" Enabled="False"></asp:TextBox><br />
                        Data do início do processo:<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ControlToValidate="data_iniTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="data_iniTextBox"
                            Display="Dynamic" ErrorMessage="* Formato [dd/M/yyyy]" SetFocusOnError="True"
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
<%--                        <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" TargetControlID="data_iniTextBox">
                        </cc1:CalendarExtender>--%>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("data_ini", "{0:d}") %>'></asp:TextBox><br />
                        Data para o término do processo:<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                            runat="server" ControlToValidate="data_fimTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                            Display="Dynamic" ErrorMessage="* Formato [dd/M/yyyy]" SetFocusOnError="True"
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
<%--                        <cc1:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/M/yyyy" TargetControlID="data_fimTextBox">
                        </cc1:CalendarExtender>--%>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" Text='<%# Bind("data_fim", "{0:d}") %>' CssClass="InputCadEmp"></asp:TextBox><br />
                        Número de vagas:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            ControlToValidate="nrovagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="nrovagaTextBox"
                                ErrorMessage="* A vaga não pode ser [0]." SetFocusOnError="True" ValidationExpression="[1-9][0-9]?"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="nrovagaTextBox" runat="server" Text='<%# Bind("nrovaga") %>' CssClass="InputCadEmp"></asp:TextBox><br />
                        Número da solicitação [0 se não existir]:<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                            runat="server" ControlToValidate="nropedidoTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="nropedidoTextBox" runat="server" Text='<%# Bind("nropedido") %>' CssClass="InputCadEmp"></asp:TextBox><br />
                        Departamento:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ControlToValidate="dsdepartamentoTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsdepartamentoTextBox" runat="server" Text='<%# Bind("dsdepartamento") %>' CssClass="InputCadEmp"></asp:TextBox><br />
                        Requisitante da vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="nmresponsavelTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="nmresponsavelTextBox" runat="server" Text='<%# Bind("nmresponsavel") %>' CssClass="InputCadEmp"></asp:TextBox><br />
                        Depto. do requisitante / centro de custo: [0] se não existir<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="centrodecustoTextBox" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="centrodecustoTextBox" runat="server" Text='<%# Bind("centrodecusto") %>' CssClass="InputCadEmp" MaxLength="50"></asp:TextBox><br />
                        Descrição da oportunidade (Vaga):<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                            ControlToValidate="dsvagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsvagaTextBox" runat="server" Text='<%# Bind("dsvaga") %>' CssClass="InputCadEmp" Height="100px" TextMode="MultiLine" OnDataBinding="dsvagaTextBox_DataBinding"></asp:TextBox><br />
                        Competências e habilidades desejadas:<br />
                        <asp:TextBox ID="TBhabilidades" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("Habilidades") %>' TextMode="MultiLine" OnDataBinding="TBhabilidades_DataBinding"></asp:TextBox><br />
                        Qualificações e conhecimentos desejados:<br />
                        <asp:TextBox ID="TBQualificacoes" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("Qualificacoes") %>' TextMode="MultiLine" OnDataBinding="TBQualificacoes_DataBinding"></asp:TextBox><br />
                        Remuneração: (Vazio para [Combinar])<asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                            runat="server" ControlToValidate="TBRemuneracao" Display="Dynamic" ErrorMessage="* Formato 99.999,99"
                            SetFocusOnError="True" ValidationExpression="^\$?([0-9]{1,3}.([0-9]{3}.)*[0-9]{3}|[0-9]+)(,[0-9][0-9])?$"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="TBRemuneracao" runat="server" CssClass="InputCadEmp" Text='<%# Bind("Remuneracao", "{0:N}") %>'></asp:TextBox><br />
                        Local de trabalho:<br />
                        <asp:TextBox ID="TBLocalTrabalho" runat="server" CssClass="InputCadEmp" MaxLength="50"
                            Text='<%# Bind("LocalTrabalho") %>'></asp:TextBox><br />
                        Observações complementares:<br />
                        <asp:TextBox ID="TBObsComplementares" runat="server" CssClass="InputCadEmp" Height="100px"
                            MaxLength="4000" TextMode="MultiLine" Text='<%# Bind("ObsComplementares") %>' OnDataBinding="TBObsComplementares_DataBinding"></asp:TextBox><br />
                        Benefícios: (Vaga)<br />
                        <asp:TextBox ID="TBBeneficios" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("Beneficios") %>' TextMode="MultiLine" OnDataBinding="TBBeneficios_DataBinding"></asp:TextBox><br />
                        <br />
                        <asp:CheckBox ID="CKBliberarEmail" runat="server" Checked='<%# Bind("liberarEmail") %>'
                            Text="Permitir envio de e-mails para solucionar dúvidas." /><br />
                        <br />
                        <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" /><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar esta vaga"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer excluir esta vaga?\nVocê perderá todos os currículos vinculados à esta vaga.")'
                            Text="Excluir esta vaga"></asp:LinkButton>&nbsp; |
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" OnClick="CancInc"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Data do início do processo:<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ControlToValidate="data_iniTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="data_iniTextBox"
                            Display="Dynamic" ErrorMessage="* Formato [dd/M/yyyy]" SetFocusOnError="True"
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="codvagaTextBox" runat="server" Text='<%# Bind("codvaga") %>' CssClass="InputCadEmp" Enabled="False" Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>' Width="8px" Visible="False"></asp:TextBox><asp:TextBox ID="idfuncaoTextBox" runat="server" Text='<%# Bind("idfuncao") %>' Width="1px" Visible="False"></asp:TextBox><asp:TextBox ID="dsfuncaoTextBox" runat="server" Text='<%# Bind("dsfuncao") %>' Width="8px" Visible="False"></asp:TextBox>
<%--                        <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" TargetControlID="data_iniTextBox">
                        </cc1:CalendarExtender>--%>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("data_ini", "{0:d}") %>'></asp:TextBox><br />
                        Data para o término do processo:<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                            runat="server" ControlToValidate="data_fimTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                            Display="Dynamic" ErrorMessage="* Formato [dd/M/yyyy]" SetFocusOnError="True"
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
<%--                        <cc1:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/M/yyyy" TargetControlID="data_fimTextBox">
                        </cc1:CalendarExtender>--%>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("data_fim", "{0:d}") %>'></asp:TextBox><br />
                        Número de vagas:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            ControlToValidate="nrovagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="nrovagaTextBox"
                                ErrorMessage="* A vaga não pode ser [0]." SetFocusOnError="True" ValidationExpression="[1-9][0-9]?"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="nrovagaTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("nrovaga") %>'></asp:TextBox><br />
                        Número da solicitação [0 se não existir]:<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                            runat="server" ControlToValidate="nropedidoTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="nropedidoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("nropedido") %>'></asp:TextBox><br />
                        Departamento:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ControlToValidate="dsdepartamentoTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsdepartamentoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("dsdepartamento") %>'></asp:TextBox><br />
                        Requisitante da vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="nmresponsavelTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="nmresponsavelTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("nmresponsavel") %>'></asp:TextBox><br />
                        Depto. do requisitante / centro de custo: [0] se não existir<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="centrodecustoTextBox" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="centrodecustoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("centrodecusto") %>' MaxLength="50"></asp:TextBox><br />
                        Descrição da oportunidade (Vaga):<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                            ControlToValidate="dsvagaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsvagaTextBox" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("dsvaga") %>' TextMode="MultiLine"></asp:TextBox><br />
                        Competências e habilidades desejadas:<br />
                        <asp:TextBox ID="TBhabilidades" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("Habilidades") %>' TextMode="MultiLine"></asp:TextBox><br />
                        Qualificações e conhecimentos desejados:<br />
                        <asp:TextBox ID="TBQualificacoes" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("Qualificacoes") %>' TextMode="MultiLine"></asp:TextBox><br />
                        Remuneração: (Vazio para [Combinar])<asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                            runat="server" ControlToValidate="TBRemuneracao" Display="Dynamic" ErrorMessage="* Formato 99.999,99"
                            SetFocusOnError="True" ValidationExpression="^\$?([0-9]{1,3}.([0-9]{3}.)*[0-9]{3}|[0-9]+)(,[0-9][0-9])?$"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="TBRemuneracao" runat="server" CssClass="InputCadEmp" Text='<%# Bind("Remuneracao", "{0:N}") %>'></asp:TextBox><br />
                        Local de trabalho:<br />
                        <asp:TextBox ID="TBLocalTrabalho" runat="server" CssClass="InputCadEmp" MaxLength="50"
                            Text='<%# Bind("LocalTrabalho") %>'></asp:TextBox><br />
                        Observações complementares:<br />
                        <asp:TextBox ID="TBObsComplementares" runat="server" CssClass="InputCadEmp" Height="100px"
                            MaxLength="4000" TextMode="MultiLine" Text='<%# Bind("ObsComplementares") %>'></asp:TextBox><br />
                        Benefícios: (Vaga)<br />
                        <asp:TextBox ID="TBBeneficios" runat="server" CssClass="InputCadEmp" Height="100px"
                            Text='<%# Bind("Beneficios") %>' TextMode="MultiLine"></asp:TextBox><br />
                        <br />
                        <asp:CheckBox ID="CKBliberarEmail" runat="server" Checked='<%# Bind("liberarEmail") %>'
                            Text="Permitir envio de e-mails para solucionar dúvidas." /><br />
                        <br />
                        <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" /><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar/Publicar vaga"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" OnClick="CancInc"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idVaga:
                        <asp:Label ID="idVagaLabel" runat="server" Text='<%# Eval("idVaga") %>'></asp:Label><br />
                        idCadastroEmpresa:
                        <asp:Label ID="idCadastroEmpresaLabel" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'></asp:Label><br />
                        codvaga:
                        <asp:Label ID="codvagaLabel" runat="server" Text='<%# Bind("codvaga") %>'></asp:Label><br />
                        idfuncao:
                        <asp:Label ID="idfuncaoLabel" runat="server" Text='<%# Bind("idfuncao") %>'></asp:Label><br />
                        dsfuncao:
                        <asp:Label ID="dsfuncaoLabel" runat="server" Text='<%# Bind("dsfuncao") %>'></asp:Label><br />
                        data_ini:
                        <asp:Label ID="data_iniLabel" runat="server" Text='<%# Bind("data_ini") %>'></asp:Label><br />
                        data_fim:
                        <asp:Label ID="data_fimLabel" runat="server" Text='<%# Bind("data_fim") %>'></asp:Label><br />
                        nrovaga:
                        <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Bind("nrovaga") %>'></asp:Label><br />
                        nropedido:
                        <asp:Label ID="nropedidoLabel" runat="server" Text='<%# Bind("nropedido") %>'></asp:Label><br />
                        dsdepartamento:
                        <asp:Label ID="dsdepartamentoLabel" runat="server" Text='<%# Bind("dsdepartamento") %>'></asp:Label><br />
                        nmresponsavel:
                        <asp:Label ID="nmresponsavelLabel" runat="server" Text='<%# Bind("nmresponsavel") %>'></asp:Label><br />
                        centrodecusto:
                        <asp:Label ID="centrodecustoLabel" runat="server" Text='<%# Bind("centrodecusto") %>'></asp:Label><br />
                        dsvaga:
                        <asp:Label ID="dsvagaLabel" runat="server" Text='<%# Bind("dsvaga") %>'></asp:Label><br />
                        idstatusvaga:
                        <asp:Label ID="idstatusvagaLabel" runat="server" Text='<%# Bind("idstatusvaga") %>'></asp:Label><br />
                        iddsempresa:
                        <asp:Label ID="iddsempresaLabel" runat="server" Text='<%# Bind("iddsempresa") %>'></asp:Label><br />
                        publicar:
                        <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>'
                            Enabled="false" /><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        &nbsp;
                    </EmptyDataTemplate>
                </asp:FormView>
                &nbsp;<br />
                &nbsp;
            </td> 
        </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT tbVaga.idVaga, tbVaga.idCadastroEmpresa, tbVaga.codvaga, tbVaga.idfuncao, tbVaga.data_ini, tbVaga.data_fim, tbVaga.nrovaga, tbVaga.nropedido, tbVaga.dsdepartamento, tbVaga.nmresponsavel, tbVaga.centrodecusto, tbVaga.dsvaga, tbVaga.idstatusvaga, tbVaga.iddsempresa, tbVaga.publicar, tbVaga.idRH_Gestor, tbRH_Gestor.nome, tbVaga.dsfuncao FROM tbVaga INNER JOIN tbRH_Gestor ON tbVaga.idRH_Gestor = tbRH_Gestor.idRH_Gestor WHERE (tbVaga.idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbVaga] WHERE [idVaga] = @idVaga" 
        InsertCommand="INSERT INTO tbVaga(idCadastroEmpresa, codvaga, idfuncao, dsfuncao, data_ini, data_fim, nrovaga, nropedido, dsdepartamento, nmresponsavel, centrodecusto, dsvaga, idstatusvaga, iddsempresa, publicar, idRH_Gestor, idTipoFormacao, TipoOportunidade, Habilidades, Qualificacoes, Remuneracao, LocalTrabalho, ObsComplementares, Beneficios, liberarEmail, idNivelHierarquico) VALUES (@idCadastroEmpresa, @codvaga, @idfuncao, @dsfuncao, @data_ini, @data_fim, @nrovaga, @nropedido, @dsdepartamento, @nmresponsavel, @centrodecusto, @dsvaga, @idstatusvaga, @iddsempresa, @publicar, @idRH_Gestor, @idTipoFormacao, @TipoOportunidade, @Habilidades, @Qualificacoes, @Remuneracao, @LocalTrabalho, @ObsComplementares, @Beneficios, @liberarEmail, @idNivelHierarquico)"
        SelectCommand="SELECT idVaga, idCadastroEmpresa, codvaga, idfuncao, dsfuncao, data_ini, data_fim, nrovaga, nropedido, dsdepartamento, nmresponsavel, centrodecusto, dsvaga, idstatusvaga, iddsempresa, publicar, idRH_Gestor, idTipoFormacao, TipoOportunidade, Habilidades, Qualificacoes, Remuneracao, LocalTrabalho, ObsComplementares, Beneficios, liberarEmail, idNivelHierarquico FROM tbVaga WHERE (idVaga = @idVaga) AND (idCadastroEmpresa = @idCadastroEmpresa)"
        UpdateCommand="UPDATE tbVaga SET idCadastroEmpresa = @idCadastroEmpresa, codvaga = @codvaga, idfuncao = @idfuncao, dsfuncao = @dsfuncao, data_ini = @data_ini, data_fim = @data_fim, nrovaga = @nrovaga, nropedido = @nropedido, dsdepartamento = @dsdepartamento, nmresponsavel = @nmresponsavel, centrodecusto = @centrodecusto, dsvaga = @dsvaga, idstatusvaga = @idstatusvaga, iddsempresa = @iddsempresa, publicar = @publicar, idRH_Gestor = @idRH_Gestor, idTipoFormacao = @idTipoFormacao, TipoOportunidade = @TipoOportunidade, Habilidades = @Habilidades, Qualificacoes = @Qualificacoes, Remuneracao = @Remuneracao, LocalTrabalho = @LocalTrabalho, ObsComplementares = @ObsComplementares, Beneficios = @Beneficios, liberarEmail = @liberarEmail, idNivelHierarquico = @idNivelHierarquico WHERE (idVaga = @idVaga)">
        <DeleteParameters>
            <asp:Parameter Name="idVaga" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="codvaga" Type="String" />
            <asp:Parameter Name="idfuncao" Type="Int32" />
            <asp:Parameter Name="dsfuncao" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="nrovaga" Type="Int32" />
            <asp:Parameter Name="nropedido" Type="String" />
            <asp:Parameter Name="dsdepartamento" Type="String" />
            <asp:Parameter Name="nmresponsavel" Type="String" />
            <asp:Parameter Name="centrodecusto" Type="String" />
            <asp:Parameter Name="dsvaga" Type="String" />
            <asp:Parameter Name="idstatusvaga" Type="String" />
            <asp:Parameter Name="iddsempresa" Type="Int32" />
            <asp:Parameter Name="publicar" Type="Boolean" />
            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
            <asp:Parameter Name="idTipoFormacao" Type="Int32" />
            <asp:Parameter Name="TipoOportunidade" Type="String" />
            <asp:Parameter Name="Habilidades" Type="String" />
            <asp:Parameter Name="Qualificacoes" Type="String" />
            <asp:Parameter Name="Remuneracao" Type="Double" />
            <asp:Parameter Name="LocalTrabalho" Type="String" />
            <asp:Parameter Name="ObsComplementares" Type="String" />
            <asp:Parameter Name="Beneficios" Type="String" />
            <asp:Parameter Name="liberarEmail" Type="Boolean" />
            <asp:Parameter Name="idNivelHierarquico" Type="Int32" />
            <asp:Parameter Name="idVaga" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idVaga" QueryStringField="idVaga"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="codvaga" Type="String" />
            <asp:Parameter Name="idfuncao" Type="Int32" />
            <asp:Parameter Name="dsfuncao" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="nrovaga" Type="Int32" />
            <asp:Parameter Name="nropedido" Type="String" />
            <asp:Parameter Name="dsdepartamento" Type="String" />
            <asp:Parameter Name="nmresponsavel" Type="String" />
            <asp:Parameter Name="centrodecusto" Type="String" />
            <asp:Parameter Name="dsvaga" Type="String" />
            <asp:Parameter Name="idstatusvaga" Type="String" />
            <asp:Parameter Name="iddsempresa" Type="Int32" />
            <asp:Parameter Name="publicar" Type="Boolean" />
            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
            <asp:Parameter Name="idTipoFormacao" Type="Int32" />
            <asp:Parameter Name="TipoOportunidade" Type="String" />
            <asp:Parameter Name="Habilidades" Type="String" />
            <asp:Parameter Name="Qualificacoes" Type="String" />
            <asp:Parameter Name="Remuneracao" Type="Double" />
            <asp:Parameter Name="LocalTrabalho" Type="String" />
            <asp:Parameter Name="ObsComplementares" Type="String" />
            <asp:Parameter Name="Beneficios" Type="String" />
            <asp:Parameter Name="liberarEmail" Type="Boolean" />
            <asp:Parameter Name="idNivelHierarquico" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [iddsempresa], [idCadastroEmpresa], [tituloDesEmpresa], [dsempresaVaga] FROM [tbDescEmpresa_Vaga] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbDescEmpresa_Vaga] WHERE [iddsempresa] = @iddsempresa"
        InsertCommand="INSERT INTO tbDescEmpresa_Vaga(idCadastroEmpresa, tituloDesEmpresa, dsempresaVaga, msnCandidato) VALUES (@idCadastroEmpresa, @tituloDesEmpresa, @dsempresaVaga, @msnCandidato)"
        SelectCommand="SELECT iddsempresa, idCadastroEmpresa, tituloDesEmpresa, dsempresaVaga, msnCandidato FROM tbDescEmpresa_Vaga WHERE (iddsempresa = @iddsempresa)"
        UpdateCommand="UPDATE tbDescEmpresa_Vaga SET idCadastroEmpresa = @idCadastroEmpresa, tituloDesEmpresa = @tituloDesEmpresa, dsempresaVaga = @dsempresaVaga, msnCandidato = @msnCandidato WHERE (iddsempresa = @iddsempresa)">
        <DeleteParameters>
            <asp:Parameter Name="iddsempresa" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="tituloDesEmpresa" Type="String" />
            <asp:Parameter Name="dsempresaVaga" Type="String" />
            <asp:Parameter Name="msnCandidato" />
            <asp:Parameter Name="iddsempresa" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="iddsempresa" QueryStringField="iddsempresa"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="tituloDesEmpresa" Type="String" />
            <asp:Parameter Name="dsempresaVaga" Type="String" />
            <asp:Parameter Name="msnCandidato" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSearchFuncao" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT DISTINCT [idfuncao], [dsfuncao] FROM [tbFuncao] WHERE ([idfuncao] = @idfuncao)">
        <SelectParameters>
            <asp:ControlParameter ControlID="resTxt" Name="idfuncao" PropertyName="Text" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataIdCadEmp" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idCadastroEmpresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataDesEmp" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [iddsempresa], [tituloDesEmpresa], [idCadastroEmpresa] FROM [tbDescEmpresa_Vaga] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataStatusVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idstatusvaga] FROM [tbStatusVaga]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataNivelHierarquico" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idNivelHierarquico], [dsNivelHierarquico] FROM [tbNivelHierarquico]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTipoOportunidade" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoOportunidade] FROM [tbTipoOportunidade]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTipoFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataConsultor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idRH_Gestor], [nome] FROM [tbRH_Gestor] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataVaga_Consultor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT tbVaga.idVaga, tbVaga.idCadastroEmpresa, tbVaga.codvaga, tbVaga.idfuncao, tbVaga.data_ini, tbVaga.data_fim, tbVaga.nrovaga, tbVaga.nropedido, tbVaga.dsdepartamento, tbVaga.nmresponsavel, tbVaga.centrodecusto, tbVaga.dsvaga, tbVaga.idstatusvaga, tbVaga.iddsempresa, tbVaga.publicar, tbVaga.idRH_Gestor, tbVaga.dsfuncao, tbRH_Gestor.nome FROM tbVaga INNER JOIN tbRH_Gestor ON tbVaga.idRH_Gestor = tbRH_Gestor.idRH_Gestor WHERE (tbVaga.idCadastroEmpresa = @idCadastroEmpresa) AND (tbVaga.idRH_Gestor = @idRH_Gestor)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="idRH_Gestor" SessionField="idRH_Gestor" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataConsultor_Consultor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idRH_Gestor], [nome] FROM [tbRH_Gestor] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa) AND (idRH_Gestor = @idRH_Gestor)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="idRH_Gestor" SessionField="idRH_Gestor" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:ScriptManager id="ScriptManager1" runat="server" EnableScriptGlobalization="True">
    </asp:ScriptManager>
</asp:Content>

