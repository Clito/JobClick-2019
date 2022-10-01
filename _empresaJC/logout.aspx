<%@ Page Language="VB" MasterPageFile="~/_empresaJC/layout_Page001.master"  AutoEventWireup="false" CodeFile="logout.aspx.vb" Inherits="logout" %>
<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" height="300" width="100%">
        <tr>
            <td align="center">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="LabelAviso" runat="server" 
                    Text="Você está para encerrar esta sessão, quer realmente encerrar?"></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" class="texto" OnClick="btnLogout_OnClick"
                    PostBackUrl="#" CssClass="button">Sim</asp:LinkButton>
                <span style="color: #505050; text-decoration: none">&nbsp; </span>
                <a class="button" href="javascript:history.go(-1)" 
                    onmouseover="self.status=document.referrer;return true">Não</a></td>
        </tr>
    </table>
</asp:Content> 
