<%@ Page Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="gestor.aspx.vb" Inherits="_empresa_gestor" title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_consultor.gif" /><br />
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    DataKeyNames="idRH" DataSourceID="SqlDataSource5" GridLines="None" Width="614px">
                    <Columns>
                        <asp:BoundField DataField="idRH" HeaderText="idRH" InsertVisible="False" ReadOnly="True"
                            SortExpression="idRH" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa"
                            Visible="False" />
                        <asp:BoundField DataField="dsRH_vinculo" HeaderText="Acesso (Grupo)" SortExpression="dsRH_vinculo" />
                        <asp:BoundField DataField="dsvinculo" HeaderText="Observa&#231;&#227;o" SortExpression="dsvinculo" />
                        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True">
                            <HeaderStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                    <AlternatingRowStyle BackColor="Azure" />
                    <EmptyDataTemplate>
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/antencao.gif" />
                        <asp:Label ID="info" runat="server" Text="Não há grupo criado, antes de incluir um Consultor cadastre um grupo de acesso. "></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idRH" DataSourceID="SqlDataSource6">
        <EditItemTemplate>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Nome da equipe (Grupo): "></asp:Label><asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'
                Visible="False" Width="8px"></asp:TextBox><asp:DropDownList ID="DropDownList3" runat="server"
                    DataSourceID="SqlDataSource4" DataTextField="idCadastroEmpresa" DataValueField="idCadastroEmpresa"
                    SelectedValue='<%# Bind("idCadastroEmpresa") %>' Visible="False">
                </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RH_vinculoTextBox"
                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="RH_vinculoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("dsRH_vinculo") %>'></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Observações:"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="dsvinculoTextBox" Display="Dynamic" ErrorMessage="*" 
                SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Descreva qual é a especialidade da equipe ou do grupo.<br>Se for a contratação de um especialista descreva as <br>características da contatação e/ou sua finalidade."
                Width="350px"></asp:Label><br />
            <asp:TextBox ID="dsvinculoTextBox" runat="server" CssClass="InputCadEmp" Height="100px"
                Text='<%# Bind("dsvinculo") %>' TextMode="MultiLine"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Salvar atualização"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Nome da equipe (Grupo): "></asp:Label><asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'
                Visible="False" Width="8px"></asp:TextBox><asp:DropDownList ID="DropDownList3" runat="server"
                    DataSourceID="SqlDataSource4" DataTextField="idCadastroEmpresa" DataValueField="idCadastroEmpresa"
                    SelectedValue='<%# Bind("idCadastroEmpresa") %>' Visible="False">
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RH_vinculoTextBox"
                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><br />
            Obs.: Crie várias equipes de consultores.<br />
            <asp:TextBox ID="RH_vinculoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("dsRH_vinculo") %>'></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Observações:"></asp:Label>&nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="dsvinculoTextBox" Display="Dynamic" ErrorMessage="*" 
                SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Descreva qual é a especialidade da equipe ou do grupo.<br>Se for a contratação de um especialista descreva as <br>características da contatação e/ou sua finalidade."
                Width="350px"></asp:Label><br />
            <asp:TextBox ID="dsvinculoTextBox" runat="server" CssClass="InputCadEmp" Height="100px"
                Text='<%# Bind("dsvinculo") %>' TextMode="MultiLine"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Salvar"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            O registro [<asp:Label ID="dsRHLabel" runat="server" Font-Bold="True" Text='<%# Eval("dsRH_vinculo") %>'></asp:Label>]
            está selecionado para edição.<br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Editar"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Excluir vínculo" 
                OnClientClick='return confirm("Quer excluir este Grupo?\nTodos os Consultores deste grupo serão excluidos também...")' 
                Visible="False"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Cria novo grupo de acesso"></asp:LinkButton>
        </ItemTemplate>
        <EmptyDataTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/setalat.gif" />
            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New"
                Text="Cria novo grupo de acesso"></asp:LinkButton>
        </EmptyDataTemplate>
    </asp:FormView>
                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    DataKeyNames="idUser" DataSourceID="SqlDataSource1" GridLines="None" Width="614px">
                    <Columns>
                        <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa"
                            Visible="False" />
                        <asp:BoundField DataField="nome" HeaderText="Nome:" SortExpression="nome" />
                        <asp:BoundField DataField="password" HeaderText="Password:" SortExpression="password" />
                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                        <asp:CheckBoxField DataField="bloquear" HeaderText="Bloquear" SortExpression="bloquear" />
                        <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" />
                        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True">
                            <HeaderStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/antencao.gif" />
                        <asp:Label ID="info" runat="server" Text="Não há consultores cadastrados. "></asp:Label>
                    </EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                <br />
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="idUser" 
                    DataSourceID="SqlDataSource3">
                    <EditItemTemplate>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa") %>' Width="5px" Visible="False"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource4" DataTextField="idCadastroEmpresa" DataValueField="idCadastroEmpresa"
                                SelectedValue='<%# Bind("idCadastroEmpresa") %>' Visible="False">
                            </asp:DropDownList>
                        <asp:TextBox ID="idRH_vinculoTextBox" runat="server" 
                            Text='<%# Bind("idRH") %>' Width="5px" Visible="False"></asp:TextBox>
                        <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' 
                            Width="5px" Visible="False"></asp:TextBox>
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource2"
                            DataTextField="dsRH_vinculo" DataValueField="idRH" SelectedValue='<%# Bind("idRH") %>'>
                        </asp:DropDownList><br />
                        <asp:Label ID="Label9" runat="server" Text="Nível de acesso:"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownListAcesso" runat="server" CssClass="DropCadEmp" 
                            DataSourceID="SqlDataSourcetbuserType" DataTextField="idTypeUser" 
                            DataValueField="idTypeUser" SelectedValue='<%# Bind("idTypeUser") %>'>
                        </asp:DropDownList>
                        <br />
                        Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="nomeTextBox"
                            Display="Dynamic" ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("nome") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="User Name (Utilizado no Login)"></asp:Label>
                        <br />
                        <asp:TextBox ID="usernameTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("userName") %>'></asp:TextBox>
                        <br />
                        Senha de acesso (Password):<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="* Campo obrigatório!"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCadEmp" MaxLength="16"
                            Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox><br />
                        E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="emailTextBox"
                            Display="Dynamic" ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox"
                                Display="Dynamic" ErrorMessage="* Informe um e-mail válido!" SetFocusOnError="True"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("email") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Frase para recuperar senha:"></asp:Label>
                        <br />
                        <asp:TextBox ID="FraseTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("frase") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="DDD:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="dddTextBox" ErrorMessage="DDD é obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dddTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("ddd") %>' Width="80px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="dddTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                            TargetControlID="dddTextBox">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Telefone:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="telefoneTextBox" ErrorMessage="Telefone é Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="telefoneTextBox" runat="server" CssClass="DropCadEmp" 
                            Text='<%# Bind("telefone") %>'></asp:TextBox>
                        <asp:MaskedEditExtender ID="telefoneTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="9999\-9999" MaskType="Number" 
                            TargetControlID="telefoneTextBox" ClearMaskOnLostFocus="False">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="CPF:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="CPFTextBox" ErrorMessage="CPF é obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CPFTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("cpf") %>'></asp:TextBox>
                        <asp:MaskedEditExtender ID="CPFTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="999\.999\.999-99" MaskType="Number" 
                            TargetControlID="CPFTextBox" ClearMaskOnLostFocus="False">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:CheckBox ID="bloquearCheckBox" runat="server" Checked='<%# Bind("bloquear") %>'
                            Text="Bloquear acesso" /><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Salvar atualização"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>'
                            Visible="False" Width="5px"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource4" DataTextField="idCadastroEmpresa" DataValueField="idCadastroEmpresa"
                                SelectedValue='<%# Bind("idCadastroEmpresa") %>' Visible="False">
                            </asp:DropDownList>
                        <asp:TextBox ID="idRH_vinculoTextBox" runat="server" Text='<%# Bind("idRH") %>'
                                Visible="False" Width="5px"></asp:TextBox>
                        <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' 
                            Visible="False" Width="5px"></asp:TextBox>
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" 
                            DataSourceID="SqlDataSource2" DataTextField="dsRH_vinculo" 
                            DataValueField="idRH" SelectedValue='<%# Bind("idRH") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Nível de acesso:"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownListAcesso" runat="server" CssClass="DropCadEmp" 
                            DataSourceID="SqlDataSourcetbuserType" DataTextField="idTypeUser" 
                            DataValueField="idTypeUser" SelectedValue='<%# Bind("idTypeUser") %>'>
                        </asp:DropDownList>
                        <br />
                        Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="nomeTextBox" Display="Dynamic" 
                            ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("nome") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="User Name (Utilizado no Login)"></asp:Label>
                        <br />
                        <asp:TextBox ID="usernameTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("userName") %>'></asp:TextBox>
                        <br />
                        Senha de acesso (Password):<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="passwordTextBox" 
                            Display="Dynamic" ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCadEmp" 
                            MaxLength="16" Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
                        <br />
                        E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" 
                            ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" 
                            ErrorMessage="* Informe um e-mail válido!" SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("email") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Frase para recuperar senha:"></asp:Label>
                        <br />
                        <asp:TextBox ID="FraseTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("frase") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="DDD:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="dddTextBox" ErrorMessage="DDD é obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dddTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("ddd") %>' Width="80px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="dddTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                            TargetControlID="dddTextBox">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Telefone:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="telefoneTextBox" ErrorMessage="Telefone é Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="telefoneTextBox" runat="server" CssClass="DropCadEmp" 
                            Text='<%# Bind("telefone") %>'></asp:TextBox>
                        <asp:MaskedEditExtender ID="telefoneTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="9999\-9999" MaskType="Number" 
                            TargetControlID="telefoneTextBox" ClearMaskOnLostFocus="False">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="CPF:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="CPFTextBox" ErrorMessage="CPF é Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CPFTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("cpf") %>'></asp:TextBox>
                        <asp:MaskedEditExtender ID="CPFTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="999\.999\.999\-99" MaskType="Number" 
                            TargetControlID="CPFTextBox" ClearMaskOnLostFocus="False">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:CheckBox ID="bloquearCheckBox" runat="server" 
                            Checked='<%# Bind("bloquear") %>' Text="Bloquear acesso" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        O registro abaixo está selecionado para edição:&nbsp;
                        <br />
                        Nome:
                        <asp:Label ID="nomeLabel" runat="server" Font-Bold="True" Text='<%# Bind("nome") %>'></asp:Label><br />
                        E-mail:
                        <asp:Label ID="emailLabel" runat="server" Font-Bold="True" Text='<%# Bind("email") %>'></asp:Label>
                        <br />
                        Telefone:
                        <asp:Label ID="dddLabel" runat="server" Font-Bold="True" 
                            Text='<%# Eval("ddd") %>'></asp:Label>
&nbsp;<asp:Label ID="telefoneLabel" runat="server" Font-Bold="True" Text='<%# Eval("telefone") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Editar registro"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Quer realmente excluir este consultor?")' Text="Excluir"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir novo acesso (Consultor)"></asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/setalat.gif" />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir novo acesso (Consultor)"></asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:FormView>
    </td> 
        </tr>
    </table>     
    <br />
    <br />
    &nbsp;<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="uspGestor" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT idCadastroEmpresa, dsvinculo, idRH, dsRH_vinculo FROM tbRH_vinculo WHERE (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="uspGestorDelete"
        InsertCommand="uspGestorInsert"
        SelectCommand="uspGestorSelect"
        UpdateCommand="uspGestorUpdate" InsertCommandType="StoredProcedure" 
        SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" 
        DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="GridView1" Name="idUser" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idTypeUser" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="cpf" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="idRH" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idTypeUser" Type="String" />
            <asp:Parameter Name="idRH" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="cpf" Type="String" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idCadastroEmpresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT idRH, idCadastroEmpresa, dsvinculo, dsRH_vinculo FROM tbRH_vinculo WHERE (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbRH_vinculo] WHERE [idRH] = @idRH" InsertCommand="INSERT INTO [tbRH_vinculo] ([idCadastroEmpresa], [dsRH_vinculo], [dsvinculo]) VALUES (@idCadastroEmpresa, @dsRH_vinculo, @dsvinculo)"
        SelectCommand="SELECT [idRH], [idCadastroEmpresa], [dsRH_vinculo], [dsvinculo] FROM [tbRH_vinculo] WHERE ([idRH] = @idRH)"
        UpdateCommand="UPDATE [tbRH_vinculo] SET [idCadastroEmpresa] = @idCadastroEmpresa, [dsRH_vinculo] = @dsRH_vinculo, [dsvinculo] = @dsvinculo WHERE [idRH] = @idRH">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" DefaultValue="0" Name="idRH" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idRH" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="dsRH_vinculo" Type="String" />
            <asp:Parameter Name="dsvinculo" Type="String" />
            <asp:Parameter Name="idRH" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="dsRH_vinculo" Type="String" />
            <asp:Parameter Name="dsvinculo" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSourcetbuserType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTypeUser] FROM [tbuserType] WHERE ([apresenta] = @apresenta)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="apresenta" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

