<%@ Page Language="VB" AutoEventWireup="false" CodeFile="laudoCandidato.aspx.vb" Inherits="_corporativo_laudos_laudoCandidato" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laudo</title>
    <style type="text/css">


.textoNone
{
	font-family: "Helvetica Neue", Arial, Helvetica, Geneva, sans-serif;
	font-size: 9pt;
	text-decoration: none;
	color: #666666;	
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                                    <table ID="CONTATO2" 
    cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="100">
                                                            &nbsp;</td>
                                                        <td align="right">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DataList ID="DataListLaudo" runat="server" DataKeyField="idLaudo" 
                                                    DataSourceID="SqlLAUDOAPRESENTA" Width="100%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelLAUDO" runat="server" CssClass="textoNone" 
                                                            Text='<%# Eval("Laudo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="idLaudoLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:SqlDataSource ID="SqlLAUDOAPRESENTA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    
                                    
            SelectCommand="SELECT idLaudo, Laudo, idSetup FROM _tbLaudo WHERE (idLaudo = @idLaudo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idLaudoLabel" Name="idLaudo" 
                                            PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
