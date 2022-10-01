<%@ Page Language="VB" MasterPageFile="~/DefaultPage.master" AutoEventWireup="false" CodeFile="Default_CheckOut.aspx.vb" Inherits="_empresa_Default" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
        DataKeyNames="idRH_Gestor" DataSourceID="SqlDataSource1" GridLines="None" Width="544px" HorizontalAlign="Left">
        <Columns>
            <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" InsertVisible="False"
                ReadOnly="True" SortExpression="idRH_Gestor" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa"
                Visible="False" />
            <asp:BoundField DataField="idRH" HeaderText="idRH" SortExpression="idRH" Visible="False" />
            <asp:BoundField DataField="nome" HeaderText="Usu&#225;rio" SortExpression="nome" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password"
                Visible="False" />
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
            <asp:CheckBoxField DataField="bloquear" HeaderText="Acesso" SortExpression="bloquear"
                Visible="False" />
            <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
        <AlternatingRowStyle CssClass="DGBGnot" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Text="Bem-Vindo ao sistema de Gestão RH."></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" 
                    Text="Você já está autenticado no sistema. Para iniciar seus trabalhos clique no link [Iniciar o Processo Seletivo (Gestão RH)]. Esta página será redirecionada a uma área segura do sistema JobClick que irá solicitar novamente a sua senha de acesso."></asp:Label>
                <br />
                <br />
    Esta é uma medida de segurança.<br />
    Obrigado pela compreensão.</td>
        </tr>
    </table>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server">Iniciar o Processo Seletivo 
    (Gestão RH)</asp:HyperLink>
    |
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/logout.aspx">Encerrar sessão</asp:HyperLink><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idRH_Gestor], [idCadastroEmpresa], [idRH], [nome], [password], [email], [bloquear], [data] FROM [tbRH_Gestor] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

