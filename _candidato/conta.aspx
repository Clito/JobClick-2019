<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="conta.aspx.vb" Inherits="_candidato_conta" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Página Principal" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td style="width: 30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
    <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
                <asp:FormView ID="FormView1" runat="server" CellPadding="0" DataKeyNames="idUser"
                    DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        Cadastro:<br />
                        <asp:TextBox ID="idTypeUserTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Enabled="False"
                            Text='<%# Bind("idTypeUser") %>' Width="100%"></asp:TextBox><br />
                        Protocolo/Username:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="userNameTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="userNameTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("userName") %>' Enabled="False" Width="100%"></asp:TextBox><br />
                        Nova senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:CompareValidator
                                ID="CompareValidator1" runat="server" ControlToCompare="passwordTextBox" ControlToValidate="ReTextBox"
                                Display="Dynamic" ErrorMessage="* A senha deve ser igual nos dois campos!"></asp:CompareValidator><br />
                        <asp:TextBox ID="passwordTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("password") %>'
                            TextMode="Password" Width="100%"></asp:TextBox><br />
                        Digite novamente sua nova senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ControlToValidate="ReTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="ReTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            TextMode="Password" Width="100%"></asp:TextBox><br />
                        <br />
                        E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("email") %>' Width="100%"></asp:TextBox><br />
                        Frase:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fraseTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="fraseTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="40px" Text='<%# Bind("frase") %>'
                            TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <asp:CheckBox ID="bloquearCheckBox" runat="server" Checked='<%# Bind("bloquear") %>'
                            Visible="False" /><br />
                        Cadastrado desde:<br />
                        <asp:TextBox ID="dataTextBox" runat="server" CssClass="InputCadFormCandidatoCV" Enabled="False"
                            Text='<%# Bind("data") %>' Width="200px"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar meus dados de acesso" CssClass="button" 
                            ToolTip="Clique aqui para atualizar seus dados de acesso"></asp:LinkButton>
                        <asp:LinkButton ID="linkButtonMP" runat="server" CausesValidation="False" 
                            Text="Menu Principal" CssClass="button" 
                            PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Clique aqui para voltar para o menu principal"></asp:LinkButton>
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
                        &nbsp;<br />
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

