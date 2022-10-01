<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuControl.ascx.vb" Inherits="App_Include_MenuControl" %>

<link href="../App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
<table id="Nav" bgcolor="#F9F9F9" cellpadding="2" cellspacing="2" width="100%">
    <tr>
        <td>
            <asp:Menu ID="Menu" runat="server" BorderStyle="None" 
                DataSourceID="XmlDataSourceGeral" DisappearAfter="1000" 
                DynamicBottomSeparatorImageUrl="/../images/empresa/separador.png" 
                DynamicHorizontalOffset="2" DynamicVerticalOffset="10" Height="30px" 
                Orientation="Horizontal" RenderingMode="Table" StaticSubMenuIndent="20px" 
                BorderWidth="0px">
                <DataBindings>
                    <asp:MenuItemBinding DataMember="Menu" NavigateUrlField="url" 
                        TextField="title" />
                    <asp:MenuItemBinding DataMember="SubMenu" NavigateUrlField="url" 
                        TextField="title" />
                </DataBindings>
                <DynamicMenuItemStyle CssClass="MenuJobClick" />
                <DynamicMenuStyle CssClass="MenuJobClick" />
                <StaticMenuItemStyle CssClass="MenuJobClick" />
                <StaticMenuStyle CssClass="MenuJobClick" />
            </asp:Menu>
        </td>
    </tr>
</table>
<asp:XmlDataSource ID="XmlDataSourceGeral" runat="server" 
    DataFile="~/xml/menuRHUser.xml" XPath="/Wizard/Menu"></asp:XmlDataSource>




