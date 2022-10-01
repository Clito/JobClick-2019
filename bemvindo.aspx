<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="bemvindo.aspx.vb" Inherits="bemvindo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .centralizado {
                text-align: center;
                margin:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbl_idCadastroEmpresa" runat="server" Visible="False"></asp:Label>
    <br />
    <script src="bemvindo.aspx.js" type="text/javascript"></script>

    <div style="">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SQLBemvindo" ItemStyle-HorizontalAlign="NotSet" CssClass="centralizado">
            <ItemTemplate>
                &nbsp;<asp:Label ID="bemvindo_pageLabel" runat="server" Text='<%# Eval("bemvindo_page") %>' />
                <br />
    <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SQLBemvindo" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [bemvindo_page] FROM [tbsetup] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_idCadastroEmpresa" DefaultValue="1" Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

