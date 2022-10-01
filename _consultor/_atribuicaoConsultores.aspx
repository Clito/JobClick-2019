<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_atribuicaoConsultores.aspx.vb" Inherits="_consultor_atribuicaoConsultores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="690" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="664"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="690" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="664">
                    <br />
                    <asp:GridView ID="GridViewAtr" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" DataKeyNames="ID" DataSourceID="SqlAtribuicao" 
                        GridLines="Horizontal" Width="100%" Font-Names="Tahoma" Font-Size="7pt">
                        <AlternatingRowStyle BackColor="#F2F2F2" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                Visible="False" />
                            <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" 
                                SortExpression="idTypeUser" Visible="False" />
                            <asp:BoundField DataField="nome" HeaderText="Consultor" SortExpression="nome" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:TemplateField HeaderText="Protocolo" SortExpression="Protocolo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Protocolo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLinkProtocolo" runat="server" 
                                        NavigateUrl='<%# Eval("URLRedirect") %>' Text='<%# Eval("Protocolo") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                            <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                SortExpression="idRH_Gestor" Visible="False" />
                            <asp:BoundField DataField="VISUALIDO" HeaderText="V" 
                                SortExpression="VISUALIDO" />
                            <asp:TemplateField HeaderText="P" SortExpression="PUBLICADO" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PUBLICADO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelP" runat="server" Text='<%# Bind("PUBLICADO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CANDIDATURAS" HeaderText="CE" 
                                SortExpression="CANDIDATURAS" />
                            <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                                SortExpression="nmempresa" />
                            <asp:TemplateField HeaderText="CORTEXTO" SortExpression="CORTEXTO" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CORTEXTO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelCORTEXTO" runat="server" Text='<%# Bind("CORTEXTO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:Label ID="LabelLegenda" runat="server" Font-Names="Tahoma" 
                        Text="&lt;b&gt;V&lt;/b&gt;: - Visualizações da vaga pelo JOBCLICK | &lt;b&gt;CE&lt;/b&gt;: - Candidaturas Espontâneas vindas do JOBCLICK"></asp:Label>
                    <br />
    <asp:SqlDataSource ID="SqlAtribuicao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_ATRIBUICAO_CONSULTORES" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Content>

