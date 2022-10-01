<%@ Page Language="VB" AutoEventWireup="true" CodeFile="formulario.aspx.vb" Inherits="formulario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="key_to_UPDATELabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="table_to_UPDATELabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="column_to_UPDATELabel" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
    
        <br />
        <asp:Panel ID="PanelNOME" runat="server" Visible="False">
            <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                Width="400px"></asp:TextBox>
            <asp:LinkButton ID="LinkButtonSalvarNome" runat="server">Salvar</asp:LinkButton>
        </asp:Panel>
        <br />
            
    </div>
    <br />
    <asp:FormView ID="FormViewCadastro" runat="server" 
        DataKeyNames="idCadastroUser" DataSourceID="SqlCadastro">
        <EditItemTemplate>
            areaAtuacao:
            <asp:TextBox ID="areaAtuacaoTextBox" runat="server" 
                Text='<%# Bind("areaAtuacao") %>' />
            <br />
            interesse01:
            <asp:TextBox ID="interesse01TextBox" runat="server" 
                Text='<%# Bind("interesse01") %>' />
            <br />
            interesse02:
            <asp:TextBox ID="interesse02TextBox" runat="server" 
                Text='<%# Bind("interesse02") %>' />
            <br />
            interesse03:
            <asp:TextBox ID="interesse03TextBox" runat="server" 
                Text='<%# Bind("interesse03") %>' />
            <br />
            idCadastroUser:
            <asp:Label ID="idCadastroUserLabel1" runat="server" 
                Text='<%# Eval("idCadastroUser") %>' />
            <br />
            idUser:
            <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            areaAtuacao:
            <asp:TextBox ID="areaAtuacaoTextBox" runat="server" 
                Text='<%# Bind("areaAtuacao") %>' />
            <br />
            interesse01:
            <asp:TextBox ID="interesse01TextBox" runat="server" 
                Text='<%# Bind("interesse01") %>' />
            <br />
            interesse02:
            <asp:TextBox ID="interesse02TextBox" runat="server" 
                Text='<%# Bind("interesse02") %>' />
            <br />
            interesse03:
            <asp:TextBox ID="interesse03TextBox" runat="server" 
                Text='<%# Bind("interesse03") %>' />
            <br />

            idUser:
            <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton_areaAtuacao" runat="server" 
                CommandArgument="areaAtuacao" CommandName="Select" CssClass="textQUIZ" 
                onclick="LinkButton_areaAtuacao_Click" Text='<%# Eval("areaAtuacao") %>'></asp:LinkButton>
            <br />
            <asp:LinkButton ID="LinkButton_interesse01" runat="server" 
                CommandArgument="interesse01" CommandName="Select" CssClass="textQUIZ" 
                onclick="LinkButton_interesse01_Click" Text='<%# Eval("interesse01") %>'></asp:LinkButton>
            <br />
            <asp:LinkButton ID="LinkButton_interesse02" runat="server" 
                CommandArgument="interesse02" CommandName="Select" CssClass="textQUIZ" 
                onclick="LinkButton_interesse02_Click" Text='<%# Eval("interesse02") %>'></asp:LinkButton>
            <br />
            <asp:LinkButton ID="LinkButton_interesse03" runat="server" 
                CommandArgument="interesse03" CommandName="Select" CssClass="textQUIZ" 
                onclick="LinkButton_interesse03_Click" Text='<%# Eval("interesse03") %>'></asp:LinkButton>
            <br />
            <br />
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlCadastro" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [areaAtuacao], [interesse01], [interesse02], [interesse03], [idCadastroUser], [idUser] FROM [tbCadastroUser] WHERE ([idUser] = @idUser)" 
        DeleteCommand="DELETE FROM [tbCadastroUser] WHERE [idCadastroUser] = @idCadastroUser" 
        InsertCommand="INSERT INTO [tbCadastroUser] ([areaAtuacao], [interesse01], [interesse02], [interesse03], [idUser]) VALUES (@areaAtuacao, @interesse01, @interesse02, @interesse03, @idUser)" 
        UpdateCommand="UPDATE [tbCadastroUser] SET [areaAtuacao] = @areaAtuacao, [interesse01] = @interesse01, [interesse02] = @interesse02, [interesse03] = @interesse03, [idUser] = @idUser WHERE [idCadastroUser] = @idCadastroUser">
        <DeleteParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="areaAtuacao" Type="String" />
            <asp:Parameter Name="interesse01" Type="String" />
            <asp:Parameter Name="interesse02" Type="String" />
            <asp:Parameter Name="interesse03" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idUserLabel" Name="idUser" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="areaAtuacao" Type="String" />
            <asp:Parameter Name="interesse01" Type="String" />
            <asp:Parameter Name="interesse02" Type="String" />
            <asp:Parameter Name="interesse03" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
