<%@ Page Language="VB" AutoEventWireup="false" CodeFile="_OLD_menu.aspx.vb" Inherits="menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt" lang="pt">

<head>
	<title>Menu Horizontal</title>
    <link href="App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script src="droplinemenu.js" type="text/javascript"></script>
    <script type="text/javascript">
    droplinemenu.buildmenu("mydroplinemenu")
    </script>
</head>

<body>
<div id="mydroplinemenu" class="droplinebar">
<ul>
<li><asp:HyperLink ID="HyperLinkHome" runat="server" Text="Home"></asp:HyperLink></li>
<li><asp:HyperLink ID="HyperLinkDuvida" runat="server" Text="Dúvidas"></asp:HyperLink>
  <ul>
  <li><asp:HyperLink ID="HyperLinkFaq" runat="server" Text="Utilize nosso FAQ para responder suas dúvidas."></asp:HyperLink></li>
  </ul>
</li>
</ul>
</div>
</body>
</html>
