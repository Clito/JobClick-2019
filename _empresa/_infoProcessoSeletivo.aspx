<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_infoProcessoSeletivo.aspx.vb" Inherits="_empresa_infoProcessoSeletivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:Label ID="idRH_GestorLabel" runat="server" Text="0" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <asp:GridView ID="GridViewPS" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                        DataKeyNames="idProcessoSeletivo" DataSourceID="SqlDataPS" 
                        GridLines="Horizontal" Width="100%" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idProcessoSeletivo" 
                                Visible="False" />
                            <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                Visible="False" />
                            <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                SortExpression="idRH_Gestor" Visible="False" />
                            <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                SortExpression="idSetup" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo" />
                            <asp:BoundField DataField="dsProcesso" HeaderText="Processo" 
                                SortExpression="dsProcesso" />
                            <asp:BoundField DataField="dataCriacao" HeaderText="Criação" 
                                SortExpression="dataCriacao" />
                            <asp:BoundField DataField="dsfuncao" HeaderText="dsfuncao" 
                                SortExpression="dsfuncao" Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataPS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_PROCESSOSELETIVO" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

