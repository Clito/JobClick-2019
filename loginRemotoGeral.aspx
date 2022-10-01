<%@ Page Language="VB" AutoEventWireup="false" CodeFile="loginRemotoGeral.aspx.vb" Inherits="loginRemotoGeral" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

.msn
{
	font-size: 3mm;
	color: #FF0000;
	font-family: Verdana;
	text-decoration: none;
	font-weight: bold;
}

.login
{
	background: #FFFFFF;
	opacity: 0.5;
	color: #000000;
	font-size: 12pt;
	font-family: Verdana;
	text-decoration: none;
	border-right: #9E9E9E 1px solid;
	border-top: #E0E0E0 1px solid;
	border-left: #9E9E9E 1px solid;
	border-bottom: #E0E0E0 1px solid;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	cursor: text;
	font-weight: normal;
	width: 550px;
	height: 25px;
	z-index: 0;
}

a:link    {text-decoration:underline;color: #505050;background-color: transparent;text-align: right;}
    </style>
    <link href="App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
   <asp:ScriptManager ID="ScriptManagerHome" runat="server" 
        EnableScriptGlobalization="True">
        <Services>
        </Services>
    </asp:ScriptManager>
    <asp:Label ID="URLLabel" runat="server" Visible="False"></asp:Label>
    <asp:Panel ID="PanelLogin" runat="server" Visible="True" 
            DefaultButton="LinkButtonLogin" Width="460px">
        <table cellpadding="0" cellspacing="0" width="100%" id="Login_Int" 
            align="center">
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="2" cellspacing="2" id="Form">
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelEmail" runat="server" Font-Bold="True" Text="E-mail:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="login" 
                                    ValidationGroup="FormLogin" Width="345px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBoxEmail" Display="Dynamic" 
                                    ErrorMessage="E-mail é obrigatório." ValidationGroup="FormLogin">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="TextBoxEmail" Display="Dynamic" 
                                    ErrorMessage="Informe e-mail válido." 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="FormLogin">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td id="tdEsquerdo" runat="server" align="right" visible="true">
                                <asp:Label ID="LabelSenha" runat="server" Font-Bold="True" Font-Italic="False" 
                                    Text="Senha:"></asp:Label>
                            </td>
                            <td id="tdDireito" runat="server" visible="true">
                                <asp:TextBox ID="TextBoxSenha" runat="server" CssClass="login" 
                                    TextMode="Password" Width="345px" ValidationGroup="FormLogin"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBoxSenha" Display="Dynamic" 
                                    ErrorMessage="Senha é obrigatória" ValidationGroup="FormLogin">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:LinkButton ID="LinkButtonLembrete" runat="server" CausesValidation="False">Esqueci a senha de acesso!</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                            <td align="left">
								<br />
                                <asp:LinkButton ID="LinkButtonLogin" runat="server" CssClass="button" 
                                    ToolTip="Para ter acesso você precisa ter uma conta no portal." 
                                    ValidationGroup="FormLogin">Login</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonRecuperar" runat="server" CssClass="button" 
                                    ValidationGroup="FormLogin" Visible="False">Recuperar senha</asp:LinkButton>
                                <asp:LinkButton ID="Voltar" runat="server" CssClass="button" Visible="False">Voltar</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonCadastro" runat="server" CssClass="button" 
                                    PostBackUrl="http://www.jobclick.com.br/_anonimo/cadastroCandidato.aspx">Cadastre-se</asp:LinkButton>
                                <asp:ValidationSummary ID="ValidationSummaryLogin" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="FormLogin" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
