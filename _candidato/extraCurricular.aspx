<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="extraCurricular.aspx.vb" Inherits="_candidato_extraCurricular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" } });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Atividade Extra Curricular " 
                    CssClass="TituloBGText"></asp:Label>
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
                <br />
                <asp:GridView ID="AtividadeLista" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idAtividadeExtracurricular" 
                    DataSourceID="SqlApresentaExtra" GridLines="None" Width="100%" 
                    CellPadding="5">
                    <AlternatingRowStyle BackColor="#EAEAEA" />
                    <Columns>
                        <asp:BoundField DataField="idAtividadeExtracurricular" 
                            HeaderText="idAtividadeExtracurricular" InsertVisible="False" ReadOnly="True" 
                            SortExpression="idAtividadeExtracurricular" Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                            SortExpression="idcurriculo" Visible="False" />
                        <asp:ButtonField CommandName="Select" 
                            DataTextField="AtividadeExtracurricularTipo" HeaderText="Tipo de Atividade(s)" 
                            Text="Button">
                        <HeaderStyle HorizontalAlign="Left" Width="250px" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="AtividadeExtracurricularTipo" 
                            HeaderText="Tipo de Atividade(s)" 
                            SortExpression="AtividadeExtracurricularTipo" Visible="False" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dsAtividadeExtracurricularAtividade" 
                            HeaderText="Qual Atividade(s)" 
                            SortExpression="dsAtividadeExtracurricularAtividade" Visible="False" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="O que foi informado por você" 
                            SortExpression="dsAtividadeExtracurricular">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    Text='<%# Bind("dsAtividadeExtracurricular") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" CssClass="textBold" 
                                    Text='<%# Eval("dsAtividadeExtracurricularAtividade") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# Bind("dsAtividadeExtracurricular") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dataCadastro" HeaderText="dataCadastro" 
                            SortExpression="dataCadastro" Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="LabelDica" runat="server" 
                            Text="Quem está começando a carreira sabe que participar de atividades extracurriculares valoriza o currículo, ajuda a ganhar um diferencial em relação a muitos candidatos e chama a atenção dos recrutadores.&lt;br&gt;Confira atividades extracurriculares que podem ser úteis na vida profissional de quem está atrás do primeiro emprego.&lt;br&gt;&lt;br&gt;&lt;b&gt;Participar de grupos artísticos&lt;/b&gt;&lt;br&gt;Fazer teatro, aulas de dança ou de música pode ajudar na carreira, mesmo que ela não tenha nada a ver com artes, pois essas atividades demonstram desenvoltura e disciplina. No teatro, por exemplo, é possível aprender a se expressar melhor, perder a timidez, ganhar autoconfiança e melhorar os relacionamentos interpessoais.&lt;br&gt;&lt;br&gt;&lt;b&gt;Praticar esportes&lt;/b&gt;&lt;br&gt;Participar de competições ensina a ter compromisso com as atividades. O esporte também trabalha a questão do grupo, quando os esportes são coletivos como futebol, dá para aprender a trabalhar equipe e lidar melhor com as adversidades. Além disso, esportes trabalham não só a saúde física, mas também a mental, deixando o profissional mais equilibrado para trabalhar.&lt;br&gt;&lt;br&gt;&lt;b&gt;Ser voluntário&lt;/b&gt;&lt;br&gt;Realizar trabalhos voluntários além de fazer bem aos outros e nos proporcionar sensação de bem estar, também pode ser bom para o currículo. Quem pratica essas atividades demonstra generosidade, disponibilidade e disciplina.&lt;br&gt;&lt;br&gt;&lt;b&gt;Fazer iniciação científica&lt;/b&gt;&lt;br&gt;As universidades disponibilizam para seus alunos a chance de pesquisar a fundo algum tema de seu interesse. O aluno pode apresentar sua ideia de estudo para a universidade e se seu projeto for aprovado ele recebe uma bolsa da faculdade e o apoio de professores para desenvolver seu trabalho. Para quem busca seguir carreira acadêmica ou para quem quer mostrar conteúdo teórico, essa atividade ajuda a enriquecer o currículo.&lt;br&gt;&lt;br&gt;&lt;b&gt;Entrar para grêmios estudantis&lt;/b&gt;&lt;br&gt;Além de divertido, fazer parte do grêmio estudantil da sua faculdade pode demonstrar profissionalmente que você tem capacidade para liderar e interresse em defender causas sociais. O estudante ainda aumenta seu círculo de amigos e sua rede de contatos, e aprende a trabalhar em equipe.&lt;br&gt;&lt;br&gt;&lt;b&gt;Trabalhar em empresa júnior&lt;/b&gt;&lt;br&gt;Passar por uma experiência em empresa júnior valoriza a vida profissional e pessoal. É a chance que o estudante tem de liderar projetos, vivenciar a rotina da sua profissão, fazer contato com empresas e aprender na prática o que funciona e o que não funciona na sua área.&lt;br&gt;&lt;br&gt;&lt;b&gt;Fazer intercâmbio&lt;/b&gt;&lt;br&gt;A vivência em um país estrangeiro traz a fluência em um novo idioma, o aprendizado de uma nova cultura e o desenvolvimento pessoal, já que quem vai precisa se virar sozinho por lá. Essa experiência deixa o currículo mais rico e chama a atenção dos recrutadores.&lt;br&gt;&lt;br&gt;&lt;b&gt;Ter um blog&lt;/b&gt;&lt;br&gt;Cada vez mais, as redes sociais fazem parte da rotina das empresas e estar por dentro das novidades é essencial. Ter um blog legal mostra que o estudante sabe usar as novas mídias e ainda permite que o recrutador conheça melhor o candidato. Só é preciso ter cuidado com o conteúdo das páginas e com os erros de português.&lt;br&gt;Portanto, fique atento! Atividade extracurricular não é coisa de outro mundo!&lt;br&gt;Escolha aquela que tem mais a ver com seus interesses e invista na sua carreira!&lt;br&gt;"></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:Label ID="MSNError" runat="server" CssClass="msn"></asp:Label>
                <br />
                <asp:Label ID="AtividadeExtracurricularTipoLabel" runat="server" 
                    Visible="False"></asp:Label>
                <asp:Label ID="dsAtividadeExtracurricularAtividadeLabel" runat="server" 
                    Visible="False"></asp:Label>
                <asp:Label ID="idAtividadeExtracurricularLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:FormView ID="FormViewExtra" runat="server" 
                    DataKeyNames="idAtividadeExtracurricular" DataSourceID="SqlExtraForm" 
                    Width="100%">
                    <EditItemTemplate>
                        &nbsp;<asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="1px" />
                        <asp:TextBox ID="AtividadeExtracurricularTipoTextBox" runat="server" 
                            Text='<%# Bind("AtividadeExtracurricularTipo") %>' Visible="False" 
                            Width="1px" />
                        <asp:TextBox ID="dsAtividadeExtracurricularAtividadeTextBox" runat="server" 
                            Text='<%# Bind("dsAtividadeExtracurricularAtividade") %>' Visible="False" 
                            Width="1px" />
                        <asp:TextBox ID="dataCadastroTextBox" runat="server" 
                            Text='<%# Bind("dataCadastro") %>' Visible="False" Width="1px" />
                        <br />
                        <asp:Label ID="LabelCabecExpDs" runat="server" 
                            Text="Descrição de sua experiência Extra Curricular:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="dsAtividadeExtracurricularTextBox" 
                            ErrorMessage="Campo [Descreva a sua experiência] é obrigatório." 
                            ValidationGroup="EEC">•</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsAtividadeExtracurricularTextBox" runat="server" 
                            CssClass="InputCad" Height="180px" 
                            Text='<%# Bind("dsAtividadeExtracurricular") %>' TextMode="MultiLine" 
                            Width="100%" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="EEC" />
                        <br />
                        <asp:LinkButton ID="LinkButtonUPDATE" runat="server" CommandName="Update" 
                            CssClass="button" ToolTip="Clique aqui para salvar as alterações">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonEXCLUIR" runat="server" CausesValidation="False" 
                            CommandName="Delete" CssClass="button" 
                            onclientclick="return confirm(&quot;Quer excluir este registro?&quot;)" 
                            ToolTip="Clique aqui para excluir este registro">Excluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButtonNOVO" runat="server" CausesValidation="False" 
                            CommandName="New" CssClass="button" 
                            ToolTip="Clique aqui para informar uma atividade extra curricular">Informar uma atividade extra curricular</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        &nbsp;<asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="1px" />
                        <asp:TextBox ID="AtividadeExtracurricularTipoTextBox" runat="server" 
                            Text='<%# Bind("AtividadeExtracurricularTipo") %>' Visible="False" 
                            Width="1px" />
                        <asp:TextBox ID="dsAtividadeExtracurricularAtividadeTextBox" runat="server" 
                            Text='<%# Bind("dsAtividadeExtracurricularAtividade") %>' Visible="False" 
                            Width="1px" />
                        <asp:TextBox ID="dataCadastroTextBox" runat="server" 
                            Text='<%# Bind("dataCadastro") %>' Visible="False" Width="1px" />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Informe qual tipo de atividade:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="DropDownListTipo" ErrorMessage="Selecione uma atividade.">•</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListTipo" runat="server" AutoPostBack="True" 
                            CssClass="DropCad" DataSourceID="SqlAtividadeTipo" 
                            DataTextField="AtividadeExtracurricularTipo" 
                            DataValueField="AtividadeExtracurricularTipo" 
                            onselectedindexchanged="DropDownListTipo_SelectedIndexChanged" 
                            Width="100%" AppendDataBoundItems="True">
                            <asp:ListItem>Selecione uma das atividades listadas aqui.</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        &nbsp;<br />
                        <asp:GridView ID="GridViewAtividade" runat="server" AutoGenerateColumns="False" 
                            BorderStyle="None" DataSourceID="SqlAtividade" GridLines="None" 
                            Width="100%" 
                            DataKeyNames="AtividadeExtracurricularTipo,dsAtividadeExtracurricularAtividade,Dicas" 
                            onselectedindexchanged="GridViewAtividade_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#E9E9E9" />
                            <Columns>
                                <asp:ButtonField CommandName="Select" 
                                    DataTextField="dsAtividadeExtracurricularAtividade" 
                                    HeaderText="Selecione qual a atividade">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="AtividadeExtracurricularTipo" 
                                    HeaderText="AtividadeExtracurricularTipo" 
                                    SortExpression="AtividadeExtracurricularTipo" Visible="False" />
                                <asp:BoundField DataField="dsAtividadeExtracurricularAtividade" 
                                    HeaderText="Selecione qual a atividade" 
                                    SortExpression="dsAtividadeExtracurricularAtividade" Visible="False">
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Dicas" HeaderText="Dicas" SortExpression="Dicas" 
                                    Visible="False" />
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text="Informe acima qual tipo de atividade extra curricular deseja informar."></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="DicasLabel" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="LabelCabecExpDs" runat="server" 
                            Text="Descreva a sua experiência:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="dsAtividadeExtracurricularTextBox" 
                            ErrorMessage="Campo [Descreva a sua experiência] é obrigatório." 
                            SetFocusOnError="True" ValidationGroup="EEC">•</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsAtividadeExtracurricularTextBox" runat="server" 
                            CssClass="InputCad" Height="180px" 
                            Text='<%# Bind("dsAtividadeExtracurricular") %>' TextMode="MultiLine" 
                            Width="100%" ValidationGroup="EEC" />
                        <br />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="EEC" />
                        <asp:LinkButton ID="LinkButtonINSERT" runat="server" CommandName="Insert" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" onclick="LinkButtonCANCELAR_Click">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                        <br />
                        &nbsp; &nbsp;
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="AtividadeExtracurricularTipoLabel" runat="server" 
                            Font-Bold="True" Text='<%# Bind("AtividadeExtracurricularTipo") %>' />
                        <br />
                        <br />
                        <asp:Label ID="dsAtividadeExtracurricularAtividadeLabel" runat="server" 
                            Font-Italic="True" Text='<%# Bind("dsAtividadeExtracurricularAtividade") %>' />
                        <br />
                        <br />
                        <asp:Label ID="dsAtividadeExtracurricularLabel" runat="server" 
                            Text='<%# Bind("dsAtividadeExtracurricular") %>' />
                        <br />
                        <asp:Label ID="dataCadastroLabel" runat="server" 
                            Text='<%# Bind("dataCadastro") %>' />
                        <br />
                        &nbsp;&nbsp;&nbsp;<br />
                        <br />
                        <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="Edit" 
                            CssClass="button" ToolTip="Clique aqui para salvar">Editar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonEXCLUIR" runat="server" CausesValidation="False" 
                            CommandName="Delete" CssClass="button" 
                            onclientclick="return confirm(&quot;Quer excluir esta Atividade Extra Curricular?&quot;)" 
                            ToolTip="Clique aqui para excluir este registro">Excluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CssClass="button" onclick="LinkButtonCANCELAR_Click" 
                            ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlApresentaExtra" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idAtividadeExtracurricular], [idcurriculo], [AtividadeExtracurricularTipo], [dsAtividadeExtracurricularAtividade], [dsAtividadeExtracurricular], [dataCadastro] FROM [tbAtividadeExtracurricular] WHERE ([idcurriculo] = @idcurriculo)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idCurriculo" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlAtividadeTipo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idAtividadeExtracurricularTipo], [AtividadeExtracurricularTipo] FROM [tbAtividadeExtracurricularTipo]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlAtividade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [AtividadeExtracurricularTipo], [dsAtividadeExtracurricularAtividade], [Dicas] FROM [tbAtividadeExtracurricularAtividade] WHERE ([AtividadeExtracurricularTipo] = @AtividadeExtracurricularTipo)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="AtividadeExtracurricularTipoLabel" 
                            Name="AtividadeExtracurricularTipo" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlExtraForm" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbAtividadeExtracurricular] WHERE [idAtividadeExtracurricular] = @idAtividadeExtracurricular" 
                    InsertCommand="INSERT INTO [tbAtividadeExtracurricular] ([idcurriculo], [AtividadeExtracurricularTipo], [dsAtividadeExtracurricularAtividade], [dsAtividadeExtracurricular], [dataCadastro]) VALUES (@idcurriculo, @AtividadeExtracurricularTipo, @dsAtividadeExtracurricularAtividade, @dsAtividadeExtracurricular, @dataCadastro)" 
                    SelectCommand="SELECT idAtividadeExtracurricular, idcurriculo, AtividadeExtracurricularTipo, dsAtividadeExtracurricularAtividade, dsAtividadeExtracurricular, dataCadastro FROM tbAtividadeExtracurricular WHERE (idcurriculo = @idcurriculo) AND (idAtividadeExtracurricular = @idAtividadeExtracurricular)" 
                    
                    UpdateCommand="UPDATE [tbAtividadeExtracurricular] SET [idcurriculo] = @idcurriculo, [AtividadeExtracurricularTipo] = @AtividadeExtracurricularTipo, [dsAtividadeExtracurricularAtividade] = @dsAtividadeExtracurricularAtividade, [dsAtividadeExtracurricular] = @dsAtividadeExtracurricular, [dataCadastro] = @dataCadastro WHERE [idAtividadeExtracurricular] = @idAtividadeExtracurricular">
                    <DeleteParameters>
                        <asp:Parameter Name="idAtividadeExtracurricular" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="AtividadeExtracurricularTipo" Type="String" />
                        <asp:Parameter Name="dsAtividadeExtracurricularAtividade" Type="String" />
                        <asp:Parameter Name="dsAtividadeExtracurricular" Type="String" />
                        <asp:Parameter Name="dataCadastro" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idCurriculo" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idAtividadeExtracurricularLabel" 
                            Name="idAtividadeExtracurricular" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="AtividadeExtracurricularTipo" Type="String" />
                        <asp:Parameter Name="dsAtividadeExtracurricularAtividade" Type="String" />
                        <asp:Parameter Name="dsAtividadeExtracurricular" Type="String" />
                        <asp:Parameter Name="dataCadastro" Type="DateTime" />
                        <asp:Parameter Name="idAtividadeExtracurricular" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

