<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_relatorio.aspx.vb" Inherits="_empresa_relatorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False">0</asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                <table id="DropDownTable" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <asp:Label ID="Passo1Label" runat="server" CssClass="tituloEmp" 
                                Text="Passo 1 (um) - Selecionar uma Vaga:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListSelectEmpresa" runat="server" 
                                CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                                DataValueField="idCadastroEmpresa" ValidationGroup="SelectEmpresa" 
                                AutoPostBack="True">
                            </asp:DropDownList></td>
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
                    </td>
            </tr>
        </table>
                    <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
        <asp:RadioButtonList ID="RadioButtonListConsultor" runat="server" 
            AutoPostBack="True" DataSourceID="SqlListaConsultor" DataTextField="nome" 
            DataValueField="idRH_Gestor" RepeatColumns="2" RepeatDirection="Horizontal" 
            Width="100%">
        </asp:RadioButtonList>
                    <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
        <br /><br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="idFaseProcessoSeletivoCV" DataSourceID="SqlRelatorioGeral" 
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo" />
                            <asp:BoundField DataField="idFaseProcessoSeletivoCV" 
                                HeaderText="idFaseProcessoSeletivoCV" InsertVisible="False" ReadOnly="True" 
                                SortExpression="idFaseProcessoSeletivoCV" Visible="False" />
                            <asp:BoundField DataField="idFaseProcessoSeletivo" 
                                HeaderText="idFaseProcessoSeletivo" SortExpression="idFaseProcessoSeletivo" 
                                Visible="False" />
                            <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                SortExpression="idcurriculo" Visible="False" />
                            <asp:BoundField DataField="flgAprovado" HeaderText="flgAprovado" 
                                SortExpression="flgAprovado" Visible="False" />
                            <asp:BoundField DataField="dataIni" DataFormatString="{0:d}" 
                                HeaderText="Início" SortExpression="dataIni" />
                            <asp:BoundField DataField="dataFim" DataFormatString="{0:d}" 
                                HeaderText="Encerramento" SortExpression="dataFim" />
                            <asp:BoundField DataField="encerrado" HeaderText="encerrado" 
                                SortExpression="encerrado" Visible="False" />
                            <asp:BoundField DataField="iniciado" HeaderText="iniciado" 
                                SortExpression="iniciado" Visible="False" />
                            <asp:BoundField DataField="dataCriacao" DataFormatString="{0:d}" 
                                HeaderText="Criado em:" SortExpression="dataCriacao" />
                            <asp:BoundField DataField="dsProcesso" HeaderText="Processo" 
                                SortExpression="dsProcesso" Visible="False" />
                            <asp:BoundField DataField="dsfuncao" HeaderText="Cargo" 
                                SortExpression="dsfuncao" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                Visible="False" />
                            <asp:BoundField DataField="cnt" HeaderText="Visualizações da vaga" 
                                SortExpression="cnt" />
                        </Columns>
                    </asp:GridView>
        <br />
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRelatorioGeral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_RELATORIO_PS_EMPRESA" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                    Type="Int32" />
                <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                    SessionField="IdCadastroEmpresaFilha" Type="Int32" />
                <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
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
                <asp:SqlDataSource ID="SqlListaConsultor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_LISTA_CONSULTOR" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
                </asp:Content>

