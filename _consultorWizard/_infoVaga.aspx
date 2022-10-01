<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_infoVaga.aspx.vb" Inherits="_empresa_infoVaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                        DataKeyNames="idVaga" DataSourceID="SqlListaVaga" GridLines="Horizontal" 
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="idVaga" HeaderText="idVaga" InsertVisible="False" 
                                ReadOnly="True" SortExpression="idVaga" Visible="False" />
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo" />
                            <asp:BoundField DataField="codvaga" HeaderText="Código" 
                                SortExpression="codvaga" Visible="False" />
                            <asp:BoundField DataField="dsfuncao" HeaderText="Função" 
                                SortExpression="dsfuncao" />
                            <asp:BoundField DataField="data_ini" DataFormatString="{0:d}" 
                                HeaderText="Inicio" SortExpression="data_ini" Visible="False" />
                            <asp:BoundField DataField="data_fim" DataFormatString="{0:d}" 
                                HeaderText="Final" SortExpression="data_fim" Visible="False" />
                            <asp:CheckBoxField DataField="publicar" HeaderText="Publicado" 
                                SortExpression="publicar" Visible="False" />
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="LabelAviso" runat="server" 
                                Text="Não existem vagas para este Cliente."></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlListaVaga" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idVaga], [Protocolo], [codvaga], [dsfuncao], [data_ini], [data_fim], [publicar] FROM [_tbVaga] WHERE (([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha))">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                Type="Int32" />
                            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                                SessionField="idCadastroEmpresaFilha" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

