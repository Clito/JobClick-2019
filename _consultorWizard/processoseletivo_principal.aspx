<%@ Page Title="" Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="false" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" CodeFile="processoseletivo_principal.aspx.vb" Inherits="_empresa_processoseletivo_principal" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_processo.gif" />
    <br />
    <table width="720" cellpadding="0" cellspacing="0" id="Processo">
        <tr>
            <td width="26"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="694">
                <asp:Label ID="LabelPS0" runat="server" Text="Cadastro de Processo(s) Seletivo(s)" 
                    CssClass="titulo"></asp:Label>
                <br />
                <table id="DropDownTable" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" valign="top" width="50%">
                            <asp:Label ID="Passo1Label" runat="server" CssClass="tituloEmp" 
                                Text="Passo 1 (um) - Selecionar uma Vaga:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListSelectEmpresa" runat="server" 
                                CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                                DataValueField="idCadastroEmpresa" ValidationGroup="SelectEmpresa" 
                                AutoPostBack="True">
                            </asp:DropDownList></td>
                        <td align="center" width="50%">
                            <asp:GridView ID="GridViewVAGA" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" BorderStyle="None" 
                                DataKeyNames="idProcessoSeletivo,idVaga,idRH_Gestor" DataSourceID="SqlVaga" 
                                GridLines="None" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="Protocolo (Vaga)" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
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
                                    <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                        SortExpression="idRH_Gestor" Visible="False" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:GridView ID="GridViewListaProcessoSeletivo" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="idProcessoSeletivo,idFaseProcessoSeletivo" 
                    DataSourceID="SqlPSVisaoGeral" Width="100%" BorderColor="Silver" 
                    BorderStyle="Dotted" BorderWidth="1px" GridLines="None">
                    <AlternatingRowStyle BorderColor="Silver" BorderStyle="Dotted" 
                        BorderWidth="1px" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonSel" runat="server" CausesValidation="False" 
                                    CommandName="Select" Text="Excluir Fase"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nome" HeaderText="Consultor" SortExpression="nome" 
                            Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idProcessoSeletivo" 
                            Visible="False" />
                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                            Visible="False" />
                        <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                            SortExpression="idRH_Gestor" Visible="False" />
                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                            SortExpression="idSetup" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="dsProcesso" HeaderText="Processo Seletivo" 
                            SortExpression="dsProcesso" Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="Criado em:" SortExpression="data" 
                            Visible="False" />
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" />
                        <asp:BoundField DataField="dataIni" HeaderText="Inicia em" 
                            SortExpression="dataIni" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="dataFim" HeaderText="Finaliza em" 
                            SortExpression="dataFim" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="dsFase" HeaderText="Fases" SortExpression="dsFase" />
                        <asp:BoundField DataField="idFaseProcessoSeletivo" 
                            HeaderText="idFaseProcessoSeletivo" InsertVisible="False" 
                            SortExpression="idFaseProcessoSeletivo" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelNavegador" runat="server">
                    <table id="NavegadorPS" cellpadding="0" cellspacing="0" 
    width="100%">
                        <tr>
                            <td align="center" width="50%">
                                <asp:Label ID="Passo2Label" runat="server" CssClass="tituloEmp" 
                                    Text="Passo 2 (dois) - Cadastrar Processo Seletivo:" Visible="False"></asp:Label>
                                <br />
                                <asp:ImageButton ID="ImageButtonPS" runat="server" 
                CausesValidation="False" ImageUrl="~/images/layout/btIncProcessoSeletivo.png" 
                                    Visible="False" />
                            </td>
                            <td align="center" width="50%">
                                <asp:Label ID="Passo3Label" runat="server" CssClass="tituloEmp" 
                                    Text="Feito Passo 2 (dois);&lt;br&gt;Passo 3 (tres) - Cadastrar Fases do Processo Seletivo:" 
                                    Visible="False"></asp:Label>
                                <br />
                                <asp:ImageButton ID="ImageButtonFPS" runat="server" 
                CausesValidation="False" 
                ImageUrl="~/images/layout/btIncFasesProcessoSeletivo.png" Visible="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                    <asp:Label ID="msnLabel" runat="server" CssClass="msn"></asp:Label>
                <br />
                <asp:Panel ID="PanelProcessoSeletivoCompleto" runat="server" Visible="False">
                    <table cellpadding="2" cellspacing="0" ID="FormProcessoSeletivoTb" width="100%">
                        <tr>
                            <td align="left" bgcolor="#84C7E7">
                                <asp:Label ID="LabelPS3" runat="server" 
                                    Text="Informe os dados do Processo Seletivo" Font-Bold="True"></asp:Label>
                            </td>
                            <td bgcolor="#84C7E7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 22px">
                                <asp:Label ID="LabelQualVaga" runat="server" 
                                    Text="A qual vaga este Processo pertence?"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="DropDownListVaga" 
                                    ErrorMessage="Informe a vaga, se não existir crie primeiro a Vaga.">*</asp:RequiredFieldValidator>
                            </td>
                            <td style="height: 22px">
                                <asp:DropDownList ID="DropDownListVaga" runat="server" CssClass="DropCad" 
                                    DataSourceID="SqlVaga" DataTextField="Protocolo" DataValueField="idVaga" 
                                    ondatabound="DropDownListVaga_DataBound" Width="250px" Enabled="False">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelGestor" runat="server" 
                                    Text="A qual Consultor este Processo Seletivo estará vinculado?"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="DropDownListConsultor" 
                                    ErrorMessage="Informe o Consultor">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListConsultor" runat="server" CssClass="DropCad" 
                                    DataSourceID="SqlGestor" DataTextField="nome" DataValueField="idRH_Gestor" 
                                    ondatabound="DropDownListConsultor_DataBound" 
                                    Width="250px" Enabled="False">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelNomeProcesso" runat="server" 
                                    Text="Nome do Processo Seletivo para identificação apenas:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="dsProcessoTextBox" 
                                    ErrorMessage="Informe um nome para o Processo Seletivo">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="dsProcessoTextBox" runat="server" CssClass="InputCad" 
                                    Width="243px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelData" runat="server" Text="Data do ínicio do Processo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="dataTextBox" 
                                    ErrorMessage="Informe a data de início do Processo Seletivo">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="dataTextBox" runat="server" CssClass="InputCad" 
                                    Width="243px" />
                                <asp:CalendarExtender ID="dataTextBox_CalendarExtender" runat="server" 
                                    Enabled="True" Format="dd/M/yyyy" TargetControlID="dataTextBox" 
                                    PopupButtonID="ImageButtonCP">
                                </asp:CalendarExtender>
                                <asp:ImageButton ID="ImageButtonCP" runat="server" 
                                    ImageUrl="~/images/candidato/buttonCalendario.png" 
                                    CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelProcessoSeletivoFases" runat="server" Width="100%" 
                    Visible="False">
                <table cellpadding="2" cellspacing="0" ID="FormProcessoSeletivo" width="100%">
                        <tr>
                            <td align="left" bgcolor="#84C7E7">
                                <asp:Label ID="LabelPS2" runat="server" 
                                    Text="Fases do Processo Seletivo" Font-Bold="True"></asp:Label>
                            </td>
                            <td bgcolor="#84C7E7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelFase" runat="server" 
                                    Text="Informe a fase do Processo Seletivo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="DropDownListFase" ErrorMessage="Informe a Fase.">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListFase" runat="server" CssClass="DropCad" 
                                    DataSourceID="SqlDataSourceFasesdoProcesso" DataTextField="dsFase" 
                                    DataValueField="idTipoFaseProcessoSeletivo" Width="250px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelInicio" runat="server" 
                                    Text="Informe a data de início desta fase:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="dataIniTextBox" 
                                    ErrorMessage="Informe a data de início da fase.">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="dataIniTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("dataIni") %>' Width="243px" />
                                <asp:CalendarExtender ID="dataIniTextBox_CalendarExtender" runat="server" 
                                    Enabled="True" PopupButtonID="ImageButtonI" TargetControlID="dataIniTextBox">
                                </asp:CalendarExtender>
                                <asp:MaskedEditExtender ID="dataIniTextBox_MaskedEditExtender" runat="server" 
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                    InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" 
                                    TargetControlID="dataIniTextBox">
                                </asp:MaskedEditExtender>
                                <asp:ImageButton ID="ImageButtonI" runat="server" CausesValidation="False" 
                                    ImageUrl="~/images/candidato/buttonCalendario.png" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="LabelInicio0" runat="server" 
                                    Text="Informe a data prevista para o encerramento desta fase:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="dataFimTextBox" 
                                    ErrorMessage="Informe a data prevista de encerramento da fase">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="dataFimTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("dataFim") %>' Width="243px" />
                                <asp:CalendarExtender ID="dataFimTextBox_CalendarExtender" runat="server" 
                                    Enabled="True" PopupButtonID="ImageButtonT" TargetControlID="dataFimTextBox">
                                </asp:CalendarExtender>
                                <asp:MaskedEditExtender ID="dataFimTextBox_MaskedEditExtender" runat="server" 
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                    InputDirection="RightToLeft" Mask="99/99/9999" MaskType="Date" 
                                    TargetControlID="dataFimTextBox">
                                </asp:MaskedEditExtender>
                                <asp:ImageButton ID="ImageButtonT" runat="server" CausesValidation="False" 
                                    ImageUrl="~/images/candidato/buttonCalendario.png" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Labelmsn1" runat="server" Text="Mensagem aos aprovados na fase:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="mensagemAprovadoTextBox" 
                                    ErrorMessage="Escreva a mensagem aos aprovados.">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="mensagemAprovadoTextBox" runat="server" CssClass="InputCad" 
                                    Height="80px" Text='<%# Bind("mensagemAprovado") %>' TextMode="MultiLine" 
                                    Width="243px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Labelmsn2" runat="server" 
                                    Text="Mensagem aos reprovados na fase:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="mensagemReprovadoTextBox" 
                                    ErrorMessage="Escreva a mensagem aos reprovados.">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="mensagemReprovadoTextBox" runat="server" CssClass="InputCad" 
                                    Height="80px" Text='<%# Bind("mensagemAprovado") %>' TextMode="MultiLine" 
                                    Width="243px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="ButtonSalvar" runat="server" CssClass="cur01st" Text="Salvar" />
                                <asp:Button ID="ButtonHideForm" runat="server" CausesValidation="False" 
                                    CssClass="cur01st" Text="Cancelar" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummaryPSinc" runat="server" 
                        ShowMessageBox="True" />
                </asp:Panel>
                <asp:SqlDataSource ID="SqlPSVisaoGeral" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PROCESSOSELETIVO_LISTA_TODOS" 
                    SelectCommandType="StoredProcedure" 
                    DeleteCommand="_USP_PROCESSOSELETIVO_LISTA_EXCLUIR" 
                    DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="idFaseProcessoSeletivo" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlGestor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idRH_Gestor], [nome], [idCadastroEmpresa] FROM [tbRH_Gestor] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceFasesdoProcesso" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idTipoFaseProcessoSeletivo], [idSetup], [dsFase] FROM [tbTipoFaseProcessoSeletivo] WHERE ([idSetup] = @idSetup)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
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
            </td>
        </tr>
    </table> 
</asp:Content>

