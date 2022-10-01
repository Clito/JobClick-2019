<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manutencaoSITE.aspx.vb" Inherits="manutencaoSITE" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                    <asp:Panel ID="PanelMensagemEnviada" runat="server" Visible="False">
                        <table cellpadding="0" cellspacing="0" ID="StatusMSN" align="center">
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                        ImageUrl="~/images/close.png" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="MSNEmail" runat="server" CssClass="msnOK"></asp:Label>
                                    <br />
                                    <asp:Image ID="ImageEmail" runat="server" 
                                        ImageUrl="~/images/emailEnviado.png" />
                                    <br />
                                </td>
                            </tr>
                        </table>
</asp:Panel>
<cc1:DragPanelExtender ID="PanelMensagemEnviada_DragPanelExtender" 
    runat="server" DragHandleID="PanelMensagemEnviada" Enabled="True" 
    TargetControlID="PanelMensagemEnviada">
</cc1:DragPanelExtender>
    
    </div>
    </form>
</body>
</html>
