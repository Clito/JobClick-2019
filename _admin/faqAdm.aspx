<%@ Page Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="faqAdm.aspx.vb" Inherits="_admin_faqAdm" title="Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" Text="Administração (FAQ)"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BorderStyle="None" DataKeyNames="idFAQ" DataSourceID="SqlDataSource1" GridLines="Horizontal"
        Width="100%">
        <Columns>
            <asp:BoundField DataField="idFAQ" HeaderText="idFAQ" InsertVisible="False" ReadOnly="True"
                SortExpression="idFAQ" Visible="False" />
            <asp:BoundField DataField="tema" HeaderText="Assunto" SortExpression="tema" />
            <asp:BoundField DataField="contaclick" HeaderText="Visitas" SortExpression="contaclick" />
            <asp:CheckBoxField DataField="apresentar" HeaderText="Apresentar" SortExpression="apresentar" />
            <asp:HyperLinkField DataNavigateUrlFields="idFAQ" DataNavigateUrlFormatString="faqAdm.aspx?idFAQ={0}"
                Text="Editar" />
            <asp:HyperLinkField DataNavigateUrlFields="idFAQ" DataNavigateUrlFormatString="faqAdm.aspx?idFAQr={0}"
                Text="Selecionar" />
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idFAQ" DataSourceID="SqlDataSource2"
        DefaultMode="Edit" Width="100%">
        <EditItemTemplate>
            Assunto:<br />
            <asp:TextBox ID="temaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("tema") %>'></asp:TextBox><br />
            Visitas (Contador):<br />
            <asp:TextBox ID="contaclickTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("contaclick") %>'></asp:TextBox><br />
            Status:<br />
            <asp:CheckBox ID="apresentarCheckBox" runat="server" Checked='<%# Bind("apresentar") %>'
                Text="Apresentar este assunto?" /><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar "></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                OnClick="mudaFormA" Text="Cancelar"></asp:LinkButton>
            <asp:Label ID="idFAQLabel1" runat="server" Text='<%# Eval("idFAQ") %>' Visible="False"></asp:Label>
        </EditItemTemplate>
        <InsertItemTemplate>
            Assunto:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="temaTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="temaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("tema") %>'></asp:TextBox><br />
            Visitas (Inicie com 0):<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="contaclickTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="contaclickTextBox"
                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationExpression="\d{1}"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="contaclickTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("contaclick") %>'></asp:TextBox><br />
            <br />
            <asp:CheckBox ID="apresentarCheckBox" runat="server" Checked='<%# Bind("apresentar") %>'
                Text="Apresentar" /><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Incluir este assunto"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                OnClick="mudaFormA" Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            Assunto selecionado para edição:
            <br />
            <asp:Label ID="temaLabel" runat="server" Text='<%# Bind("tema") %>'></asp:Label><br />
            Visitado: [<asp:Label ID="contaclickLabel" runat="server" Text='<%# Bind("contaclick") %>'></asp:Label>]<br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Editar assunto"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Você está para excluir este assunto, está certo disso?\n\nTodos os registros relacionados a este assunto serão apagados...")'
                Text="Excluir assunto"></asp:LinkButton>
            |
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Incluir novo assunto"></asp:LinkButton>
        </ItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Incluir novo assunto"></asp:LinkButton>
        </EmptyDataTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BorderStyle="None" DataKeyNames="idFAQresAssunto" DataSourceID="SqlDataSource3"
        GridLines="Horizontal" Width="100%">
        <Columns>
            <asp:BoundField DataField="idFAQresAssunto" HeaderText="idFAQresAssunto" InsertVisible="False"
                ReadOnly="True" SortExpression="idFAQresAssunto" Visible="False" />
            <asp:BoundField DataField="idFAQ" HeaderText="idFAQ" SortExpression="idFAQ" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="idFAQresAssunto,idFAQ" DataNavigateUrlFormatString="faqAdm.aspx?idFAQresAssunto={0}&amp;idFAQr={1}"
                DataTextField="duvida" HeaderText="D&#250;vida/Pergunta" />
            <asp:BoundField DataField="duvida" HeaderText="D&#250;vida/Pergunta" SortExpression="duvida"
                Visible="False" />
            <asp:BoundField DataField="resposta" HeaderText="resposta" SortExpression="resposta"
                Visible="False" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" Visible="False" />
            <asp:BoundField DataField="datares" HeaderText="datares" SortExpression="datares"
                Visible="False" />
            <asp:CheckBoxField DataField="apresentar" HeaderText="Apresentar" SortExpression="apresentar">
                <HeaderStyle Width="50px" />
            </asp:CheckBoxField>
        </Columns>
        <EmptyDataTemplate>
            • Não existe registro para o assunto selecionado.
        </EmptyDataTemplate>
        <HeaderStyle HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <div style="text-align: right">
    </div>
    <br />
    <br />
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="idFAQresAssunto" DataSourceID="SqlDataSource4"
        DefaultMode="Edit" Width="510px">
        <EditItemTemplate>
            Assunto:<asp:TextBox ID="idFAQTextBox" runat="server" Text='<%# Bind("idFAQ") %>'
                Visible="False"></asp:TextBox>
            <asp:Label ID="idFAQresAssuntoLabel1" runat="server" Text='<%# Eval("idFAQresAssunto") %>'
                Visible="False"></asp:Label><br />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource1"
                DataTextField="tema" DataValueField="idFAQ" SelectedValue='<%# Bind("idFAQ") %>'>
            </asp:DropDownList><br />
            Dúvida:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="duvidaTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="duvidaTextBox" runat="server" CssClass="InputCad" Height="90px"
                Text='<%# Bind("duvida") %>' TextMode="MultiLine"></asp:TextBox><br />
            Resposta:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="respostaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="respostaTextBox" runat="server" CssClass="InputCad" Height="90px"
                Text='<%# Bind("resposta") %>' TextMode="MultiLine"></asp:TextBox><br />
            Data:<br />
            <asp:TextBox ID="dataTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("data") %>'></asp:TextBox><br />
            Respondido em:<br />
            <asp:TextBox ID="dataresTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("datares") %>'></asp:TextBox><br />
            <br />
            <asp:CheckBox ID="apresentarCheckBox" runat="server" Checked='<%# Bind("apresentar") %>'
                Text="Apresentar" /><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar FAQ"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Você está para excluir este FAQ, está certo disso?")'
                Text="Excluir este FAQ"></asp:LinkButton>
            |
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Incluir novo FAQ"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                OnClick="mudaForm" Text="Cancelar"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            Assunto:<asp:TextBox ID="idFAQTextBox" runat="server" Text='<%# Bind("idFAQ") %>'
                Visible="False"></asp:TextBox><br />
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource1"
                DataTextField="tema" DataValueField="idFAQ" SelectedValue='<%# Bind("idFAQ") %>'>
            </asp:DropDownList><br />
            Dúvida:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="duvidaTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="duvidaTextBox" runat="server" CssClass="InputCad" Height="90px"
                Text='<%# Bind("duvida") %>' TextMode="MultiLine"></asp:TextBox><br />
            Resposta:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="respostaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="respostaTextBox" runat="server" CssClass="InputCad" Height="90px"
                Text='<%# Bind("resposta") %>' TextMode="MultiLine"></asp:TextBox><br />
            <br />
            <asp:CheckBox ID="apresentarCheckBox" runat="server" Checked='<%# Bind("apresentar") %>'
                Text="Apresentar" /><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Incluir este FAQ"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                OnClick="mudaForm" Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            Dúvida selecionada para edição:<br />
            [<asp:Label ID="duvidaLabel" runat="server" Text='<%# Bind("duvida") %>'></asp:Label>]<br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Editar este FAQ"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Você está para excluir este FAQ, está certo disso?\n\nTodos os registros relacionados a este FAQ serão apagados...")'
                Text="Excluir este FAQ"></asp:LinkButton>
            |
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Incluir um novo FAQ"></asp:LinkButton>
        </ItemTemplate>
        <EmptyDataTemplate>
            &nbsp;
        </EmptyDataTemplate>
    </asp:FormView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idFAQ], [tema], [contaclick], [apresentar] FROM [tbFAQ]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbFAQ] WHERE [idFAQ] = @idFAQ" InsertCommand="INSERT INTO [tbFAQ] ([tema], [contaclick], [apresentar]) VALUES (@tema, @contaclick, @apresentar)"
        OnDeleted="OnChangeFAQ" OnInserted="OnChangeFAQ" OnUpdated="OnChangeFAQ" SelectCommand="SELECT [idFAQ], [tema], [contaclick], [apresentar] FROM [tbFAQ] WHERE ([idFAQ] = @idFAQ)"
        UpdateCommand="UPDATE [tbFAQ] SET [tema] = @tema, [contaclick] = @contaclick, [apresentar] = @apresentar WHERE [idFAQ] = @idFAQ">
        <DeleteParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="tema" Type="String" />
            <asp:Parameter Name="contaclick" Type="Int32" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
            <asp:Parameter Name="idFAQ" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idFAQ" QueryStringField="idFAQ"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="tema" Type="String" />
            <asp:Parameter Name="contaclick" Type="Int32" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbFAQresAssunto] WHERE [idFAQresAssunto] = @idFAQresAssunto"
        InsertCommand="INSERT INTO [tbFAQresAssunto] ([idFAQ], [duvida], [resposta], [data], [datares], [apresentar]) VALUES (@idFAQ, @duvida, @resposta, @data, @datares, @apresentar)"
        OnDeleted="OnChangeFAQ" OnInserted="OnChangeFAQ" OnUpdated="OnChangeFAQ" SelectCommand="SELECT [idFAQresAssunto], [idFAQ], [duvida], [resposta], [data], [datares], [apresentar] FROM [tbFAQresAssunto] WHERE ([idFAQ] = @idFAQ)"
        UpdateCommand="UPDATE [tbFAQresAssunto] SET [idFAQ] = @idFAQ, [duvida] = @duvida, [resposta] = @resposta, [data] = @data, [datares] = @datares, [apresentar] = @apresentar WHERE [idFAQresAssunto] = @idFAQresAssunto">
        <DeleteParameters>
            <asp:Parameter Name="idFAQresAssunto" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="resposta" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="datares" Type="DateTime" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
            <asp:Parameter Name="idFAQresAssunto" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idFAQ" QueryStringField="idFAQr"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="resposta" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="datares" Type="DateTime" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbFAQresAssunto] WHERE [idFAQresAssunto] = @idFAQresAssunto"
        InsertCommand="INSERT INTO [tbFAQresAssunto] ([idFAQ], [duvida], [resposta], [apresentar]) VALUES (@idFAQ, @duvida, @resposta, @apresentar)"
        OnDeleted="OnChangeFAQ" OnInserted="OnChangeFAQ" OnUpdated="OnChangeFAQ" SelectCommand="SELECT [idFAQresAssunto], [idFAQ], [duvida], [resposta], [data], [datares], [apresentar] FROM [tbFAQresAssunto] WHERE ([idFAQresAssunto] = @idFAQresAssunto)"
        UpdateCommand="UPDATE [tbFAQresAssunto] SET [idFAQ] = @idFAQ, [duvida] = @duvida, [resposta] = @resposta, [data] = @data, [datares] = @datares, [apresentar] = @apresentar WHERE [idFAQresAssunto] = @idFAQresAssunto">
        <DeleteParameters>
            <asp:Parameter Name="idFAQresAssunto" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="resposta" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="datares" Type="DateTime" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
            <asp:Parameter Name="idFAQresAssunto" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idFAQresAssunto" QueryStringField="idFAQresAssunto"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="resposta" Type="String" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

