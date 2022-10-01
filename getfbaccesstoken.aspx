<%@ Page Language="VB" AutoEventWireup="false" CodeFile="getfbaccesstoken.aspx.vb" Inherits="getfbaccesstoken" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<script type="text/javascript" language="javascript">
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexS = name + "=([^&#]*)";
        var regex = new RegExp(regexS);
        var results = regex.exec(window.location);
        if (results == null)
            return "";
        else
            return decodeURIComponent(results[1].replace(/\+/g, " "));
    }
	
    Access_Token = getParameterByName('#access_token');
	
</script>
    <form id="form1" runat="server">
    <div>
		Carregando
        <asp:TextBox ID="TXT_AccessToken" runat="server" style="display:none"></asp:TextBox>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    if (Access_Token != "") {
        document.getElementById('<%=TXT_AccessToken.ClientID %>').value = Access_Token;
        document.forms["form1"].submit();
    }
</script>