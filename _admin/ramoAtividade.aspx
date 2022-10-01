<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="ramoAtividade.aspx.vb" Inherits="_admin_ramoAtividade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Ramo de Atividade)"></asp:Label>
    <asp:Label ID="idAreaAtuacaoLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:FormView ID="FormViewRamoAtividade" runat="server" 
        DataKeyNames="idAreaAtuacao" DataSourceID="SqlRamoAtividadeFORM">
        <EditItemTemplate>
            <asp:Label ID="Label1" runat="server" Text="Ramo de atividade:"></asp:Label>
            <br />
            <asp:TextBox ID="dsAreaAtuacaoTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("dsAreaAtuacao") %>' />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" CssClass="button" Text="Salvar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" CssClass="button" 
                Text="Cancelar" />
            <br />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <br />
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" CssClass="button" Text="Novo Ramo de Atividade" />
            <br />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Label1" runat="server" Text="Ramo de atividade:"></asp:Label>
            <br />
            <asp:TextBox ID="dsAreaAtuacaoTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("dsAreaAtuacao") %>' />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" CssClass="button" Text="Salvar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" CssClass="button" 
                Text="Cancelar" />
            <br />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="dsAreaAtuacaoLabel" runat="server" CssClass="titulo" 
                Text='<%# Bind("dsAreaAtuacao") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" CssClass="button" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" CssClass="button" 
                onclientclick="return confirm(&quot;Deseja excluir este registro?&quot;)" 
                Text="Excluir" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" CssClass="button" Text="Novo Ramo de Atividade" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="GridViewRamoAtividade" runat="server" 
        AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idAreaAtuacao" 
        DataSourceID="SqlRamoAtividade" GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#EAEAEA" />
        <Columns>
            <asp:BoundField DataField="idAreaAtuacao" HeaderText="idAreaAtuacao" 
                InsertVisible="False" ReadOnly="True" SortExpression="idAreaAtuacao" 
                Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="dsAreaAtuacao" 
                Text="Ramo de Atividade" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlRamoAtividadeFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbAreaAtuacao] WHERE [idAreaAtuacao] = @idAreaAtuacao" 
        InsertCommand="INSERT INTO [tbAreaAtuacao] ([dsAreaAtuacao]) VALUES (@dsAreaAtuacao)" 
        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao] WHERE ([idAreaAtuacao] = @idAreaAtuacao)" 
        UpdateCommand="UPDATE [tbAreaAtuacao] SET [dsAreaAtuacao] = @dsAreaAtuacao WHERE [idAreaAtuacao] = @idAreaAtuacao">
        <DeleteParameters>
            <asp:Parameter Name="idAreaAtuacao" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dsAreaAtuacao" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idAreaAtuacaoLabel" Name="idAreaAtuacao" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="dsAreaAtuacao" Type="String" />
            <asp:Parameter Name="idAreaAtuacao" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlRamoAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao] ORDER BY [dsAreaAtuacao]">
    </asp:SqlDataSource>
</asp:Content>

