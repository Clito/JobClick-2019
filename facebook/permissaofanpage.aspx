<%@ Page Title="" Language="VB" AutoEventWireup="false" CodeFile="permissaofanpage.aspx.vb" Inherits="facebook_permissaofanpage" MasterPageFile="~/_candidato/MasterPageVazia.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="/js/jquery.ddslick.min.js"></script>
    <script src="permissaofanpage.aspx.js" type="text/javascript"></script>
    <asp:Label ID="Label_idClient" runat="server" CssClass="Label_idClient" 
    Visible="False"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SQLEmpresa">
        <ItemTemplate>
            Liberação de Postagem para empresa:
            <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' />
            <br />
<br />
        </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SQLEmpresa" runat="server" 
    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
    SelectCommand="SELECT [nmempresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label_idClient" Name="idCadastroEmpresa" 
            PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
    <asp:TextBox ID="TextBox_UserAccessToken_ShortLive" runat="server" 
    CssClass="TextBox_UserAccessToken_ShortLive" Visible="False"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox_UserAccessToken_LongLive" runat="server" 
    CssClass="TextBox_UserAccessToken_LongLive" Visible="False"></asp:TextBox>
    <br />
    <asp:DropDownList ID="Select_Fanpage" runat="server" CssClass="Select_Fanpage">
    </asp:DropDownList>
    <br />
    <asp:TextBox ID="TextBox_Page_id" runat="server" CssClass="TextBox_Page_id"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox_Page_name" runat="server" CssClass="TextBox_Page_name"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox_AccessToken" runat="server" 
        CssClass="TextBox_AccessToken"></asp:TextBox>
<br />
<asp:Button ID="Button_Liberar" runat="server" CssClass="button" Text="Liberar" />
<br />

    <script type="text/javascript">
</script>

</asp:Content>

