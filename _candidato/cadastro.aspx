<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="cadastro.aspx.vb" Inherits="_candidato_curriculo" title="Jobclick" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Dados Pessoais" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td style="width: 30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />

                <table runat="server" id="Def" visible="false" border="0" cellpadding="0" 
                    cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" CssClass="titulo" Text="Atenção especial (Deficiência)"></asp:Label><br />
                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="idDeficienteFisico" DataSourceID="SqlDataDEF"
                                DefaultMode="Edit" Width="100%">
                                <EditItemTemplate>
                                    Deficiência na audição:<asp:TextBox ID="idDefAuditivaTextBox" runat="server" Text='<%# Bind("idDefAuditiva") %>'
                                        Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="idCadastroUserTextBox"
                                            runat="server" Text='<%# Bind("idUser") %>' Visible="False" Width="1px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFAuditivo"
                                        DataTextField="dsDefAuditiva" DataValueField="idDefAuditiva" 
                                        SelectedValue='<%# Bind("idDefAuditiva") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência motora:<asp:TextBox ID="idDefMotoraTextBox" runat="server" Text='<%# Bind("idDefMotora") %>'
                                        Visible="False" Width="1px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFMotora"
                                        DataTextField="dsDefMotora" DataValueField="idDefMotora" 
                                        SelectedValue='<%# Bind("idDefMotora") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência na fala:<asp:TextBox ID="idDefFalaTextBox" runat="server" Text='<%# Bind("idDefFala") %>'
                                        Visible="False" Width="8px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFFala"
                                        DataTextField="dsDefFala" DataValueField="idDefFala" 
                                        SelectedValue='<%# Bind("idDefFala") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência mental:<asp:TextBox ID="idDefMentalTextBox" runat="server" Text='<%# Bind("idDefMental") %>'
                                        Visible="False" Width="8px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFMental"
                                        DataTextField="dsDefMental" DataValueField="idDefMental" 
                                        SelectedValue='<%# Bind("idDefMental") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência visual:<asp:TextBox ID="idDefVisualTextBox" runat="server" Text='<%# Bind("idDefVisual") %>'
                                        Visible="False" Width="8px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFVisual"
                                        DataTextField="dsDefVisual" DataValueField="idDefVisual" 
                                        SelectedValue='<%# Bind("idDefVisual") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    <br />
                                    Comentários e observações:
                                    <br />
                                    <asp:TextBox ID="ObsTextBox" runat="server" CssClass="InputCad" Height="80px" Text='<%# Bind("Obs") %>'
                                        TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                                    <br />
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/images/candidato/btatualizarDF.gif" /><asp:ImageButton
                                        ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        ImageUrl="~/images/candidato/btcancelarDF.gif" OnClick="HideFormDEF" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    Deficiência na audição:<asp:TextBox ID="idDefAuditivaTextBox" runat="server" Text='<%# Bind("idDefAuditiva") %>'
                                        Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="idCadastroUserTextBox"
                                            runat="server" Text='<%# Bind("idUser") %>' Visible="False" Width="8px"></asp:TextBox>
                                    <asp:DropDownList
                                                ID="DropDownList6" runat="server" DataSourceID="SqlDataSource9" DataTextField="idUser"
                                                DataValueField="idUser" SelectedValue='<%# Bind("idUser") %>'
                                                Visible="False" Width="100%">
                                            </asp:DropDownList><br />
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFAuditivo"
                                        DataTextField="dsDefAuditiva" DataValueField="idDefAuditiva" 
                                        SelectedValue='<%# Bind("idDefAuditiva") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência motora:<asp:TextBox ID="idDefMotoraTextBox" runat="server" Text='<%# Bind("idDefMotora") %>'
                                        Visible="False" Width="1px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFMotora"
                                        DataTextField="dsDefMotora" DataValueField="idDefMotora" 
                                        SelectedValue='<%# Bind("idDefMotora") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência na fala:<asp:TextBox ID="idDefFalaTextBox" runat="server" Text='<%# Bind("idDefFala") %>'
                                        Visible="False" Width="8px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFFala"
                                        DataTextField="dsDefFala" DataValueField="idDefFala" 
                                        SelectedValue='<%# Bind("idDefFala") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência mental:<asp:TextBox ID="idDefMentalTextBox" runat="server" Text='<%# Bind("idDefMental") %>'
                                        Visible="False" Width="8px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFMental"
                                        DataTextField="dsDefMental" DataValueField="idDefMental" 
                                        SelectedValue='<%# Bind("idDefMental") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    Deficiência visual:<asp:TextBox ID="idDefVisualTextBox" runat="server" Text='<%# Bind("idDefVisual") %>'
                                        Visible="False" Width="8px"></asp:TextBox><br />
                                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="DropCad" DataSourceID="SqlDataDEFVisual"
                                        DataTextField="dsDefVisual" DataValueField="idDefVisual" 
                                        SelectedValue='<%# Bind("idDefVisual") %>' Width="100%">
                                    </asp:DropDownList><br />
                                    <br />
                                    Comentários e observações:
                                    <br />
                                    <asp:TextBox ID="ObsTextBox" runat="server" CssClass="InputCad" Height="80px" Text='<%# Bind("Obs") %>'
                                        TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Incluir (Salvar)"></asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancelar" OnClick="HideFormDEF"></asp:LinkButton>
                                    <br />
                                    <br />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    idDeficienteFisico:
                                    <asp:Label ID="idDeficienteFisicoLabel" runat="server" Text='<%# Eval("idDeficienteFisico") %>'></asp:Label><br />
                                    idCadastroUser:
                                    <asp:Label ID="idCadastroUserLabel" runat="server" Text='<%# Bind("idCadastroUser") %>'></asp:Label><br />
                                    idDefAuditiva:
                                    <asp:Label ID="idDefAuditivaLabel" runat="server" Text='<%# Bind("idDefAuditiva") %>'></asp:Label><br />
                                    idDefMotora:
                                    <asp:Label ID="idDefMotoraLabel" runat="server" Text='<%# Bind("idDefMotora") %>'></asp:Label><br />
                                    idDefFala:
                                    <asp:Label ID="idDefFalaLabel" runat="server" Text='<%# Bind("idDefFala") %>'></asp:Label><br />
                                    idDefMental:
                                    <asp:Label ID="idDefMentalLabel" runat="server" Text='<%# Bind("idDefMental") %>'></asp:Label><br />
                                    idDefVisual:
                                    <asp:Label ID="idDefVisualLabel" runat="server" Text='<%# Bind("idDefVisual") %>'></asp:Label><br />
                                    Obs:
                                    <asp:Label ID="ObsLabel" runat="server" Text='<%# Bind("Obs") %>'></asp:Label><br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit"></asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete"></asp:LinkButton>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New"></asp:LinkButton>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table border="0" cellpadding="5" cellspacing="5" style="width: 100%">
                                        <tr>
                                            <td bgcolor="snow">
                                                O JobClick tem como objetivo apoiar ações e projetos que privilegiem a inclusão
                                                social e econômica de pessoas portadoras de <b>necessidades especiais</b>.<br />
                                                <br />
                                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                                    Text="Informe aqui suas necessidades especiais..."></asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataDEF" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                DeleteCommand="DELETE FROM [tbDeficienteFisico] WHERE [idDeficienteFisico] = @idDeficienteFisico"
                                InsertCommand="INSERT INTO [tbDeficienteFisico] ([idUser], [idDefAuditiva], [idDefMotora], [idDefFala], [idDefMental], [idDefVisual], [Obs]) VALUES (@idUser, @idDefAuditiva, @idDefMotora, @idDefFala, @idDefMental, @idDefVisual, @Obs)"
                                SelectCommand="SELECT [idDeficienteFisico], [idUser], [idDefAuditiva], [idDefMotora], [idDefFala], [idDefMental], [idDefVisual], [Obs] FROM [tbDeficienteFisico] WHERE ([idUser] = @idUser)"
                                UpdateCommand="UPDATE [tbDeficienteFisico] SET [idUser] = @idUser, [idDefAuditiva] = @idDefAuditiva, [idDefMotora] = @idDefMotora, [idDefFala] = @idDefFala, [idDefMental] = @idDefMental, [idDefVisual] = @idDefVisual, [Obs] = @Obs WHERE [idDeficienteFisico] = @idDeficienteFisico">
                                <DeleteParameters>
                                    <asp:Parameter Name="idDeficienteFisico" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="idUser" />
                                    <asp:Parameter Name="idDefAuditiva" Type="Int32" />
                                    <asp:Parameter Name="idDefMotora" Type="Int32" />
                                    <asp:Parameter Name="idDefFala" Type="Int32" />
                                    <asp:Parameter Name="idDefMental" Type="Int32" />
                                    <asp:Parameter Name="idDefVisual" Type="Int32" />
                                    <asp:Parameter Name="Obs" Type="String" />
                                    <asp:Parameter Name="idDeficienteFisico" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="idUser" />
                                    <asp:Parameter Name="idDefAuditiva" Type="Int32" />
                                    <asp:Parameter Name="idDefMotora" Type="Int32" />
                                    <asp:Parameter Name="idDefFala" Type="Int32" />
                                    <asp:Parameter Name="idDefMental" Type="Int32" />
                                    <asp:Parameter Name="idDefVisual" Type="Int32" />
                                    <asp:Parameter Name="Obs" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFAuditivo" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefAuditiva], [dsDefAuditiva] FROM [tbDefAuditiva]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFFala" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefFala], [dsDefFala] FROM [tbDefFala]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFMental" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefMental], [dsDefMental] FROM [tbDefMental]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFVisual" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefVisual], [dsDefVisual] FROM [tbDefVisual]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFMotora" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [dsDefMotora], [idDefMotora] FROM [tbDefMotora]"></asp:SqlDataSource>
                            </td>
                    </tr>
                </table>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idCadastroUser" DataSourceID="SqlDataSource1"
        Width="100%" DefaultMode="Edit">
        <EditItemTemplate>
            <table ID="FormCandidato" cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td width="50%">
                        <asp:Label ID="LabelNome" runat="server" Text="Nome Completo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                            ControlToValidate="nomeTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("nome") %>' ValidationGroup="Candidato"></asp:TextBox>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelCPF" runat="server" Text="CPF:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBoxCPF" runat="server" CssClass="InputCad" Enabled="False" 
                            OnTextChanged="PesquisaCPF" Text='<%# Bind("cpf") %>' Width="300px" 
                            ValidationGroup="Candidato"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td width="50%">
                        <table ID="CEP" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="LabelCEP" runat="server" Text="CEP:"></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="cepTextBox" ErrorMessage="* CEP 99999-999" 
                                        ValidationExpression="\d{5}(-\d{3})?" ValidationGroup="CEPSearch"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True" ValidationGroup="CEPSearch"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("cep") %>' ValidationGroup="CEPSearch" Width="315px"></asp:TextBox>
                                </td>
                                <td valign="baseline">
                                    <br />
                                    <asp:ImageButton ID="PesquisaCEP" runat="server" 
                                        ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click" 
                                        ValidationGroup="CEPSearch" />
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="LabelEndereco" runat="server" Text="Endereço:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                            ControlToValidate="enderecoTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("endereco") %>' ValidationGroup="Candidato"></asp:TextBox>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelBairro" runat="server" Text="Bairro:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                            ControlToValidate="bairroTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="bairroTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("bairro") %>' ValidationGroup="Candidato" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <table ID="Cidade" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="LabelCidade" runat="server" Text="Cidade:"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                        ControlToValidate="cidadeTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="../images/5px.gif" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelUF" runat="server" Text="UF:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="cidadeTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("cidade") %>' ValidationGroup="Candidato" Width="295px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Image ID="Image3" runat="server" ImageUrl="../images/5px.gif" />
                                </td>
                                <td>
                                    <asp:DropDownList ID="DDUf" runat="server" CssClass="DropUF" 
                                        DataSourceID="SqlDataSource3" DataTextField="uf" DataValueField="uf" 
                                        SelectedValue='<%# Bind("uf") %>'>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="LabelPais" runat="server" Text="Pais:"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSource4" DataTextField="pais" DataValueField="pais" 
                            SelectedValue='<%# Bind("pais") %>'>
                        </asp:DropDownList>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelNascimento" runat="server" Text="Data de nascimento:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ControlToValidate="nascimentoTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                            ControlToValidate="nascimentoTextBox" Display="Dynamic" 
                            ErrorMessage="* Data no formato d/m/yyyy" SetFocusOnError="True" 
                            ValidationExpression="\d{1,2}/\d{1,2}/\d{4}" ValidationGroup="Candidato"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="nascimentoTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("nascimento", "{0:d}") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" valign="top">
                        <asp:Label ID="LabelSexo" runat="server" Text="Sexo:"></asp:Label>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="0" 
                            CellSpacing="0" RepeatDirection="Horizontal" 
                            SelectedValue='<%# Bind("sexo") %>'>
                            <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                            <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelTipo" runat="server" Font-Bold="False" 
                            Text="Tipo de cadastro:"></asp:Label>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" CellPadding="0" 
                            CellSpacing="0" DataSourceID="SqlDataSource5" DataTextField="cadastroTipo" 
                            DataValueField="cadastroTipo" SelectedValue='<%# Bind("cadastroTipo") %>'>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="Label7" runat="server" Text="Área de Atuação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                            ControlToValidate="DropDownListArea" ErrorMessage="Informe sua área de atuação" 
                            ValidationGroup="Candidato">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListArea" runat="server" 
                            AppendDataBoundItems="True" CssClass="DropCad" DataSourceID="SqlAtuacao" 
                            DataTextField="dsAreaAtuacaoCandidato" DataValueField="dsAreaAtuacaoCandidato" 
                            SelectedValue='<%# Bind("areaAtuacao") %>' ValidationGroup="Candidato" 
                            ViewStateMode="Enabled">
                            <asp:ListItem Value="Outros">Selecione</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelCargo1" runat="server" 
                            Text="Cargo de seu interesse 1ª opção:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                            ControlToValidate="TextBoxCargo1" ErrorMessage="Cargo 1ª opção é obrigatório" 
                            ValidationGroup="Candidato">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="TextBoxCargo1" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("interesse01") %>' ValidationGroup="Candidato" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        &nbsp;</td>
                    <td width="50%">
                        <asp:Label ID="LabelCargo2" runat="server" 
                            Text="Cargo de seu interesse 2ª opção: "></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBoxCargo2" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("interesse02") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        &nbsp;</td>
                    <td width="50%">
                        <asp:Label ID="LabelCargo3" runat="server" 
                            Text="Cargo de seu interesse 3ª opção: "></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBoxCargo3" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("interesse03") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%" valign="top">
                        <asp:Label ID="LabelDependente" runat="server" Text="Número de dependentes:"></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                            ControlToValidate="nrdependenteTextBox" Display="Dynamic" 
                            ErrorMessage="* Numérico" SetFocusOnError="True" ValidationExpression="\d{1}" 
                            ValidationGroup="Candidato"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="nrdependenteTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("nrdependente") %>' ValidationGroup="Candidato"></asp:TextBox>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelEstadoCivil" runat="server" Font-Bold="False" 
                            Text="Estado Civil:"></asp:Label>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server" CellPadding="0" 
                            CellSpacing="0" DataSourceID="SqlDataSource6" DataTextField="estadocivil" 
                            DataValueField="estadocivil" SelectedValue='<%# Bind("estadocivil") %>'>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="Label4" runat="server" Text="Remuneração em Reais atual:"></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="valorRemAtualTextBox" Display="Dynamic" 
                            ErrorMessage="* Formato 99.999,99" SetFocusOnError="True" 
                            ValidationExpression="(\d{1,999}.)?(\d{3})(,\d{2})?" 
                            ValidationGroup="Candidato">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="valorRemAtualTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="valorRemAtualTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("valorRemAtual", "{0:n}") %>' ValidationGroup="Candidato"></asp:TextBox>
                    </td>
                    <td width="50%">
                        <asp:Label ID="Label5" runat="server" Text="Remuneração em Reais pretendida:"></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="valorRemPretendidaTextBox" Display="Dynamic" 
                            ErrorMessage="* Formato 99.999,99" SetFocusOnError="True" 
                            ValidationExpression="(\d{1,999}.)?(\d{3})(,\d{2})?" 
                            ValidationGroup="Candidato">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="valorRemPretendidaTextBox" Display="Dynamic" 
                            ErrorMessage="*" SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("valorRemPretendida", "{0:n}") %>' ValidationGroup="Candidato" 
                            Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="LabelCombinar" runat="server" 
                            Text="&lt;b&gt;Obs.:&lt;/b&gt;&lt;br&gt; Selecione [A combinar]  para &lt;u&gt;não&lt;/u&gt; apresentar as suas pretenções salariais."></asp:Label>
                        <br />
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("acombinar") %>' 
                            Text="&lt;b&gt;A combinar&lt;/b&gt;" />
                    </td>
                    <td width="50%">
                        <asp:Label ID="Label6" runat="server" Text="Disponibilidade:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="RadioButtonList4" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="RadioButtonList4" runat="server" 
                            DataSourceID="SqlDataSource7" DataTextField="disponibilidade" 
                            DataValueField="disponibilidade" SelectedValue='<%# Bind("disponibilidade") %>' 
                            ValidationGroup="Candidato">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="LabelPreferencia" runat="server" 
                            Text="Local de trabalho (Preferência):"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSource3" DataTextField="dsuf" DataValueField="dsuf" 
                            SelectedValue='<%# Bind("localPreferencia") %>'>
                        </asp:DropDownList>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelJob" runat="server" Text="Como ficou sabendo do JobClick?"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="RadioButtonList5" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" ValidationGroup="Candidato"></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="RadioButtonList5" runat="server" 
                            DataSourceID="SqlDataSource8" DataTextField="origem" DataValueField="origem" 
                            SelectedValue='<%# Bind("origem") %>' ValidationGroup="Candidato">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        &nbsp;</td>
                    <td width="50%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:CheckBox ID="privacidadeCheckBox" runat="server" 
                            Checked='<%# Bind("privacidade") %>' 
                            Text="Quero manter meus dados em sigilo (CPF, nome e outros)" />
                    </td>
                    <td bgcolor="#FFECFF" width="50%">
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                            Checked='<%# Bind("portadorDef") %>' 
                            oncheckedchanged="CheckBox1_CheckedChanged" 
                            Text="Sim, necessito de atenções especiais" />
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:CheckBox ID="apresentarCheckBox" runat="server" 
                            Checked='<%# Bind("apresentar") %>' 
                            Text="Apresentar meus dados imediatamente após a criação." />
                    </td>
                    <td width="50%">
                        <asp:CheckBox ID="trabalhandoCheckBox" runat="server" 
                            Checked='<%# Bind("trabalhando") %>' Text="Atualmente estou trabalhando." />
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        &nbsp;</td>
                    <td width="50%">
                        &nbsp;</td>
                </tr>
            </table>
            <table ID="Resumo" cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" 
                            Text="Resumo das minhas qualificações: (Apenas um resumo)"></asp:Label>
                        <asp:TextBox ID="resumoTextBox" runat="server" CssClass="InputCad" 
                            Height="200px" OnDataBinding="resumoTextBox_DataBinding" 
                            Text='<%# Bind("resumo") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' 
                Visible="False" Width="1px"></asp:TextBox><asp:TextBox ID="idUserTextBox" 
                runat="server" Text='<%# Bind("idUser") %>' Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="ufTextBox" runat="server" Text='<%# Bind("uf") %>' 
                Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' 
                Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' 
                Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="cadastroTipoTextBox" runat="server" Text='<%# Bind("cadastroTipo") %>'
                Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="estadocivilTextBox" runat="server" Text='<%# Bind("estadocivil") %>'
                Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="localPreferenciaTextBox" runat="server"
                Text='<%# Bind("localPreferencia") %>' Visible="False" Width="1px"></asp:TextBox>
            <asp:TextBox ID="disponibilidadeTextBox" runat="server" Text='<%# Bind("disponibilidade") %>'
                Visible="False" Width="1px"></asp:TextBox><asp:TextBox ID="origemTextBox" 
                runat="server" Text='<%# Bind("origem") %>' Visible="False" Width="1px"></asp:TextBox><br />
            <br />
            
            
            
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Atualizar meus dados" ValidationGroup="Candidato"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Voltar ao Menu Principal" OnClick="voltar"></asp:LinkButton>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <b>Bem-vindo ao JobClick</b>,
            <br />
            <br />
            <b>Atenção:</b><br />
            Antes de publicar seu Curriculum Vitæ será necessário informar seus [Dados Pessoais].
            <br />
            <br />
            Estas informações serão utilizadas para identificar você e ajudar as empresas, devidamente cadastradas em nosso sistema, a montar seus processos seletivos, agendar entrevistas e facilitar as possíveis contratações. 
            <br />
            <br />
            O sistema JobPost permite a publicação de vários currículos que poderão ser
            classificados por você.
            <br />
            <br />
            Veja alguns exemplos:
            <br />
            Por idioma, você poderá ter quantos currículos forem necessários para expressar
            sua fluência, um em cada idioma, já imaginou!
            <br />
            <br />
            Por função, você poderá dar ênfase a seus conhecimentos técnicos, administrativos
            e ou comerciais separadamente. Isso é de grande ajuda quando se quer
            focar seus esforços em uma determinada vaga.<br />
            <br />
            [<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Quero iniciar meu cadastro agora." Font-Bold="True"></asp:LinkButton>]<br />
            <br />
            <asp:Label ID="lblmsn" runat="server" ForeColor="Red"></asp:Label>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Nome completo:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="nomeTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' Visible="False"></asp:TextBox>
            <asp:DropDownList ID="idUserTextBox" runat="server" DataSourceID="SqlDataSource2"
                DataTextField="idUser" DataValueField="idUser" SelectedValue='<%# Bind("idUser") %>'
                Visible="False">
            </asp:DropDownList>&nbsp;
            <asp:TextBox ID="ufTextBox" runat="server" Text='<%# Bind("uf") %>' Visible="False"></asp:TextBox><br />
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' CssClass="InputCad"></asp:TextBox><br />
            CPF:
            <asp:RegularExpressionValidator ID="RegularExpressionValidator8"
                        runat="server" ControlToValidate="TextBoxCPF" Display="Dynamic" ErrorMessage="*"
                        SetFocusOnError="True" ValidationExpression="^\d{3}\.\d{3}\.\d{3}\-\d{2}$" OnDisposed="PesquisaCPF"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBoxCPF"
                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:Label ID="lblmsn"
                    runat="server" ForeColor="Red"></asp:Label>
            <cc1:MaskedEditExtender id="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false"
                ErrorTooltipEnabled="true" Mask="999\.999\.999\-99" MaskType="None" MessageValidatorTip="true"
                TargetControlID="TextBoxCPF">
            </cc1:MaskedEditExtender>
            <cc1:MaskedEditValidator id="MaskedEditValidator1" runat="server" ControlExtender="MaskedEditExtender1"
                ControlToValidate="TextBoxCPF" Display="Dynamic" EmptyValueMessage="Preencha o campo no formato [000.000.000-00]" IsValidEmpty="False" SetFocusOnError="True"
                ToolTipMessage="Preencha o campo no formato [000.000.000-00]" MinimumValue="14" ValidationExpression="^\d{3}\.\d{3}\.\d{3}\-\d{2}$">
            &nbsp;&nbsp;&nbsp;
            </cc1:MaskedEditValidator>
            <br />
            <asp:TextBox ID="TextBoxCPF" runat="server" CssClass="InputCad" OnTextChanged="PesquisaCPF"
                Text='<%# Bind("cpf") %>' AutoPostBack="True"></asp:TextBox><br />
            CEP:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cepTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="psqCEP"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="cepTextBox"
                    ErrorMessage="* CEP 99999-999" ValidationExpression="\d{5}(-\d{3})?" ValidationGroup="psqCEP"></asp:RegularExpressionValidator><br />
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("cep") %>'
                            Width="315px" ValidationGroup="psqCEP"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="PesquisaCEP" runat="server" ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click1" ValidationGroup="psqCEP" />&nbsp;</td>
                </tr>
            </table>
            Endereço:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="enderecoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' CssClass="InputCad"></asp:TextBox><br />
            Bairro:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="bairroTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' CssClass="InputCad"></asp:TextBox><br />
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>Cidade:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="cidadeTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    <td><asp:Image ID="Image1" runat="server" ImageUrl="../images/5px.gif" /></td>
                    <td>UF:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="cidadeTextBox" runat="server" Text='<%# Bind("cidade") %>' CssClass="InputCad" Width="295px"></asp:TextBox></td>
                    <td><asp:Image ID="Image2" runat="server" ImageUrl="../images/5px.gif" /></td>
                    <td><asp:DropDownList ID="DDUf" runat="server" DataSourceID="SqlDataSource3" DataTextField="uf" DataValueField="uf" SelectedValue='<%# Bind("uf") %>' CssClass="DropUF"></asp:DropDownList></td>
                </tr>
            </table>
            Pais:<asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' Visible="False"></asp:TextBox><br />
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4"
                DataTextField="pais" DataValueField="pais" 
                SelectedValue='<%# Bind("pais") %>' CssClass="DropCad" 
                ondatabound="DropDownList3_DataBound">
            </asp:DropDownList><br />
            Data de nascimento:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="nascimentoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="nascimentoTextBox"
                Display="Dynamic" ErrorMessage="* Data no formato d/m/yyyy" SetFocusOnError="True"
                ValidationExpression="\d{1,2}/\d{1,2}/\d{4}"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="nascimentoTextBox" runat="server" Text='<%# Bind("nascimento") %>' CssClass="InputCad"></asp:TextBox><br />
            <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" 
                TargetControlID="nascimentoTextBox" DefaultView="Years">
            </cc1:CalendarExtender>
            <br />
            Sexo:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList1"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' Visible="False"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="0" CellSpacing="0"
                RepeatDirection="Horizontal" SelectedValue='<%# Bind("sexo") %>'>
                <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Tipo de cadastro:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                ControlToValidate="RadioButtonList2" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:TextBox ID="cadastroTipoTextBox" runat="server" Text='<%# Bind("cadastroTipo") %>'
                Visible="False"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" CellPadding="0" CellSpacing="0"
                DataSourceID="SqlDataSource5" DataTextField="cadastroTipo" DataValueField="cadastroTipo"
                SelectedValue='<%# Bind("cadastroTipo") %>'>
            </asp:RadioButtonList><br />
            <asp:CheckBox ID="apresentarCheckBox" runat="server" Checked='<%# Bind("apresentar") %>'
                Text="Apresentar meus dados imediatamente após a criação." /><br />
            <br />
            Estado Civil:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                ControlToValidate="RadioButtonList3" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:TextBox ID="estadocivilTextBox" runat="server" Text='<%# Bind("estadocivil") %>'
                Visible="False"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList3" runat="server" CellPadding="0" CellSpacing="0"
                DataSourceID="SqlDataSource6" DataTextField="estadocivil" DataValueField="estadocivil"
                SelectedValue='<%# Bind("estadocivil") %>'>
            </asp:RadioButtonList><br />
            Número de dependentes:<asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                runat="server" ControlToValidate="nrdependenteTextBox" Display="Dynamic" ErrorMessage="* Numérico"
                SetFocusOnError="True" ValidationExpression="\d{1}"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="nrdependenteTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("nrdependente") %>'></asp:TextBox><br />
            <br /><asp:Image ID="Image6" runat="server" ImageUrl="~/images/candidato/necessidadesesp.gif" /><br />
            Você necessita de atenções especiais? (Deficiênte Físico)<br />
            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("portadorDef") %>'
                Text="Sim, necessito de atenções especiais" />&nbsp;
            <br />
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/images/pesquisa.gif" /></td>
                    <td>
                        Em caso afirmativo [<asp:LinkButton ID="LinkButton1" runat="server" OnClick="ShowFormDEF">clique aqui</asp:LinkButton>]
                        e informe detalhes</td>
                </tr>
            </table>
            <asp:Image ID="Image7" runat="server" ImageUrl="~/images/candidato/separador.gif" /><br />
            <br />
            Situação atual...<br />
            <asp:CheckBox ID="trabalhandoCheckBox" runat="server" Checked='<%# Bind("trabalhando") %>'
                Text="Atualmente estou trabalhando." /><br />
            <br />
            Resumo das minhas qualificações: (Apenas um resumo)<br />
            <asp:TextBox ID="resumoTextBox" runat="server" Text='<%# Bind("resumo") %>' CssClass="InputCad" Height="96px" TextMode="MultiLine"></asp:TextBox><br />
            <br />
            Remuneração em Reais atual:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                ControlToValidate="valorRemAtualTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="valorRemAtualTextBox"
                    Display="Dynamic" ErrorMessage="* Formato 99.999,99" SetFocusOnError="True" ValidationExpression="(\d{1,999}.)?(\d{3})(,\d{2})?"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="valorRemAtualTextBox" runat="server" Text='<%# Bind("valorRemAtual") %>' CssClass="InputCad"></asp:TextBox><br />
            Remuneração em Reais pretendida:<asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                runat="server" ControlToValidate="valorRemPretendidaTextBox" Display="Dynamic"
                ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="valorRemPretendidaTextBox"
                    Display="Dynamic" ErrorMessage="* Formato 99.999,99" SetFocusOnError="True" ValidationExpression="(\d{1,999}.)?(\d{3})(,\d{2})?"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" Text='<%# Bind("valorRemPretendida") %>' CssClass="InputCad"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" 
                Text="&lt;b&gt;Obs.:&lt;/b&gt;&lt;br&gt; Selecione [A combinar]  para &lt;u&gt;não&lt;/u&gt; apresentar as suas pretenções salariais."></asp:Label>
            <br />
            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("acombinar") %>' 
                Text="&lt;b&gt;A combinar&lt;/b&gt;" />
            <br />
            <br />
            Local de trabalho (Preferência):<asp:TextBox ID="localPreferenciaTextBox" runat="server"
                Text='<%# Bind("localPreferencia") %>' Visible="False"></asp:TextBox><br />
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3"
                DataTextField="dsuf" DataValueField="dsuf" SelectedValue='<%# Bind("localPreferencia") %>' CssClass="DropCad">
            </asp:DropDownList><br />
            <br />
            Disponibilidade:<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                ControlToValidate="RadioButtonList4" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:TextBox ID="disponibilidadeTextBox" runat="server" Text='<%# Bind("disponibilidade") %>'
                Visible="False"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList4" runat="server" DataSourceID="SqlDataSource7"
                DataTextField="disponibilidade" DataValueField="disponibilidade" SelectedValue='<%# Bind("disponibilidade") %>'>
            </asp:RadioButtonList><br />
            Como ficou sabendo do JobClick?<asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                runat="server" ControlToValidate="RadioButtonList5" Display="Dynamic" ErrorMessage="*"
                SetFocusOnError="True"></asp:RequiredFieldValidator>
            &nbsp;<asp:TextBox ID="origemTextBox" runat="server" Text='<%# Bind("origem") %>' Visible="False"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList5" runat="server" DataSourceID="SqlDataSource8"
                DataTextField="origem" DataValueField="origem" SelectedValue='<%# Bind("origem") %>'>
            </asp:RadioButtonList><br />
            <asp:CheckBox ID="privacidadeCheckBox" runat="server" Checked='<%# Bind("privacidade") %>'
                Text="Quero manter meus dados em sigilo (CPF, nome e outros)" /><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Enviar meu cadastro agora"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Atualizar meu cadastro"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbCadastroUser] WHERE [idCadastroUser] = @idCadastroUser"
        InsertCommand="INSERT INTO tbCadastroUser(idUser, foto, nome, endereco, cep, bairro, cidade, uf, pais, nascimento, sexo, cadastroTipo, apresentar, estadocivil, nrdependente, portadorDef, trabalhando, resumo, valorRemAtual, valorRemPretendida, localPreferencia, disponibilidade, origem, cpf, privacidade, acombinar, areaAtuacao, interesse01, interesse02, interesse03) VALUES (@idUser, @foto, @nome, @endereco, @cep, @bairro, @cidade, @uf, @pais, @nascimento, @sexo, @cadastroTipo, @apresentar, @estadocivil, @nrdependente, @portadorDef, @trabalhando, @resumo, @valorRemAtual, @valorRemPretendida, @localPreferencia, @disponibilidade, @origem, @cpf, @privacidade, @acombinar, @areaAtuacao, @interesse01, @interesse02, @interesse03)"
        SelectCommand="SELECT idCadastroUser, idUser, foto, nome, endereco, cep, bairro, cidade, uf, pais, nascimento, sexo, cadastroTipo, apresentar, estadocivil, nrdependente, portadorDef, trabalhando, resumo, valorRemAtual, valorRemPretendida, localPreferencia, disponibilidade, origem, cpf, privacidade, acombinar, areaAtuacao, interesse01, interesse02, interesse03 FROM tbCadastroUser WHERE (idUser = @idUser)"
        
        
        UpdateCommand="UPDATE tbCadastroUser SET idUser = @idUser, foto = @foto, nome = @nome, endereco = @endereco, cep = @cep, bairro = @bairro, cidade = @cidade, uf = @uf, pais = @pais, nascimento = @nascimento, sexo = @sexo, cadastroTipo = @cadastroTipo, apresentar = @apresentar, estadocivil = @estadocivil, nrdependente = @nrdependente, portadorDef = @portadorDef, trabalhando = @trabalhando, resumo = @resumo, valorRemAtual = @valorRemAtual, valorRemPretendida = @valorRemPretendida, localPreferencia = @localPreferencia, disponibilidade = @disponibilidade, origem = @origem, cpf = @cpf, privacidade = @privacidade, acombinar = @acombinar, areaAtuacao = @areaAtuacao, interesse01 = @interesse01, interesse02 = @interesse02, interesse03 = @interesse03 WHERE (idCadastroUser = @idCadastroUser)">
        <DeleteParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="foto" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="uf" Type="String" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="nascimento" Type="DateTime" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="cadastroTipo" Type="String" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
            <asp:Parameter Name="estadocivil" Type="String" />
            <asp:Parameter Name="nrdependente" />
            <asp:Parameter Name="portadorDef" Type="Boolean" />
            <asp:Parameter Name="trabalhando" Type="Boolean" />
            <asp:Parameter Name="resumo" Type="String" />
            <asp:Parameter Name="valorRemAtual" Type="Decimal" />
            <asp:Parameter Name="valorRemPretendida" Type="Decimal" />
            <asp:Parameter Name="localPreferencia" Type="String" />
            <asp:Parameter Name="disponibilidade" Type="String" />
            <asp:Parameter Name="origem" Type="String" />
            <asp:Parameter Name="cpf" />
            <asp:Parameter Name="privacidade" />
            <asp:Parameter Name="acombinar" />
            <asp:Parameter Name="areaAtuacao" />
            <asp:Parameter Name="interesse01" />
            <asp:Parameter Name="interesse02" />
            <asp:Parameter Name="interesse03" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="foto" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="uf" Type="String" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="nascimento" Type="DateTime" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="cadastroTipo" Type="String" />
            <asp:Parameter Name="apresentar" Type="Boolean" />
            <asp:Parameter Name="estadocivil" Type="String" />
            <asp:Parameter Name="nrdependente" />
            <asp:Parameter Name="portadorDef" />
            <asp:Parameter Name="trabalhando" Type="Boolean" />
            <asp:Parameter Name="resumo" Type="String" />
            <asp:Parameter Name="valorRemAtual" Type="Decimal" />
            <asp:Parameter Name="valorRemPretendida" Type="Decimal" />
            <asp:Parameter Name="localPreferencia" Type="String" />
            <asp:Parameter Name="disponibilidade" Type="String" />
            <asp:Parameter Name="origem" Type="String" />
            <asp:Parameter Name="cpf" />
            <asp:Parameter Name="privacidade" />
            <asp:Parameter Name="acombinar" />
            <asp:Parameter Name="areaAtuacao" />
            <asp:Parameter Name="interesse01" />
            <asp:Parameter Name="interesse02" />
            <asp:Parameter Name="interesse03" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idUser] FROM [tbuser] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [cadastroTipo] FROM [tbCadastroTipo]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [estadocivil] FROM [tbestadocivil]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [disponibilidade] FROM [tbDisponibilidade]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [origem] FROM [tbOrigem]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idUser] FROM [tbCadastroUser] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlAtuacao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idAreaAtuacaoCandidato], [dsAreaAtuacaoCandidato] FROM [tbAreaAtuacaoCandidato]">
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <link href="../App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
</asp:Content>


