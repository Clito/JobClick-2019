<%@ Page Language="VB" AutoEventWireup="false" CodeFile="varbannerEmpCredito.aspx.vb" Inherits="varflash_varbannerEmpCredito" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="varFlashBannerEmp" runat="server" Text=""></asp:Label>
        <asp:SqlDataSource ID="SqlEmpresaFilha" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) AND (idCadastroEmpresa = @idCadastroEmpresa)">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                    SessionField="idCadastroEmpresa" Type="Int32" />
                <asp:SessionParameter Name="idCadastroEmpresa" 
                    SessionField="idCadastroEmpresaFilha" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataListEmpresaFilha" runat="server" 
            DataKeyField="idCadastroEmpresa" DataSourceID="SqlEmpresaFilha" Width="100%">
            <ItemTemplate>
                <asp:Label ID="EmpresaLabel" runat="server" 
                    Text="Você está trabalhando com a empresa: "></asp:Label>
                <asp:Label ID="nmempresaLabel" runat="server" CssClass="msnOK" Font-Bold="True" 
                    Text='<%# Eval("nmempresa") %>' ForeColor="#499300" />
            </ItemTemplate>
        </asp:DataList>
    
    </div>
    </form>
</body>
</html>
