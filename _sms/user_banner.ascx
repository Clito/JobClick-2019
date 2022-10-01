<%@ Control Language="VB" AutoEventWireup="false" CodeFile="user_banner.ascx.vb" Inherits="_modulo_user_lateralApp" %>
<table id="Banner" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td><asp:ImageButton ID="ImageButtonLogo" runat="server" ImageUrl="~/images/logoPrincipal.png" /></td>
                    <td><asp:Label ID="bannerAppLabel" runat="server" CssClass="textoCaixaAltaAzul"></asp:Label></td>
                </tr>
            </table>
            <asp:Label ID="NavegacaoLabel" runat="server"></asp:Label>
            <br />
        </td>
    </tr>
</table>
