<%@ Page Language="VB" AutoEventWireup="false" CodeFile="landing.aspx.vb" Inherits="facebook_landing" %>

<!DOCTYPE>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vagas no Facebook</title>
</head>
<body style="margin:0; padding: 0;">
<script type="text/javascript">
    jobclick_config =
     {
         'companykey': '<%=Encode(Request.Querystring("companyid"))%>'
         , 'css': "facebook"
         , 'action': "login"
         , 'server': 'http://alpha.jobclick.com.br'
     };

    document.write('<scr' + 'ipt type="text/javascript" src="' + jobclick_config['server'] + '/jobclick.js"></scr' + 'ipt>');
</script>	
</body>
</html>
