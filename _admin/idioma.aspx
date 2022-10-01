<%@ Page Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" ValidateRequest="false" AutoEventWireup="false" CodeFile="idioma.aspx.vb" Inherits="_admin_idioma" title="Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" Text="Administração (Idioma proficiência)"></asp:Label><br />
    <br />
    <asp:GridView ID="GridViewPROFICIENCIA" runat="server" 
    AutoGenerateColumns="False" BorderStyle="None"
        DataKeyNames="ididiomanivel" DataSourceID="SqlDataSource1" 
    GridLines="None" Width="100%">
        <Columns>
            <asp:BoundField DataField="ididiomanivel" HeaderText="ididiomanivel" InsertVisible="False"
                ReadOnly="True" SortExpression="ididiomanivel" Visible="False" />
            <asp:BoundField DataField="dsnivel" HeaderText="Descri&#231;&#227;o da profici&#234;ncia"
                SortExpression="dsnivel" >
                <HeaderStyle Width="490px" />
            </asp:BoundField>
            <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
        </Columns>
        <AlternatingRowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <br />
    <br />
    <asp:FormView ID="FormViewIDIOMA" runat="server" 
    DataKeyNames="ididiomanivel" DataSourceID="SqlDataSource2"
        DefaultMode="Edit" Width="100%">
        <EditItemTemplate>
            Nível:<br />
            <asp:TextBox ID="dsnivelTextBox" runat="server" CssClass="InputCad" Height="120px"
                Text='<%# Bind("dsnivel") %>' TextMode="MultiLine"></asp:TextBox>
            <br />
            Descrição:<br />
            <asp:TextBox ID="TextBoxDS" runat="server" CssClass="InputCad" Height="120px" 
                Text='<%# Bind("dsproficiencia") %>' TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar proficiência"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Quer excluir esta proficiência?")' Text="Excluir proficiência"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                OnClick="GoBack" Text="Cancelar"></asp:LinkButton>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Criar uma nova proficiência"></asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Nível:<br />
            <asp:TextBox ID="dsnivelTextBox" runat="server" CssClass="InputCad" Height="120px"
                Text='<%# Bind("dsnivel") %>' TextMode="MultiLine"></asp:TextBox><br />
            Descrição:<br />
            <asp:TextBox ID="TextBoxDS" runat="server" CssClass="InputCad" Height="120px" 
                TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Incluir proficiência"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            ididiomanivel:
            <asp:Label ID="ididiomanivelLabel" runat="server" Text='<%# Eval("ididiomanivel") %>'></asp:Label><br />
            dsnivel:
            <asp:Label ID="dsnivelLabel" runat="server" Text='<%# Bind("dsnivel") %>'></asp:Label><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/linhaAdm.gif" /><br />
    &nbsp;<br />
    <asp:Label ID="Label1" runat="server" CssClass="titulo" Text="Administração (Idioma)"></asp:Label><br />
    <br />
    <asp:GridView ID="GridViewIDIOMA" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BorderStyle="None" DataKeyNames="ididioma" 
    DataSourceID="SqlDataSource3" GridLines="None"
        Width="100%">
        <Columns>
            <asp:BoundField DataField="ididioma" HeaderText="ididioma" InsertVisible="False"
                ReadOnly="True" SortExpression="ididioma" Visible="False" />
            <asp:BoundField DataField="dsidioma" HeaderText="Idioma" SortExpression="dsidioma">
                <HeaderStyle Width="490px" />
            </asp:BoundField>
            <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
        </Columns>
        <AlternatingRowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <br />
    <br />
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="ididioma" DataSourceID="SqlDataSource4"
        DefaultMode="Edit" Width="100%">
        <EditItemTemplate>
            Idioma:<br />
            <asp:TextBox ID="dsidiomaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("dsidioma") %>'></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar idioma"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Excluir idioma?")' Text="Excluir idioma"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Incluir idioma"></asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Idioma:<br />
            <asp:TextBox ID="dsidiomaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("dsidioma") %>'></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Incluir idioma"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/linhaAdm.gif" /><br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [ididiomanivel], [dsnivel] FROM [tbIdiomaNivel]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbIdiomaNivel] WHERE [ididiomanivel] = @ididiomanivel"
        
        InsertCommand="INSERT INTO tbIdiomaNivel(dsnivel, dsproficiencia) VALUES (@dsnivel, @dsproficiencia)" SelectCommand="SELECT ididiomanivel, dsnivel, dsproficiencia FROM tbIdiomaNivel WHERE (ididiomanivel = @ididiomanivel)"
        
        UpdateCommand="UPDATE tbIdiomaNivel SET dsnivel = @dsnivel, dsproficiencia = @dsproficiencia WHERE (ididiomanivel = @ididiomanivel)">
        <DeleteParameters>
            <asp:Parameter Name="ididiomanivel" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="dsnivel" Type="String" />
            <asp:Parameter Name="dsproficiencia" />
            <asp:Parameter Name="ididiomanivel" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewPROFICIENCIA" DefaultValue="0" Name="ididiomanivel"
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="dsnivel" Type="String" />
            <asp:Parameter Name="dsproficiencia" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [ididioma], [dsidioma] FROM [tbidioma]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbidioma] WHERE [ididioma] = @ididioma" InsertCommand="INSERT INTO [tbidioma] ([dsidioma]) VALUES (@dsidioma)"
        SelectCommand="SELECT [ididioma], [dsidioma] FROM [tbidioma] WHERE ([ididioma] = @ididioma)"
        UpdateCommand="UPDATE [tbidioma] SET [dsidioma] = @dsidioma WHERE [ididioma] = @ididioma">
        <DeleteParameters>
            <asp:Parameter Name="ididioma" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="dsidioma" Type="String" />
            <asp:Parameter Name="ididioma" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewIDIOMA" DefaultValue="0" 
                Name="ididioma" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="dsidioma" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

