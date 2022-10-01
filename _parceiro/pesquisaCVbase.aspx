<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiro/parceiroPage.master" AutoEventWireup="false" CodeFile="pesquisaCVbase.aspx.vb" Inherits="_parceiro_pesquisaCVbase" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelCVCandidato.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Perfil do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
        <br />
    <table id="NAVEGADOR1" align="center" bgcolor="#F3F3F3" cellpadding="0" 
                                    cellspacing="0" width="930px">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" id="NAVEGADOR2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="PPLabelNomeEmpresa" runat="server" 
                                                            CssClass="bannerNavegadorInternoNomeEmpresa" 
                                                Text="Menu:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image2" runat="server" 
                                                            ImageUrl="~/_corporativo/images/holomatica/navegadorIndicador.png" />
                                        </td>
                                        <td>
                                        <a href="pesquisaCVBase.aspx?menu=4">Pesquisa de Curriculos</a>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel5" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <a href="pesquisaCVBaseMailing.aspx?menu=4">Pesquisa de Curriculos (Mailing)</a>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
    <h1><asp:Label ID="Label2" runat="server" Text="Pesquisa de Curriculos"></asp:Label></h1>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">&nbsp;</td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                </td>
                <td width="614"></td>
            </tr>
            <tr>
                <td width="26">
                </td>
                <td width="614">
                    <strong>ATENÇÃO:</strong> Serão apresentados apenas os curriculos que os candidatos disponibilizaram para pesquisa. Não estando em conformidade com a quantidade total de cadastrados.
                </td>
            </tr>
            <tr>
                <td width="26">
                </td>
                <td width="614"></td>
            </tr>
        </table>
<table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26"><asp:Image ID="lateral0" runat="server" 
                    ImageUrl="~/images/h26.gif" /></td>
            <td width="614">
                    <table ID="tbFiltros" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td width="100%">
                                <asp:Label ID="idFiltroDinamicoMontadorLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:GridView ID="GridViewFiltro" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="Gray" BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idFiltroDinamicoMontador,idRH_Gestor" 
                                    DataSourceID="SqlMontaFiltroPesquisa" Width="100%" ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="Editar Filtro"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="idFiltroDinamicoXML_Liberado" 
                                            HeaderText="idFiltroDinamicoXML_Liberado" InsertVisible="False" ReadOnly="True" 
                                            SortExpression="idFiltroDinamicoXML_Liberado" Visible="False" />
                                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                            SortExpression="idSetup" Visible="False" />
                                        <asp:TemplateField HeaderText="Filtro" SortExpression="dsFiltroDinamico">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dsFiltroDinamico") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" 
                                                    Text='<%# Bind("dsFiltroDinamico") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="refTabela" HeaderText="refTabela" 
                                            SortExpression="refTabela" Visible="False" />
                                        <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" 
                                            SortExpression="dataPublicacao" Visible="False" />
                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                        <asp:BoundField DataField="field" HeaderText="field" SortExpression="field" 
                                            Visible="False" />
                                        <asp:BoundField DataField="value" HeaderText="O que será filtrado" 
                                            SortExpression="value" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <table cellpadding="10" cellspacing="10" width="100%">
                                            <tr>
                                                <td>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Image ID="ImageAviso" runat="server" 
                                                                    ImageUrl="~/images/empresa/aviso.png" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label51" runat="server" 
                                                                    Text="&lt;b&gt;Dica:&lt;/b&gt;&lt;br&gt;Para iniciar uma Pesquisa de Candidatos será necessário informar quais os parâmetros da pesquisa. Após informar todos os parâmetos desejados é só clicar em [&lt;b&gt;Pesquisar base com as informações acima&lt;/b&gt;].&lt;br&gt;&lt;br&gt;&lt;b&gt;Obs.:&lt;/b&gt;&lt;br&gt;&lt;i&gt;Esta pesquisa não está ligada a nenhuma fase de um processo seletivo&lt;/i&gt;."></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <table id="GravaXML" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left">
                                <asp:FormView ID="FormViewFiltro" runat="server" 
                                    DataKeyNames="idFiltroDinamicoMontador" DataSourceID="SqlFiltro" 
                                    Width="100%">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="idRH_GestorTextBox" runat="server" 
                                            Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="5px" />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Escola um dos filtro dinâmico:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListField" runat="server" CssClass="DropCad" 
                                            DataSourceID="SqlFiltrosLiberados" DataTextField="dsFiltroDinamico" 
                                            DataValueField="refTabela" SelectedValue='<%# Bind("field") %>'>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="O que pesquisar?"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="valueTextBox" ErrorMessage="* Informe o que pesquisar">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="valueTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <asp:Label ID="Label48" runat="server" Text="Nível:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="nivelTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("nivel") %>'></asp:TextBox>
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" />
                                        <asp:LinkButton ID="ImageButton4" runat="server" CommandName="Update" 
                                            text="Criar o cadastro desse Cliente" CssClass="button" />
                                        <asp:LinkButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" text="Cancelar" CssClass="button" />
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <asp:LinkButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                            CommandName="New" text="Incluir filtro para pesquisa" CssClass="button" />
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Escola um dos filtro dinâmico:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListField" runat="server" CssClass="DropCad" 
                                            DataSourceID="SqlFiltrosLiberados" DataTextField="dsFiltroDinamico" 
                                            DataValueField="refTabela" SelectedValue='<%# Bind("field") %>'>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="O que pesquisar?"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="valueTextBox" ErrorMessage="* Informe o que pesquisar">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="valueTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <asp:Label ID="Label48" runat="server" Text="Nível:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="nivelTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("nivel") %>'></asp:TextBox>
                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" />
                                        <br />
                                        <asp:LinkButton ID="ImageButton3" runat="server" CommandName="Insert" 
                                            Text="Criar o cadastro deste cliente" CssClass="button" />
                                        &nbsp;<asp:linkbutton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" text="Cancelar" CssClass="button" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text="Você selecionou para edição o filtro:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="valueLabel" runat="server" CssClass="msnOK" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <br />
                                        <asp:LinkButton ID="ImageButton8" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Alterar" CssClass="button" />
                                        &nbsp;<asp:LinkButton ID="ImageButton6" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Excluir" CssClass="button"/>
                                        <asp:LinkButton ID="ImageButton7" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="Incluir filtro para pesquisa" CssClass="button"/>
                                    </ItemTemplate>
                                </asp:FormView>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:LinkButton ID="ImageButtonPSQ" runat="server" 
                                    Text="Pesquisar"  CssClass="button"/>
                                <br />
                                <br />
                            <asp:Panel ID="PanelApresentaRes" runat="server" Visible="False">
                                <table ID="Res" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="80%">
                                            <asp:GridView ID="GridViewResPesquisa" runat="server" 
                                                AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                                                BorderWidth="1px" DataKeyNames="idcurriculo,idUser" GridLines="Horizontal" 
                                                ShowHeader="False" Width="100%">
                                                <AlternatingRowStyle BackColor="#EBEBEB" />
                                                <Columns>
                                                    <asp:ButtonField ButtonType="Image" CommandName="Select" 
                                                        ImageUrl="~/images/candidato/bvcv.png" Text="Button" />
                                                    <asp:BoundField DataField="idcurriculo" Visible="False" />
                                                    <asp:BoundField DataField="nome" />
                                                    <asp:BoundField DataField="idUser" Visible="False" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                        <td valign="top">
                                            <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                                ImageUrl="~/images/close.png" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:Panel>
                                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idcurriculoLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="Passo1Label0" runat="server" CssClass="tituloEmp" 
                                    Text="Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:" Visible="False"></asp:Label>
                                <br />
                                <table id="IncluirFiltro" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                                 <br />
                    <asp:SqlDataSource ID="SqlFiltro" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        DeleteCommand="DELETE FROM [tbFiltroDinamicoXMLMontador_Consultor] WHERE [idFiltroDinamicoMontador] = @idFiltroDinamicoMontador" 
                        InsertCommand="INSERT INTO [tbFiltroDinamicoXMLMontador_Consultor] ([idRH_Gestor], [field], [value], [nivel]) VALUES (@idRH_Gestor, @field, @value, @nivel)" 
                        SelectCommand="SELECT [idFiltroDinamicoMontador], [idRH_Gestor], [field], [value], [nivel] FROM [tbFiltroDinamicoXMLMontador_Consultor] WHERE ([idFiltroDinamicoMontador] = @idFiltroDinamicoMontador)" 
                        
                        
                        
                        UpdateCommand="UPDATE [tbFiltroDinamicoXMLMontador_Consultor] SET [idRH_Gestor] = @idRH_Gestor, [field] = @field, [value] = @value, [nivel] = @nivel WHERE [idFiltroDinamicoMontador] = @idFiltroDinamicoMontador">
                        <DeleteParameters>
                            <asp:Parameter Name="idFiltroDinamicoMontador" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                            <asp:Parameter Name="field" Type="String" />
                            <asp:Parameter Name="value" Type="String" />
                            <asp:Parameter Name="nivel" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idFiltroDinamicoMontadorLabel" 
                                Name="idFiltroDinamicoMontador" PropertyName="Text" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                            <asp:Parameter Name="field" Type="String" />
                            <asp:Parameter Name="value" Type="String" />
                            <asp:Parameter Name="nivel" Type="String" />
                            <asp:Parameter Name="idFiltroDinamicoMontador" Type="Int32" />
                        </UpdateParameters>
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
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlMontaFiltroPesquisa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_PROCESSOSELETIVO_FILTROS_MONTADOS_CONSULTOR" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                Type="Int32" />
                            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlFiltrosLiberados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idFiltroDinamicoXML_Liberado], [idSetup], [dsFiltroDinamico], [refTabela], [dataPublicacao] FROM [tbFiltroDinamicoXML_Liberado]">
                    </asp:SqlDataSource>
                                 <br />
</td>
</tr>
</table>
                    <asp:Panel ID="PanelCVCandidato" runat="server">
                    <asp:LinkButton ID="ImageButtonImprimir" runat="server" CausesValidation="False" Text="Salvar/Imprimir" cssClass="button" />

                    <asp:DataList ID="DataListCV" runat="server" DataSourceID="SqlDADOSPESSOAIS" 
                                                                Width="100%">
                        <ItemTemplate>
                            <asp:Label ID="idCadastroUserLabel" runat="server" 
                                                                        
                                Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                            <asp:Label ID="idUserLabel0" runat="server" Text='<%# Eval("idUser") %>' 
                                                                        Visible="False" />
                            <asp:Label ID="apresentarLabel" runat="server" 
                                                                        Text='<%# Eval("apresentar") %>' 
                                Visible="False" />
                            <br />
                            <table ID="CORPOCV" cellpadding="5" cellspacing="5" width="800px">
                                <tr>
                                    <td valign="top" width="100px">
                                        <asp:Image ID="ImageCandidato" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                                                                    
                                            ToolTip='Clique aqui para ver o CV deste profissional' Width="100px" />
                                    </td>
                                    <td align="left" valign="top" width="600px">
                                        <table ID="CV" cellpadding="2" cellspacing="2" width="600px">
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados9" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Nome do Candidato(a):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="nomeLabel0" runat="server" CssClass="textoApresentaNOMECV" 
                                                                                                Font-Bold="False" 
                                                        Text='<%# Eval("nome") %>' />
                                                    <br />
                                                    <asp:Label ID="cadastroTipoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("cadastroTipo") %>' />
                                                    <br />
                                                    <asp:Label ID="emailLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("email") %>'></asp:Label>
                                                    <br />
                                                    <asp:DataList ID="DataListTELEFONE" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceTELEFONE">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("TELEFONE") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados8" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Sexo:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="sexoLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("sexo") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados0" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Área de Atuação:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="areaAtuacaoLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("areaAtuacao") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados1" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Área de interesse (1ª Opção):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="interesse01Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("interesse01") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados2" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Área de interesse (2ª Opção):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="interesse02Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("interesse02") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados3" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Área de interesse (3ª Opção):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="interesse03Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("interesse03") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados4" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="CPF:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="cpfLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cpf") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados5" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Resumo:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="resumoLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("resumo") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados6" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Endereço: (Formas de contato)"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:Label ID="enderecoLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("endereco") %>' />
                                                    <br />
                                                    <asp:Label ID="bairroLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("bairro") %>' />
                                                    <br />
                                                    <asp:Label ID="cepLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cep") %>' />
                                                    <br />
                                                    <asp:Label ID="cidadeLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cidade") %>' />
                                                    <asp:Label ID="HIFENlabel1" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text=" - "></asp:Label>
                                                    <asp:Label ID="ufLabel1" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("uf") %>' />
                                                    <asp:Label ID="HIFENlabel2" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text=" - "></asp:Label>
                                                    <asp:Label ID="paisLabel1" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("pais") %>' />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados7" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Data de Nascimento:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="nascimentoLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("nascimento", "{0:d}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados10" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Estado Civil:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="estadocivilLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("estadocivil") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados11" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Dependentes:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="nrdependenteLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("nrdependente") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados12" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Situação atual:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="trabalhandoLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("trabalhando") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados13" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Salário atual:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="valorRemAtualLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados14" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Salário pretendido:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="valorRemPretendidaLabel0" runat="server" 
                                                                                                CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados15" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="À combinar:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="acombinarLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("acombinar") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados16" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Preferência de local de trabalho:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="localPreferenciaLabel0" runat="server" 
                                                                                                CssClass="textoApresentaCV" 
                                                        Text='<%# Eval("localPreferencia") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados17" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Disponibilidade:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="disponibilidadeLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("disponibilidade") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados18" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Ficou sabendo pelo:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="origemLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("origem") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados19" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Cadastrado desde:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="dataLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("data") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados20" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Último acesso em:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="dataultimoacessLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dataultimoacess") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados21" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Visualizações deste CV:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:Label ID="contadorLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("contador") %>' />
                                                    <asp:Label ID="LabelCVDados22" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="  vezes"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados23" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Quanto a privacidade:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="privacidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("privacidade") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados24" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Necessidades especiais:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="portadorDefLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("portadorDef") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados25" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Observações (PNE):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="dsDefAuditivaLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefAuditiva") %>' />
                                                    <asp:Label ID="dsDefFalaLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefFala") %>' />
                                                    <asp:Label ID="dsDefMotoraLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefMotora") %>' />
                                                    <asp:Label ID="dsDefVisualLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefVisual") %>' />
                                                    <asp:Label ID="dsDefMentalLabel0" runat="server" CssClass="textoApresentaCV" 
                                                                                                
                                                        Text='<%# Eval("dsDefMental") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVDados26" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Referência:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:Label ID="VINCULOLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("VINCULO") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="Label48" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Formação Acadêmica:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:DataList ID="DataListFORMACAO" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceFORMACAO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label0" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="Label49" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Idioma(s):"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:DataList ID="DataListIDIOMA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceIDIOMA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label1" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="Label50" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Conhecimento(s) em informática:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:DataList ID="DataListINFORMATICA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceINFORMATICA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label2" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="Label51" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Trajetória profissional:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:DataList ID="DataListTRAJETORIA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceTRAJETORIA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label3" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                    <asp:Label ID="Label52" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Apresentação pessoal:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label53" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                
                                                        Text="Auto-Avaliação Profissional:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label54" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Competência Profissional:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label55" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Realizações:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label56" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Objetivos:"></asp:Label>
                                                </td>
                                                <td align="left" bgcolor="#F0F0F0" width="400">
                                                    <asp:DataList ID="DataListAPRESENTA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceAUTOAVALIACAO">
                                                        <ItemTemplate>
                                                            <asp:Label ID="AUTOAVALIACAOLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                        
                                                                Text='<%# Eval("AUTOAVALIACAO") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="Label57" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Videos:"></asp:Label>
                                                </td>
                                                <td align="left" width="400">
                                                    <asp:DataList ID="DataListMULTIMIDIA" runat="server" 
                                                                                                
                                                        DataSourceID="SqlDataSourceMULTIMIDIA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="MULTIMIDIALabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("MULTIMIDIA") %>' />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            &nbsp;<asp:Label ID="idsetupLabel" runat="server" Text='<%# Eval("idsetup") %>' 
                                Visible="False" />
                            &nbsp;<asp:Label ID="idcurriculoLabel4" runat="server" 
                                                                        Text='<%# Eval("idcurriculo") %>' 
                                Visible="False" />
                            <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                                                                        Visible="False" />
                            <br />
                            <table ID="BODYRESTANTE" cellpadding="5" cellspacing="5" width="800px">
                                <tr>
                                    <td valign="top" width="130px">
                                    </td>
                                    <td align="left" valign="top" width="670px">
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceFORMACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_FORMACAO" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceIDIOMA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_IDIOMA" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceINFORMATICA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_INFORMATICA" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceTRAJETORIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TRAJETORIA_PROFISSIONAL" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceTELEFONE" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TELEFONE" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceAUTOAVALIACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_AUTO_AVALIACAO" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceMULTIMIDIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_MULTIMIDIA" 
                                                                        
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
        </asp:Panel>

                                <asp:SqlDataSource ID="SqlDADOSPESSOAIS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_CURRICULO_DADOSPESSOAIS" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idCurriculo" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
        <br />
        
</asp:Content>

