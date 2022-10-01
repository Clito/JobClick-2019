<%@ Page Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="faq.aspx.vb" Inherits="_admin_faq" title="Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" Text="Administração (E-mails não respondidos)"></asp:Label><br />
    <br />
    Selecione uma das opções abaixo:<br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
    CssClass="DropCadEmp">
        <asp:ListItem Value="false">Veja todos os e-mails que ainda n&#227;o foram respondidos.</asp:ListItem>
        <asp:ListItem Value="true">Veja todos os emails enviados.</asp:ListItem>
    </asp:DropDownList><br />
    <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
        CellPadding="0" DataKeyNames="idemailres" 
    DataSourceID="SqlDataSource1" GridLines="Horizontal"
        Width="100%">
        <Columns>
            <asp:BoundField DataField="idemailres" HeaderText="idemailres" InsertVisible="False"
                ReadOnly="True" SortExpression="idemailres" Visible="False" />
            <asp:BoundField DataField="idFAQ" HeaderText="idFAQ" SortExpression="idFAQ" Visible="False" />
            <asp:BoundField DataField="pergunta" HeaderText="D&#250;vida" SortExpression="pergunta">
                <HeaderStyle Width="600px" />
            </asp:BoundField>
            <asp:BoundField DataField="resposta" HeaderText="resposta" SortExpression="resposta"
                Visible="False" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" Visible="False" />
            <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" Visible="False" />
            <asp:BoundField DataField="ticket" HeaderText="ticket" SortExpression="ticket" Visible="False" />
            <asp:BoundField DataField="data" HeaderText="Enviado em" SortExpression="data" />
            <asp:CheckBoxField DataField="status" HeaderText="Status" SortExpression="status" />
            <asp:CommandField SelectText="Responder" ShowSelectButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Nenhum e-mail encontrado na base de dados.
        </EmptyDataTemplate>
        <AlternatingRowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idemailres" DataSourceID="SqlDataSource2"
        DefaultMode="Edit" Width="100%">
        <EditItemTemplate>
            Sobre:<asp:TextBox ID="idFAQTextBox" runat="server" Text='<%# Bind("idFAQ") %>' Visible="False"
                Width="8px"></asp:TextBox>
            <asp:Label ID="idemailresLabel1" runat="server" Text='<%# Eval("idemailres") %>'
                Visible="False"></asp:Label><br />
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource3"
                DataTextField="tema" DataValueField="idFAQ" SelectedValue='<%# Bind("idFAQ") %>'>
            </asp:DropDownList><br />
            Dúvida:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="perguntaTextBox"
                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="perguntaTextBox" runat="server" CssClass="InputCad" Height="104px"
                Text='<%# Bind("pergunta") %>' TextMode="MultiLine"></asp:TextBox><br />
            Responda aqui:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="respostaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="respostaTextBox" runat="server" CssClass="InputCad" Height="104px"
                Text='<%# Bind("resposta") %>' TextMode="MultiLine"></asp:TextBox><br />
            E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox"
                Display="Dynamic" ErrorMessage="* Informe e-mail válido!" SetFocusOnError="True"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("email") %>'></asp:TextBox><br />
            Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="nomeTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("nome") %>'></asp:TextBox><br />
            IP:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ipTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="ipTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("ip") %>'></asp:TextBox><br />
            Ticket:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ticketTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="ticketTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("ticket") %>'></asp:TextBox><br />
            Data do envio:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                ControlToValidate="dataTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="dataTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("data") %>'></asp:TextBox><br />
            <br />
            Se você quer enviar este e-mail, favor marcar esta opção:<br />
            <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Bind("status") %>'
                Text="Selecione aqui apenas se sua intenção for de enviar..." /><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar este registro"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Quer excluir este e-mail?")' Text="Excluir este e-mail"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                OnClick="GoBack" Text="Cancelar"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            idFAQ:
            <asp:TextBox ID="idFAQTextBox" runat="server" Text='<%# Bind("idFAQ") %>'>
            </asp:TextBox><br />
            pergunta:
            <asp:TextBox ID="perguntaTextBox" runat="server" Text='<%# Bind("pergunta") %>'>
            </asp:TextBox><br />
            resposta:
            <asp:TextBox ID="respostaTextBox" runat="server" Text='<%# Bind("resposta") %>'>
            </asp:TextBox><br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'>
            </asp:TextBox><br />
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>'>
            </asp:TextBox><br />
            ip:
            <asp:TextBox ID="ipTextBox" runat="server" Text='<%# Bind("ip") %>'>
            </asp:TextBox><br />
            ticket:
            <asp:TextBox ID="ticketTextBox" runat="server" Text='<%# Bind("ticket") %>'>
            </asp:TextBox><br />
            data:
            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>'>
            </asp:TextBox><br />
            status:
            <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Bind("status") %>' /><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            idemailres:
            <asp:Label ID="idemailresLabel" runat="server" Text='<%# Eval("idemailres") %>'></asp:Label><br />
            idFAQ:
            <asp:Label ID="idFAQLabel" runat="server" Text='<%# Bind("idFAQ") %>'></asp:Label><br />
            pergunta:
            <asp:Label ID="perguntaLabel" runat="server" Text='<%# Bind("pergunta") %>'></asp:Label><br />
            resposta:
            <asp:Label ID="respostaLabel" runat="server" Text='<%# Bind("resposta") %>'></asp:Label><br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label><br />
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>'></asp:Label><br />
            ip:
            <asp:Label ID="ipLabel" runat="server" Text='<%# Bind("ip") %>'></asp:Label><br />
            ticket:
            <asp:Label ID="ticketLabel" runat="server" Text='<%# Bind("ticket") %>'></asp:Label><br />
            data:
            <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>'></asp:Label><br />
            status:
            <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Bind("status") %>'
                Enabled="false" /><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <br />
    <br />
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idemailres], [idFAQ], [pergunta], [resposta], [email], [nome], [ip], [ticket], [data], [status] FROM [tbEmail_res] WHERE ([status] = @status)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="false" Name="status"
                PropertyName="SelectedValue" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbEmail_res] WHERE [idemailres] = @idemailres" InsertCommand="INSERT INTO [tbEmail_res] ([idFAQ], [pergunta], [resposta], [email], [nome], [ip], [ticket], [data], [status]) VALUES (@idFAQ, @pergunta, @resposta, @email, @nome, @ip, @ticket, @data, @status)"
        SelectCommand="SELECT [idemailres], [idFAQ], [pergunta], [resposta], [email], [nome], [ip], [ticket], [data], [status] FROM [tbEmail_res] WHERE ([idemailres] = @idemailres)"
        UpdateCommand="UPDATE [tbEmail_res] SET [idFAQ] = @idFAQ, [pergunta] = @pergunta, [resposta] = @resposta, [email] = @email, [nome] = @nome, [ip] = @ip, [ticket] = @ticket, [data] = @data, [status] = @status WHERE [idemailres] = @idemailres">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="idemailres" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idemailres" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
            <asp:Parameter Name="pergunta" Type="String" />
            <asp:Parameter Name="resposta" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="ip" Type="String" />
            <asp:Parameter Name="ticket" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="status" Type="Boolean" />
            <asp:Parameter Name="idemailres" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idFAQ" Type="Int32" />
            <asp:Parameter Name="pergunta" Type="String" />
            <asp:Parameter Name="resposta" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="ip" Type="String" />
            <asp:Parameter Name="ticket" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="status" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idFAQ], [tema] FROM [tbFAQ]"></asp:SqlDataSource>
    <br />
</asp:Content>

