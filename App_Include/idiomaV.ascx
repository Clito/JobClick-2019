<%@ Control Language="VB" AutoEventWireup="false" CodeFile="idiomaV.ascx.vb" Inherits="App_Include_idiomaV" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
    DataKeyNames="ididiomaV" DataSourceID="SqlDataSource1" GridLines="None" Width="614px">
    <Columns>
        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" Visible="False" />
        <asp:ButtonField CommandName="Select" DataTextField="dsidioma" HeaderText="Idioma" >
            <HeaderStyle Width="143px" />
        </asp:ButtonField>
        <asp:BoundField DataField="dsidioma" HeaderText="Idioma" SortExpression="dsidioma"
            Visible="False" />
        <asp:BoundField DataField="dsnivel" HeaderText="Profici&#234;ncia" SortExpression="dsnivel" />
        <asp:BoundField DataField="dscomentario" HeaderText="dscomentario" SortExpression="dscomentario"
            Visible="False" />
    </Columns>
    <HeaderStyle HorizontalAlign="Left" />
    <AlternatingRowStyle BackColor="Azure" />
</asp:GridView>
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="ididiomaV" DataSourceID="SqlDataSource2"
    DefaultMode="Edit" Width="350px">
    <EditItemTemplate>
        Idioma:<asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>'
            Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="ididiomanivelTextBox"
                runat="server" Text='<%# Bind("ididiomanivel") %>' Visible="False" Width="1px"></asp:TextBox><asp:TextBox
                    ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False"
                    Width="24px"></asp:TextBox><br />
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource3"
            DataTextField="dsidioma" DataValueField="ididioma" SelectedValue='<%# Bind("ididioma") %>'>
        </asp:DropDownList><br />
        Proficiência:<br />
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource4"
            DataTextField="dsnivel" DataValueField="ididiomanivel" SelectedValue='<%# Bind("ididiomanivel") %>'>
        </asp:DropDownList><br />
        Comentário:<br />
        <asp:TextBox ID="dscomentarioTextBox" runat="server" CssClass="InputCadEmp" Height="100px"
            Text='<%# Bind("dscomentario") %>' TextMode="MultiLine" OnDataBinding="dscomentarioTextBox_DataBinding"></asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Atualizar"></asp:LinkButton>
        |
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="Incluir Idioma"></asp:LinkButton>
        |
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            OnClientClick='return confirm("Quer excluir este idioma?")' Text="Excluir"></asp:LinkButton>
        |
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
            Text="Cancelar" OnClick="UpdateCancelButton_Click"></asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        Idioma:<asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>'
            Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="ididiomanivelTextBox"
                runat="server" Text='<%# Bind("ididiomanivel") %>' Visible="False" Width="1px"></asp:TextBox><asp:TextBox
                    ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False"
                    Width="24px"></asp:TextBox><br />
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource3"
            DataTextField="dsidioma" DataValueField="ididioma" SelectedValue='<%# Bind("ididioma") %>'>
        </asp:DropDownList><br />
        Proficiência:<br />
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource4"
            DataTextField="dsnivel" DataValueField="ididiomanivel" SelectedValue='<%# Bind("ididiomanivel") %>'>
        </asp:DropDownList><br />
        Comentário:<br />
        <asp:TextBox ID="dscomentarioTextBox" runat="server" CssClass="InputCadEmp" Height="100px"
            Text='<%# Bind("dscomentario") %>' TextMode="MultiLine"></asp:TextBox><br />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            Text="Incluir Idioma"></asp:LinkButton>
        |
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancelar"></asp:LinkButton>
    </InsertItemTemplate>
    <ItemTemplate>
        ididiomaV:
        <asp:Label ID="ididiomaVLabel" runat="server" Text='<%# Eval("ididiomaV") %>'></asp:Label><br />
        idVaga:
        <asp:Label ID="idVagaLabel" runat="server" Text='<%# Bind("idVaga") %>'></asp:Label><br />
        ididioma:
        <asp:Label ID="ididiomaLabel" runat="server" Text='<%# Bind("ididioma") %>'></asp:Label><br />
        ididiomanivel:
        <asp:Label ID="ididiomanivelLabel" runat="server" Text='<%# Bind("ididiomanivel") %>'></asp:Label><br />
        dscomentario:
        <asp:Label ID="dscomentarioLabel" runat="server" Text='<%# Bind("dscomentario") %>'></asp:Label><br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit"></asp:LinkButton>
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="Delete"></asp:LinkButton>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
    <EmptyDataTemplate>
        [<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="Incluir idioma desejado"></asp:LinkButton>]
    </EmptyDataTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    SelectCommand="SELECT [dsnivel], [dsidioma], [idVaga], [dscomentario], [ididiomaV] FROM [vwidiomaV] WHERE ([idVaga] = @idVaga)">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblIdVaga" DefaultValue="0" Name="idVaga" PropertyName="Text"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    DeleteCommand="DELETE FROM [tbIdiomaV] WHERE [ididiomaV] = @ididiomaV" InsertCommand="INSERT INTO [tbIdiomaV] ([idVaga], [ididioma], [ididiomanivel], [dscomentario]) VALUES (@idVaga, @ididioma, @ididiomanivel, @dscomentario)"
    SelectCommand="SELECT [ididiomaV], [idVaga], [ididioma], [ididiomanivel], [dscomentario] FROM [tbIdiomaV] WHERE ([ididiomaV] = @ididiomaV)"
    UpdateCommand="UPDATE [tbIdiomaV] SET [idVaga] = @idVaga, [ididioma] = @ididioma, [ididiomanivel] = @ididiomanivel, [dscomentario] = @dscomentario WHERE [ididiomaV] = @ididiomaV">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblidIdioma" DefaultValue="0" Name="ididiomaV" PropertyName="Text"
            Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="ididiomaV" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="idVaga" Type="Int32" />
        <asp:Parameter Name="ididioma" Type="Int32" />
        <asp:Parameter Name="ididiomanivel" Type="Int32" />
        <asp:Parameter Name="dscomentario" Type="String" />
        <asp:Parameter Name="ididiomaV" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="idVaga" Type="Int32" />
        <asp:Parameter Name="ididioma" Type="Int32" />
        <asp:Parameter Name="ididiomanivel" Type="Int32" />
        <asp:Parameter Name="dscomentario" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    SelectCommand="SELECT [ididioma], [dsidioma] FROM [tbidioma]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    SelectCommand="SELECT [ididiomanivel], [dsnivel] FROM [tbIdiomaNivel]"></asp:SqlDataSource>
<asp:Label ID="lblidIdioma" runat="server" Visible="False"></asp:Label>
<asp:Label ID="lblIdVaga" runat="server" Visible="False"></asp:Label>
