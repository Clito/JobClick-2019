<%@ Page Language="VB" MasterPageFile="~/DefaultPage.master" AutoEventWireup="false" CodeFile="contaEmp.aspx.vb" Inherits="_anonimo_conta" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/contadeacessoemp.gif" />
    &nbsp;
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
            privacidade:
            <asp:CheckBox ID="privacidadeCheckBox" runat="server" Checked='<%# Bind("privacidade") %>' /><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            Olá, para ter acesso aos currículos cadastros em nosso banco de talentos você terá que criar uma
            conta de acesso para sua empresa.<br />
            <br />
            <b>Obs.:</b><br />
            Este é o primeiro passo para sua empresa ter contato com o mais moderno sistema
            de gestão de RH do mercado.&nbsp;<br />
            <asp:Label ID="lblmsn" runat="server" CssClass="msn"></asp:Label><br />
            CNPJ:<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                runat="server" ControlToValidate="TextBoxCNPJ" Display="Dynamic" ErrorMessage="*"
                SetFocusOnError="True"></asp:RequiredFieldValidator>
                      <cc1:MaskedEditExtender id="MaskedEditExtender1" 
                        runat="server"
                        TargetControlID="TextBoxCNPJ" 
                        Mask="99\.999\.999\/9999-99" 
                        MaskType="None"
                        MessageValidatorTip=true 
                        ErrorTooltipEnabled=true 
                        ClearMaskOnLostFocus=false />
            
            <cc1:MaskedEditValidator ID="MaskedEditValidator1"                         
                         runat="server"
                         ControlToValidate="TextBoxCNPJ"                         
                         ControlExtender="MaskedEditExtender1"
                         IsValidEmpty=false
                         Display="Dynamic" 
                         InvalidValueMessage="Formato não é válido!"
                         ToolTipMessage="Preencha o campo no formato [00.000.000/0000-00]" 
                         EmptyValueMessage="Preencha o campo no formato [00.000.000/0000-00]" ErrorMessage="*" SetFocusOnError="True" ValidationExpression="^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$" /> 
                         
            <br />
            <asp:TextBox ID="TextBoxCNPJ" runat="server" CssClass="InputCad"
                OnTextChanged="PesquisaCNPJ"></asp:TextBox><br />
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
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top"><asp:CheckBox ID="privacidadeCheckBox" runat="server" Checked='<%# Bind("privacidade") %>' /></td>
                    <td>
                        Manter meus dados em sigilo (CNPJ, nome e outros)</td>
                </tr>
            </table>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Insert" ImageUrl="~/images/btCriarContaE.gif" /><asp:ImageButton
                ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                ImageUrl="~/images/buttonCanc.gif" PostBackUrl="~/Default.aspx" /><br />
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
            privacidade:
            <asp:CheckBox ID="privacidadeCheckBox" runat="server" Checked='<%# Bind("privacidade") %>'
                Enabled="false" /><br />
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
        InsertCommand="INSERT INTO [tbuser] ([idTypeUser], [userName], [password], [email], [frase], [bloquear], [privacidade], [cnpj]) VALUES (@idTypeUser, @userName, @password, @email, @frase, @bloquear, @privacidade, @cnpj)"
        SelectCommand="SELECT [idUser], [idTypeUser], [userName], [password], [email], [frase], [bloquear], [privacidade], [cnpj] FROM [tbuser]"
        UpdateCommand="UPDATE [tbuser] SET [idTypeUser] = @idTypeUser, [userName] = @userName, [password] = @password, [email] = @email, [frase] = @frase, [bloquear] = @bloquear, [privacidade] = @privacidade, [cnpj] = @cnpj WHERE [idUser] = @idUser"
        OnInserted="OnInsertConta"
        >
        <DeleteParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
        </DeleteParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="idTypeUser" Type="String" DefaultValue="Empresa" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
            <asp:Parameter Name="privacidade" Type="Boolean" />
            <asp:Parameter Name="cnpj" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </UpdateParameters>
        
        <InsertParameters>
            <asp:Parameter Name="idTypeUser" Type="String" DefaultValue="Empresa" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
            <asp:Parameter Name="privacidade" Type="Boolean" />
            <asp:Parameter Name="cnpj" Type="String" />
        </InsertParameters>
        
    </asp:SqlDataSource>
</asp:Content>

