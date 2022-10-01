<%@ Control Language="VB" AutoEventWireup="false" CodeFile="personalizarV.ascx.vb" Inherits="App_Include_personalizarV" %>
<asp:Label ID="lblIdVagaP" runat="server" Visible="False"></asp:Label><asp:Label ID="lblidPersonalizada"
    runat="server" Visible="False"></asp:Label><br />
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="None"
    DataKeyNames="idPersonalizada" DataSourceID="SqlPersonalizado" GridLines="None"
    Width="614px">
    <Columns>
        <asp:BoundField DataField="idPersonalizada" HeaderText="idPersonalizada" InsertVisible="False"
            ReadOnly="True" SortExpression="idPersonalizada" Visible="False" />
        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" Visible="False" />
        <asp:ButtonField CommandName="Select" DataTextField="titulo" HeaderText="Campos personalizados" />
        <asp:BoundField DataField="titulo" HeaderText="Campos personalizados" SortExpression="titulo"
            Visible="False" />
        <asp:BoundField DataField="conteudo" HeaderText="conteudo" SortExpression="conteudo"
            Visible="False" />
    </Columns>
    <HeaderStyle HorizontalAlign="Left" />
    <AlternatingRowStyle BackColor="Azure" />
</asp:GridView>
<br />
<asp:FormView ID="FormView2" runat="server" DataKeyNames="idPersonalizada" DataSourceID="SqlPersonalizadoForm"
    DefaultMode="Edit" Width="350px">
    <EditItemTemplate>
        Título que será apresentado na publicação desta vaga:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tituloTextBox"
            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tituloTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("titulo") %>'></asp:TextBox><br />
        Conteúdo para apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            runat="server" ControlToValidate="conteudoTextBox" Display="Dynamic" ErrorMessage="*"
            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="conteudoTextBox" runat="server" CssClass="InputCadEmp" Height="120px"
            OnDataBinding="conteudoTextBox_DataBinding" Text='<%# Bind("conteudo") %>' TextMode="MultiLine"></asp:TextBox><br />
        <asp:Label ID="idPersonalizadaLabel1" runat="server" Text='<%# Eval("idPersonalizada") %>'
            Visible="False"></asp:Label><asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>'
                Visible="False" Width="24px"></asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Atualizar"></asp:LinkButton>
        |
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="New"
            Text="Incluir campo"></asp:LinkButton>
        |
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            OnClientClick='return confirm("Quer excluir este campo personalizado?")' Text="Excluir"></asp:LinkButton>
        |
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="Cancel"
            OnClick="NewButton_Click" Text="Cancelar"></asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        Título que será apresentado na publicação desta vaga:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tituloTextBox"
            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:TextBox ID="tituloTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("titulo") %>'></asp:TextBox><br />
        Conteúdo para apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            runat="server" ControlToValidate="conteudoTextBox" Display="Dynamic" ErrorMessage="*"
            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:TextBox ID="conteudoTextBox" runat="server" CssClass="InputCadEmp" Height="120px"
            Text='<%# Bind("conteudo") %>' TextMode="MultiLine"></asp:TextBox><br />
        <asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False"
            Width="24px"></asp:TextBox>&nbsp;<br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            Text="Salvar"></asp:LinkButton>
        |
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancelar"></asp:LinkButton>
    </InsertItemTemplate>
    <ItemTemplate>
        idPersonalizada:
        <asp:Label ID="idPersonalizadaLabel" runat="server" Text='<%# Eval("idPersonalizada") %>'></asp:Label><br />
        idVaga:
        <asp:Label ID="idVagaLabel" runat="server" Text='<%# Bind("idVaga") %>'></asp:Label><br />
        titulo:
        <asp:Label ID="tituloLabel" runat="server" Text='<%# Bind("titulo") %>'></asp:Label><br />
        conteudo:
        <asp:Label ID="conteudoLabel" runat="server" Text='<%# Bind("conteudo") %>'></asp:Label><br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit"></asp:LinkButton>
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="Delete"></asp:LinkButton>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
    <EmptyDataTemplate>
        Está faltando algum campo?<br />
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="Crie aqui seus campos personalizados"></asp:LinkButton>
    </EmptyDataTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlPersonalizado" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    SelectCommand="SELECT [idPersonalizada], [idVaga], [titulo], [conteudo] FROM [tbPersonalizada] WHERE ([idVaga] = @idVaga)">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblIdVagaP" DefaultValue="0" Name="idVaga" PropertyName="Text"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlPersonalizadoForm" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    DeleteCommand="DELETE FROM [tbPersonalizada] WHERE [idPersonalizada] = @idPersonalizada"
    InsertCommand="INSERT INTO [tbPersonalizada] ([idVaga], [titulo], [conteudo]) VALUES (@idVaga, @titulo, @conteudo)"
    SelectCommand="SELECT [idPersonalizada], [idVaga], [titulo], [conteudo] FROM [tbPersonalizada] WHERE ([idPersonalizada] = @idPersonalizada)"
    UpdateCommand="UPDATE [tbPersonalizada] SET [idVaga] = @idVaga, [titulo] = @titulo, [conteudo] = @conteudo WHERE [idPersonalizada] = @idPersonalizada">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblidPersonalizada" DefaultValue="0" Name="idPersonalizada"
            PropertyName="Text" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="idPersonalizada" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="idVaga" Type="Int32" />
        <asp:Parameter Name="titulo" Type="String" />
        <asp:Parameter Name="conteudo" Type="String" />
        <asp:Parameter Name="idPersonalizada" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="idVaga" Type="Int32" />
        <asp:Parameter Name="titulo" Type="String" />
        <asp:Parameter Name="conteudo" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
