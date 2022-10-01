<%@ Page Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_admin_Default" title="Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Ini" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <br />
                <asp:Label ID="SetupLabel" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewEMPRESA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSetup" Width="100%" CssClass="Grid" DataKeyNames="idCadastroEmpresa,idUser,idCadastroUser,idTypeUser" AllowPaging="True" AllowSorting="True" PageSize="20">
                    <Columns>
                        <asp:ButtonField CommandName="Select" DataTextField="nmempresa" HeaderText="Empresa" Text="Button" />
                        <asp:BoundField DataField="nmempresa" HeaderText="Empresa" ReadOnly="True" SortExpression="nmempresa" Visible="False" />
                        <asp:BoundField DataField="idsetup" HeaderText="S" ReadOnly="True" SortExpression="idsetup" NullDisplayText="-" />
                        <asp:BoundField DataField="idUser" HeaderText="U" ReadOnly="True" SortExpression="idUser" NullDisplayText="-" />
                        <asp:BoundField DataField="idCadastroUser" HeaderText="C" ReadOnly="True" SortExpression="idCadastroUser" NullDisplayText="-" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="E" NullDisplayText="-" SortExpression="idCadastroEmpresa" />
                        <asp:BoundField DataField="idTypeUser" HeaderText="Tipo" SortExpression="idTypeUser" />
                        <asp:BoundField DataField="password" HeaderText="PWD" SortExpression="password" />
                        <asp:BoundField DataField="email" HeaderText="E" SortExpression="email" />
                        <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="dataultimoacess" DataFormatString="{0:d}" HeaderText="UA" SortExpression="dataultimoacess" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:Label ID="UsuariosOnlineLabel" runat="server"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlSetup" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_AD_STATUS_EMPRESA" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idUser" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idTypeUser" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

