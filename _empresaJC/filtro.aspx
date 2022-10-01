<%@ Page Language="VB" MasterPageFile="~/_empresaJC/EmpresaPage.master" AutoEventWireup="false" CodeFile="filtro.aspx.vb" Inherits="_empresa__processo_gestao" title=":. Sistema JobClick .:" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/e_processo_filtro.gif" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
                <asp:Label ID="lblTituloProcesso" runat="server" CssClass="titulo"></asp:Label>
                <br />
                <asp:Label ID="lblidFiltro" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidvaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidProcessoSeletivo" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:FormView ID="FormView2" runat="server" DataKeyNames="idFiltro" 
                    DataSourceID="SqlPessoalForm" DefaultMode="Edit" Width="614px" 
                    BackColor="#DBEAEA">
                    <EditItemTemplate>
<asp:TextBox ID="idProcessoSeletivoTextBox" runat="server" 
                            Text='<%# Bind("idProcessoSeletivo") %>' Visible="False" Width="37px" />
                        <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' 
                            Visible="False" Width="22px" />
                        <asp:TextBox ID="cadastroTipoTextBox" runat="server" 
                            Text='<%# Bind("cadastroTipo") %>' Visible="False" Width="24px" />
                        <asp:TextBox ID="estadocivilTextBox" runat="server" 
                            Text='<%# Bind("estadocivil") %>' Visible="False" Width="24px" />
                        <asp:TextBox ID="disponibilidadeTextBox" runat="server" 
                            Text='<%# Bind("disponibilidade") %>' Visible="False" Width="22px" />
                        <asp:Label ID="idFiltroPessoalLabel1" runat="server" 
                            Text='<%# Eval("idFiltro") %>' Visible="False" />
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" CssClass="textBold" 
                                        Text="Faixa de idade:"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Nascidos entre:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                                        runat="server" ControlToValidate="nascimentoITextBox" Display="Dynamic" 
                                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                        ControlToValidate="nascimentoITextBox" Display="Dynamic" 
                                        ErrorMessage="* dd/m/aaaa" SetFocusOnError="True" 
                                        ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    Até<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                        ControlToValidate="nascimentoFTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                        ControlToValidate="nascimentoFTextBox" Display="Dynamic" 
                                        ErrorMessage="* dd/m/aaaa" SetFocusOnError="True" 
                                        ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="nascimentoITextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nascimentoI", "{0:d}") %>' Width="290px" />
                                    <cc1:CalendarExtender ID="nascimentoITextBox_CalendarExtender" runat="server" 
                                        Enabled="True" Format="dd/M/yyyy" TargetControlID="nascimentoITextBox">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                    <asp:TextBox ID="nascimentoFTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nascimentoF", "{0:d}") %>' Width="305px" />
                                    <cc1:CalendarExtender ID="nascimentoFTextBox_CalendarExtender" runat="server" 
                                        Enabled="True" Format="dd/M/yyyy" TargetControlID="nascimentoFTextBox">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" CssClass="textBold" Text="Sexo:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" CssClass="textBold" Text="Modelo do CV:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" 
                                        SelectedValue='<%# Bind("sexo") %>' Width="297px">
                                        <asp:ListItem Value="0">Ambos os sexos</asp:ListItem>
                                        <asp:ListItem>Masculino</asp:ListItem>
                                        <asp:ListItem>Feminino</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCadEmp" 
                                        DataSourceID="SqlPessoalTipoCad" DataTextField="cadastroTipo" 
                                        DataValueField="cadastroTipo" SelectedValue='<%# Bind("cadastroTipo") %>' 
                                        Width="310px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" CssClass="textBold" Text="Estado civil:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" CssClass="textBold" Text="Dependentes:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCadEmp" 
                                        DataSourceID="SqlPessoalEstadoCivil" DataTextField="estadocivil" 
                                        DataValueField="estadocivil" SelectedValue='<%# Bind("estadocivil") %>' 
                                        Width="297px" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">Todos</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="nrdependenteTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nrdependente") %>' Width="305px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" CssClass="textBold" 
                                        Text="Portador de deficiência:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" CssClass="textBold" Text="Trabalhando:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="0" 
                                        CellSpacing="0" RepeatDirection="Horizontal" 
                                        SelectedValue='<%# Bind("portadorDef") %>' Width="250px">
                                        <asp:ListItem Value="True">Sim</asp:ListItem>
                                        <asp:ListItem Value="False">Não</asp:ListItem>
                                        <asp:ListItem Value="">Ambos</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" CellPadding="0" 
                                        CellSpacing="0" RepeatDirection="Horizontal" 
                                        SelectedValue='<%# Bind("trabalhando") %>' Width="250px">
                                        <asp:ListItem Value="True">Sim</asp:ListItem>
                                        <asp:ListItem Value="False">Não</asp:ListItem>
                                        <asp:ListItem Value="">Ambos</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" CssClass="textBold" 
                                        Text="Remuneração Atual: (=&lt;)"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label9" runat="server" CssClass="textBold" 
                                        Text="Remuneração Pretendida: (=&lt;)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="valorRemAtualTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("valorRemAtual", "{0:N}") %>' Width="290px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" 
                                        CssClass="InputCadEmp" Text='<%# Bind("valorRemPretendida", "{0:N}") %>' 
                                        Width="305px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="Label11" runat="server" CssClass="textBold" 
                                        Text="Disponibilidade:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="DropCadEmp" 
                                        DataSourceID="SqlPessoalDisponibilidade" DataTextField="disponibilidade" 
                                        DataValueField="disponibilidade" SelectedValue='<%# Bind("disponibilidade") %>' 
                                        Width="310px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        &nbsp;<asp:Label ID="Label10" runat="server" CssClass="textBold" 
                            Text="Texto para pesquisa:"></asp:Label>
                        <br />
                        <asp:TextBox ID="resumoTextBox" runat="server" CssClass="InputCadEmp" 
                            Height="51px" Text='<%# Bind("resumo") %>' TextMode="MultiLine" 
                            Width="605px" />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CommandName="Update" CssClass="btGeral" 
                            Text="Salvar &amp; Executar" />
                        &nbsp;<asp:Button ID="ButtonClose" runat="server" CausesValidation="False" 
                            onclick="ButtonClose_Click" Text="Fechar" />
                        <br />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="idProcessoSeletivoTextBox" runat="server" 
                            Text='<%# Bind("idProcessoSeletivo") %>' Visible="False" Width="37px" />
                        <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' 
                            Visible="False" Width="22px" />
                        <asp:TextBox ID="cadastroTipoTextBox" runat="server" 
                            Text='<%# Bind("cadastroTipo") %>' Visible="False" Width="24px" />
                        <asp:TextBox ID="estadocivilTextBox" runat="server" 
                            Text='<%# Bind("estadocivil") %>' Visible="False" Width="24px" />
                        <asp:TextBox ID="disponibilidadeTextBox" runat="server" 
                            Text='<%# Bind("disponibilidade") %>' Visible="False" Width="22px" />
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" CssClass="textBold" 
                                        Text="Faixa de idade:"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Nascidos entre:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" 
                                        runat="server" ControlToValidate="nascimentoITextBox" Display="Dynamic" 
                                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                        ControlToValidate="nascimentoITextBox" Display="Dynamic" 
                                        ErrorMessage="* dd/m/aaaa" SetFocusOnError="True" 
                                        ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    Até<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ControlToValidate="nascimentoFTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                        ControlToValidate="nascimentoFTextBox" Display="Dynamic" 
                                        ErrorMessage="* dd/m/aaaa" SetFocusOnError="True" 
                                        ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="nascimentoITextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nascimentoI") %>' Width="290px" />
                                    <cc1:CalendarExtender ID="nascimentoITextBox_CalendarExtender" runat="server" 
                                        Enabled="True" Format="dd/M/yyyy" TargetControlID="nascimentoITextBox">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                    <asp:TextBox ID="nascimentoFTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nascimentoF") %>' Width="305px" />
                                    <cc1:CalendarExtender ID="nascimentoFTextBox_CalendarExtender" runat="server" 
                                        Enabled="True" Format="dd/M/yyyy" TargetControlID="nascimentoFTextBox">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" CssClass="textBold" Text="Sexo:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" CssClass="textBold" Text="Modelo do CV:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" 
                                        SelectedValue='<%# Bind("sexo") %>' Width="297px">
                                        <asp:ListItem Value="0">Ambos os sexos</asp:ListItem>
                                        <asp:ListItem>Masculino</asp:ListItem>
                                        <asp:ListItem>Feminino</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCadEmp" 
                                        DataSourceID="SqlPessoalTipoCad" DataTextField="cadastroTipo" 
                                        DataValueField="cadastroTipo" SelectedValue='<%# Bind("cadastroTipo") %>' 
                                        Width="310px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" CssClass="textBold" Text="Estado civil:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" CssClass="textBold" Text="Dependentes:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCadEmp" 
                                        DataSourceID="SqlPessoalEstadoCivil" DataTextField="estadocivil" 
                                        DataValueField="estadocivil" SelectedValue='<%# Bind("estadocivil") %>' 
                                        Width="297px" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">Todos</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="nrdependenteTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nrdependente") %>' Width="305px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" CssClass="textBold" 
                                        Text="Portador de deficiência:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" CssClass="textBold" Text="Trabalhando:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="0" 
                                        CellSpacing="0" RepeatDirection="Horizontal" 
                                        SelectedValue='<%# Bind("portadorDef") %>' Width="250px">
                                        <asp:ListItem Value="True">Sim</asp:ListItem>
                                        <asp:ListItem Value="False">Não</asp:ListItem>
                                        <asp:ListItem Value="">Ambos</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" CellPadding="0" 
                                        CellSpacing="0" RepeatDirection="Horizontal" 
                                        SelectedValue='<%# Bind("trabalhando") %>' Width="250px">
                                        <asp:ListItem Value="True">Sim</asp:ListItem>
                                        <asp:ListItem Value="False">Não</asp:ListItem>
                                        <asp:ListItem Value="">Ambos</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" CssClass="textBold" 
                                        Text="Remuneração Atual: (=&lt;)"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label9" runat="server" CssClass="textBold" 
                                        Text="Remuneração Pretendida: (=&lt;)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="valorRemAtualTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("valorRemAtual", "{0:N}") %>' Width="290px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" 
                                        CssClass="InputCadEmp" Text='<%# Bind("valorRemPretendida") %>' 
                                        Width="305px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="Label11" runat="server" CssClass="textBold" 
                                        Text="Disponibilidade:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="DropCadEmp" 
                                        DataSourceID="SqlPessoalDisponibilidade" DataTextField="disponibilidade" 
                                        DataValueField="disponibilidade" SelectedValue='<%# Bind("disponibilidade") %>' 
                                        Width="310px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        &nbsp;<asp:Label ID="Label10" runat="server" CssClass="textBold" 
                            Text="Texto para pesquisa:"></asp:Label>
                        <br />
                        <asp:TextBox ID="resumoTextBox" runat="server" CssClass="InputCadEmp" 
                            Height="51px" Text='<%# Bind("resumo") %>' TextMode="MultiLine" 
                            Width="605px" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar estes critérios de pesquisa" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Fechar" onclick="InsertCancelButton_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idFiltroPessoal:
                        <asp:Label ID="idFiltroPessoalLabel" runat="server" 
                            Text='<%# Eval("idFiltro") %>' />
                        <br />
                        idProcessoSeletivo:
                        <asp:Label ID="idProcessoSeletivoLabel" runat="server" 
                            Text='<%# Bind("idProcessoSeletivo") %>' />
                        <br />
                        nascimentoI:
                        <asp:Label ID="nascimentoILabel" runat="server" 
                            Text='<%# Bind("nascimentoI") %>' />
                        <br />
                        nascimentoF:
                        <asp:Label ID="nascimentoFLabel" runat="server" 
                            Text='<%# Bind("nascimentoF") %>' />
                        <br />
                        sexo:
                        <asp:Label ID="sexoLabel" runat="server" Text='<%# Bind("sexo") %>' />
                        <br />
                        cadastroTipo:
                        <asp:Label ID="cadastroTipoLabel" runat="server" 
                            Text='<%# Bind("cadastroTipo") %>' />
                        <br />
                        estadocivil:
                        <asp:Label ID="estadocivilLabel" runat="server" 
                            Text='<%# Bind("estadocivil") %>' />
                        <br />
                        nrdependente:
                        <asp:Label ID="nrdependenteLabel" runat="server" 
                            Text='<%# Bind("nrdependente") %>' />
                        <br />
                        portadorDef:
                        <asp:Label ID="portadorDefLabel" runat="server" 
                            Text='<%# Bind("portadorDef") %>' />
                        <br />
                        trabalhando:
                        <asp:CheckBox ID="trabalhandoCheckBox" runat="server" 
                            Checked='<%# Bind("trabalhando") %>' Enabled="false" />
                        <br />
                        resumo:
                        <asp:Label ID="resumoLabel" runat="server" Text='<%# Bind("resumo") %>' />
                        <br />
                        valorRemAtual:
                        <asp:Label ID="valorRemAtualLabel" runat="server" 
                            Text='<%# Bind("valorRemAtual") %>' />
                        <br />
                        valorRemPretendida:
                        <asp:Label ID="valorRemPretendidaLabel" runat="server" 
                            Text='<%# Bind("valorRemPretendida") %>' />
                        <br />
                        disponibilidade:
                        <asp:Label ID="disponibilidadeLabel" runat="server" 
                            Text='<%# Bind("disponibilidade") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />                
                <asp:Image ID="Image12" runat="server" Height="1px" ImageUrl="~/images/layout/linhafiltro.gif"
                    Width="613px" /><br />
                <br />
                <br />
                <table width="614px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left">
                            
                            <table align="right" cellpadding="0" cellspacing="0" width="614">
                                <tr>
                                    <td align="right">
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                </table>                    
                <br />
            </td> 
        </tr>
    </table>     
    <asp:SqlDataSource ID="SqlPessoal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT idFiltro, idProcessoSeletivo, nascimentoI, nascimentoF, sexo, cadastroTipo, estadocivil, nrdependente, portadorDef, trabalhando, resumo, valorRemAtual, valorRemPretendida, disponibilidade FROM tbFiltro WHERE (idProcessoSeletivo = @idProcessoSeletivo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidProcessoSeletivo" 
                Name="idProcessoSeletivo" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPessoalForm" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbFiltro] WHERE [idFiltro] = @idFiltro" 
        InsertCommand="INSERT INTO [tbFiltro] ([idProcessoSeletivo], [nascimentoI], [nascimentoF], [sexo], [cadastroTipo], [estadocivil], [nrdependente], [portadorDef], [trabalhando], [resumo], [valorRemAtual], [valorRemPretendida], [disponibilidade]) VALUES (@idProcessoSeletivo, @nascimentoI, @nascimentoF, @sexo, @cadastroTipo, @estadocivil, @nrdependente, @portadorDef, @trabalhando, @resumo, @valorRemAtual, @valorRemPretendida, @disponibilidade)" 
        SelectCommand="SELECT idFiltro, idProcessoSeletivo, nascimentoI, nascimentoF, sexo, cadastroTipo, estadocivil, nrdependente, portadorDef, trabalhando, resumo, valorRemAtual, valorRemPretendida, disponibilidade FROM tbFiltro WHERE (idProcessoSeletivo = @idProcessoSeletivo)" 
        
        
        UpdateCommand="UPDATE [tbFiltro] SET [idProcessoSeletivo] = @idProcessoSeletivo, [nascimentoI] = @nascimentoI, [nascimentoF] = @nascimentoF, [sexo] = @sexo, [cadastroTipo] = @cadastroTipo, [estadocivil] = @estadocivil, [nrdependente] = @nrdependente, [portadorDef] = @portadorDef, [trabalhando] = @trabalhando, [resumo] = @resumo, [valorRemAtual] = @valorRemAtual, [valorRemPretendida] = @valorRemPretendida, [disponibilidade] = @disponibilidade WHERE [idFiltro] = @idFiltro">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidProcessoSeletivo" 
                Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idFiltro" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
            <asp:Parameter Name="nascimentoI" Type="DateTime" />
            <asp:Parameter Name="nascimentoF" Type="DateTime" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="cadastroTipo" Type="String" />
            <asp:Parameter Name="estadocivil" Type="String" />
            <asp:Parameter Name="nrdependente" Type="Int32" />
            <asp:Parameter Name="portadorDef" Type="Boolean" />
            <asp:Parameter Name="trabalhando" Type="Boolean" />
            <asp:Parameter Name="resumo" Type="String" />
            <asp:Parameter Name="valorRemAtual" Type="Decimal" />
            <asp:Parameter Name="valorRemPretendida" Type="Decimal" />
            <asp:Parameter Name="disponibilidade" Type="String" />
            <asp:Parameter Name="idFiltro" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
            <asp:Parameter Name="nascimentoI" Type="DateTime" />
            <asp:Parameter Name="nascimentoF" Type="DateTime" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="cadastroTipo" Type="String" />
            <asp:Parameter Name="estadocivil" Type="String" />
            <asp:Parameter Name="nrdependente" Type="Int32" />
            <asp:Parameter Name="portadorDef" />
            <asp:Parameter Name="trabalhando" />
            <asp:Parameter Name="resumo" Type="String" />
            <asp:Parameter Name="valorRemAtual" Type="Decimal" />
            <asp:Parameter Name="valorRemPretendida" Type="Decimal" />
            <asp:Parameter Name="disponibilidade" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPessoalTipoCad" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [cadastroTipo] FROM [tbCadastroTipo]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPessoalEstadoCivil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [estadocivil] FROM [tbestadocivil]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPessoalDisponibilidade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [disponibilidade] FROM [tbDisponibilidade]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlAtuacao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [_vwAreaAtuacaoFiltro]">
    </asp:SqlDataSource>
</asp:Content>

