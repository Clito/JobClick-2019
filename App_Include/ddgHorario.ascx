<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ddgHorario.ascx.vb" Inherits="App_Include_ddgHorario" %>
<table cellpadding="4" cellspacing="3">
    <tr>
        <td>
            In�cio:<br />
            <asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" CssClass="DropUF"
                Width="90px">
            </asp:DropDownList></td>
        <td>
            T�rmino:<br />
            <asp:DropDownList ID="ddl2" runat="server" AutoPostBack="True" CssClass="DropUF"
                Width="90px">
            </asp:DropDownList></td>
    </tr>
</table>
