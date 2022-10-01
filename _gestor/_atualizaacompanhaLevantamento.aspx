<%@ Page Title="" Language="VB" MasterPageFile="corporativoPage.master" AutoEventWireup="false" CodeFile="_atualizaacompanhaLevantamento.aspx.vb" Inherits="_gestor_atualizaacompanhaLevantamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewLevantamento" runat="server" 
                        AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                        BorderWidth="1px" DataKeyNames="idPerfilVaga,Protocolo,perfil_vaga_aprovado" 
                        DataSourceID="SqlLevantamentoStatus" Width="100%">
                        <Columns>
                            <asp:ButtonField ButtonType="Image" CommandName="Select" 
                                ImageUrl="~/images/candidato/bvcv.png" Text="Button">
                            <ItemStyle Width="28px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                Visible="False" />
                            <asp:BoundField DataField="idPerfilVaga" HeaderText="idPerfilVaga" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idPerfilVaga" 
                                Visible="False" />
                            <asp:BoundField DataField="perfil_vaga_aprovado" 
                                HeaderText="perfil_vaga_aprovado" SortExpression="perfil_vaga_aprovado" 
                                Visible="False" />
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo">
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                            <asp:BoundField DataField="idstatusvaga" HeaderText="Status" 
                                SortExpression="idstatusvaga" />
                            <asp:BoundField DataField="perfil_vaga_aprovado_comentario" 
                                HeaderText="Comentário" SortExpression="perfil_vaga_aprovado_comentario" 
                                Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlLevantamentoStatus" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_EMPRESA_LEVANTAMENTO_PERFIL_VAGA_STATUS" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                                SessionField="idCadastroEmpresa_Filha" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

