<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="excluirUser.aspx.vb" Inherits="_admin_excluirUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" Text="Pesquisa e exclusão de usuários da base de dados"></asp:Label>
    <asp:Label ID="PESQUISALabel" runat="server" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="TextBoxPESQUISA" runat="server" CssClass="InputCadFormCandidatoCV"></asp:TextBox>
    <br />
    <br />
    <asp:LinkButton ID="LinkButtonPESQUISAR" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridViewRESULTADO" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="SqlDataSourceRESULTADOPESQUISA" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="ID" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select" OnClientClick="return confirm(&quot;Você está certo de que deseja excluir este usuário?&quot;)" Text='<%# Eval("idUser") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="idUser" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idUser" Visible="False" />
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
            <asp:BoundField DataField="password" HeaderText="Senha" SortExpression="password" />
            <asp:BoundField DataField="userName" HeaderText="User Name" SortExpression="userName" />
            <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
            <asp:BoundField DataField="nmempresa" HeaderText="Empresa" ReadOnly="True" SortExpression="nmempresa" />
            <asp:BoundField DataField="cnpj" HeaderText="CNPJ" ReadOnly="True" SortExpression="cnpj" />
            <asp:BoundField DataField="idcurriculo" HeaderText="Curriculo" ReadOnly="True" SortExpression="idcurriculo" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSourceRESULTADOPESQUISA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PESQUISA_USUARIO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxPESQUISA" Name="nome" PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="0" Name="excluir" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

