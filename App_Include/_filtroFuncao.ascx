<%@ Control Language="VB" AutoEventWireup="false" CodeFile="_filtroFuncao.ascx.vb" Inherits="App_Include_filtroFuncao" %>
<style type="text/css">
body
{
	font-size: 3mm;
	color: #505050;
	font-family: Verdana;
	text-decoration: none;
}

.InputCad
{
	background-color: #F0F0F0;
	font-size: 8pt;
	color: #000000;
	font-family: Verdana;
	text-decoration: none;
	border-right: #E0E0E0 1px solid;
	border-top: #E0E0E0 1px solid;
	border-left: #E0E0E0 1px solid;
	border-bottom: #E0E0E0 1px solid;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	cursor: text;
	font-weight: normal;
	width: 350px;
	height: 16px;
}
a:link    {text-decoration:underline;color: #505050;background-color: transparent;}
    .style1
    {
        width: 100%;
    }
</style>
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td>
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" MaxLength="255" Width="256px" CssClass="InputCad"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Pesquisar" /><br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BorderStyle="None" DataKeyNames="idfuncao" DataSourceID="SqlDataSourcePsq" GridLines="None"
            Width="350px">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="idfuncao" DataNavigateUrlFormatString="teste.aspx?idfuncao={0}"
                    DataTextField="dsfuncao" Visible="False">
                </asp:HyperLinkField>
                <asp:BoundField DataField="dsfuncao" SortExpression="dsfuncao" ReadOnly="True" />
                <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" InsertVisible="False" SortExpression="idfuncao" Visible="False" />
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/images/selectRow.gif" SelectText="">
                    <ItemStyle Width="40px" />
                </asp:CommandField>
            </Columns>
            <AlternatingRowStyle BackColor="WhiteSmoke" />
            <HeaderStyle HorizontalAlign="Left" />
        </asp:GridView>
        <asp:Label ID="resTxt" runat="server"></asp:Label><br />
        <asp:SqlDataSource ID="SqlDataSourcePsq" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
            SelectCommand="spGetFunction" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="buscador" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
</table>

        