<%@ Page Language="VB" AutoEventWireup="false" CodeFile="criptografarDados.aspx.vb" Inherits="criptografarDados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Informe o que será criptografado:"></asp:Label>
        <br />
        <asp:TextBox ID="criptografarTextBox" runat="server" CssClass="InputCad"></asp:TextBox>
        <br />
        <asp:Label ID="criptografadoLabel" runat="server"></asp:Label>
        <br />
        <asp:Label ID="descriptografadoLabel" runat="server"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LinkButtonCriptografar" runat="server" CssClass="button">Criptografar</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
