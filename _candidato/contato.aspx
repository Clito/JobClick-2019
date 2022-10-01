<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="contato.aspx.vb" Inherits="_candidato_contato" title="Jobclick" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Telefones para contato" CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idTelefoneLabel" runat="server" Visible="False"></asp:Label>
            </td>
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
                <br />
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:GridView ID="GridViewCONTATO" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    CellPadding="0" DataKeyNames="idTelefone" DataSourceID="SqlLISTACONTATO" GridLines="None"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="ImageSMS" runat="server" ImageUrl="~/images/celularNO.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idTelefone" HeaderText="idTelefone" InsertVisible="False"
                            ReadOnly="True" SortExpression="idTelefone" Visible="False" />
                        <asp:TemplateField HeaderText="Tipo" SortExpression="idTipoTelefone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("idTipoTelefone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelTipo" runat="server" Text='<%# Bind("idTipoTelefone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idCadastroUser" SortExpression="idCadastroUser" Visible="False" />
                        <asp:BoundField DataField="ddd" HeaderText="DDD" SortExpression="ddd" />
                        <asp:BoundField DataField="numero" HeaderText="N&#250;mero" SortExpression="numero" />
                        <asp:BoundField DataField="ramal" HeaderText="Ramal" SortExpression="ramal" NullDisplayText="-" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                    CommandName="Select" Text="Editar"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="optin">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("optin") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelSMS" runat="server" Text='<%# Bind("optin", "{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        Além do seu nome e data de nascimento, nunca deixe de incluir informações completas
                        de endereço e telefone, além de endereço eletrônico.
                        <br />
                        <br />
                        <b>Lembre-se:</b>
                        <br />
                        Elas permitirão que você receba uma resposta ao envio do seu CV e ajudam a empresa
                        a escolher melhor o perfil do candidato.
                        <br />
                        (idade, local de residência etc).
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                &nbsp;<asp:FormView ID="FormViewCONTATO" runat="server" 
                    DataKeyNames="idTelefone" DataSourceID="SqlCONTATOFORM"
                    DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        <table ID="Contato0" cellpadding="5" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Tipo de telefone:"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DropDownListCsms" runat="server" AutoPostBack="True" 
                                        CssClass="DropCadFormCandidatoCV" DataSourceID="SqlTIPOTELEFONE" DataTextField="idTipoTelefone" 
                                        DataValueField="idTipoTelefone" 
                                        onselectedindexchanged="DropDownListCsms_SelectedIndexChanged1" 
                                        SelectedValue='<%# Bind("idTipoTelefone") %>' Width="300px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <table ID="Cadastrodetelefone0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Label ID="dddlabel" runat="server" Text="DDD:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="dddTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="dddTextBox" Display="Dynamic" ErrorMessage="* 99" 
                                                    SetFocusOnError="True" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:Label ID="numeroLabel" runat="server" Text="Número:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="numeroTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="numeroTextBox" Display="Dynamic" ErrorMessage="* 99999-9999" 
                                                    SetFocusOnError="True" ValidationExpression="([9_]{1})?\d{4}\-\d{4}"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="dddTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                    Text='<%# Bind("ddd") %>' Width="50px"></asp:TextBox>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="numeroTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                    Text='<%# Bind("numero") %>' Width="245px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Ramal:"></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="ramalTextBox" Display="Dynamic" 
                                        ErrorMessage="* Numérico até 5 dígitos" SetFocusOnError="True" 
                                        ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:TextBox ID="ramalTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                        Text='<%# Bind("ramal") %>' Width="308px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListSMS" runat="server" 
                                        SelectedValue='<%# Bind("optin", "{0}") %>' Visible="False">
                                        <asp:ListItem Selected="True" Value="1">Aceito receber SMS sobre Vagas</asp:ListItem>
                                        <asp:ListItem Value="0">Não quero receber SMS</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Update" 
                            CssClass="button" ToolTip="Clique aqui para salvar as alterações">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonEXCLUIR" runat="server" CausesValidation="False" 
                            CommandName="Delete" CssClass="button" 
                            onclientclick="return confirm(&quot;Deseja excluir este número de telefone?&quot;)" 
                            ToolTip="Clique aqui para excluir o telefone selecionado">Excluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button" 
                            PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Informe um telefone para contato" CssClass="button" 
                            ToolTip="Clique aqui para informar um ou mais telefones para contato"></asp:LinkButton>
                        <asp:LinkButton ID="linkbuttonMP" runat="server" CausesValidation="False" 
                            CssClass="button" ToolTip="Clique aqui para voltar ao menu principal" 
                            PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table ID="Contato" cellpadding="5" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Tipo de telefone:"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DropDownListCsms" runat="server" AutoPostBack="True" 
                                        CssClass="DropCadFormCandidatoCV" DataSourceID="SqlTIPOTELEFONE" DataTextField="idTipoTelefone" 
                                        DataValueField="idTipoTelefone" 
                                        onselectedindexchanged="DropDownListCsms_SelectedIndexChanged1" 
                                        SelectedValue='<%# Bind("idTipoTelefone") %>' Width="300px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <table ID="Cadastrodetelefone" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Label ID="dddlabel" runat="server" Text="DDD:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="dddTextBox" Display="Dynamic" ErrorMessage="DDD é obrigatório." 
                                                    SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:Label ID="numeroLabel" runat="server" Text="Número:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="numeroTextBox" Display="Dynamic" ErrorMessage="Número do telefone é obrigatório." 
                                                    SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="numeroTextBox" Display="Dynamic" ErrorMessage="O formato permitido é: 99999-9999" 
                                                    SetFocusOnError="True" ValidationExpression="([9_]{1})?\d{4}\-\d{4}">•</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="dddTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                    Text='<%# Bind("ddd") %>' Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="dddTextBox_MaskedEditExtender" runat="server" 
                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                    InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                    TargetControlID="dddTextBox">
                                                </asp:MaskedEditExtender>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="numeroTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                    Text='<%# Bind("numero") %>' Width="245px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="numeroTextBox_MaskedEditExtender" runat="server" 
                                                    ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                    InputDirection="RightToLeft" Mask="99999\-9999" MaskType="Number" 
                                                    TargetControlID="numeroTextBox">
                                                </asp:MaskedEditExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Ramal:"></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="ramalTextBox" Display="Dynamic" 
                                        ErrorMessage="Numérico até 5 dígitos" SetFocusOnError="True" 
                                        ValidationExpression="\d{1,5}">•</asp:RegularExpressionValidator>
                                    <br />
                                    <asp:TextBox ID="ramalTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                        Text='<%# Bind("ramal") %>' Width="308px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListSMS" runat="server" 
                                        SelectedValue='<%# Bind("optin", "{0}") %>' Visible="False">
                                        <asp:ListItem Selected="True" Value="1">Aceito receber SMS sobre Vagas</asp:ListItem>
                                        <asp:ListItem Value="0">Não quero receber SMS</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Insert" 
                            CssClass="button" 
                            ToolTip="Preencha os dados do formulário e clique aqui para salvar">Incluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                        <br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Informe outro telefone de contato"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
            </td> 
        </tr>
    </table> 
    <br />
    &nbsp;
    <asp:SqlDataSource ID="SqlLISTACONTATO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbTelefone] WHERE [idTelefone] = @idTelefone" 
        InsertCommand="INSERT INTO [tbTelefone] ([idTipoTelefone], [idCadastroUser], [ddd], [numero], [ramal]) VALUES (@idTipoTelefone, @idCadastroUser, @ddd, @numero, @ramal)"
        SelectCommand="SELECT idTelefone, idTipoTelefone, idCadastroUser, ddd, numero, ramal, optin FROM tbTelefone WHERE (idCadastroUser = @idCadastroUser)"
        
        
        UpdateCommand="UPDATE [tbTelefone] SET [idTipoTelefone] = @idTipoTelefone, [idCadastroUser] = @idCadastroUser, [ddd] = @ddd, [numero] = @numero, [ramal] = @ramal WHERE [idTelefone] = @idTelefone">
        <DeleteParameters>
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTIPOTELEFONE" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoTelefone] FROM [tbTipoTelefone]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCONTATOFORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbTelefone] WHERE [idTelefone] = @idTelefone" 
        InsertCommand="INSERT INTO tbTelefone(idTipoTelefone, idCadastroUser, ddd, numero, ramal, optin) VALUES (@idTipoTelefone, @idCadastroUser, @ddd, @numero, @ramal, @optin)"
        SelectCommand="SELECT idTelefone, idTipoTelefone, idCadastroUser, ddd, numero, ramal, optin FROM tbTelefone WHERE (idTelefone = @idTelefone)"
        
        
        UpdateCommand="UPDATE tbTelefone SET idTipoTelefone = @idTipoTelefone, idCadastroUser = @idCadastroUser, ddd = @ddd, numero = @numero, ramal = @ramal, optin = @optin WHERE (idTelefone = @idTelefone)">
        <DeleteParameters>
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
            <asp:Parameter Name="optin" />
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idTelefoneLabel" DefaultValue="0" 
                Name="idTelefone" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
            <asp:Parameter Name="optin" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

