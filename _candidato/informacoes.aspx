<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="informacoes.aspx.vb" Inherits="_candidato_informacoes" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" } });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Página Principal" CssClass="TituloBGText"></asp:Label></td>
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
                <asp:Label ID="Label1" runat="server" CssClass="titulo" Text="Documentação"></asp:Label><br />
                <asp:GridView ID="GridViewDOC" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    CellPadding="0" DataKeyNames="idDocumento" DataSourceID="SqlDataSource2" GridLines="None"
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idDocumento" HeaderText="idDocumento" InsertVisible="False"
                            ReadOnly="True" SortExpression="idDocumento" Visible="False" />
                        <asp:BoundField DataField="idTipoDocumento" HeaderText="idTipoDocumento" SortExpression="idTipoDocumento"
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" SortExpression="idCadastroUser"
                            Visible="False" />
                        <asp:BoundField DataField="nrDocumento" HeaderText="nrDocumento" SortExpression="nrDocumento"
                            Visible="False" />
                        <asp:BoundField DataField="dsTipoDocumento" HeaderText="Documento" SortExpression="dsTipoDocumento"
                            Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="idDocumento" DataNavigateUrlFormatString="informacoes.aspx?idDocumento={0}"
                            DataTextField="dsTipoDocumento" HeaderText="Tipo do documento" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="AVISOLabel" runat="server" 
                            Text="&lt;b&gt;ATENÇÃO:&lt;/b&gt;&lt;br&gt;Apenas preencha estas informações se solicitado pelo consultor ou gestor de empresas devidamente cadastradas em nosso portal.&lt;br&gt;&lt;b&gt;JobClick &lt;/b&gt;"></asp:Label>
                        <br />
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idDocumento" DataSourceID="SqlDataSource1"
                    DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        Documento:
                        <asp:TextBox ID="idTipoDocumentoTextBox" runat="server" Text='<%# Bind("idTipoDocumento") %>'
                            Visible="False" Width="1px"></asp:TextBox>
                        <asp:TextBox ID="idCadastroUserTextBox" runat="server" Text='<%# Bind("idCadastroUser") %>'
                            Visible="False" Width="16px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource3"
                            DataTextField="dsTipoDocumento" DataValueField="idTipoDocumento" 
                            SelectedValue='<%# Bind("idTipoDocumento") %>' Width="100%">
                        </asp:DropDownList><br />
                        Número:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nrDocumentoTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="nrDocumentoTextBox"
                            ErrorMessage="* Não use (-), (.), (/) " ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="nrDocumentoTextBox" runat="server" CssClass="InputCad" MaxLength="80"
                            Text='<%# Bind("nrDocumento") %>' Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar número do documento" CssClass="button" 
                            ToolTip="Clique aqui para salvar as alterações feitas"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer excluir este documento?")' 
                            Text="Excluir" CssClass="button" 
                            ToolTip="Clique aqui para excluir este registro"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            OnClick="goBack" Text="Cancelar" CssClass="button" 
                            ToolTip="Clique aqui para cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir documento" CssClass="button" 
                            ToolTip="Clique aqui para informar um documento"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button" 
                            ToolTip="Clique aqui para voltar ao menu principal" 
                            PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        Tipo documento:
                        <asp:DropDownList ID="idCadastroUserTextBox" runat="server" DataSourceID="SqlDataSource4"
                            DataTextField="idCadastroUser" DataValueField="idCadastroUser" SelectedValue='<%# Bind("idCadastroUser") %>'
                            Visible="False">
                        </asp:DropDownList><br />
                        <asp:DropDownList ID="idTipoDocumentoTextBox" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource3"
                            DataTextField="dsTipoDocumento" DataValueField="idTipoDocumento" 
                            SelectedValue='<%# Bind("idTipoDocumento") %>' Width="100%">
                        </asp:DropDownList><br />
                        Número do documeto:<br />
                        <asp:TextBox ID="nrDocumentoTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("nrDocumento") %>' Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar" CssClass="button" ToolTip="Clique aqui para salvar"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            Text="Cancelar" CommandName="Cancel" CssClass="button" 
                            ToolTip="Clique aqui para cancelar"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir documento" CssClass="button" 
                            ToolTip="Clique aqui para incluir um documento, apenas se solicitado pela empresa."></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />
                &nbsp;<br />
            </td> 
        </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idDocumento], [idTipoDocumento], [idCadastroUser], [nrDocumento], [dsTipoDocumento] FROM [vwdocumento] WHERE ([idCadastroUser] = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbDocumento] WHERE [idDocumento] = @idDocumento"
        InsertCommand="INSERT INTO [tbDocumento] ([idTipoDocumento], [idCadastroUser], [nrDocumento]) VALUES (@idTipoDocumento, @idCadastroUser, ISNULL(@nrDocumento,0))"
        SelectCommand="SELECT [idDocumento], [idTipoDocumento], [idCadastroUser], ISNULL(nrDocumento,0) AS nrDocumento FROM [tbDocumento] WHERE (([idCadastroUser] = @idCadastroUser) AND ([idDocumento] = @idDocumento))"
        UpdateCommand="UPDATE [tbDocumento] SET [idTipoDocumento] = @idTipoDocumento, [idCadastroUser] = @idCadastroUser, [nrDocumento] = ISNULL(@nrDocumento,0) WHERE [idDocumento] = @idDocumento">
        <DeleteParameters>
            <asp:Parameter Name="idDocumento" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoDocumento" Type="Int32" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="nrDocumento" Type="String" />
            <asp:Parameter Name="idDocumento" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="idDocumento" QueryStringField="idDocumento"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoDocumento" Type="Int32" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="nrDocumento" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoDocumento], [dsTipoDocumento] FROM [tbTipoDocumento] ORDER BY [dsTipoDocumento]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idCadastroUser] FROM [tbCadastroUser] WHERE ([idCadastroUser] = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

