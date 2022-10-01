<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="filtroPS.aspx.vb" Inherits="_empresa_filtroPS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" 
        ImageUrl="~/images/empresa/titFiltroPS.gif" />
<table width="720" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="694">
                    <asp:Label ID="LabelPS0" runat="server" CssClass="titulo" 
                        Text="Observe se a empresa está selecionada"></asp:Label>
                    <br />
                    <table ID="ApresentaPSFases" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" valign="top" width="50%">
                                <asp:Label ID="Passo1Label" runat="server" CssClass="tituloEmp" 
                                    Text="Passo 1 (um) - Selecionar uma Vaga:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="DropDownListSelectEmpresa" runat="server" 
                                    AutoPostBack="True" CssClass="DropCad" DataSourceID="SqlEmpresa" 
                                    DataTextField="nmempresa" DataValueField="idCadastroEmpresa" 
                                    ValidationGroup="SelectEmpresa" Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td align="center" width="50%">
                                <asp:GridView ID="GridViewVAGA" runat="server" AllowPaging="True" 
                                    AutoGenerateColumns="False" BorderStyle="None" 
                                    DataKeyNames="idProcessoSeletivo,idVaga,idRH_Gestor" DataSourceID="SqlVaga" 
                                    GridLines="None" PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                            ReadOnly="True" SortExpression="ID" Visible="False" />
                                        <asp:TemplateField HeaderText="Protocolo (Vaga)" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text='<%# Eval("Protocolo") %>' 
                                                    ToolTip='<%# Eval("dsCargo") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo (Vaga)" 
                                            SortExpression="Protocolo" Visible="False" />
                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                            SortExpression="idRH_Gestor" Visible="False" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <table ID="tbFiltros" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td width="100%">
                                <asp:Label ID="idFiltroDinamicoMontadorLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:GridView ID="GridViewFiltro" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="Gray" BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idFiltroDinamicoMontador" DataSourceID="SqlMontaFiltroPesquisa" 
                                    GridLines="Horizontal" Width="100%">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="Editar Filtro"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="idFiltroDinamicoXML_Liberado" 
                                            HeaderText="idFiltroDinamicoXML_Liberado" InsertVisible="False" ReadOnly="True" 
                                            SortExpression="idFiltroDinamicoXML_Liberado" Visible="False" />
                                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                            SortExpression="idSetup" Visible="False" />
                                        <asp:BoundField DataField="dsFiltroDinamico" HeaderText="Filtro" 
                                            SortExpression="dsFiltroDinamico" />
                                        <asp:BoundField DataField="refTabela" HeaderText="refTabela" 
                                            SortExpression="refTabela" Visible="False" />
                                        <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" 
                                            SortExpression="dataPublicacao" Visible="False" />
                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                        <asp:BoundField DataField="field" HeaderText="field" SortExpression="field" 
                                            Visible="False" />
                                        <asp:BoundField DataField="value" HeaderText="O que será filtrado" 
                                            SortExpression="value" />
                                    </Columns>
                                </asp:GridView>
                                <table id="GravaXML" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="right">
                                            <asp:LinkButton ID="LinkButtonXML" runat="server">Gravar e Rodar esta configuração de filtro</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <asp:Label ID="Passo1Label0" runat="server" CssClass="tituloEmp" 
                                    Text="Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:" Visible="False"></asp:Label>
                                <asp:FormView ID="FormViewFiltro" runat="server" 
                                    DataKeyNames="idFiltroDinamicoMontador" DataSourceID="SqlFiltro" 
                                    Visible="False" Width="100%">
                                    <EditItemTemplate>
                                        <table ID="FormInc0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="Escola um dos filtro dinâmico:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="O que pesquisar?"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="valueTextBox" ErrorMessage="* Informe o que pesquisar">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" 
                                                        DataSourceID="SqlFiltrosLiberados" DataTextField="dsFiltroDinamico" 
                                                        DataValueField="refTabela" SelectedValue='<%# Bind("field") %>' Width="300px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="valueTextBox" runat="server" CssClass="InputCad" 
                                                        Text='<%# Bind("value") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="idProcessoSeletivoTextBox" runat="server" 
                                            Text='<%# Bind("idProcessoSeletivo") %>' Visible="False" Width="5px" />
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Salvar" />
                                        &nbsp;|&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="Incluir novo Filtro para esta pesquisa" />
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <table ID="FormInc" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="Escola um dos filtro dinâmico:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="O que pesquisar?"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="valueTextBox" ErrorMessage="* Informe o que pesquisar">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" 
                                                        DataSourceID="SqlFiltrosLiberados" DataTextField="dsFiltroDinamico" 
                                                        DataValueField="refTabela" SelectedValue='<%# Bind("field") %>' Width="300px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="valueTextBox" runat="server" CssClass="InputCad" 
                                                        Text='<%# Bind("value") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="idProcessoSeletivoTextBox" runat="server" 
                                            Text='<%# Bind("idProcessoSeletivo") %>' Visible="False" Width="5px" />
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Salvar (Incluir Filtro)" />
                                        &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="Selecionado para edição:"></asp:Label>
                                        <br />
                                        <asp:Label ID="valueLabel" runat="server" CssClass="msnOK" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <br />
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Editar Filtro" />
                                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" 
                                            onclientclick="return confirm(&quot;Quer excluir este filtro?&quot;)" 
                                            Text="Excluir Filtro" />
                                        &nbsp;
                                    </ItemTemplate>
                                </asp:FormView>
                                <br />
                                <table id="IncluirFiltro" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left">
                                            <asp:GridView ID="GridViewResPesquisa" runat="server" BorderColor="#CCCCCC" 
                                                BorderStyle="Dotted" BorderWidth="1px" GridLines="Horizontal" 
                                                ShowHeader="False" Width="100%">
                                                <AlternatingRowStyle BackColor="#EBEBEB" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idTipoFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="fieldLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlPlanejamento" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PROCESSOSELETIVO_TAREFAS_FASES" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                            Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlPSVisaoGeral" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PROCESSOSELETIVO_FASES_EXECUTANDO" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                            Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" 
                            PropertyName="Text" Type="Int32" />
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
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlApresentaSelecaoProcesso" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idTipoFaseProcessoSeletivo], [idSetup], [dsFase] FROM [tbTipoFaseProcessoSeletivo] WHERE ([idTipoFaseProcessoSeletivo] = @idTipoFaseProcessoSeletivo)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idTipoFaseProcessoSeletivoLabel" 
                            Name="idTipoFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlMontaFiltroPesquisa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PROCESSOSELETIVO_FILTROS_MONTADOS" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlFiltrosLiberados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idFiltroDinamicoXML_Liberado], [idSetup], [dsFiltroDinamico], [refTabela], [dataPublicacao] FROM [tbFiltroDinamicoXML_Liberado] WHERE ([idSetup] = @idSetup)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlFiltro" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        DeleteCommand="DELETE FROM [tbFiltroDinamicoXMLMontador] WHERE [idFiltroDinamicoMontador] = @idFiltroDinamicoMontador" 
                        InsertCommand="INSERT INTO [tbFiltroDinamicoXMLMontador] ([idProcessoSeletivo], [field], [value]) VALUES (@idProcessoSeletivo, @field, @value)" 
                        SelectCommand="SELECT [idFiltroDinamicoMontador], [idProcessoSeletivo], [field], [value] FROM [tbFiltroDinamicoXMLMontador] WHERE ([idFiltroDinamicoMontador] = @idFiltroDinamicoMontador)" 
                        UpdateCommand="UPDATE [tbFiltroDinamicoXMLMontador] SET [idProcessoSeletivo] = @idProcessoSeletivo, [field] = @field, [value] = @value WHERE [idFiltroDinamicoMontador] = @idFiltroDinamicoMontador">
                        <DeleteParameters>
                            <asp:Parameter Name="idFiltroDinamicoMontador" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
                            <asp:Parameter Name="field" Type="String" />
                            <asp:Parameter Name="value" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idFiltroDinamicoMontadorLabel" 
                                Name="idFiltroDinamicoMontador" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
                            <asp:Parameter Name="field" Type="String" />
                            <asp:Parameter Name="value" Type="String" />
                            <asp:Parameter Name="idFiltroDinamicoMontador" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                <br />
            </td>
        </tr>
</table>
</asp:Content>

