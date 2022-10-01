<%@ Page Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="senha.aspx.vb" Inherits="senha" title="Acesso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Recuperação da senha de acesso" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
            
                <table cellpadding="0" cellspacing="0" style="width: 690px">
                    <tr>
                        <td>
                            <asp:Label ID="LabelAviso" runat="server" 
                                Text="Para recuperar seus dados de acesso preencha o formulário abaixo informando o e-mail que foi utilizado na criação de sua conta no JobClick."></asp:Label>
                            <br />
                            </td>
                    </tr>              
                </table>
                <br />
                <asp:Label ID="LabelFormAviso" runat="server" 
                    Text="E-mail (O mesmo utilizado na criação de sua conta)"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="email" Display="Dynamic" 
                    ErrorMessage="Informe seu e-mail." SetFocusOnError="True">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="email" Display="Dynamic"
                        ErrorMessage="Informe seu e-mail, válido." SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator><br />
                <asp:TextBox ID="email" runat="server" CssClass="InputCad" Width="350px"></asp:TextBox><br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td><asp:ImageButton ID="RecuperaDados" runat="server" 
                                ImageUrl="~/images/layoutNew/btRecuperaSenha.png" /></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="msn" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <br />
            </td> 
        </tr>
    </table>  
           
           
</asp:Content>

