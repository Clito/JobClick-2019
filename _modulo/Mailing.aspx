<%@ Page Language="VB" MasterPageFile="~/_user/user_MasterPage.master" AutoEventWireup="false" CodeFile="Mailing.aspx.vb" Inherits="_modulo_Mailing" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Mailing" cellpadding="2" cellspacing="2" width="100%">
    <tr>
        <td><asp:Label ID="idGroupLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idMailingLabel" runat="server" Visible="False"></asp:Label>
            <br />
                <asp:Panel ID="MenuGeral" runat="server" Width="100%">
                    &nbsp;
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButtonNovo" runat="server" 
                                    ImageUrl="~/images/point.png" />
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="NovoLinkButton" runat="server" 
                                    PostBackUrl="~/_modulo/Grupo.aspx" CausesValidation="False">Voltar</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataView" 
                        AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" 
                        CellPadding="2" DataKeyNames="idMailing" BorderColor="#CCCCCC" 
                        CellSpacing="2" Width="448px">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="idMailing" HeaderText="idMailing" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idMailing" 
                                Visible="False" />
                            <asp:BoundField DataField="numDDDPhoneNumber" HeaderText="Celular" 
                                SortExpression="numDDDPhoneNumber" >
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FKidClient" HeaderText="FKidClient" 
                                SortExpression="FKidClient" Visible="False" />
                            <asp:BoundField DataField="FKidGroup" HeaderText="FKidGroup" 
                                SortExpression="FKidGroup" Visible="False" />
                            <asp:BoundField DataField="strContactName" HeaderText="Contato" 
                                SortExpression="strContactName" >
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="strContactEmail" HeaderText="strContactEmail" 
                                SortExpression="strContactEmail" Visible="False" />
                            <asp:BoundField DataField="strContactCity" HeaderText="strContactCity" 
                                SortExpression="strContactCity" Visible="False" />
                            <asp:BoundField DataField="strContactState" HeaderText="strContactState" 
                                SortExpression="strContactState" Visible="False" />
                            <asp:BoundField DataField="strContactCorp" HeaderText="strContactCorp" 
                                SortExpression="strContactCorp" Visible="False" />
                            <asp:BoundField DataField="strContactCorpArea" HeaderText="strContactCorpArea" 
                                SortExpression="strContactCorpArea" Visible="False" />
                            <asp:BoundField DataField="strContactCorpPrincipalBusiness" 
                                HeaderText="strContactCorpPrincipalBusiness" 
                                SortExpression="strContactCorpPrincipalBusiness" Visible="False" />
                            <asp:BoundField DataField="strContactCorpPhone" 
                                HeaderText="strContactCorpPhone" SortExpression="strContactCorpPhone" 
                                Visible="False" />
                            <asp:BoundField DataField="strContactCPFCNPJ" HeaderText="strContactCPFCNPJ" 
                                SortExpression="strContactCPFCNPJ" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue1" HeaderText="DynamicFieldValue1" 
                                SortExpression="DynamicFieldValue1" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue2" HeaderText="DynamicFieldValue2" 
                                SortExpression="DynamicFieldValue2" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue3" HeaderText="DynamicFieldValue3" 
                                SortExpression="DynamicFieldValue3" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue4" HeaderText="DynamicFieldValue4" 
                                SortExpression="DynamicFieldValue4" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue5" HeaderText="DynamicFieldValue5" 
                                SortExpression="DynamicFieldValue5" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue6" HeaderText="DynamicFieldValue6" 
                                SortExpression="DynamicFieldValue6" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue7" HeaderText="DynamicFieldValue7" 
                                SortExpression="DynamicFieldValue7" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue8" HeaderText="DynamicFieldValue8" 
                                SortExpression="DynamicFieldValue8" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue9" HeaderText="DynamicFieldValue9" 
                                SortExpression="DynamicFieldValue9" Visible="False" />
                            <asp:BoundField DataField="DynamicFieldValue10" 
                                HeaderText="DynamicFieldValue10" SortExpression="DynamicFieldValue10" 
                                Visible="False" />
                            <asp:CheckBoxField DataField="flgActive" HeaderText="Ativo" 
                                SortExpression="flgActive" >
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="ROW_datCreate" HeaderText="ROW_datCreate" 
                                SortExpression="ROW_datCreate" Visible="False" />
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="AvisoLabel" runat="server" 
                                Text="Não existe mailing para o grupo selecionado, clique em [incluir mailing]."></asp:Label>
                        </EmptyDataTemplate>
                        <EditRowStyle BorderStyle="None" />
                        <AlternatingRowStyle BackColor="#EFEFEF" />
                    </asp:GridView>
                    <br />
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataForm" 
                        DataKeyNames="idMailing">
                        <EditItemTemplate>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" />
                            <asp:Label ID="numDDDPhoneNumberTextBoxLabel" runat="server" 
                                Text="Numero Celular:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="numDDDPhoneNumberTextBox" 
                                ErrorMessage="Celular é obrigatório.">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="numDDDPhoneNumberTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("numDDDPhoneNumber") %>' Width="200px" />
                            <cc1:MaskedEditExtender ID="numDDDPhoneNumberTextBox_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99\-9999\-9999" MaskType="Number" 
                                TargetControlID="numDDDPhoneNumberTextBox">
                            </cc1:MaskedEditExtender>
                            <br />
                            <asp:Label ID="strContactNameTextBoxLabel" runat="server" Text="Contato:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="strContactNameTextBox" ErrorMessage="Contato é obrigatório.">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="strContactNameTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactName") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactEmailLabel" runat="server" Text="E-mail:"></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="strContactEmailTextBox" 
                                ErrorMessage="E-mail deve ser válido." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="strContactEmailTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactEmail") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCityLabel" runat="server" Text="Cidade do contato:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCityTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCity") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactStateLabel" runat="server" Text="UF do contato:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactStateTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactState") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCorpLabel" runat="server" Text="Empresa do contato:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpTextBox" runat="server" CssClass="textbox" 
                                Width="200px" Text='<%# Bind("strContactCorp") %>' />
                            <br />
                            <asp:Label ID="strContactCorpAreaLabel" runat="server" Text="Área de atuação:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpAreaTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCorpArea") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCorpPrincipalBusinessLabel" runat="server" 
                                Text="Negócios principais:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpPrincipalBusinessTextBox" runat="server" 
                                CssClass="textbox" Text='<%# Bind("strContactCorpPrincipalBusiness") %>' 
                                Width="200px" />
                            <br />
                            <asp:Label ID="strContactCorpPhoneLabel" runat="server" 
                                Text="Telefone comercial:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpPhoneTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCorpPhone") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCPFCNPJLabel" runat="server" Text="CPF/CNPJ:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCPFCNPJTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCPFCNPJ") %>' Width="200px" />
                            <br />
                            <asp:Label ID="DynamicFieldValue1Label" runat="server" 
                                Text="DynamicFieldValue1"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue1TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue1") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue2Label" runat="server" 
                                Text="DynamicFieldValue2"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue2TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue2") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue3Label" runat="server" 
                                Text="DynamicFieldValue3"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue3TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue3") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue4Label" runat="server" 
                                Text="DynamicFieldValue4"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue4TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue4") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue5Label" runat="server" 
                                Text="DynamicFieldValue5"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue5TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue5") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue6Label" runat="server" 
                                Text="DynamicFieldValue6"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue6TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue6") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue7Label" runat="server" 
                                Text="DynamicFieldValue7"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue7TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue7") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue8Label" runat="server" 
                                Text="DynamicFieldValue8"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue8TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue8") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue9Label" runat="server" 
                                Text="DynamicFieldValue9"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue9TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue9") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue10Label" runat="server" 
                                Text="DynamicFieldValue10"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue10TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue10") %>' Width="200px" />
                            <br />
                            <asp:CheckBox ID="flgActiveCheckBox" runat="server" 
                                Checked='<%# Bind("flgActive") %>' Text="Liberar envio de SMS" />
                            <br />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Salvar registro" />
                            &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" />
                            <asp:Label ID="numDDDPhoneNumberTextBoxLabel" runat="server" 
                                Text="Numero Celular:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="numDDDPhoneNumberTextBox" 
                                ErrorMessage="Celular é obrigatório.">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="numDDDPhoneNumberTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("numDDDPhoneNumber") %>' Width="200px" />
                            <cc1:MaskedEditExtender ID="numDDDPhoneNumberTextBox_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99\-9999\-9999" MaskType="Number" 
                                TargetControlID="numDDDPhoneNumberTextBox">
                            </cc1:MaskedEditExtender>
                            <br />
                            <asp:Label ID="strContactNameTextBoxLabel" runat="server" Text="Contato:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="strContactNameTextBox" ErrorMessage="Contato é obrigatório.">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="strContactNameTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactName") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactEmailLabel" runat="server" Text="E-mail:"></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="strContactEmailTextBox" 
                                ErrorMessage="E-mail deve ser válido." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="strContactEmailTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactEmail") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCityLabel" runat="server" Text="Cidade do contato:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCityTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCity") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactStateLabel" runat="server" Text="UF do contato:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactStateTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactState") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCorpLabel" runat="server" Text="Empresa do contato:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpTextBox" runat="server" CssClass="textbox" 
                                Width="200px" Text='<%# Bind("strContactCorp") %>' />
                            <br />
                            <asp:Label ID="strContactCorpAreaLabel" runat="server" Text="Área de atuação:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpAreaTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCorpArea") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCorpPrincipalBusinessLabel" runat="server" 
                                Text="Negócios principais:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpPrincipalBusinessTextBox" runat="server" 
                                CssClass="textbox" Text='<%# Bind("strContactCorpPrincipalBusiness") %>' 
                                Width="200px" />
                            <br />
                            <asp:Label ID="strContactCorpPhoneLabel" runat="server" 
                                Text="Telefone comercial:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCorpPhoneTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCorpPhone") %>' Width="200px" />
                            <br />
                            <asp:Label ID="strContactCPFCNPJLabel" runat="server" Text="CPF/CNPJ:"></asp:Label>
                            <br />
                            <asp:TextBox ID="strContactCPFCNPJTextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("strContactCPFCNPJ") %>' Width="200px" />
                            <br />
                            <asp:Label ID="DynamicFieldValue1Label" runat="server" 
                                Text="DynamicFieldValue1"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue1TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue1") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue2Label" runat="server" 
                                Text="DynamicFieldValue2"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue2TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue2") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue3Label" runat="server" 
                                Text="DynamicFieldValue3"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue3TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue3") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue4Label" runat="server" 
                                Text="DynamicFieldValue4"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue4TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue4") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue5Label" runat="server" 
                                Text="DynamicFieldValue5"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue5TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue5") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue6Label" runat="server" 
                                Text="DynamicFieldValue6"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue6TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue6") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue7Label" runat="server" 
                                Text="DynamicFieldValue7"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue7TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue7") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue8Label" runat="server" 
                                Text="DynamicFieldValue8"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue8TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue8") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue9Label" runat="server" 
                                Text="DynamicFieldValue9"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue9TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue9") %>' Width="200px" />
                            <asp:Label ID="DynamicFieldValue10Label" runat="server" 
                                Text="DynamicFieldValue10"></asp:Label>
                            <asp:TextBox ID="DynamicFieldValue10TextBox" runat="server" CssClass="textbox" 
                                Text='<%# Bind("DynamicFieldValue10") %>' Width="200px" />
                            <br />
                            <asp:CheckBox ID="flgActiveCheckBox" runat="server" 
                                Checked='<%# Bind("flgActive") %>' Text="Liberar envio de SMS" />
                            <br />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Salvar registro" />
                            &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="2" cellspacing="2">
                                <tr>
                                    <td>
                                        <asp:Label ID="LabelInfo2" runat="server" Font-Bold="True" Text="Contato: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="strContactNameLabel" runat="server" Font-Bold="False" 
                                            Font-Italic="False" Text='<%# Bind("strContactName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LabelInfo1" runat="server" Font-Bold="True" Text="Celular: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="numDDDPhoneNumberLabel" runat="server" Font-Bold="False" 
                                            Text='<%# Bind("numDDDPhoneNumber") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Alterar dados" />
                            &nbsp;|&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Excluir registro" 
                                onclientclick="return confirm(&quot;Quer excluir este registro?&quot;)" />
                            &nbsp;|&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="Incluir novo mailing" />
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="Incluir mailing" />
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataForm" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionString %>" 
                        DeleteCommand="DELETE FROM [SMSCenter].[SMSSite].[TMailing] WHERE [idMailing] = @idMailing" 
                        InsertCommand="INSERT INTO SMSSite.TMailing(numDDDPhoneNumber, FKidGroup, FKidClient, strContactName, strContactEmail, strContactCity, strContactState, strContactCorp, DynamicFieldValue7, strContactCorpArea, strContactCorpPrincipalBusiness, strContactCorpPhone, strContactCPFCNPJ, DynamicFieldValue1, DynamicFieldValue2, DynamicFieldValue3, DynamicFieldValue4, DynamicFieldValue5, DynamicFieldValue6, DynamicFieldValue8, DynamicFieldValue9, DynamicFieldValue10, flgActive, ROW_FKidUserCreate, ROW_datCreate) VALUES (@numDDDPhoneNumber, @FKidGroup, @FKidClient, @strContactName, @strContactEmail, @strContactCity, @strContactState, @strContactCorp, @DynamicFieldValue7, @strContactCorpArea, @strContactCorpPrincipalBusiness, @strContactCorpPhone, @strContactCPFCNPJ, @DynamicFieldValue1, @DynamicFieldValue2, @DynamicFieldValue3, @DynamicFieldValue4, @DynamicFieldValue5, @DynamicFieldValue6, @DynamicFieldValue8, @DynamicFieldValue9, @DynamicFieldValue10, @flgActive, @ROW_FKidUserCreate, @ROW_datCreate)" 
                        SelectCommand="SELECT idMailing, numDDDPhoneNumber, FKidGroup, FKidClient, strContactName, strContactEmail, strContactCity, strContactState, strContactCorp, DynamicFieldValue7, strContactCorpArea, strContactCorpPrincipalBusiness, strContactCorpPhone, strContactCPFCNPJ, DynamicFieldValue1, DynamicFieldValue2, DynamicFieldValue3, DynamicFieldValue4, DynamicFieldValue5, DynamicFieldValue6, DynamicFieldValue8, DynamicFieldValue9, DynamicFieldValue10, flgActive, ROW_FKidUserCreate, ROW_datCreate, ROW_FKidUserAlter, ROW_datAlter FROM SMSSite.TMailing WHERE (idMailing = @idMailing) AND (FKidGroup = @FKidGroup) AND (FKidClient = @FKidClient)" 
                        
                        UpdateCommand="UPDATE [SMSCenter].[SMSSite].[TMailing] SET [numDDDPhoneNumber] = @numDDDPhoneNumber, [FKidGroup] = @FKidGroup, [FKidClient] = @FKidClient, [strContactName] = @strContactName, [strContactEmail] = @strContactEmail, [strContactCity] = @strContactCity, [strContactState] = @strContactState, [strContactCorp] = @strContactCorp, [DynamicFieldValue7] = @DynamicFieldValue7, [strContactCorpArea] = @strContactCorpArea, [strContactCorpPrincipalBusiness] = @strContactCorpPrincipalBusiness, [strContactCorpPhone] = @strContactCorpPhone, [strContactCPFCNPJ] = @strContactCPFCNPJ, [DynamicFieldValue1] = @DynamicFieldValue1, [DynamicFieldValue2] = @DynamicFieldValue2, [DynamicFieldValue3] = @DynamicFieldValue3, [DynamicFieldValue4] = @DynamicFieldValue4, [DynamicFieldValue5] = @DynamicFieldValue5, [DynamicFieldValue6] = @DynamicFieldValue6, [DynamicFieldValue8] = @DynamicFieldValue8, [DynamicFieldValue9] = @DynamicFieldValue9, [DynamicFieldValue10] = @DynamicFieldValue10, [flgActive] = @flgActive, [ROW_datCreate] = @ROW_datCreate WHERE [idMailing] = @idMailing">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idMailingLabel" Name="idMailing" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="idGroupLabel" Name="FKidGroup" 
                                PropertyName="Text" />
                            <asp:SessionParameter Name="FKidClient" SessionField="idClient" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="idMailing" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="numDDDPhoneNumber" Type="Int64" />
                            <asp:Parameter Name="FKidGroup" Type="Int32" />
                            <asp:Parameter Name="FKidClient" Type="Int32" />
                            <asp:Parameter Name="strContactName" Type="String" />
                            <asp:Parameter Name="strContactEmail" Type="String" />
                            <asp:Parameter Name="strContactCity" Type="String" />
                            <asp:Parameter Name="strContactState" Type="String" />
                            <asp:Parameter Name="strContactCorp" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue7" Type="String" />
                            <asp:Parameter Name="strContactCorpArea" Type="String" />
                            <asp:Parameter Name="strContactCorpPrincipalBusiness" Type="String" />
                            <asp:Parameter Name="strContactCorpPhone" Type="String" />
                            <asp:Parameter Name="strContactCPFCNPJ" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue1" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue2" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue3" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue4" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue5" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue6" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue8" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue9" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue10" Type="String" />
                            <asp:Parameter Name="flgActive" Type="Boolean" />
                            <asp:Parameter Name="ROW_FKidUserAlter" Type="Int32" />
                            <asp:Parameter Name="ROW_datAlter" Type="DateTime" />
                            <asp:Parameter Name="ROW_FKidUserCreate" />
                            <asp:Parameter Name="ROW_datCreate" Type="DateTime" />                            
                            <asp:Parameter Name="idMailing" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="numDDDPhoneNumber" Type="Int64" />
                            <asp:Parameter Name="FKidGroup" Type="Int32" />
                            <asp:Parameter Name="FKidClient" Type="Int32" />
                            <asp:Parameter Name="strContactName" Type="String" />
                            <asp:Parameter Name="strContactEmail" Type="String" />
                            <asp:Parameter Name="strContactCity" Type="String" />
                            <asp:Parameter Name="strContactState" Type="String" />
                            <asp:Parameter Name="strContactCorp" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue7" Type="String" />
                            <asp:Parameter Name="strContactCorpArea" Type="String" />
                            <asp:Parameter Name="strContactCorpPrincipalBusiness" Type="String" />
                            <asp:Parameter Name="strContactCorpPhone" Type="String" />
                            <asp:Parameter Name="strContactCPFCNPJ" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue1" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue2" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue3" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue4" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue5" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue6" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue8" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue9" Type="String" />
                            <asp:Parameter Name="DynamicFieldValue10" Type="String" />
                            <asp:Parameter Name="flgActive" Type="Boolean" />
                            <asp:Parameter Name="ROW_FKidUserCreate" />
                            <asp:Parameter Name="ROW_datCreate" Type="DateTime" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataView" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionString %>" 
                        SelectCommand="SELECT [idMailing], [numDDDPhoneNumber], [FKidClient], [FKidGroup], [strContactName], [strContactEmail], [strContactCity], [strContactState], [strContactCorp], [strContactCorpArea], [strContactCorpPrincipalBusiness], [strContactCorpPhone], [strContactCPFCNPJ], [DynamicFieldValue1], [DynamicFieldValue2], [DynamicFieldValue3], [DynamicFieldValue4], [DynamicFieldValue5], [DynamicFieldValue6], [DynamicFieldValue7], [DynamicFieldValue8], [DynamicFieldValue9], [DynamicFieldValue10], [flgActive], [ROW_datCreate] FROM [SMSCenter].[SMSSite].[TMailing] WHERE (([FKidGroup] = @FKidGroup) AND ([FKidClient] = @FKidClient))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idGroupLabel" Name="FKidGroup" 
                                PropertyName="Text" Type="Int32" />
                            <asp:SessionParameter Name="FKidClient" SessionField="idClient" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </asp:Panel>
                </td>
    </tr>
</table> 
</asp:Content>

