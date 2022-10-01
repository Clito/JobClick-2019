<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="formacaoAcademica.aspx.vb" Inherits="_candidato_formacaoAcademica" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
    <link href="../scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=InstituicaoTextBox.ClientID%>").autocomplete("AutocompleteData.ashx");
            $("#<%=CidadeTextBox.ClientID%>").autocomplete("AutocompleteDataCidade.ashx");
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "formacaoAcademica.aspx" } });
        });
	</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Formação Acadêmica" CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idInstituicaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="ufLabel" runat="server"></asp:Label>
                <asp:Label ID="cidadeLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idFormacaoLabel" runat="server" Visible="False">0</asp:Label>
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

            <table width="720px" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td width="30px">
                        <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
                    <td width="690px" align="left">
                        <br />
                        <asp:DataList ID="DataListESCOLA" runat="server" DataSourceID="SqlInstituicao" 
                            Width="100%" DataKeyField="idFormacao">
                            <ItemTemplate>
                                <table ID="ESCOLA" cellpadding="1" cellspacing="1" width="750px">
                                    <tr>
                                        <td bgcolor="#EEEEEE" width="450px">
                                            <asp:Label ID="dsinstituicaoLabel" runat="server" CssClass="textSite" 
                                                Text='<%# Eval("dsinstituicao") %>' />
                                        </td>
                                        <td width="300px">
                                            <asp:Label ID="dsTipoFormacaoLabel" runat="server" CssClass="textSite" 
                                                Text='<%# Eval("dsTipoFormacao") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#EEEEEE" valign="top" width="450px">
                                            <asp:Label ID="Label1" runat="server" Text="Curso:"></asp:Label>
                                            <asp:Label ID="dsCursoLabel" runat="server" Text='<%# Eval("dsCurso") %>' />
                                        </td>
                                        <td width="300px">
                                            <table ID="DATA" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Data de início:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" CssClass="cur01st" 
                                                            Text="Data de término:"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="data_iniLabel" runat="server" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="data_fimLabel" runat="server" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#EEEEEE" width="450px">
                                            &nbsp;</td>
                                        <td width="300px">
                                            <asp:Label ID="Label4" runat="server" CssClass="cur01st" Text="Local:"></asp:Label>
                                            <br />
                                            <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#EEEEEE" width="450px" height="30px">
                                            <asp:LinkButton ID="linkbuttonEditar" runat="server" CausesValidation="False" 
                                                CommandName="Select" CssClass="button">Editar</asp:LinkButton>
                                            <br />
                                        </td>
                                        <td width="300px">
                                            <asp:Label ID="Label5" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                            <br />
                                            <asp:Label ID="obsLabel" runat="server" Text='<%# Eval("obs") %>' />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Image ID="ImageLinha" runat="server" 
                                    ImageUrl="~/images/layoutNew/linha.png" />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <br />
                        <asp:Panel ID="PanelPRINCIPAL" runat="server">
                            <asp:LinkButton ID="LinkButtonINCLUIR" runat="server" 
    CausesValidation="False" CssClass="button">Informar outra formação acadêmica</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonMP0" runat="server" CausesValidation="False" 
                                CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                        </asp:Panel>
                        <asp:Panel ID="PanelIncluir" runat="server" Visible="False">
                            <table  width="100%" id="InfoEscola" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td align="right" width="100px" valign="top">
                                        <asp:Label ID="LabelInst0" runat="server" Text="Nome da Escola:"></asp:Label>
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="InstituicaoTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorProximo" runat="server" 
                                            ControlToValidate="InstituicaoTextBox" Display="Dynamic" 
                                            ErrorMessage="Informe uma instituição educacional">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100px">
                                        &nbsp;</td>
                                    <td>
                                        <br />
                                        <asp:LinkButton ID="LinkButtonProximo" runat="server" CssClass="button" 
                                            ToolTip="Informe o nome da escola e clique aqui para proceguir">Próximo passo</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonMP1" runat="server" CausesValidation="False" 
                                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="PanelCidade" runat="server" Visible="False" Width="100%">
                                <table ID="PESQUISA" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="right" width="100px" valign="top">
                                            <asp:Label ID="LabelInst" runat="server" Text="Instituição:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListCURSO" runat="server" 
                                                AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                                DataSourceID="SqlInstituicaoTIPO" DataTextField="dsTipo" 
                                                DataValueField="identidadeTipo">
                                                <asp:ListItem Value="">-- Selecione --</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="DropDownListCURSO" 
                                                ErrorMessage="Informe o tipo de instituição">•</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="100px" valign="top">
                                            <asp:Label ID="LabelCidade" runat="server" Text="Cidade:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CidadeTextBox" runat="server" 
                                                CssClass="InputCadFormCandidatoCV"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="CidadeTextBox" Display="Dynamic" 
                                                ErrorMessage="Informe aonde fica sua instituição" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="PanelFORMULARIO_INC" runat="server" Visible="False">
                            <table ID="INSERTFORMACAO" cellpadding="2" cellspacing="2" width="100%">
                                <tr>
                                    <td align="right" width="100" valign="top">
                                        <asp:Label ID="Label7" runat="server" Text="Formação:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListTipoFormacao" runat="server" 
                                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlTIPOFORMACAO" 
                                            DataTextField="dsTipoFormacao" DataValueField="idTipoFormacao" 
                                            AppendDataBoundItems="True">
                                            <asp:ListItem Value="">-- Selecione --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="DropDownListTipoFormacao" 
                                            ErrorMessage="Informe qual o nível de sua formação">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100" valign="top">
                                        <asp:Label ID="Label8" runat="server" Text="Curso:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dsCursoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Text=""></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="dsCursoTextBox" Display="Dynamic" 
                                            ErrorMessage="Escreva o nome do Curso" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1" width="100">
                                        </td>
                                    <td class="style1">
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style1" align="right" width="100" valign="top">
                                        <asp:Label ID="Label9" runat="server" Text="Observações:"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="obsTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="50px" Text="" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" width="100" valign="top">
                                        <asp:Label ID="Label10" runat="server" Text="Início:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="data_iniTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("data_ini", "{0:d}") %>' 
                                            Width="150px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" format="dd/M/yyyy" 
                                            targetcontrolid="data_iniTextBox" DefaultView="Years">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="data_iniTextBox" 
                                            ErrorMessage="Informe a data de início do curso">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100" valign="top">
                                        <asp:Label ID="Label11" runat="server" Text="Término:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="data_fimTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("data_fim", "{0:d}") %>' 
                                            Width="150px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" format="dd/M/yyyy" 
                                            targetcontrolid="data_fimTextBox" DefaultView="Years">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="data_fimTextBox" 
                                            ErrorMessage="Informe a data do término do curso">•</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="Label12" runat="server" 
                                            Text="Se ainda estiver cursando informe uma data de previsão do encerramento do curso"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" width="100">
                                        &nbsp;</td>
                                    <td>
                                        <asp:LinkButton ID="LinkButtonSalvar" runat="server" CssClass="button" 
                                            ToolTip="Clique aqui para salvar sua formação acadêmica">Salvar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonINCCANCELAR" runat="server" 
                                            CausesValidation="False" CssClass="button">Cancelar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                        <br />
                                        <br />
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="PanelFORMFORMACAO" runat="server" BackColor="#EEEEEE">
                            <asp:FormView ID="FormViewFORMACAO" runat="server" DataKeyNames="idFormacao" 
                                DataSourceID="SqlFormacaoFORM" DefaultMode="Edit" Width="100%">
                                <EditItemTemplate>
                                    &nbsp;<br />&nbsp;<br /><table ID="FormFormacao" cellpadding="2" 
                                        cellspacing="2" width="100%">
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                <asp:Label ID="Label8" runat="server" Text="Curso:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="dsCursoTextBox" runat="server" 
                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("dsCurso") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="dsCursoTextBox" Display="Dynamic" 
                                                    ErrorMessage="Escreva o nome do Curso" SetFocusOnError="True">•</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                <asp:Label ID="Label9" runat="server" Text="Observações:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="obsTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                    Height="50px" Text='<%# Bind("obs") %>' TextMode="MultiLine" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                <asp:Label ID="Label10" runat="server" Text="Início:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="FORMdata_iniTextBox" runat="server" 
                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("data_ini", "{0:d}") %>' 
                                                    Width="150px" />
                                                <cc1:CalendarExtender ID="FORMdata_iniTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" TargetControlID="FORMdata_iniTextBox">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="FORMdata_iniTextBox" 
                                                    ErrorMessage="Informe a data de início do curso">•</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="FORMdata_iniTextBox" ErrorMessage="Data de início inválida!" 
                                                    ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$">•</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                <asp:Label ID="Label11" runat="server" Text="Término:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="FORMdata_fimTextBox" runat="server" 
                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("data_fim", "{0:d}") %>' 
                                                    Width="150px" />
                                                <cc1:CalendarExtender ID="FORMdata_fimTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" TargetControlID="FORMdata_fimTextBox">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                    ControlToValidate="FORMdata_fimTextBox" 
                                                    ErrorMessage="Informe a data do término do curso">•</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                    ControlToValidate="FORMdata_fimTextBox" 
                                                    ErrorMessage="Data do término inválida!" 
                                                    ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$">•</asp:RegularExpressionValidator>
                                                <br />
                                                <asp:Label ID="Label12" runat="server" 
                                                    Text="Se ainda estiver cursando informe uma data de previsão do encerramento do curso"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="100px">
                                                &nbsp;</td>
                                            <td>
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    CommandName="Update" CssClass="button" Text="Salvar" 
                                                    ToolTip="Clique aqui para salvar as alterações" />
                                                <asp:LinkButton ID="LinkButtonExcluir" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" CssClass="button" 
                                                    onclientclick="return confirm(&quot;Você quer excluir esta formação?&quot;)" 
                                                    ToolTip="Clique aqui para excluir este registro">Excluir</asp:LinkButton>
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                    CssClass="button" onclick="UpdateCancelButton_Click" Text="Cancelar" 
                                                    ToolTip="Clique aqui para cancelar a ação" />
                                                <br />
                                                <br />
                                                <br />
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                    ShowMessageBox="True" />
                                            </td>
                                        </tr>
                                    </table>
                                    &nbsp;
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    dsCurso:
                                    <asp:TextBox ID="dsCursoTextBox" runat="server" Text='<%# Bind("dsCurso") %>' />
                                    <br />
                                    obs:
                                    <asp:TextBox ID="obsTextBox" runat="server" Text='<%# Bind("obs") %>' />
                                    <br />
                                    data_ini:
                                    <asp:TextBox ID="data_iniTextBox" runat="server" 
                                        Text='<%# Bind("data_ini") %>' />
                                    <br />
                                    data_fim:
                                    <asp:TextBox ID="data_fimTextBox" runat="server" 
                                        Text='<%# Bind("data_fim") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    idFormacao:
                                    <asp:Label ID="idFormacaoLabel" runat="server" 
                                        Text='<%# Eval("idFormacao") %>' />
                                    <br />
                                    dsCurso:
                                    <asp:Label ID="dsCursoLabel" runat="server" Text='<%# Bind("dsCurso") %>' />
                                    <br />
                                    obs:
                                    <asp:Label ID="obsLabel" runat="server" Text='<%# Bind("obs") %>' />
                                    <br />
                                    data_ini:
                                    <asp:Label ID="data_iniLabel" runat="server" Text='<%# Bind("data_ini") %>' />
                                    <br />
                                    data_fim:
                                    <asp:Label ID="data_fimLabel" runat="server" Text='<%# Bind("data_fim") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" Text="New" />
                                </ItemTemplate>
                            </asp:FormView>
                        </asp:Panel>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlInstituicao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="_USP_FORMACAO_ACADEMICA_SELECT_AUTOPREENCHIMENTO" 
                            SelectCommandType="StoredProcedure" 
                            InsertCommand="_USP_FORMACAO_ACADEMICA_INSERT_AUTOPREENCHIMENTO" 
                            InsertCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Name="idcurriculo" Type="Int32" />
                                <asp:Parameter Name="idTipoFormacao" Type="Int32" />
                                <asp:Parameter Name="idInstituicao" Type="Int32" />
                                <asp:Parameter Name="identidadeTipo" Type="Int32" />
                                <asp:Parameter Name="dsinstituicao" Type="String" />
                                <asp:Parameter Name="cidade" Type="String" />
                                <asp:Parameter Name="dsCurso" Type="String" />
                                <asp:Parameter Name="obs" Type="String" />
                                <asp:Parameter Name="data_ini" Type="DateTime" />
                                <asp:Parameter Name="data_fim" Type="DateTime" />
                                <asp:Parameter Name="uf" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="idcurriculo" SessionField="idcurriculo" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="idFormacaoLabel" Name="idFormacao" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlTIPOFORMACAO" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="SELECT * FROM [tbTipoFormacao] ORDER BY [dsTipoFormacao]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlInstituicaoTIPO" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="SELECT [identidadeTipo], [dsTipo] FROM [tbInstituicaoTipo] ORDER BY [dsTipo]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlFormacaoFORM" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            DeleteCommand="DELETE FROM [tbFormacao] WHERE [idFormacao] = @idFormacao" 
                            InsertCommand="INSERT INTO [tbFormacao] ([dsCurso], [obs], [data_ini], [data_fim]) VALUES (@dsCurso, @obs, @data_ini, @data_fim)" 
                            SelectCommand="SELECT [idFormacao], [dsCurso], [obs], [data_ini], [data_fim] FROM [tbFormacao] WHERE (([idcurriculo] = @idcurriculo) AND ([idFormacao] = @idFormacao))" 
                            UpdateCommand="UPDATE [tbFormacao] SET [dsCurso] = @dsCurso, [obs] = @obs, [data_ini] = @data_ini, [data_fim] = @data_fim WHERE [idFormacao] = @idFormacao">
                            <DeleteParameters>
                                <asp:Parameter Name="idFormacao" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="dsCurso" Type="String" />
                                <asp:Parameter Name="obs" Type="String" />
                                <asp:Parameter Name="data_ini" Type="DateTime" />
                                <asp:Parameter Name="data_fim" Type="DateTime" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="idcurriculo" SessionField="idcurriculo" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="idFormacaoLabel" Name="idFormacao" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="dsCurso" Type="String" />
                                <asp:Parameter Name="obs" Type="String" />
                                <asp:Parameter Name="data_ini" Type="DateTime" />
                                <asp:Parameter Name="data_fim" Type="DateTime" />
                                <asp:Parameter Name="idFormacao" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </td> 
                </tr> 
             </table> 
</asp:Content>

