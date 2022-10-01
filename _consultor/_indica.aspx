<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_indica.aspx.vb" Inherits="_gestor_indica" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:Label ID="idCVIndicadoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LabelCPF" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="DataLabel" runat="server"></asp:Label>
                    <table id="FormIndicaProf" cellpadding="5" cellspacing="5" width="100%">
                        <tr>
                            <td>
                    <asp:GridView ID="GridViewCliente" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                        BorderWidth="1px" DataKeyNames="idCadastroEmpresa,idCadastroEmpresa_Pai" 
                        DataSourceID="SqlEmpresa" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" 
                                Visible="False" />
                            <asp:ButtonField CommandName="Select" DataTextField="nmempresa" 
                                HeaderText="Clientes" Text="Button" />
                            <asp:BoundField DataField="nmempresa" HeaderText="Cliente" 
                                SortExpression="nmempresa" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa_Pai" 
                                HeaderText="idCadastroEmpresa_Pai" SortExpression="idCadastroEmpresa_Pai" 
                                Visible="False" />
                        </Columns>
                    </asp:GridView>
                                <br />
                                <asp:GridView ID="GridViewPSQProf" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idCadastroUser,nome,idcurriculo,email" DataSourceID="SqlCPF" 
                                    Visible="False" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Candidato localizado" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                    CommandName="Select" CssClass="msnOK" Text='<%# Eval("nome") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                                    Text="Status da pesquisa:"></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cpf" HeaderText="cpf" SortExpression="cpf" 
                                            Visible="False" />
                                        <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idCadastroUser" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" 
                                            Visible="False" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="LabelAvisoC" runat="server" CssClass="msn" 
                                            Text="Nenhum candidato na base de talentos com este CPF."></asp:Label>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <br />
                                <asp:Label ID="LabelCabec0" runat="server" CssClass="tituloEmpresa">Indicações enviadas:</asp:Label>
                                <asp:GridView ID="GridViewIndicado" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idCVIndicado" DataSourceID="SqlListaIndicado" Width="100%">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" Text="Excluir" 
                                                    onclientclick="return confirm(&quot;Quer excluir esta indicação?&quot;)"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="idCVIndicado" HeaderText="idCVIndicado" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idCVIndicado" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                            SortExpression="idCadastroEmpresa" Visible="False" />
                                        <asp:BoundField DataField="idCadastroEmpresaFilha" 
                                            HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idCurriculo" HeaderText="idCurriculo" 
                                            SortExpression="idCurriculo" Visible="False" />
                                        <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                                        <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                        <asp:BoundField DataField="mensagem" HeaderText="mensagem" 
                                            SortExpression="mensagem" Visible="False" />
                                        <asp:BoundField DataField="data" HeaderText="Indicado em" 
                                            SortExpression="data" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="LabelAviso" runat="server" 
                                            Text="Não existem indicações cadastradas"></asp:Label>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <br />
                                <asp:Panel ID="PanelFormularioIndica" runat="server">
                                    <asp:Label ID="LabelCabec1" runat="server" CssClass="tituloEmpresa">Formulário de indicações:</asp:Label>
                                    <br />
                                    <asp:Label ID="msn" runat="server" CssClass="msnOK"></asp:Label>
                                    <asp:Label ID="msnEmailCandidato" runat="server"></asp:Label>
                                    <br />
                                    <table cellpadding="0" cellspacing="0" ID="FormularioIndicador" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelCmp0" runat="server" Text="CPF:"></asp:Label>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="cpfTextBox" runat="server" CssClass="InputCad" 
                                                                Text='<%# Bind("cpf") %>' Width="280px" />
                                                            <asp:MaskedEditExtender ID="cpfTextBox_MaskedEditExtender" runat="server" 
                                                                ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                InputDirection="RightToLeft" Mask="999\.999\.999\-99" MaskType="Number" 
                                                                TargetControlID="cpfTextBox">
                                                            </asp:MaskedEditExtender>
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="ImageButtonPsq" runat="server" 
                                                                ImageUrl="~/images/layout/pesquisa.gif" CausesValidation="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelCmp1" runat="server" Text="Nome:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="nomeTextBox" ErrorMessage="Nome da indicação é obrigatório.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCad" 
                                                    Text='<%# Bind("nome") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="Para a vaga de: (Protocolo)"></asp:Label>
                                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ControlToValidate="ProtocoloIndTextBox" 
                                                    ErrorMessage="Informe a vaga para indicar.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="ProtocoloIndTextBox" runat="server" CssClass="InputCad" 
                                                    Width="280px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelCmp2" runat="server" Text="E-mail:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="emailTextBox" 
                                                    ErrorMessage="E-mail da indicação é obrigatório.">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="emailTextBox" ErrorMessage="Informe um e-mail válido." 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                <br />
                                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" 
                                                    Text='<%# Bind("email") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelCmp4" runat="server" Text="Apresentação do Candidato:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="apresentacaoTextBox" runat="server" CssClass="InputCad" 
                                                    Height="100px" Text='<%# Bind("apresentacao") %>' TextMode="MultiLine" 
                                                    Width="300px" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelCmp3" runat="server" Text="Mensagem ao Candidato:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="mensagemTextBox" 
                                                    ErrorMessage="Mensagem ao candidato é obrigatória.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="mensagemTextBox" runat="server" CssClass="InputCad" 
                                                    Height="100px" Text='<%# Bind("mensagem") %>' TextMode="MultiLine" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelCabec2" runat="server" CssClass="tituloEmpresa">Informe a Vaga:</asp:Label>
                                                <asp:GridView ID="GridViewVAGA" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" BorderStyle="None" 
                                                    DataKeyNames="idProcessoSeletivo,idVaga,Protocolo" DataSourceID="SqlVaga" 
                                                    GridLines="None" PageSize="5">
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                            ReadOnly="True" SortExpression="ID" Visible="False" />
                                                        <asp:TemplateField HeaderText="Protocolo (Vaga)" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                                    CommandName="Select" Text='<%# Eval("Protocolo") %>' 
                                                                    ToolTip='<%# Eval("dsCargo") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo (Vaga)" 
                                                            SortExpression="Protocolo" Visible="False" />
                                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                                            Visible="False" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelCmp5" runat="server" Text="Comentários:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="comentarioCVTextBox" runat="server" CssClass="InputCad" 
                                                    Height="100px" Text='<%# Bind("comentarioCV") %>' TextMode="MultiLine" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" 
                                                    Text="Ação a ser tomada no momento do cadastro da indicação:"></asp:Label>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="RadioButtonListincluirPS" 
                                                    ErrorMessage="A ação é obrigatória.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RadioButtonList ID="RadioButtonListincluirPS" runat="server">
                                                    <asp:ListItem Value="1">Incluir este Currículo no Processo.</asp:ListItem>
                                                    <asp:ListItem Value="0">Cadastrar a indicação.</asp:ListItem>
                                                    <asp:ListItem Value="3">Cadastrar a indicação e enviar e-mail para o Candidato</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ValidationSummary ID="ValidationSummaryInd" runat="server" 
                                                    ShowMessageBox="True" ShowSummary="False" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                                                    Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="1px" />
                                                <asp:TextBox ID="idCadastroEmpresaFilhaTextBox" runat="server" 
                                                    Text='<%# Bind("idCadastroEmpresaFilha") %>' Visible="False" Width="1px" />
                                                <asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' 
                                                    Visible="False" Width="1px" />
                                                <asp:TextBox ID="idCurriculoTextBox" runat="server" 
                                                    Text='<%# Bind("idCurriculo") %>' Visible="False" Width="1px" />
                                                <br />
                                                <asp:Button ID="ButtonCadastra" runat="server" Text="Cadastrar a indicação" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                                <asp:SqlDataSource ID="SqlCadastroIndica" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    InsertCommand="_USP_CADASTRA_INDICACAO_PROFISSIONAL" 
                                    InsertCommandType="StoredProcedure" 
                                    SelectCommand="_USP_CADASTRA_INDICACAO_PROFISSIONAL" 
                                    SelectCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                        <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
                                        <asp:Parameter Name="idVaga" Type="Int32" />
                                        <asp:Parameter Name="idCurriculo" Type="Int32" />
                                        <asp:Parameter Name="cpf" Type="String" />
                                        <asp:Parameter Name="nome" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="mensagem" Type="String" />
                                        <asp:Parameter Name="incluirPS" Type="Int32" />
                                        <asp:Parameter Name="Protocolo" Type="String" />
                                        <asp:Parameter Name="apresentacao" Type="String" />
                                        <asp:Parameter Name="comentarioCV" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idCadastroEmpresaFilha" 
                                            SessionField="idCadastroEmpresaFilha" Type="Int32" />
                                        <asp:Parameter Name="idVaga" Type="Int32" />
                                        <asp:Parameter Name="idCurriculo" Type="Int32" />
                                        <asp:Parameter Name="cpf" Type="String" />
                                        <asp:Parameter Name="nome" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="mensagem" Type="String" />
                                        <asp:Parameter Name="incluirPS" Type="Int32" />
                                        <asp:Parameter Name="Protocolo" Type="String" />
                                        <asp:Parameter Name="apresentacao" Type="String" />
                                        <asp:Parameter Name="comentarioCV" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlListaIndicado" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_LISTA_INDICACAO_PROFISSIONAL" 
                                    SelectCommandType="StoredProcedure" 
                                    DeleteCommand="_USP_CADASTRA_INDICACAO_PROFISSIONAL_EXCLUIR" 
                                    DeleteCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="idCVIndicado" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idCadastroEmpresaFilha" 
                                            SessionField="idCadastroEmpresaFilha" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) OR (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlCPF" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PESQUISA_PROFISSIONAL_CFP" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cpfTextBox" Name="cpf" PropertyName="Text" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_LISTA_INDICACAO_PROFISSIONAL_FORMULARIO" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                SessionField="idCadastroEmpresaFilha" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>

