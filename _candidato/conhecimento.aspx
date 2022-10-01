<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="conhecimento.aspx.vb" Inherits="_candidato_conhecimento" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" } });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Conhecimentos em Informática" CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idexprofissionalInformaticaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idTipoConhecimentoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idTipoConhecimentoRelLabel" runat="server" Visible="False"></asp:Label>
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
                <asp:GridView ID="GridViewInfo" runat="server" AutoGenerateColumns="False" DataKeyNames="idexprofissionalInformatica,idTipoConhecimento,idTipoConhecimentoRel"
                    DataSourceID="SqlDataSource1" Width="100%" BorderStyle="None" 
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="idexprofissionalInformatica" HeaderText="idexprofissionalInformatica"
                            InsertVisible="False" ReadOnly="True" SortExpression="idexprofissionalInformatica"
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="dsTipoConhecimento" 
                            Text="Button" />
                        <asp:BoundField DataField="dsTipoConhecimento" HeaderText="Conhecimento em:" SortExpression="dsTipoConhecimento" Visible="False" />
                        <asp:BoundField DataField="dsTipoConhecimentoRel" HeaderText="Software:"
                            SortExpression="dsTipoConhecimentoRel" />
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <asp:Label ID="MSNLabel" runat="server" CssClass="msn"></asp:Label>
                <br />
                <table runat="server" id="DropInfo" border="0" cellpadding="0" cellspacing="0" 
                    visible="false" width="100%">
                    <tr>
                        <td>
                    Conhecimento em:<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" 
                                ErrorMessage="Selecione seu conhecimento.">*</asp:RequiredFieldValidator>
                            &nbsp;<br />
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="DropCadFormCandidatoCV"
                            DataSourceID="SqlDataSource3" DataTextField="dsTipoConhecimento" 
                                DataValueField="idTipoConhecimento" Width="100%" 
                                AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Selecione seu conhecimento</asp:ListItem>
                        </asp:DropDownList><br />
                    Software:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="DropDownList2" ErrorMessage="Informe o software.">*</asp:RequiredFieldValidator>
                            <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                                CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource4"
                            DataTextField="dsTipoConhecimentoRel" DataValueField="idTipoConhecimentoRel" 
                                Width="100%">
                        </asp:DropDownList></td>
                    </tr>
                </table>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idexprofissionalInformatica"
                    DataSourceID="SqlDataSource2" DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>' Visible="False" Width="16px"></asp:TextBox><asp:TextBox ID="idTipoConhecimentoTextBox" runat="server" Text='<%# Bind("idTipoConhecimento") %>' Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="idTipoConhecimentoRelTextBox" runat="server" Text='<%# Bind("idTipoConhecimentoRel") %>' Visible="False" Width="16px"></asp:TextBox>
                        Conhecimento em:<br />
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSourceDrop1Edit"
                            DataTextField="dsTipoConhecimento" DataValueField="idTipoConhecimento" 
                            Width="100%">
                        </asp:DropDownList><br />
                        Software<br />
                        <asp:DropDownList ID="DropDownList5" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSourceDrop2Edit"
                            DataTextField="dsTipoConhecimentoRel" 
                            DataValueField="idTipoConhecimentoRel" Width="100%">
                        </asp:DropDownList><br />
                        <span class="texto3">Especifique o grau de conhecimento:</span><br />
                        <asp:DropDownList ID="DropDownList7" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource6"
                            DataTextField="dsGrauExperiencia" DataValueField="idGrauExperiencia" 
                            SelectedValue='<%# Bind("idGrauExperiencia") %>' Width="100%">
                        </asp:DropDownList><br />
                        Descreva seu nível de conhecimento:<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="obsTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="obsTextBox" runat="server" Text='<%# Bind("obs") %>' 
                            CssClass="InputCadFormCandidatoCV" Height="88px" TextMode="MultiLine" 
                            OnDataBinding="obsTextBox_DataBinding" Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Salvar" CssClass="button" 
                            ToolTip="Clique aqui para salvar as alterações feitas"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer realmente excluir este registro?")'
                            Text="Excluir" CssClass="button" 
                            ToolTip="Clique aqui para excluir este registro"></asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" OnClick="VaPara" CssClass="button" 
                            ToolTip="Clique aqui para cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <span class="texto3">Especifique o grau de conhecimento:</span><br />
                        <asp:DropDownList ID="DropDownList6" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource6"
                            DataTextField="dsGrauExperiencia" DataValueField="idGrauExperiencia" 
                            SelectedValue='<%# Bind("idGrauExperiencia") %>' Width="100%">
                        </asp:DropDownList><br />
                        Descreva seu nível de conhecimento:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="obsTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="obsTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Height="80px" Text='<%# Bind("obs") %>'
                            TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Incluir" CssClass="button" ToolTip="Clique aqui para salvar"></asp:LinkButton>
                        <asp:LinkButton ID="linkbuttonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" onclick="linkbuttonCANCELAR_Click" 
                            ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            Text="Menu Principal" OnClick="HideDrop" CssClass="button" 
                            ToolTip="Clique aqui para voltar ao menu principal"></asp:LinkButton>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>' Visible="False" Width="8px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False">
                        </asp:DropDownList>
                        <asp:TextBox ID="idTipoConhecimentoTextBox" runat="server" Text='<%# Bind("idTipoConhecimento") %>'
                            Visible="False" Width="1px"></asp:TextBox>
                        <asp:TextBox ID="idTipoConhecimentoRelTextBox" runat="server"
                            Visible="False" Width="16px"></asp:TextBox><br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idexprofissionalInformatica:
                        <asp:Label ID="idexprofissionalInformaticaLabel" runat="server" Text='<%# Eval("idexprofissionalInformatica") %>'></asp:Label><br />
                        idcurriculo:
                        <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Bind("idcurriculo") %>'></asp:Label><br />
                        idTipoConhecimento:
                        <asp:Label ID="idTipoConhecimentoLabel" runat="server" Text='<%# Bind("idTipoConhecimento") %>'></asp:Label><br />
                        idTipoConhecimentoRel:
                        <asp:Label ID="idTipoConhecimentoRelLabel" runat="server" Text='<%# Bind("idTipoConhecimentoRel") %>'></asp:Label><br />
                        obs:
                        <asp:Label ID="obsLabel" runat="server" Text='<%# Bind("obs") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="linkbuttonINC" runat="server" CausesValidation="False" 
                                        CommandName="New" CssClass="button" onclick="linkbuttonINC_Click" 
                                        ToolTip="Clique aqui para informar seus conhecimentos">Informar seus Conhecimentos em Informática</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                                        CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                        ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:FormView>
            </td> 
        </tr>
    </table> 
    <br />
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                            SelectCommand="SELECT [idTipoConhecimentoRel], [idTipoConhecimento], [dsTipoConhecimentoRel] FROM [tbTipoConhecimentoRel] WHERE ([idTipoConhecimento] = @idTipoConhecimento)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="idTipoConhecimento"
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idexprofissionalInformatica], [dsTipoConhecimentoRel], [dsTipoConhecimento], [idTipoConhecimento], [idTipoConhecimentoRel] FROM [vwinformatica] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbExperienciaInformatica] WHERE [idexprofissionalInformatica] = @idexprofissionalInformatica"
        InsertCommand="INSERT INTO [tbExperienciaInformatica] ([idcurriculo], [idTipoConhecimento], [idTipoConhecimentoRel], [idGrauExperiencia], [obs]) VALUES (@idcurriculo, @idTipoConhecimento, @idTipoConhecimentoRel, @idGrauExperiencia, @obs)"
        SelectCommand="SELECT [idexprofissionalInformatica], [idcurriculo], [idTipoConhecimento], [idTipoConhecimentoRel], [idGrauExperiencia], [obs] FROM [tbExperienciaInformatica] WHERE ([idexprofissionalInformatica] = @idexprofissionalInformatica)"
        UpdateCommand="UPDATE [tbExperienciaInformatica] SET [idcurriculo] = @idcurriculo, [idTipoConhecimento] = @idTipoConhecimento, [idTipoConhecimentoRel] = @idTipoConhecimentoRel, [idGrauExperiencia] = @idGrauExperiencia, [obs] = @obs WHERE [idexprofissionalInformatica] = @idexprofissionalInformatica">
        <DeleteParameters>
            <asp:Parameter Name="idexprofissionalInformatica" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idTipoConhecimento" Type="Int32" />
            <asp:Parameter Name="idTipoConhecimentoRel" Type="Int32" />
            <asp:Parameter Name="idGrauExperiencia" />
            <asp:Parameter Name="obs" Type="String" />
            <asp:Parameter Name="idexprofissionalInformatica" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idexprofissionalInformaticaLabel" 
                DefaultValue="0" Name="idexprofissionalInformatica" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idTipoConhecimento" Type="Int32" />
            <asp:Parameter Name="idTipoConhecimentoRel" Type="Int32" />
            <asp:Parameter Name="idGrauExperiencia" />
            <asp:Parameter Name="obs" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoConhecimento], [dsTipoConhecimento] FROM [tbConhecimentoInformatica]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [idCadastroUser] FROM [tbCurriculo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;<br />
    &nbsp;<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idGrauExperiencia], [dsGrauExperiencia] FROM [tbExperienciaInfoNivel]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDrop1Edit" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoConhecimento], [dsTipoConhecimento] FROM [tbConhecimentoInformatica] WHERE ([idTipoConhecimento] = @idTipoConhecimento)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idTipoConhecimentoLabel" DefaultValue="0" 
                Name="idTipoConhecimento" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDrop2Edit" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoConhecimentoRel], [idTipoConhecimento], [dsTipoConhecimentoRel] FROM [tbTipoConhecimentoRel] WHERE ([idTipoConhecimentoRel] = @idTipoConhecimentoRel)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idTipoConhecimentoRelLabel" DefaultValue="0" 
                Name="idTipoConhecimentoRel" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

