<%@ Page Language="VB" MasterPageFile="~/DefaultPage.master" AutoEventWireup="false" CodeFile="conta.aspx.vb" Inherits="_anonimo_conta" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/contadeacesso.gif" />
    &nbsp;&nbsp;
    <br />
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idUser" DataSourceID="SqlDataSource1"
        DefaultMode="Insert" Width="360px">
        <EditItemTemplate>
            idUser:
            <asp:Label ID="idUserLabel1" runat="server" Text='<%# Eval("idUser") %>'></asp:Label><br />
            idTypeUser:
            <asp:TextBox ID="idTypeUserTextBox" runat="server" Text='<%# Bind("idTypeUser") %>'>
            </asp:TextBox><br />
            userName:
            <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>'>
            </asp:TextBox><br />
            password:
            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>'>
            </asp:TextBox><br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'>
            </asp:TextBox><br />
            frase:
            <asp:TextBox ID="fraseTextBox" runat="server" Text='<%# Bind("frase") %>'>
            </asp:TextBox><br />
            bloquear:
            <asp:CheckBox ID="bloquearCheckBox" runat="server" Checked='<%# Bind("bloquear") %>' /><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            Olá, para cadastrar seu currículo em nosso banco de dados será necessário criar uma
            conta de acesso no JobClick.
            <br />
            <br />
            "O processo de abertura de uma conta de acesso é muito simples e rápido, confira".
            <br />
            <asp:Label ID="lblmsn" runat="server" CssClass="msn"></asp:Label>&nbsp;<br />
            Usuário: (NickName)<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="userNameTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp;
            <br />
            <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' CssClass="InputCad" MaxLength="16"></asp:TextBox><br />
            Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' CssClass="InputCad" MaxLength="16" TextMode="Password"></asp:TextBox><br />
            E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox"
                    Display="Dynamic" ErrorMessage="* Informe e-mail válido!" SetFocusOnError="True"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' CssClass="InputCad"></asp:TextBox><br />
            Lembrete:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="fraseTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="fraseTextBox" runat="server" Text='<%# Bind("frase") %>' CssClass="InputCad"></asp:TextBox><br />
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Insert" ImageUrl="~/images/btCriarConta.gif" /><asp:ImageButton
                ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                ImageUrl="~/images/buttonCanc.gif" OnClick="goback" OnClientClick="javascript:history.go(-1)" /><br />
            <asp:CheckBox ID="bloquearCheckBox" runat="server" Checked='<%# Bind("bloquear") %>' Visible="False" />
            <asp:TextBox ID="idTypeUserTextBox" runat="server" Text='<%# Bind("idTypeUser") %>' Visible="False"></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
            idUser:
            <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>'></asp:Label><br />
            idTypeUser:
            <asp:Label ID="idTypeUserLabel" runat="server" Text='<%# Bind("idTypeUser") %>'>
            </asp:Label><br />
            userName:
            <asp:Label ID="userNameLabel" runat="server" Text='<%# Bind("userName") %>'></asp:Label><br />
            password:
            <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>'></asp:Label><br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label><br />
            frase:
            <asp:Label ID="fraseLabel" runat="server" Text='<%# Bind("frase") %>'></asp:Label><br />
            bloquear:
            <asp:CheckBox ID="bloquearCheckBox" runat="server" Checked='<%# Bind("bloquear") %>'
                Enabled="false" /><br />
            &nbsp;<br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit">
            </asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete">
            </asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New">
            </asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
                <br />
    <asp:Label ID="lblText" runat="server"></asp:Label></td>
        </tr>
    </table>
    <br />
    <br />
    &nbsp;<br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbuser] WHERE [idUser] = @idUser" 
        InsertCommand="INSERT INTO [tbuser] ([idTypeUser], [userName], [password], [email], [frase], [bloquear]) VALUES (@idTypeUser, @userName, @password, @email, @frase, @bloquear)"
        SelectCommand="SELECT [idUser], [idTypeUser], [userName], [password], [email], [frase], [bloquear] FROM [tbuser]"
        UpdateCommand="UPDATE [tbuser] SET [idTypeUser] = @idTypeUser, [userName] = @userName, [password] = @password, [email] = @email, [frase] = @frase, [bloquear] = @bloquear WHERE [idUser] = @idUser"
        OnInserted="OnInsertConta"
        >
        <DeleteParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
        </DeleteParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="idTypeUser" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </UpdateParameters>
        
        <InsertParameters>
            <asp:Parameter Name="idTypeUser" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
        </InsertParameters>
        
    </asp:SqlDataSource>
</asp:Content>

