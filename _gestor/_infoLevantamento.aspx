<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_infoLevantamento.aspx.vb" Inherits="_empresa_infoLevantamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelCabec0" runat="server" 
                        Text="* Levantamentos aprovados e em execução." Font-Italic="True"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:GridView ID="GridViewLevantamentoAtivo" runat="server" 
                        AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                        BorderWidth="1px" DataSourceID="SqlLevantamentosAtivos" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo">
                            <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dsProcesso" HeaderText="Vaga" 
                                SortExpression="dsProcesso" Visible="False" />
                            <asp:BoundField DataField="dsfuncao" HeaderText="Vaga" 
                                SortExpression="dsfuncao" />
                            <asp:BoundField DataField="cnt" HeaderText="CNT" SortExpression="cnt" />
                            <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idProcessoSeletivo" 
                                Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" 
                                Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                Visible="False" />
                            <asp:BoundField DataField="idPerfilVaga" HeaderText="idPerfilVaga" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idPerfilVaga" 
                                Visible="False" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="SqlLevantamentosAtivos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_EMPRESA_LEVANTAMENTO_PERFIL_VAGA_ATIVA" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresaFilha" 
                    SessionField="idCadastroEmpresaFilha" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Content>

