<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="intercambio.aspx.vb" Inherits="_candidato_situacao" title="Jobclick" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" } });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Intercâmbio" CssClass="TituloBGText"></asp:Label></td>
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
                <asp:GridView ID="GridViewINTERCAMBIO" runat="server" 
                    AutoGenerateColumns="False" BorderStyle="None"
                    CellPadding="0" DataKeyNames="idintercambio" DataSourceID="SqlDataSource1" GridLines="None"
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idintercambio" HeaderText="idintercambio" InsertVisible="False"
                            ReadOnly="True" SortExpression="idintercambio" Visible="False" />
                        <asp:BoundField DataField="idTipoIntercambio" HeaderText="Interc&#226;mbio" SortExpression="idTipoIntercambio" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="pais" HeaderText="no Pais" SortExpression="pais" Visible="False" />
                        <asp:BoundField DataField="dsIntercambio" HeaderText="dsIntercambio" SortExpression="dsIntercambio"
                            Visible="False" />
                        <asp:BoundField DataField="data_ini" HeaderText="data_ini" SortExpression="data_ini"
                            Visible="False" />
                        <asp:BoundField DataField="data_fim" HeaderText="data_fim" SortExpression="data_fim"
                            Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="idintercambio" DataNavigateUrlFormatString="intercambio.aspx?idintercambio={0}"
                            DataTextField="pais" HeaderText="no Pais" />
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <br />
                <asp:FormView ID="FormViewINTERCAMBIO" runat="server" CellPadding="0" DataKeyNames="idintercambio"
                    DataSourceID="SqlDataSource5" DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        Tipo:<asp:TextBox ID="idTipoIntercambioTextBox" runat="server" Text='<%# Bind("idTipoIntercambio") %>'
                            Visible="False" Width="8px"></asp:TextBox>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="8px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource2"
                            DataTextField="idTipoIntercambio" DataValueField="idTipoIntercambio" 
                            SelectedValue='<%# Bind("idTipoIntercambio") %>' Width="100%">
                        </asp:DropDownList><br />
                        Pais:<asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' Visible="False"
                            Width="16px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource3"
                            DataTextField="pais" DataValueField="pais" 
                            SelectedValue='<%# Bind("pais") %>' Width="100%">
                        </asp:DropDownList><br />
                        Experiências adquiridas:<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="dsIntercambioTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsIntercambioTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="50px"
                            Text='<%# Bind("dsIntercambio") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        Inicio:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="data_iniTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="data_iniTextBox"
                                ErrorMessage="* Formato (dd/mm/yyyy)" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_iniTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_ini", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        Término: (Previsão)<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="data_fimTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                                ErrorMessage="* Formato (dd/mm/yyyy)" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_fimTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_fim", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Salvar alterações" CssClass="button" 
                            ToolTip="Clique aqui para salvar as alterações realizadas"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Excluir" 
                            OnClientClick='return confirm("Você quer excluir este Intercâmbio?")' 
                            CssClass="button" ToolTip="Clique aqui para excluir este intercâmbio"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancelar" OnClick="GoBack" CssClass="button" 
                            ToolTip="Clique aqui para cancelar a ação de atualizar seu intercâmbio"></asp:LinkButton>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:Label ID="INTERCAMBIOLabel" runat="server" 
                            Text="&lt;b&gt;Dicas:&lt;/b&gt;&lt;br&gt;Empresas de diversos ramos dão muito valor a essas experiências profissionais.&lt;br&gt;E, mesmo que a experiência no exterior não seja a dos sonhos, a vivência com pessoas de outras culturas sempre agrega conhecimentos e habilidades desejáveis pelas empresas. “Sem dúvida conviver com pessoas estranhas ao seu convívio ajuda a ficar melhor inserido amanhã em um ambiente corporativo”."></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir intercâmbio" CssClass="button" 
                            ToolTip="Clique aqui para incluir seu intercâmbio"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP3" runat="server" CssClass="button" 
                            PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="INTERCAMBIOLabel" runat="server" 
                            Text="&lt;b&gt;Dicas:&lt;/b&gt;&lt;br&gt;Empresas de diversos ramos dão muito valor a essas experiências profissionais.&lt;br&gt;E, mesmo que a experiência no exterior não seja a dos sonhos, a vivência com pessoas de outras culturas sempre agrega conhecimentos e habilidades desejáveis pelas empresas. “Sem dúvida conviver com pessoas estranhas ao seu convívio ajuda a ficar melhor inserido amanhã em um ambiente corporativo”."></asp:Label>
                        <br />
                        <br />
                        Tipo:<asp:TextBox ID="idTipoIntercambioTextBox" runat="server" Text='<%# Bind("idTipoIntercambio") %>'
                            Visible="False" Width="8px"></asp:TextBox>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="8px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False">
                        </asp:DropDownList><br />
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource2"
                            DataTextField="idTipoIntercambio" DataValueField="idTipoIntercambio" 
                            SelectedValue='<%# Bind("idTipoIntercambio") %>' Width="100%">
                        </asp:DropDownList><br />
                        Pais:<asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' Visible="False"
                            Width="16px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource3"
                            DataTextField="pais" DataValueField="pais" 
                            SelectedValue='<%# Bind("pais") %>' Width="100%">
                        </asp:DropDownList><br />
                        Experiências adquiridas:<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="dsIntercambioTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsIntercambioTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="50px"
                            Text='<%# Bind("dsIntercambio") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        Inicio:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="data_iniTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="data_iniTextBox"
                                ErrorMessage="* Formato (dd/mm/yyyy)" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_iniTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_ini", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        Término: (Previsão)<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="data_fimTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                                ErrorMessage="* Formato (dd/mm/yyyy)" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_fimTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_fim", "{0:d}") %>' Width="100%"></asp:TextBox><br /><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar" CssClass="button" 
                            ToolTip="Clique aqui para salvar seus dados"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CssClass="button" onclick="LinkButtonCANCELAR_Click" 
                            ToolTip="Clique aqui para cancelar a inclusão de seu intercâmbio">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            Text="Menu Principal" onclick="InsertCancelButton_Click" CssClass="button" 
                            ToolTip="Clique aqui para voltar ao menu principal"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idintercambio:
                        <asp:Label ID="idintercambioLabel" runat="server" Text='<%# Eval("idintercambio") %>'></asp:Label><br />
                        idTipoIntercambio:
                        <asp:Label ID="idTipoIntercambioLabel" runat="server" Text='<%# Bind("idTipoIntercambio") %>'></asp:Label><br />
                        idcurriculo:
                        <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Bind("idcurriculo") %>'></asp:Label><br />
                        pais:
                        <asp:Label ID="paisLabel" runat="server" Text='<%# Bind("pais") %>'></asp:Label><br />
                        dsIntercambio:
                        <asp:Label ID="dsIntercambioLabel" runat="server" Text='<%# Bind("dsIntercambio") %>'></asp:Label><br />
                        data_ini:
                        <asp:Label ID="data_iniLabel" runat="server" Text='<%# Bind("data_ini") %>'></asp:Label><br />
                        data_fim:
                        <asp:Label ID="data_fimLabel" runat="server" Text='<%# Bind("data_fim") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
            </td> 
        </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbintercambio] WHERE [idintercambio] = @idintercambio"
        InsertCommand="INSERT INTO [tbintercambio] ([idTipoIntercambio], [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim]) VALUES (@idTipoIntercambio, @idcurriculo, @pais, @dsIntercambio, @data_ini, @data_fim)"
        SelectCommand="SELECT [idintercambio], [idTipoIntercambio], [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo)"
        UpdateCommand="UPDATE [tbintercambio] SET [idTipoIntercambio] = @idTipoIntercambio, [idcurriculo] = @idcurriculo, [pais] = @pais, [dsIntercambio] = @dsIntercambio, [data_ini] = @data_ini, [data_fim] = @data_fim WHERE [idintercambio] = @idintercambio">
        <DeleteParameters>
            <asp:Parameter Name="idintercambio" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoIntercambio" Type="String" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="dsIntercambio" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="idintercambio" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoIntercambio" Type="String" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="dsIntercambio" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoIntercambio] FROM [tbTipoIntercambio]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo] FROM [tbCurriculo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbintercambio] WHERE [idintercambio] = @idintercambio"
        InsertCommand="INSERT INTO [tbintercambio] ([idTipoIntercambio], [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim]) VALUES (@idTipoIntercambio, @idcurriculo, @pais, @dsIntercambio, @data_ini, @data_fim)"
        SelectCommand="SELECT [idintercambio], [idTipoIntercambio], [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idintercambio] = @idintercambio)"
        UpdateCommand="UPDATE [tbintercambio] SET [idTipoIntercambio] = @idTipoIntercambio, [idcurriculo] = @idcurriculo, [pais] = @pais, [dsIntercambio] = @dsIntercambio, [data_ini] = @data_ini, [data_fim] = @data_fim WHERE [idintercambio] = @idintercambio">
        <DeleteParameters>
            <asp:Parameter Name="idintercambio" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoIntercambio" Type="String" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="dsIntercambio" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="idintercambio" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idintercambio" QueryStringField="idintercambio"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoIntercambio" Type="String" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="dsIntercambio" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

