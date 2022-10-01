<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="clientes.aspx.vb" Inherits="_admin_clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Candidatos"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <asp:GridView ID="GridViewEmpresa" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idsetup,idCadastroEmpresa,empresa" 
        DataSourceID="SqlEMPRESA" GridLines="Horizontal" Width="100%" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" 
                ReadOnly="True" SortExpression="idsetup" Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="empresa" 
                HeaderText="Empresa" Text="Button" />
            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                SortExpression="empresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:GridView ID="GridViewCANDIDATOS" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="SqlPESQUISACANDIDATO" Width="100%">
        <Columns>
            <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" ReadOnly="True" SortExpression="idUser" Visible="False" />
            <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" SortExpression="idTypeUser" Visible="False" />
            <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" Visible="False" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="frase" HeaderText="frase" SortExpression="frase" Visible="False" />
            <asp:CheckBoxField DataField="bloquear" HeaderText="bloquear" SortExpression="bloquear" Visible="False" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
            <asp:BoundField DataField="cpf" HeaderText="cpf" SortExpression="cpf" Visible="False" />
            <asp:BoundField DataField="cnpj" HeaderText="cnpj" SortExpression="cnpj" Visible="False" />
            <asp:BoundField DataField="sendMail" HeaderText="sendMail" SortExpression="sendMail" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa_baseTalento" HeaderText="idCadastroEmpresa_baseTalento" SortExpression="idCadastroEmpresa_baseTalento" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa_Associacao" HeaderText="idCadastroEmpresa_Associacao" SortExpression="idCadastroEmpresa_Associacao" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlPESQUISACANDIDATO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_ADMIN_CANDIDATO_ASSOCIACAO" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

