<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="idiomas.aspx.vb" Inherits="_candidato_idiomas" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelProficiencia.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Proficiência", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Idiomas" CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="ididiomaLabel" runat="server" Visible="False"></asp:Label>
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
                <asp:Label ID="Labelinfo" runat="server" 
                    Text="A JobClick utiliza a escala de proficiência ILR (do inglês Interagency Language Roundtable) é um conjunto de descrições de habilidades para se comunicar em um determinado idioma.&lt;br&gt;&lt;br&gt;Ela foi desenvolvida originalmente pelo US Foreign Service Institute, predecessor do National Foreign Affairs Training Center (NFATC), que é o instituto do governo norte-americano para capacitação de pessoal da área de relações exteriores.&lt;br&gt;&lt;br&gt;A escala consiste na descrição de cinco níveis de proficiência em um idioma.&lt;br&gt;Para ver detalhes de cada nível clique em [&lt;b&gt;Ver os níveis de proficiências&lt;/b&gt;]&lt;br&gt;&lt;br&gt;"></asp:Label>
                <br />
                <asp:DataList ID="DataListListIDIOMA" runat="server" DataKeyField="ididiomaC" 
                    DataSourceID="SqlDataSource1" Width="100%">
                    <ItemTemplate>
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="40%" align="right">
                                    <asp:Label ID="dsidiomaLabel" runat="server" CssClass="textSite" 
                                        Text='<%# Eval("dsidioma") %>' />
                                </td>
                                <td align="right" class="style2">
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="dsnivelLabel" runat="server" Text='<%# Eval("dsnivel") %>' 
                                        CssClass="textSite" />
                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right">
                                    <asp:Label ID="Label3" runat="server" Text="Seus comentários:" />
                                </td>
                                <td align="right" class="style2">
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="dscomentarioLabel" runat="server" 
                                        Text='<%# Eval("dscomentario") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%">
                                    <asp:Label ID="Label2" runat="server" Text="Sobre a proficiência informada:"></asp:Label>
                                </td>
                                <td align="right" class="style2" valign="top">
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="dsproficienciaLabel" runat="server" Font-Italic="True" 
                                        Text='<%# Eval("dsproficiencia") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%">
                                    &nbsp;</td>
                                <td align="right" class="style2" valign="top">
                                    &nbsp;</td>
                                <td align="right">
                                    <br />
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Select" 
                                        CssClass="button" 
                                        ToolTip="Para editar as informações sobre sua profeciência clique aqui">Editar</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="ididiomaCLabel" runat="server" Text='<%# Eval("ididiomaC") %>' 
                            Visible="False" />
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Eval("idcurriculo") %>' Visible="False" />
                        <asp:Label ID="ididiomaLabel" runat="server" Text='<%# Eval("ididioma") %>' 
                            Visible="False" />
                        <asp:Label ID="ididiomanivelLabel" runat="server" 
                            Text='<%# Eval("ididiomanivel") %>' Visible="False" />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:FormView ID="FormViewIDIOMA" runat="server" DataKeyNames="ididiomaC" DataSourceID="SqlDataListaIdiomaCANDIDATO"
                    DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        Idioma:<asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>'
                            Visible="False" Width="1px"></asp:TextBox>
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="16px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource4"
                            DataTextField="dsidioma" DataValueField="ididioma" 
                            SelectedValue='<%# Bind("ididioma") %>' Width="100%">
                        </asp:DropDownList><br />
                        Proficiência:<asp:TextBox ID="ididiomanivelTextBox" runat="server" Text='<%# Bind("ididiomanivel") %>'
                            Visible="False" Width="8px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource5"
                            DataTextField="dsnivel" DataValueField="ididiomanivel" 
                            SelectedValue='<%# Bind("ididiomanivel") %>' Width="100%">
                        </asp:DropDownList><br />
                        Comentários sobre sua proficiência: (Se houver)<br />
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Height="104px" MaxLength="255"
                            Text='<%# Bind("dscomentario") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Update" 
                            CssClass="button" ToolTip="Clique aqui para salvar as alterações">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonEXCLUIR" runat="server" CausesValidation="False" 
                            CommandName="Delete" CssClass="button" 
                            onclientclick="return confirm(&quot;Você quer excluir este idioma?&quot;)" 
                            ToolTip="Clique aqui para excluir o idioma selecionado">Excluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" onclick="LinkButtonCANCELAR_Click" 
                            ToolTip="Clique aqui para cancelar a alteração de idiomas">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="LinkButtonINC" runat="server" CausesValidation="False" 
                                        CommandName="New" CssClass="button" 
                                        ToolTip="Clique aqui para informar seus conhecimentos em idiomas">Informar conhecimento de Idiomas</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                                        CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                        ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonProficiencia" runat="server" CssClass="button" 
                                        onclick="LinkButtonProficiencia_Click" 
                                        ToolTip="Para ver detalhes de cada nível clique aqui">Ver os níveis de proficiências</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        Idioma:
                        <asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>' Visible="False"
                            Width="16px"></asp:TextBox>
                        <asp:DropDownList ID="idcurriculoTextBox" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False">
                        </asp:DropDownList>
                        <br />
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource4"
                            DataTextField="dsidioma" DataValueField="ididioma" 
                            SelectedValue='<%# Bind("ididioma") %>' Width="100%">
                        </asp:DropDownList><br />
                        Proficiência:
                        <asp:TextBox ID="ididiomanivelTextBox" runat="server" Text='<%# Bind("ididiomanivel") %>'
                            Visible="False" Width="8px"></asp:TextBox><br />
                        <asp:DropDownList ID="DropDownList5" runat="server" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSource5"
                            DataTextField="dsnivel" DataValueField="ididiomanivel" 
                            SelectedValue='<%# Bind("ididiomanivel") %>' Width="100%">
                        </asp:DropDownList><br />
                        Comentários sobre sua proficiência: (Se houver)<br />
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Height="104px" MaxLength="255"
                            Text='<%# Bind("dscomentario") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="LinkButtonINC" runat="server" CommandName="Insert" 
                            CssClass="button" 
                            ToolTip="Preencha os dados do formulário e clique aqui para salvar">Incluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMPInc" runat="server" CssClass="button" 
                            PostBackUrl="~/_candidato/Default.aspx" ToolTip="Voltar ao menu principal">Menu Principal</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonProficiencia" runat="server" CssClass="button" 
                            onclick="LinkButtonProficiencia_Click" 
                            ToolTip="Para ver detalhes de cada nível clique aqui">Ver os níveis de proficiências</asp:LinkButton>
                        <br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ididiomaC:
                        <asp:Label ID="ididiomaCLabel" runat="server" Text='<%# Eval("ididiomaC") %>'></asp:Label><br />
                        idcurriculo:
                        <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Bind("idcurriculo") %>'></asp:Label><br />
                        ididioma:
                        <asp:Label ID="ididiomaLabel" runat="server" Text='<%# Bind("ididioma") %>'></asp:Label><br />
                        ididiomanivel:
                        <asp:Label ID="ididiomanivelLabel" runat="server" Text='<%# Bind("ididiomanivel") %>'></asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:Panel ID="PanelProficiencia" runat="server">
                    <asp:DataList ID="DataListProficiencia" runat="server" 
    DataKeyField="ididiomanivel" DataSourceID="SqlDataSource5" 
    Width="100%">
                        <ItemTemplate>
                            <table cellpadding="5" cellspacing="5" width="100%">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="dsnivelLabel" runat="server" 
                                    CssClass="textSite" Text='<%# Eval("dsnivel") %>' />
                                                </td>
                                                <td align="right">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="dsproficienciaLabel" runat="server" 
                        Text='<%# Eval("dsproficiencia") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
            </td> 
        </tr>
    </table> 
                <asp:GridView ID="GridViewIDIOMA" runat="server" 
        AutoGenerateColumns="False" BorderStyle="None"
                    CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource1" GridLines="None"
                    Width="100%" DataKeyNames="ididioma,ididiomaC" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="ididiomaC" HeaderText="ididiomaC" InsertVisible="False"
                            ReadOnly="True" SortExpression="ididiomaC" Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="ididioma" HeaderText="ididioma" SortExpression="ididioma"
                            Visible="False" />
                        <asp:BoundField DataField="ididiomanivel" HeaderText="ididiomanivel" SortExpression="ididiomanivel"
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="dsidioma" 
                            HeaderText="Idioma" Text="Button" >
                        <ItemStyle Width="120px" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="dsidioma" HeaderText="Idioma" SortExpression="dsidioma"
                            Visible="False">
                            <HeaderStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dsnivel" HeaderText="Profici&#234;ncia " SortExpression="dsnivel">
                            <HeaderStyle Width="250px" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="_USP_IDIOMA_CANDIDATO_CURRICULO" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataListaIdiomaCANDIDATO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbIdiomaC] WHERE [ididiomaC] = @ididiomaC" InsertCommand="INSERT INTO [tbIdiomaC] ([idcurriculo], [ididioma], [ididiomanivel], [dscomentario]) VALUES (@idcurriculo, @ididioma, @ididiomanivel, @dscomentario)"
        SelectCommand="SELECT [ididiomaC], [idcurriculo], [ididioma], [ididiomanivel], [dscomentario] FROM [tbIdiomaC] WHERE ([ididiomaC] = @ididiomaC)"
        
        UpdateCommand="UPDATE [tbIdiomaC] SET [idcurriculo] = @idcurriculo, [ididioma] = @ididioma, [ididiomanivel] = @ididiomanivel, [dscomentario] = @dscomentario WHERE [ididiomaC] = @ididiomaC">
        <DeleteParameters>
            <asp:Parameter Name="ididiomaC" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="ididioma" Type="Int32" />
            <asp:Parameter Name="ididiomanivel" Type="Int32" />
            <asp:Parameter Name="dscomentario" />
            <asp:Parameter Name="ididiomaC" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ididiomaLabel" DefaultValue="0" 
                Name="ididiomaC" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="ididioma" Type="Int32" />
            <asp:Parameter Name="ididiomanivel" Type="Int32" />
            <asp:Parameter Name="dscomentario" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [idCadastroUser] FROM [tbCurriculo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [ididioma], [dsidioma] FROM [tbidioma]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT [ididiomanivel], [dsnivel], [dsproficiencia] FROM [tbIdiomaNivel]"></asp:SqlDataSource>
    <br />
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 14%;
        }
        .style2
        {
            width: 3%;
        }
    </style>
</asp:Content>


