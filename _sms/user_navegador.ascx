<%@ Control Language="VB" AutoEventWireup="false" CodeFile="user_navegador.ascx.vb" Inherits="_modulo_user_navegador" %>
<table id="BannerNavegador" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="30%"><asp:ImageButton ID="ImageButtonLogo" runat="server" ImageUrl="~/images/logoPrincipal.png" /></td>
                    <td width="70%"><asp:Label ID="navegadorLabel" runat="server"></asp:Label></td>
                </tr>
            </table>        
        </td>
    </tr>
</table>