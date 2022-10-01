<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="pesquisaBase.aspx.vb" Inherits="_parceiroJobClick_pesquisaBase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Pesquisar Candidatos na Base Geral"></asp:Label>
            <asp:Label ID="PANELLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="refTabelaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="refTabelaNivelLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idFiltroDinamicoXML_LiberadoLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idFiltroDinamicoJSONLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="dsFiltroDinamicoJSONLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="LabelAVISOFiltro" runat="server" Text="&lt;br&gt;&lt;br&gt;Nesta área os candidatos cadastrados na base geral poderão ser selecionados, utilize os filtros para pesquisa e localize os candidatos que mais se aproximam com a vaga de sua empresa.&lt;br&gt;&lt;br&gt;Existem duas formas para utilizar a pesquisa:&lt;br&gt;&lt;br&gt;1. Filtro uso geral, neste modelo você pode fazer sua pesquisa na base sem a necessidade de ter uma vaga publicada;&lt;br&gt;2. Filtro para uma vaga específica, neste modelo você pode criar um filtro para um determino perfil de vaga.&lt;br&gt;"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Panel ID="PanelInicial" runat="server">
                <asp:LinkButton ID="LinkButtonVagaRelacionamento" runat="server" CssClass="button" ToolTip="Filtro(s) para pesquisa específica referente a uma vaga.">Filtro para uma vaga específica</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonVagaGeral" runat="server" CssClass="button" ToolTip="Filtro(s) para pesquisa geral na base de talentos.">Filtro uso geral</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonPSQ_TOP" runat="server" CssClass="buttonAtivo" ToolTip="Inicie sua pesquisa agora, veja se os filtros estão de acordo com sua necessidade." Visible="False">Inicie sua pesquisa agora!</asp:LinkButton>
            </asp:Panel>
            <br />

                             <asp:Panel ID="PaneldeVagas" runat="server" Visible="False">
                                 <asp:ImageButton ID="ImageButtonFechaVagas" runat="server" ImageUrl="~/_parceiroJobClick/images/close.png" ImageAlign="Right" CausesValidation="False" />
                                 <asp:GridView ID="GridViewVAGA" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idVagaPublica,titVagaPublica,codigo" DataSourceID="SqlDataSourceVAGA" PageSize="3" Width="100%">
                                     <Columns>
                                         <asp:TemplateField>
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/_parceiroJobClick/images/viewDescricao.png" ToolTip='<%# Eval("titVagaPublica", "Divulgar esta vaga: {0}") %>' />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Vaga" SortExpression="titVagaPublica">
                                             <EditItemTemplate>
                                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("titVagaPublica") %>'></asp:Label>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("titVagaPublica") %>' ToolTip='<%# Eval("dsVagaPublica", "[Descrição:] - {0}") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:BoundField DataField="codigo" HeaderText="Código" ReadOnly="True" SortExpression="codigo" />
                                         <asp:BoundField DataField="cnt" HeaderText="Visualizações" ReadOnly="True" SortExpression="cnt" />
                                         <asp:TemplateField HeaderText="topAn" SortExpression="topAn" Visible="False">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("topAn") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="topAnLabel" runat="server" Text='<%# Bind("topAn") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Publicar" SortExpression="publicar" Visible="False">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("publicar") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="PublicarLabel" runat="server" Text='<%# Bind("publicar") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     </Columns>
                                     <EmptyDataTemplate>
                                         <asp:Label ID="Label27" runat="server" Text="Não existem vagas publicadas no painel de vagas."></asp:Label>
                                     </EmptyDataTemplate>
                                     <PagerStyle CssClass="pgr" />
                                 </asp:GridView>
                                 <br />
                                 <asp:Label ID="LabelLeganda" runat="server" CssClass="legenda" Text="Legenda:"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Image ID="ImagePublicada" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_AP.png" ToolTip="Vagas publicadas no painel vagas patrocinadas" />
                                 &nbsp;<asp:Label ID="Label23" runat="server" CssClass="legenda" Text="Anúncio publicado nas vagas patrocinadas."></asp:Label>
                                 <br />
                                 <asp:Image ID="ImageNpublicadas" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_NP.png" ToolTip="Vagas não publicadas no painel vagas patrocinadas" />
                                 &nbsp;<asp:Label ID="Label24" runat="server" CssClass="legenda" Text="Vaga publicada no painel JobClick"></asp:Label>
                                 <br />
                                 <asp:Image ID="ImageNAnunciada" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_NA.png" ToolTip="Vagas não publicadas no painel vagas patrocinadas" />
                                 &nbsp;<asp:Label ID="Label26" runat="server" CssClass="legenda" Text="Vaga &lt;b&gt;não&lt;/b&gt; está publicada no painel JobClick"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Label ID="Label5" runat="server" CssClass="legenda" Text="&lt;b&gt;Atenção:&lt;/b&gt;&lt;br&gt;Selecione acima uma vaga para incluir ou alterar o filtro relacionado."></asp:Label>
            </asp:Panel>
            <br />
            <asp:Panel ID="PanelFiltros" runat="server" Visible="False">
                <asp:Label ID="tituloVaga" runat="server" CssClass="titulo"></asp:Label>
                <asp:ImageButton ID="ImageButtonFecharFiltro" runat="server" ImageAlign="Right" ImageUrl="~/_parceiroJobClick/images/close.png" CausesValidation="False" />
                <asp:GridView ID="GridViewFiltrosAplicados" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idFiltroDinamicoJSON,dsFiltroDinamicoJSON" DataSourceID="SqlDataSourceFiltrosAplicados" Width="100%">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:BoundField DataField="idFiltroDinamicoJSON" HeaderText="idFiltroDinamicoJSON" InsertVisible="False" ReadOnly="True" SortExpression="idFiltroDinamicoJSON" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" Visible="False" />
                        <asp:BoundField DataField="idFiltroDinamicoJSON_Liberado" HeaderText="idFiltroDinamicoJSON_Liberado" SortExpression="idFiltroDinamicoJSON_Liberado" Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="dsFiltroDinamicoJSON" HeaderText="Filtro (Nome)" />
                        <asp:BoundField DataField="pesquisaTexto" HeaderText="O que pesquisar:" SortExpression="pesquisaTexto" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm(&quot;Deseja excluir este filtro?&quot;)" Text="Excluir filtro" ToolTip="Clique aqui para excluir esta linha de filtro."></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="Labelaviso" runat="server" Font-Bold="True" ForeColor="#CC3300" Text="ATENÇÃO: Clique no botão abaixo para incluir um filtro."></asp:Label>
                    </EmptyDataTemplate>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>
                <asp:FormView ID="FormViewFiltros" runat="server" DataKeyNames="idFiltroDinamicoJSON" DataSourceID="SqlDataSourceFiltrosAplicadosForm" Width="100%" DefaultMode="Edit">
                    <EditItemTemplate>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="10px" />
                        <asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False" Width="10px" />
                        <asp:TextBox ID="IDFiltroLiberadoTextBox" runat="server" Text='<%# Bind("idFiltroDinamicoJSON_Liberado") %>' Visible="False" Width="10px"></asp:TextBox>
                        <asp:GridView ID="GridViewFiltrosLibarados" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idFiltroDinamicoJSON_Liberado,informacaoSobreFiltro" DataSourceID="SqlDataSourceFiltrosLiberados" OnSelectedIndexChanged="GridViewFiltrosLibarados_SelectedIndexChanged" PageSize="5" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="idFiltroDinamicoJSON_Liberado" HeaderText="idFiltroDinamicoJSON_Liberado" InsertVisible="False" ReadOnly="True" SortExpression="idFiltroDinamicoJSON_Liberado" Visible="False" />
                                <asp:BoundField DataField="dsFiltroDinamicoJSON" HeaderText="dsFiltroDinamicoJSON" SortExpression="dsFiltroDinamicoJSON" Visible="False" />
                                <asp:ButtonField CommandName="Select" DataTextField="dsFiltroDinamicoJSON" Text="Button" />
                                <asp:BoundField DataField="informacaoSobreFiltro" HeaderText="informacaoSobreFiltro" SortExpression="informacaoSobreFiltro" Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="LabelInfo" runat="server" Text='<%# Eval("informacaoSobreFiltro") %>'></asp:Label>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pesquisaTextoTextBox" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="pesquisaTextoTextBox" runat="server" CssClass="simple" Text='<%# Bind("pesquisaTexto") %>' Width="400px" />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Salvar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="button" Text="Cancelar" OnClick="UpdateCancelButton_Click" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="(*) Incluir um filtro para pesquisa" />
                        <asp:LinkButton ID="LinkButtonPESQUISA" runat="server" CssClass="buttonAtivo" OnClick="LinkButtonPESQUISA_Click" ToolTip="Inicie sua pesquisa agora, veja se os filtros estão de acordo com sua necessidade." Visible="False">Inicie sua pesquisa agora!</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="IDFiltroLiberadoTextBox" runat="server" Text='<%# Bind("idFiltroDinamicoJSON_Liberado") %>' Visible="False" Width="10px"></asp:TextBox>
                        <br />
                        <asp:GridView ID="GridViewFiltrosLibarados" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idFiltroDinamicoJSON_Liberado,informacaoSobreFiltro" DataSourceID="SqlDataSourceFiltrosLiberados" OnSelectedIndexChanged="GridViewFiltrosLibarados_SelectedIndexChanged" PageSize="5" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="idFiltroDinamicoJSON_Liberado" HeaderText="idFiltroDinamicoJSON_Liberado" InsertVisible="False" ReadOnly="True" SortExpression="idFiltroDinamicoJSON_Liberado" Visible="False" />
                                <asp:BoundField DataField="dsFiltroDinamicoJSON" HeaderText="dsFiltroDinamicoJSON" SortExpression="dsFiltroDinamicoJSON" Visible="False" />
                                <asp:ButtonField CommandName="Select" DataTextField="dsFiltroDinamicoJSON" Text="Button" />
                                <asp:BoundField DataField="informacaoSobreFiltro" HeaderText="informacaoSobreFiltro" SortExpression="informacaoSobreFiltro" Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="LabelInfo" runat="server" Text='<%# Eval("informacaoSobreFiltro") %>'></asp:Label>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pesquisaTextoTextBox" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="pesquisaTextoTextBox" runat="server" CssClass="simple" Text='<%# Bind("pesquisaTexto") %>' Visible="False" Width="400px" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button" Text="Salvar" Visible="False" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                        <br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="FiltroDescricaoLabel" runat="server" Font-Bold="True" Text='<%# Eval("pesquisaTexto") %>'></asp:Label>
                        <asp:Label ID="pesquisaTextoLabel" runat="server" Font-Bold="True" Text='<%# Bind("pesquisaTexto") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="button" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="button" OnClientClick="return confirm(&quot;Deseja excluir este item de filtro?&quot;)" Text="Excluir" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Incluir mais um filtro" />
                        &nbsp;<asp:LinkButton ID="LinkButtonRUN_FORM" runat="server" CssClass="buttonAtivo" OnClick="LinkButtonRUN_FORM_Click" ToolTip="Para Inicie a pesquisa com o(s) filtro(s) abaixo selecionados, clique aqui.">Inicie sua pesquisa agora!</asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />
            </asp:Panel>
            <br />
                                                <br />
                                                <br />
                                    <br />
                                    <br />

                    <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceFiltrosAplicados" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT tbFiltroDinamicoJSON.idFiltroDinamicoJSON, tbFiltroDinamicoJSON.idCadastroEmpresa, tbFiltroDinamicoJSON.idVaga, tbFiltroDinamicoJSON.idFiltroDinamicoJSON_Liberado, tbFiltroDinamicoJSON.pesquisaTexto, tbFiltroDinamicoJSON_Liberado.dsFiltroDinamicoJSON FROM tbFiltroDinamicoJSON INNER JOIN tbFiltroDinamicoJSON_Liberado ON tbFiltroDinamicoJSON.idFiltroDinamicoJSON_Liberado = tbFiltroDinamicoJSON_Liberado.idFiltroDinamicoJSON_Liberado WHERE (tbFiltroDinamicoJSON.idVaga = @idVaga) AND (tbFiltroDinamicoJSON.idCadastroEmpresa = @idCadastroEmpresa)" DeleteCommand="DELETE FROM [tbFiltroDinamicoJSON] WHERE [idFiltroDinamicoJSON] = @idFiltroDinamicoJSON">
                <DeleteParameters>
                    <asp:Parameter Name="idFiltroDinamicoJSON" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="idVagaPublicaLabel" Name="idVaga" PropertyName="Text" Type="Int32" />
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceFiltrosAplicadosForm" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [tbFiltroDinamicoJSON] WHERE [idFiltroDinamicoJSON] = @idFiltroDinamicoJSON" InsertCommand="INSERT INTO [tbFiltroDinamicoJSON] ([idCadastroEmpresa], [idVaga], [idFiltroDinamicoJSON_Liberado], [pesquisaTexto]) VALUES (@idCadastroEmpresa, @idVaga, @idFiltroDinamicoJSON_Liberado, @pesquisaTexto)" SelectCommand="SELECT tbFiltroDinamicoJSON.idFiltroDinamicoJSON, tbFiltroDinamicoJSON.idCadastroEmpresa, tbFiltroDinamicoJSON.idVaga, tbFiltroDinamicoJSON.idFiltroDinamicoJSON_Liberado, tbFiltroDinamicoJSON.pesquisaTexto, tbFiltroDinamicoJSON_Liberado.informacaoSobreFiltro FROM tbFiltroDinamicoJSON INNER JOIN tbFiltroDinamicoJSON_Liberado ON tbFiltroDinamicoJSON.idFiltroDinamicoJSON_Liberado = tbFiltroDinamicoJSON_Liberado.idFiltroDinamicoJSON_Liberado WHERE (tbFiltroDinamicoJSON.idFiltroDinamicoJSON = @idFiltroDinamicoJSON)" UpdateCommand="UPDATE [tbFiltroDinamicoJSON] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idVaga] = @idVaga, [idFiltroDinamicoJSON_Liberado] = @idFiltroDinamicoJSON_Liberado, [pesquisaTexto] = @pesquisaTexto WHERE [idFiltroDinamicoJSON] = @idFiltroDinamicoJSON">
                <DeleteParameters>
                    <asp:Parameter Name="idFiltroDinamicoJSON" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                    <asp:Parameter Name="idVaga" Type="Int32" />
                    <asp:Parameter Name="idFiltroDinamicoJSON_Liberado" Type="Int32" />
                    <asp:Parameter Name="pesquisaTexto" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="idFiltroDinamicoJSONLabel" Name="idFiltroDinamicoJSON" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                    <asp:Parameter Name="idVaga" Type="Int32" />
                    <asp:Parameter Name="idFiltroDinamicoJSON_Liberado" Type="Int32" />
                    <asp:Parameter Name="pesquisaTexto" Type="String" />
                    <asp:Parameter Name="idFiltroDinamicoJSON" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceFiltrosLiberados" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [idFiltroDinamicoJSON_Liberado], [dsFiltroDinamicoJSON], [informacaoSobreFiltro] FROM [tbFiltroDinamicoJSON_Liberado] ORDER BY [dsFiltroDinamicoJSON]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceVAGA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_RELATORIO_JSON_VAGASPUBLICAS_TEXTO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

            <br />
            <br />

        </div>
    </div>
</asp:Content>

