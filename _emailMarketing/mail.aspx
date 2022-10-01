<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mail.aspx.vb" Inherits="_emailMarketing_contador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataListMailing" runat="server" DataKeyField="Email_Corpo" DataSourceID="SqlDataSourceMailing">
            <ItemTemplate>
                <asp:Label ID="Email_Corpo" runat="server" Text='<%# Eval("Email_Corpo")%>' />
            </ItemTemplate>
        </asp:DataList>
        <br />
        <asp:SqlDataSource ID="SqlDataSourceMailing" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB_Mailing %>" SelectCommand="SELECT [idCampanha], [Email_Corpo] FROM [Campanha] WHERE ([idCampanha] = @idCampanha)">
            <SelectParameters>
                <asp:QueryStringParameter Name="idCampanha" QueryStringField="idCampanha" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
