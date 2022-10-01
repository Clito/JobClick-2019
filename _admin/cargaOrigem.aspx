<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cargaOrigem.aspx.vb" Inherits="_admin_cargaOrigem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Termos e condições de uso)"></asp:Label>
    <br />
                <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="OrigemLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <asp:GridView ID="GridViewEmpresa" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idsetup,idCadastroEmpresa,empresa" 
        DataSourceID="SqlEMPRESA" GridLines="Horizontal" Width="100%" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" 
                ReadOnly="True" SortExpression="idsetup" Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="empresa" 
                HeaderText="Empresa" Text="Button" />
            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                SortExpression="empresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
        </Columns>
    </asp:GridView>
                <br />
    <asp:FormView ID="FormViewORIGEM" runat="server" DataKeyNames="idorigem" 
        DataSourceID="SqlORIGEM_FORM">
        <EditItemTemplate>
            Origem:
            <br />
            <asp:TextBox ID="origemTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("origem") %>' />
            <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="10px" />
            <asp:Label ID="idorigemLabel1" runat="server" Text='<%# Eval("idorigem") %>' 
                Visible="False" />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" CssClass="button" Text="Atualizar" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" CssClass="button" Text="Cancelar" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButtonCARGA" runat="server" CssClass="button" 
                onclick="LinkButtonCARGA_Click">Carga</asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Origem:
            <br />
            <asp:TextBox ID="origemTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("origem") %>' />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" CssClass="button" Text="Salvar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" CssClass="button" 
                Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="origemLabel" runat="server" Text='<%# Bind("origem") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" CssClass="button" Text="Editar" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" CssClass="button" 
                onclientclick="return confirm(&quot;Deseja excluir este item?&quot;)" 
                Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" CssClass="button" Text="Novo" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="GridViewORIGEM" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="origem" DataSourceID="SqlORIGEM" Width="100%">
        <Columns>
            <asp:ButtonField CommandName="Select" Text="Selecionar" />
            <asp:BoundField DataField="origem" HeaderText="Origem" ReadOnly="True" 
                SortExpression="origem" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
        </Columns>
    </asp:GridView>
                <br />
                <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlORIGEM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [origem], [idCadastroEmpresa] FROM [tbOrigem] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlORIGEM_FORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM tbOrigem WHERE (idorigem = @idorigem)" 
        InsertCommand="INSERT INTO [tbOrigem] ([origem], [idCadastroEmpresa]) VALUES (@origem, @idCadastroEmpresa)" 
        SelectCommand="SELECT [origem], [idCadastroEmpresa], [idorigem] FROM [tbOrigem] WHERE ([origem] = @origem)" 
        
        UpdateCommand="UPDATE [tbOrigem] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idorigem] = @idorigem WHERE [origem] = @origem">
        <DeleteParameters>
            <asp:Parameter Name="idorigem" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="origem" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="OrigemLabel" Name="origem" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idorigem" Type="Int32" />
            <asp:Parameter Name="origem" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

