<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="expirado.aspx.vb" Inherits="expirado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Expirado" cellpadding="20" cellspacing="20" width="100%" align="center">
        <tr>
            <td align="center">
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.gif" />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Sua sessão expirou!" 
                    Font-Bold="True"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="LinkButtonHome" runat="server">Home</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

