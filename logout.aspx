<%@ Page Language="VB" MasterPageFile="~/erroPage.master"  AutoEventWireup="false" CodeFile="logout.aspx.vb" Inherits="logout" %>
<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="logout.aspx.js" type="text/javascript"></script>
    <table border="0" cellpadding="0" cellspacing="0" height="300" width="100%">
        <tr>
            <td align="center">
                <img id="logoParceiroEmpresa" src="images/layoutNew/logoloading.gif" /><br />
                <br />
                Você está para encerrar esta sessão, quer realmente encerrar?<br />
                <br />
                [<asp:LinkButton ID="LinkButton1" runat="server" class="texto" OnClick="btnLogout_OnClick"
                    PostBackUrl="#">Sim</asp:LinkButton><span style="color: #505050; text-decoration: none">]
                        | [</span><a class="texto" href="javascript:history.go(-1)" onmouseover="self.status=document.referrer;return true">Não</a>]</td>
        </tr>
    </table>
</asp:Content> 
