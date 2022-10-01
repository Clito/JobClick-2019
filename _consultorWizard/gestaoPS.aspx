<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="gestaoPS.aspx.vb" Inherits="_empresa_fasePS" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>
<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" 
        ImageUrl="~/images/layout/e_processo_gestao_p.gif" />
<table width="720" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="694">
                <asp:Panel ID="PanelTriagem" runat="server">
                    <asp:Label ID="LabelPS0" runat="server" CssClass="titulo" 
                        Text="Observe se a empresa está selecionada"></asp:Label>
                    <br />
                    <table ID="ApresentaPSFases" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" valign="top" width="50%">
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
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </asp:Panel>
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
                <br />
            </td>
        </tr>
</table>
</asp:Content>

