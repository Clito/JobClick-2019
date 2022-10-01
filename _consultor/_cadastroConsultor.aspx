<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_cadastroConsultor.aspx.vb" Inherits="_empresa_cadastroConsultor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="idUser" 
                    DataSourceID="SqlDataSource3" Width="100%">
                    <EditItemTemplate>
                        <asp:TextBox ID="idCadastroEmpresaTextBox1" runat="server" 
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
                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Salvar atualização"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                            CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <br />
                        <asp:DropDownList ID="DropDownList6" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSource2" DataTextField="dsRH_vinculo" 
                            DataValueField="idRH" SelectedValue='<%# Bind("idRH") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="Nível de acesso:"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownListAcesso" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourcetbuserType" DataTextField="idTypeUser" 
                            DataValueField="idTypeUser" SelectedValue='<%# Bind("idTypeUser") %>'>
                        </asp:DropDownList>
                        <br />
                        Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="nomeTextBox" Display="Dynamic" 
                            ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("nome") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label14" runat="server" Text="User Name (Utilizado no Login)"></asp:Label>
                        <br />
                        <asp:TextBox ID="usernameTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("userName") %>'></asp:TextBox>
                        <br />
                        Senha de acesso (Password):<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator13" runat="server" ControlToValidate="passwordTextBox" 
                            Display="Dynamic" ErrorMessage="* Campo obrigatório!" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                            MaxLength="16" Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
                        <br />
                        E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" 
                            ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" 
                            ErrorMessage="* Informe um e-mail válido!" SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("email") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label15" runat="server" Text="Frase para recuperar senha:"></asp:Label>
                        <br />
                        <asp:TextBox ID="FraseTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("frase") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label16" runat="server" Text="DDD:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                            ControlToValidate="dddTextBox" ErrorMessage="DDD é obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dddTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("ddd") %>' Width="80px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="dddTextBox_MaskedEditExtender0" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                            TargetControlID="dddTextBox">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:Label ID="Label17" runat="server" Text="Telefone:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                            ControlToValidate="telefoneTextBox" ErrorMessage="Telefone é Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="telefoneTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("telefone") %>'></asp:TextBox>
                        <asp:MaskedEditExtender ID="telefoneTextBox_MaskedEditExtender0" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="99999\-9999" MaskType="Number" 
                            TargetControlID="telefoneTextBox" ClearMaskOnLostFocus="False">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:Label ID="Label18" runat="server" Text="CPF:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="CPFTextBox" ErrorMessage="CPF é Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CPFTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("cpf") %>'></asp:TextBox>
                        <asp:MaskedEditExtender ID="CPFTextBox_MaskedEditExtender0" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            InputDirection="RightToLeft" Mask="999\.999\.999\-99" MaskType="Number" 
                            TargetControlID="CPFTextBox" ClearMaskOnLostFocus="False">
                        </asp:MaskedEditExtender>
                        <br />
                        <asp:CheckBox ID="bloquearCheckBox0" runat="server" 
                            Checked='<%# Bind("bloquear") %>' Text="Bloquear acesso" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton0" runat="server" 
                            CausesValidation="False" CommandName="Cancel"
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
                        <asp:LinkButton ID="EditButton0" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Editar registro"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="DeleteButton0" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Quer realmente excluir este consultor?")' 
                            Text="Excluir"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir novo acesso (Consultor)"></asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/layout/setalat.gif" />
                        <asp:LinkButton ID="NewButton0" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir novo acesso (Consultor)"></asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:FormView>
                </td>
            </tr>
        </table>
        <br />
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
            <asp:ControlParameter ControlID="idUserLabel" Name="idUser" PropertyName="Text" 
                Type="Int32" />
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
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT idRH, idCadastroEmpresa, dsvinculo, dsRH_vinculo FROM tbRH_vinculo WHERE (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSourcetbuserType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            SelectCommand="SELECT idTypeUser FROM tbuserType WHERE (apresenta = @apresenta)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="apresenta" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

