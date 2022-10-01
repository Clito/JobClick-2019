<%@ Page Language="VB" AutoEventWireup="false" CodeFile="enviaEmail.aspx.vb" Inherits="enviaEmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="StatusLabel" runat="server"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="MsgTextBox" runat="server" Height="100px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar e-mail" />
    
    </div>
    </form>
</body>
</html>
