<%@ Page Language="VB" MasterPageFile="~/_empresaJC/layout_Page001.master" AutoEventWireup="false" CodeFile="conta.aspx.vb" Inherits="_empresa_conta" title=":. Sistema JobClick .:" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_empresaJC/images/buttonOK.png" />
                            </td>
                            <td align="center" valign="top">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <br /><h1><asp:Label ID="LabelCabec" runat="server" Text="Conta de acesso"></asp:Label></h1>    
        <table border="0" width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
                <asp:FormView ID="FormViewCONTA" runat="server" CellPadding="0" DataKeyNames="idUser"
                    DataSourceID="SqlDataSource1" DefaultMode="Edit">
                    <EditItemTemplate>
                        <table cellpadding="0" cellspacing="0" class="col_16">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" class="col_15">
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label1" runat="server" Text="Nível de acesso:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="idTypeUserTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Enabled="False" Text='<%# Bind("idTypeUser") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="userNameTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:Label ID="Label2" runat="server" Text="Protocolo:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="userNameTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Enabled="False" Text='<%# Bind("userName") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="passwordTextBox" Display="Dynamic" 
                                                    ErrorMessage="Informe sua nova senha" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                    ControlToCompare="passwordTextBox" ControlToValidate="ReTextBox" 
                                                    Display="Dynamic" ErrorMessage="* A senha deve ser igual nos dois campos!">*</asp:CompareValidator>
                                                <asp:Label ID="Label3" runat="server" Text="Digite sua nova senha:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="ReTextBox" Display="Dynamic" 
                                                    ErrorMessage="Digite novamente sua nova senha" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:Label ID="Label4" runat="server" Text="Digite novamente sua nova senha:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ReTextBox" runat="server" CssClass="InputCadEmp" 
                                                    TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="emailTextBox" 
                                                    ErrorMessage="Informe seu e-mail, ele deve ser válido" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="emailTextBox" Display="Dynamic" 
                                                    ErrorMessage="Informe seu e-mail" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:Label ID="Label5" runat="server" Text="E-mail:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Text='<%# Bind("email") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="fraseTextBox" Display="Dynamic" 
                                                    ErrorMessage="Informe uma frase" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:Label ID="Label6" runat="server" Text="Frase:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="fraseTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Text='<%# Bind("frase") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label7" runat="server" Text="Cadastrado desde:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="dataTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Enabled="False" Text='<%# Bind("data") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;</td>
                                            <td>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                    ShowMessageBox="True" ShowSummary="False" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;</td>
                                            <td>
                                                <asp:CheckBox ID="bloquearCheckBox" runat="server" 
                                                    Checked='<%# Bind("bloquear") %>' Visible="False" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;</td>
                                            <td>
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    CommandName="Update" CssClass="button" Text="Atualizar meus dados de acesso"></asp:LinkButton>
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                    CssClass="button" OnClick="VaPara" Text="Menu Principal"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
&nbsp;
                    </EditItemTemplate>
                    <InsertItemTemplate>
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
                        data:
                        <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>'>
                        </asp:TextBox><br />
                        &nbsp;<br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idUser:
                        <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>'></asp:Label><br />
                        idTypeUser:
                        <asp:Label ID="idTypeUserLabel" runat="server" Text='<%# Bind("idTypeUser") %>'></asp:Label><br />
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
                        data:
                        <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>'></asp:Label><br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        </table>    
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbuser] WHERE [idUser] = @idUser" InsertCommand="INSERT INTO tbuser(idTypeUser, userName, password, email, frase, bloquear, data) VALUES (@idTypeUser, @userName, @password, @email, @frase, @bloquear, @data)"
        SelectCommand="SELECT idUser, idTypeUser, userName, password, email, frase, bloquear, data FROM tbuser WHERE (idUser = @idUser)"
        UpdateCommand="UPDATE tbuser SET idTypeUser = @idTypeUser, userName = @userName, password = @password, email = @email, frase = @frase, bloquear = @bloquear, data = @data WHERE (idUser = @idUser)">
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
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTypeUser" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
            <asp:Parameter Name="data" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

