<%@ Page Language="VB" AutoEventWireup="false" CodeFile="landing_more.aspx.vb" Inherits="_parceiro_landing_more" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobClick Landing Page More</title>
    <script type="text/javascript">
	    try {
		    window.top.frames['Landing_Jobclick'].window.frames['Vagas_Jobclick'].document.getElementById("landing_more").click();
	    }
	    catch (err) {
		    window.top.frames[0].window.frames[0].document.getElementById("landing_more").click();
	    }
    </script>
</head>
<body>
more
</body>
</html>
