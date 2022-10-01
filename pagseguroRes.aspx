<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pagseguroRes.aspx.vb" Inherits="pagseguroRes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Labelds" runat="server" Text="Enviar código de notificação"></asp:Label>
        <br />
        <asp:TextBox ID="notificationCode" runat="server" Width="300px"></asp:TextBox>
        <br />
        <asp:LinkButton ID="LinkButtonNOTIFICAR" runat="server">Notificar</asp:LinkButton>
        <br />
        <br />
        <br />
        <asp:Label ID="id" runat="server"></asp:Label>
        <asp:Label ID="description" runat="server"></asp:Label>
        <asp:Label ID="amount" runat="server"></asp:Label>
        <asp:Label ID="dateLabel" runat="server"></asp:Label>
        <asp:Label ID="code" runat="server"></asp:Label>
        <asp:Label ID="reference" runat="server"></asp:Label>
        <asp:Label ID="type" runat="server"></asp:Label>
        <asp:Label ID="status" runat="server"></asp:Label>
        <asp:Label ID="creditos" runat="server"></asp:Label>
        <asp:Label ID="sms" runat="server"></asp:Label>
        <asp:Label ID="ResultadoLabel" runat="server"></asp:Label>
        <asp:GridView ID="GridViewRetorno" runat="server" Visible="False">
        </asp:GridView>
        <asp:GridView ID="GridViewItens" runat="server" Visible="False">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
