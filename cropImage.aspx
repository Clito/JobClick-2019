<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cropImage.aspx.vb" Inherits="cropImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<script src="jquery.min.js" /></script>
<script src="jquery.Jcrop.js" /></script>
<link rel="stylesheet" href="jquery.Jcrop.js" type="text/css" />
<script>
    jQuery(document).ready(function () {
        jQuery('#OriginalImage').Jcrop({
            onSelect: marcaPontos
        });
    });

    function marcaPontos(c) {
        jQuery('#XHiddenField').val(c.x);
        jQuery('#YHiddenField').val(c.y);
        jQuery('#WHiddenField').val(c.w);
        jQuery('#HHiddenField').val(c.h);
    };
</script> 
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       <asp:Panel ID="UploadPanel" runat="server">
            <asp:Label ID="LabelArquivo" runat="server"></asp:Label>
            <br />
            <asp:FileUpload ID="ArquivoFileUpload" runat="server"/>
            <asp:Button ID="UploadButton" runat="server" Text="Upload" />
            &nbsp;<asp:Button ID="ButtonResize" runat="server" Text="UpLoad Resize" />
        </asp:Panel>
        <asp:Panel ID="ImagemOriginalPanel" runat="server" Visible="false">
            <asp:Image ID="OriginalImage" runat="server" />
            <br />
            <asp:Button ID="RecortarButton" runat="server" Text="Recortar" />
            <asp:HiddenField ID="XHiddenField" runat="server" />
            <asp:HiddenField ID="YHiddenField" runat="server" />
            <asp:HiddenField ID="WHiddenField" runat="server" />
            <asp:HiddenField ID="HHiddenField" runat="server" />
        </asp:Panel>
        <asp:Panel ID="ImagemRecortadaPanel" runat="server" Visible="false">
            <asp:Image ID="ImagemRecortadaImage" runat="server" />
        </asp:Panel>        
    
    </div>
    <asp:Label ID="ErroLabel" runat="server"></asp:Label>
    </form>
</body>
</html>
