<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="ajuda.aspx.vb" Inherits="_parceiroJobClick_ajuda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Você está precisando de ajuda?"></asp:Label>
                <div id="FormGeral">
                    <asp:Label ID="Label_Contato" runat="server" CssClass="titulo"></asp:Label> <br /><br />
                    
                    <asp:Label ID="LabelDesc" runat="server" 
                        Text="1. Informe os dados no formulário abaixo.&lt;br&gt;2. Clique em enviar."></asp:Label><br />
                    <br /><br />

                    <asp:Panel ID="PanelStatus" runat="server" Visible="False" HorizontalAlign="Center">
                        <asp:Label ID="msnLabel" runat="server" CssClass="titulo"></asp:Label>
                        <br />
                        <asp:Image ID="ImageStatusEmail" runat="server" 
                            ImageUrl="~/images/emailEnviado.png" />
                    </asp:Panel>
                    <br />
                    <asp:FormView ID="FormViewContato" runat="server" DataKeyNames="idOrcamento" 
                        DataSourceID="SqlOrcamento" DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            idOrcamento:
                            <asp:Label ID="idOrcamentoLabel1" runat="server" 
                                Text='<%# Eval("idOrcamento") %>' />
                            <br />
                            NomeEmpresa:
                            <asp:TextBox ID="NomeEmpresaTextBox" runat="server" 
                                Text='<%# Bind("NomeEmpresa") %>' />
                            <br />
                            CNPJ:
                            <asp:TextBox ID="CNPJTextBox" runat="server" Text='<%# Bind("CNPJ") %>' />
                            <br />
                            VagasMes:
                            <asp:TextBox ID="VagasMesTextBox" runat="server" 
                                Text='<%# Bind("VagasMes") %>' />
                            <br />
                            NomeContato:
                            <asp:TextBox ID="NomeContatoTextBox" runat="server" 
                                Text='<%# Bind("NomeContato") %>' />
                            <br />
                            CargoContato:
                            <asp:TextBox ID="CargoContatoTextBox" runat="server" 
                                Text='<%# Bind("CargoContato") %>' />
                            <br />
                            EmailContato:
                            <asp:TextBox ID="EmailContatoTextBox" runat="server" 
                                Text='<%# Bind("EmailContato") %>' />
                            <br />
                            TelefoneContato:
                            <asp:TextBox ID="TelefoneContatoTextBox" runat="server" 
                                Text='<%# Bind("TelefoneContato") %>' />
                            <br />
                            Mensagem:
                            <asp:TextBox ID="MensagemTextBox" runat="server" 
                                Text='<%# Bind("Mensagem") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                        <table id="figura" style="padding:2px; margin: 2px; width:800px">
                            <tr>
                                <td width="700px">
                                        <table id="FORM" style="padding:2px; margin: 2px; width:700px">
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="NomeEmpresaTextBox" 
                                                        ErrorMessage="Razão Social ou Fantasia é obrigatório.">*</asp:RequiredFieldValidator>
                                                    <asp:Label ID="Label1" runat="server" Text="Nome da empresa:"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width:400px">
                                                    <asp:TextBox ID="NomeEmpresaTextBox" runat="server" CssClass="simple" 
                                                        Text='<%# Bind("NomeEmpresa") %>' Width="400px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                        ControlToValidate="NomeContatoTextBox" 
                                                        ErrorMessage="O nome para contato é obrigatório.">*</asp:RequiredFieldValidator>
                                                    <asp:Label ID="Label4" runat="server" Text="Nome do contato:"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 400px">
                                                    <asp:TextBox ID="NomeContatoTextBox" runat="server" CssClass="simple" 
                                                        Text='<%# Bind("NomeContato") %>' Width="400px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                        ControlToValidate="CargoContatoTextBox" ErrorMessage="Cargo é obrigatório.">*</asp:RequiredFieldValidator>
                                                    <asp:Label ID="Label6" runat="server" Text="Cargo:"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 400px">
                                                    <asp:TextBox ID="CargoContatoTextBox" runat="server" CssClass="simple" 
                                                        Text='<%# Bind("CargoContato") %>' Width="400px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                        ControlToValidate="EmailContatoTextBox" ErrorMessage="Informe e-mail válido." 
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                        ControlToValidate="EmailContatoTextBox" ErrorMessage="E-mail é obrigatório.">*</asp:RequiredFieldValidator>
                                                    <asp:Label ID="Label5" runat="server" Text="E-mail:"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 400px">
                                                    <asp:TextBox ID="EmailContatoTextBox" runat="server" CssClass="simple" 
                                                        Text='<%# Bind("EmailContato") %>' Width="400px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; vertical-align: top">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                        ControlToValidate="TelefoneContatoTextBox" 
                                                        ErrorMessage="Telefone é obrigatório.">*</asp:RequiredFieldValidator>
                                                    <asp:Label ID="Label7" runat="server" Text="Telefone para contato:"></asp:Label>
                                                </td>
                                                <td style="text-align: left; width: 400px">
                                                    <table style="padding: 0px; margin: 0px">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label9" runat="server" Text="DDD"></asp:Label>
                                                                <br />
                                                                <asp:TextBox ID="TextBoxDDD" runat="server" onkeyup="formataInteiro(this,event);" style="text-align:left" CssClass="simple" 
                                                                    MaxLength="2" Width="50px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="Label10" runat="server" Text="Número"></asp:Label>
                                                                <br />
                                                                <asp:TextBox ID="TelefoneContatoTextBox" runat="server" 
                                                                    onkeyup="formataInteiro(this,event);" style="text-align:left" CssClass="simple" 
                                                                    Text='<%# Bind("TelefoneContato") %>' Width="120px" MaxLength="10" />
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="Label11" runat="server" Text="Ramal"></asp:Label>
                                                                <br />
                                                                <asp:TextBox ID="TextBoxRAMAL" runat="server" 
                                                                    onkeyup="formataInteiro(this,event);" style="text-align:left" CssClass="simple" 
                                                                    Width="50px" MaxLength="4"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; vertical-align: top">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                        ControlToValidate="RadioButtonListMENSAGEM" 
                                                        ErrorMessage="Informe qual departamento.">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td style="text-align: left; width: 400px">
                                                    <asp:RadioButtonList ID="RadioButtonListMENSAGEM" runat="server" 
                                                        ToolTip="Informe qual departamento">
                                                        <asp:ListItem Value="comercial@jobclick.com.br">Departamento Comercial</asp:ListItem>
                                                        <asp:ListItem Value="imprensa@jobclick.com.br">Assessoria de Imprensa </asp:ListItem>
                                                        <asp:ListItem Value="administrativo@jobclick.com.br">Departamento Administrativo/Financeiro</asp:ListItem>
                                                        <asp:ListItem Value="juridico@jobclick.com.br">Departamento Jurídico</asp:ListItem>
                                                        <asp:ListItem Value="outros@jobclick.com.br">Outros (*) Informe no corpo do e-mail.</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <br />
                                                    <asp:Label ID="Label8" runat="server" 
                                                        Text="&lt;b&gt;Digite abaixo sua mensagem&lt;/b&gt;&lt;br&gt;&lt;i&gt;Por favor, não utilize esta mensagem para enviar o seu currículo. Para cadastrá-lo no JobClick, &lt;a href='/_anonimo/cadastroCandidato.aspx'&gt;clique aqui&lt;/a&gt;.&lt;/i&gt;"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    &nbsp;</td>
                                                <td style="text-align: left; width: 400px">
                                                    <asp:TextBox ID="MensagemTextBox" runat="server" CssClass="simple" 
                                                        Height="80px" Text='<%# Bind("Mensagem") %>' TextMode="MultiLine" 
                                                        Width="400px" />
                                                    <br />
                                                    <asp:Label ID="Label12" runat="server" Text="Máximo de 1200 caracteres"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    &nbsp;</td>
                                                <td style="text-align: left; width: 400px">
                                                    <asp:ValidationSummary ID="ValidationSummaryOrc" runat="server" 
                                                        ShowMessageBox="True" ShowSummary="False" />
                                                    <asp:Button ID="ButtonOrc" runat="server" CommandName="Insert" Text="Enviar" 
                                                        CssClass="button" 
                                                        ToolTip="Preencha o formulário acima e clique aqui para enviar" />
                                                    <asp:LinkButton ID="LinkButtonSair" runat="server" CausesValidation="False" CssClass="button" PostBackUrl="~/_parceiroJobClick/Default.aspx" ToolTip="Sair">Sair</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                               </td>
                                <td valign="top" width="100%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            idOrcamento:
                            <asp:Label ID="idOrcamentoLabel" runat="server" 
                                Text='<%# Eval("idOrcamento") %>' />
                            <br />
                            NomeEmpresa:
                            <asp:Label ID="NomeEmpresaLabel" runat="server" 
                                Text='<%# Bind("NomeEmpresa") %>' />
                            <br />
                            CNPJ:
                            <asp:Label ID="CNPJLabel" runat="server" Text='<%# Bind("CNPJ") %>' />
                            <br />
                            VagasMes:
                            <asp:Label ID="VagasMesLabel" runat="server" Text='<%# Bind("VagasMes") %>' />
                            <br />
                            NomeContato:
                            <asp:Label ID="NomeContatoLabel" runat="server" 
                                Text='<%# Bind("NomeContato") %>' />
                            <br />
                            CargoContato:
                            <asp:Label ID="CargoContatoLabel" runat="server" 
                                Text='<%# Bind("CargoContato") %>' />
                            <br />
                            EmailContato:
                            <asp:Label ID="EmailContatoLabel" runat="server" 
                                Text='<%# Bind("EmailContato") %>' />
                            <br />
                            TelefoneContato:
                            <asp:Label ID="TelefoneContatoLabel" runat="server" 
                                Text='<%# Bind("TelefoneContato") %>' />
                            <br />
                            Mensagem:
                            <asp:Label ID="MensagemLabel" runat="server" Text='<%# Bind("Mensagem") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlOrcamento" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        DeleteCommand="DELETE FROM [_tbOrcamento] WHERE [idOrcamento] = @idOrcamento" 
                        InsertCommand="INSERT INTO [_tbOrcamento] ([NomeEmpresa], [CNPJ], [VagasMes], [NomeContato], [CargoContato], [EmailContato], [TelefoneContato], [Mensagem], [TipoOrcamento]) VALUES (@NomeEmpresa, @CNPJ, @VagasMes, @NomeContato, @CargoContato, @EmailContato, @TelefoneContato, @Mensagem, @TipoOrcamento)" 
                        SelectCommand="SELECT [idOrcamento], [NomeEmpresa], [CNPJ], [VagasMes], [NomeContato], [CargoContato], [EmailContato], [TelefoneContato], [Mensagem], [TipoOrcamento] FROM [_tbOrcamento]" 
    
                            UpdateCommand="UPDATE [_tbOrcamento] SET [NomeEmpresa] = @NomeEmpresa, [CNPJ] = @CNPJ, [VagasMes] = @VagasMes, [NomeContato] = @NomeContato, [CargoContato] = @CargoContato, [EmailContato] = @EmailContato, [TelefoneContato] = @TelefoneContato, [Mensagem] = @Mensagem, [TipoOrcamento] = @TipoOrcamento WHERE [idOrcamento] = @idOrcamento">
                        <DeleteParameters>
                            <asp:Parameter Name="idOrcamento" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="NomeEmpresa" Type="String" />
                            <asp:Parameter Name="CNPJ" Type="String" />
                            <asp:Parameter Name="VagasMes" Type="Int32" />
                            <asp:Parameter Name="NomeContato" Type="String" />
                            <asp:Parameter Name="CargoContato" Type="String" />
                            <asp:Parameter Name="EmailContato" Type="String" />
                            <asp:Parameter Name="TelefoneContato" Type="String" />
                            <asp:Parameter Name="Mensagem" Type="String" />
                            <asp:Parameter Name="TipoOrcamento" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NomeEmpresa" Type="String" />
                            <asp:Parameter Name="CNPJ" Type="String" />
                            <asp:Parameter Name="VagasMes" Type="Int32" />
                            <asp:Parameter Name="NomeContato" Type="String" />
                            <asp:Parameter Name="CargoContato" Type="String" />
                            <asp:Parameter Name="EmailContato" Type="String" />
                            <asp:Parameter Name="TelefoneContato" Type="String" />
                            <asp:Parameter Name="Mensagem" Type="String" />
                            <asp:Parameter Name="TipoOrcamento" Type="String" />
                            <asp:Parameter Name="idOrcamento" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    Telefone: (11) 2459-0286 <br />
                    e-mail: <a href="mailto:comercial@jobclick.com.br">comercial@jobclick.com.br</a>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div> 
        </div>
</asp:Content>

