<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cargaInicial.aspx.vb" Inherits="_admin_cargaInicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Carga completa para as novas empresas"></asp:Label>
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <asp:Label ID="AvisoLabel" runat="server"></asp:Label>
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="LabelEmpresa" runat="server" 
        Text="Empresas que possuem carga" CssClass="titulo"></asp:Label>
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
    <asp:Label ID="Label1" runat="server" CssClass="titulo" 
        Text="Empresas que não possuem carga completa no sistema"></asp:Label>
    <br />
    <asp:GridView ID="GridViewEmpresaSetup" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlTODASEMPRESAS" AllowPaging="True" 
        DataKeyNames="idCadastroEmpresa_CE" Width="100%">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" 
                        onclientclick="return confirm(&quot;Deseja aplicar a carga completa para esta empresa?&quot;)" 
                        Text="Carga"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="80px" />
            </asp:TemplateField>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" 
                ReadOnly="True" SortExpression="idsetup" Visible="False" />
            <asp:BoundField DataField="empresa" HeaderText="empresa" 
                SortExpression="empresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
            <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                SortExpression="nmempresa" />
            <asp:BoundField DataField="idCadastroEmpresa_CE" 
                HeaderText="idCadastroEmpresa_CE" InsertVisible="False" ReadOnly="True" 
                SortExpression="idCadastroEmpresa_CE" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa_Pai" 
                HeaderText="idCadastroEmpresa_Pai" SortExpression="idCadastroEmpresa_Pai" 
                Visible="False" />
            <asp:BoundField DataField="painelParceiro" HeaderText="painelParceiro" 
                SortExpression="painelParceiro" Visible="False" />
            <asp:BoundField DataField="liberaQtdCad" HeaderText="liberaQtdCad" 
                SortExpression="liberaQtdCad" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTODASEMPRESAS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT     dbo.tbsetup.idsetup, dbo.tbsetup.empresa, dbo.tbsetup.idCadastroEmpresa, dbo.tbCadastroEmpresa.nmempresa, 
                      dbo.tbCadastroEmpresa.idCadastroEmpresa AS idCadastroEmpresa_CE, dbo.tbCadastroEmpresa.idCadastroEmpresa_Pai, dbo.tbCadastroEmpresa.painelParceiro, 
                      dbo.tbCadastroEmpresa.liberaQtdCad
FROM         dbo.tbsetup RIGHT OUTER JOIN
                      dbo.tbCadastroEmpresa ON dbo.tbsetup.idCadastroEmpresa = dbo.tbCadastroEmpresa.idCadastroEmpresa
WHERE     (dbo.tbsetup.idsetup IS NULL) AND (dbo.tbCadastroEmpresa.idCadastroEmpresa_Pai IS NULL)">
    </asp:SqlDataSource>
</asp:Content>

