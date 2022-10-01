<%@ Page Language="VB" MasterPageFile="~/DefaultPage.master" AutoEventWireup="false" CodeFile="usercheck.aspx.vb" Inherits="_security_usercheck" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/layout/titsiteseg.gif" />
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
                <br />
                Confirme sua senha de acesso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="TBSenha" Display="Dynamic" ErrorMessage=" * Informe sua senha."
                    SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="TBSenha" runat="server" CssClass="InputCad" TextMode="Password"></asp:TextBox><br />
                <br />
                <table align="right" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:ImageButton ID="IBConfirmeSenha" runat="server" ImageUrl="~/images/layout/btconfirmar.gif" /><asp:Image ID="Image1" runat="server" ImageUrl="~/images/5px.gif" /></td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/images/layout/btvoltar.gif" /></td>
                    </tr>
                </table>
            </td> 
        </tr>
    </table>     
    <asp:Label ID="lblidUser" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblkey" runat="server" Visible="False"></asp:Label>
</asp:Content>

