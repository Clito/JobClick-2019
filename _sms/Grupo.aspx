<%@ Page Language="VB" MasterPageFile="~/_user/user_MasterPage.master" MaintainScrollPositionOnPostback="true"  AutoEventWireup="false" CodeFile="Grupo.aspx.vb" Inherits="_modulo_Grupo" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="Grupo" cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="idGrupoLabel" runat="server" BorderStyle="None" Visible="False"></asp:Label>
                <br />
                <asp:Panel ID="MenuGeral" runat="server" Width="100%">
                    &nbsp;
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButtonNovo" runat="server" 
                                    ImageUrl="~/images/plus.png" />
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="NovoLinkButton" runat="server">Novo Grupo</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                <asp:Panel ID="FormularioGrupoInc" runat="server" Visible="False" Width="100%">
                    <asp:Label ID="FormLabel" runat="server" Text="Incluir Grupo" 
                        CssClass="textoCaixaAltaAzul"></asp:Label>
                    <table ID="DynamicFieldTag" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="45%">
                                &nbsp;</td>
                            <td width="55%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="IncstrNameGroupTextBox" Display="Dynamic" 
                                    ErrorMessage="É obrigatório informar o nome do grupo." SetFocusOnError="True" 
                                    ValidationGroup="Grupo">•</asp:RequiredFieldValidator>
                                <asp:Label ID="FormLabel1" runat="server" Text="Informe o nome do grupo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="IncstrNameGroupTextBox" runat="server" CssClass="textbox" 
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="FormLabel2" runat="server" 
                                    Text="Informe nome do campo dinâmico:"></asp:Label>
                                <br />
                                <asp:TextBox ID="IncDynamicFieldTag1" runat="server" CssClass="textbox" 
                                    Width="280px"></asp:TextBox>
                                <asp:ImageButton ID="ImageButtonAdd1" runat="server" 
                                    ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" 
                                    CausesValidation="False" style="width: 11px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Panel ID="PanelcDynamicFieldTag1" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel3" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag2" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd2" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag2" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel4" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag3" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd3" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag3" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel5" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag4" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd4" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag4" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel6" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag5" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd5" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag5" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel7" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag6" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd6" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag6" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel8" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag7" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd7" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag7" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel9" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag8" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd8" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag8" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel10" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag9" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd9" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                </asp:Panel>
                                <asp:Panel ID="PanelcDynamicFieldTag9" runat="server" Visible="False">
                                    <asp:Label ID="FormLabel11" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag10" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                <br />
                                <asp:Button ID="SalvaGrupoButton" runat="server" CssClass="textbox" 
                                    Text="Criar Grupo" ValidationGroup="Grupo" />
                                <asp:Button ID="ButtonCancelar" runat="server" CssClass="textbox" 
                                    Text="Cancelar" />
                            </td>
                        </tr>
                    </table>                    
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        CssClass="textoPadraoErro" ShowMessageBox="True" ValidationGroup="Grupo" />
                    <br />
                </asp:Panel>
                <asp:Panel ID="FormularioEditarGrupoInc" runat="server" Visible="False" 
                        Width="100%">
                        <asp:Label ID="FormLabel12" runat="server" CssClass="textoCaixaAltaAzul" 
                            Text="Editar Grupo"></asp:Label>
                        <table ID="DynamicFieldTag0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="45%">
                                    &nbsp;</td>
                                <td width="55%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="IncstrNameGroupTextBox" Display="Dynamic" 
                                        ErrorMessage="É obrigatório informar o nome do grupo." SetFocusOnError="True" 
                                        ValidationGroup="Grupo">•</asp:RequiredFieldValidator>
                                    <asp:Label ID="FormLabel13" runat="server" Text="Informe o nome do grupo:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncstrNameGroupTextBox0" runat="server" CssClass="textbox" 
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="FormLabel14" runat="server" 
                                        Text="Informe nome do campo dinâmico:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="IncDynamicFieldTag11" runat="server" CssClass="textbox" 
                                        Width="280px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAdd10" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/plus.png" style="width: 11px; height: 11px;" 
                                        ToolTip="Adicionar novo campo" Height="16px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Panel ID="PanelcDynamicFieldTag10" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel15" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag12" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd11" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" 
                                            style="width: 11px" />
                                        <asp:ImageButton ID="IBdel1" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag11" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel16" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag13" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd12" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel2" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag12" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel17" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag14" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd13" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel3" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag13" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel18" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag15" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd14" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel4" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag14" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel19" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag16" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd15" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel5" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag15" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel20" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag17" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd16" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel6" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag16" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel21" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag18" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd17" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel7" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag17" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel22" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag19" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonAdd18" runat="server" CausesValidation="False" 
                                            ImageUrl="~/images/plus.png" ToolTip="Adicionar novo campo" />
                                        <asp:ImageButton ID="IBdel8" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelcDynamicFieldTag18" runat="server" Visible="False">
                                        <asp:Label ID="FormLabel23" runat="server" 
                                            Text="Informe nome do campo dinâmico:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="IncDynamicFieldTag20" runat="server" CssClass="textbox" 
                                            Width="280px"></asp:TextBox>
                                        <asp:ImageButton ID="IBdel9" runat="server" ImageUrl="~/images/less.png" />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td align="left">
                                    <br />
                                    <asp:Button ID="AtualizaGrupoButton" runat="server" CssClass="textbox" 
                                        Text="Salvar alterações em Grupo" ValidationGroup="Grupo" />
                                    <asp:Button ID="ButtonCancelarEdit" runat="server" CssClass="textbox" 
                                        Text="Cancelar" />
                                </td>
                            </tr>
                        </table>
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                        CssClass="textoPadraoErro" ShowMessageBox="True" ValidationGroup="Grupo" />
                    <br />
                    </asp:Panel>                
                <asp:GridView ID="GridViewListaGrupo" runat="server" 
                    DataSourceID="SqlApresentaGrupo" AllowPaging="True" 
                    AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="0px" CellPadding="2" 
                    CellSpacing="2" DataKeyNames="idGroup,strNameGroup" PageSize="5" 
                    Width="448px">
                    <Columns>
                        <asp:BoundField DataField="idGroup" Visible="False" />
                        <asp:BoundField DataField="FKidProject" Visible="False" />
                        <asp:BoundField DataField="FKidClient" Visible="False" />
                        <asp:BoundField DataField="strNameGroup" HeaderText="Grupo">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="numTotalMailing" HeaderText="Mailing">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" 
                                    onclientclick="return confirm(&quot;Quer excluir este Grupo?&quot;)" 
                                    Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="idGroup,strNameGroup" 
                            DataNavigateUrlFormatString="Mailing.aspx?idGroup={0}&strNameGroup={1}" 
                            Text="Mailing" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlApresentaGrupo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionString %>" 
                    SelectCommand="SMSAssist.spGroup_Select" 
                    SelectCommandType="StoredProcedure" DeleteCommand="SMSAssist.spGroup_Delete" 
                    DeleteCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idClient" SessionField="idClient" Type="Int32" />
                        <asp:SessionParameter Name="idProject" SessionField="idProject" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="idGroup" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

