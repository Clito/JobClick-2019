<%@ Page Title="" Language="VB" MasterPageFile="~/_user/principal_MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_user_Default" %>

<%@ Register src="../_app/saldoSMS.ascx" tagname="saldoSMS" tagprefix="uc1" %>
<%@ Register src="../_app/smsEnviados.ascx" tagname="smsEnviados" tagprefix="uc2" %>
<%@ Register src="../_app/dicas.ascx" tagname="dicas" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Data" cellpadding="5" cellspacing="5" width="100%">
        <tr>
            <td valign="top" align="right"><asp:Label ID="RefDataNow" runat="server"></asp:Label></td>
        </tr>
    </table>

    <table id="top" cellpadding="0" cellspacing="0" width="780px">
        <tr>
            <td width="1px" bgcolor="#FAFAFC"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/1px.gif" /></td>        
        </tr>   
    </table>
    <table id="servicos" cellpadding="0" cellspacing="5" width="780px">
        <tr>
            <td width="1px" bgcolor="#FAFAFC">&nbsp;</td>        
            <td width="266px">
                &nbsp;</td>
            <td width="1px" bgcolor="#FAFAFC">&nbsp;</td>
            <td width="266px">
                &nbsp;</td>
            <td width="1px" bgcolor="#FAFAFC">&nbsp;</td>
            <td width="266px">
                &nbsp;</td>
            <td width="1px" bgcolor="#FAFAFC">&nbsp;</td>
        </tr>     
        <tr>
            <td width="1px" bgcolor="#FAFAFC"><asp:Image ID="ImageLinha1" runat="server" ImageUrl="~/images/1px.gif" /></td>        
            <td width="266px">
                <table id="row1" cellpadding="5" cellspacing="5" width="100%">
                    <tr>
                        <td>
                            <uc1:saldoSMS ID="saldoSMS1" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="1px" bgcolor="#FAFAFC"><asp:Image ID="ImageLinha2" runat="server" ImageUrl="~/images/1px.gif" /></td>
            <td width="266px">
                <table id="Table1" cellpadding="5" cellspacing="5" width="100%">
                    <tr>
                        <td>
                            <uc2:smsEnviados ID="smsEnviados1" runat="server" />
                        </td>
                    </tr>
                </table>            
            </td>
            <td width="1px" bgcolor="#FAFAFC"><asp:Image ID="ImageLinha3" runat="server" ImageUrl="~/images/1px.gif" /></td>
            <td width="266px">
                <table id="Table2" cellpadding="5" cellspacing="5" width="100%">
                    <tr>
                        <td>
                            <uc3:dicas ID="dicas1" runat="server" />
                        </td>
                    </tr>
                </table>            
            </td>
            <td width="1px" bgcolor="#FAFAFC"><asp:Image ID="ImageLinha4" runat="server" ImageUrl="~/images/1px.gif" /></td>
        </tr>     
    </table>
    <table id="rp" cellpadding="0" cellspacing="0" width="780px">
        <tr>
            <td width="1px" bgcolor="#FAFAFC"><asp:Image ID="Image2" runat="server" ImageUrl="~/images/1px.gif" /></td>        
        </tr>   
    </table>    
    <br />
    </asp:Content>

