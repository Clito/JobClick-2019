<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="cv.aspx.vb" Inherits="_candidato_cv" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Seu(s) Currículo(s)" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:Label ID="LabelCurriculoAtivo" runat="server" Text="Curriculo Ativo:"></asp:Label>
                <br />
                <hr />
                <br />
                Selecione abaixo qual o curriculo que você deseja alterar. <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderStyle="None" CellPadding="0" DataKeyNames="idcurriculo" DataSourceID="SqlDataSource1"
                    GridLines="None" PageSize="5" Width="100%">
                    <PagerSettings Position="Top" />
                    <RowStyle Height="25px" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/images/selectCV.gif" NavigateUrl='<%# Eval("idcurriculo", "cv.aspx?idcurriculoS={0}") %>'
                                    OnDataBinding="CargaIdCurriculo" Text="CV" 
                                    ToolTip="Clique aqui para selecionar este CV."></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" InsertVisible="False"
                            ReadOnly="True" SortExpression="idcurriculo" Visible="False" />
                        <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" SortExpression="idCadastroUser"
                            Visible="False" />
                        <asp:BoundField DataField="dscurriculo" HeaderText="CV" SortExpression="dscurriculo" />
                        <asp:BoundField DataField="dsidioma" HeaderText="Idioma" SortExpression="dsidioma" />
                        <asp:BoundField DataField="ididioma" HeaderText="Idioma" SortExpression="ididioma"
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandName="Delete"
                                    ImageUrl="~/images/btexcluir.gif" OnClientClick="return confirm('Você quer excluir este currículo?\n\nObs.: Todos os registros relacionados a este currículo serão apagados também.\nApenas os demais serão mantidos.');" />
                            </ItemTemplate>
                            <ItemStyle Width="28px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <b><span style="font-size: medium">Você ainda não iniciou o seu currículo.<br />
                        </span>
                        <br />
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/images/layout/setalat.gif" />
                        <asp:LinkButton ID="LinkButtonCV" runat="server" 
                            PostBackUrl="~/_candidato/Default.aspx"><b>Clique aqui para iniciar agora 
                        mesmo.</b></asp:LinkButton>
                        </b>
                        &nbsp;
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle CssClass="DGBGnot" />
                </asp:GridView>
                            <br />
                            <hr />
                            <br />
                            <asp:FormView ID="FormView2" runat="server" 
                    DataKeyNames="idcurriculo" DataSourceID="SqlFormCV"
                                Width="100%">
                                <EditItemTemplate>
                                    <strong>Atenção:</strong> Utilize títulos diferentes para identificar o seus Curriculos.
                                    <br />
                                    Essa titulo será visto apenas por você.<br />
                                    <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                                        Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="8px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource3" DataTextField="idCadastroUser" 
                                        DataValueField="idCadastroUser" SelectedValue='<%# Bind("idCadastroUser") %>' 
                                        Visible="False">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>' 
                                        Visible="False" Width="16px"></asp:TextBox>
                                    <br />
                                    Título do Curriculo:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                        runat="server" ControlToValidate="dscurriculoTextBox" Display="Dynamic" 
                                        ErrorMessage="* Campo obrigatório." SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <br /> 
                                    <asp:TextBox ID="dscurriculoTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("dscurriculo") %>'></asp:TextBox>
                                    <br />
                                    Idioma em que será escrito o CV:<br />
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" 
                                        DataSourceID="SqlDataSource4" DataTextField="dsidioma" 
                                        DataValueField="ididioma" SelectedValue='<%# Bind("ididioma") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:CheckBox ID="publicarCheckBox" runat="server" 
                                        Checked='<%# Bind("publicar") %>' 
                                        Text="Disponibilizar esse Curriculo para Recrutadores (Meus dados serão utilizados em Processos Seletivos)" />
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Salvar alteração"></asp:LinkButton>
                                    &nbsp;|
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancelar"></asp:LinkButton>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    Lembre-se de usar um título diferente para identificar o CV.<br />
                                    <asp:TextBox ID="idCadastroUserTextBox0" runat="server" Text='<%# Bind("idCadastroUser") %>'
                                        Visible="False" Width="8px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList3" runat="server"
                                                    DataSourceID="SqlDataSource3" DataTextField="idCadastroUser" DataValueField="idCadastroUser"
                                                    SelectedValue='<%# Bind("idCadastroUser") %>' Visible="False">
                                        </asp:DropDownList>
                                    <asp:TextBox ID="ididiomaTextBox0" runat="server" 
                                        Text='<%# Bind("ididioma") %>' Visible="False"
                                        Width="16px"></asp:TextBox>
                                    <asp:TextBox ID="contadorTextBox0" runat="server" 
                                        Text='<%# Bind("contador") %>' Visible="False"
                                        Width="8px"></asp:TextBox><br />
                                    Descrição (Título):<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="dscurriculoTextBox" Display="Dynamic" ErrorMessage="* Campo obrigatório."
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    <asp:TextBox ID="dscurriculoTextBox0" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("dscurriculo") %>'></asp:TextBox><br />
                                    Idioma em que será escrito o CV:<br />
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource4"
                                                DataTextField="dsidioma" DataValueField="ididioma" 
                                        SelectedValue='<%# Bind("ididioma") %>'>
                                    </asp:DropDownList><br />
                                    <asp:CheckBox ID="publicarCheckBox0" runat="server" Checked='<%# Bind("publicar") %>'
                                                
                                        Text="Publicar (Permitir acesso a meus dados em Processos Seletivos)" /><br />
                                    &nbsp;<br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Salvar CV"></asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancelar"></asp:LinkButton>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/layout/setalat.gif" />
                                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit">LinkButton</asp:LinkButton>
                                </ItemTemplate>
                            </asp:FormView>
                <br />
                <br />
                <br />
                <hr />
                <br />
                <asp:Panel ID="PanelCANDIDATOPAGA" runat="server" Visible="False">
                    <asp:Label ID="lblVinculo" runat="server"></asp:Label>
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idRelEmpresaCandidato" DataSourceID="SqlDataSource2" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="idRelEmpresaCandidato" HeaderText="idRelEmpresaCandidato" InsertVisible="False" ReadOnly="True" SortExpression="idRelEmpresaCandidato" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa" ShowHeader="False" SortExpression="idCadastroEmpresa" />
                            <asp:BoundField DataField="idcurriculo" SortExpression="idcurriculo" Visible="False" />
                            <asp:BoundField DataField="nmempresa" HeaderText="Este curriculo está disponivel para as Bases de Talentos das empresas listadas abaixo." SortExpression="nmempresa" />
                        </Columns>
                        <EmptyDataTemplate>
                            <%If Session("idcurriculo") <> "" Then%><%End If %>
                        </EmptyDataTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <PagerSettings Position="Top" />
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Label ID="LabelV" runat="server" Font-Bold="True" Text="Este currículo não está cadastrado na Base de Talentos desta empresa."></asp:Label>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="CriaVinculo">Disponibilizar para a Base de Talentos dessa empresa agora</asp:LinkButton>
                </asp:Panel>
                <br />
                <table id="Legenda" runat="server" border="0" cellpadding="1" cellspacing="1" 
                    visible="true" width="100%">
                    <tr>
                        <td style="width: 24px" valign="top">
                        </td>
                        <td>
                            <b>Legenda:</b></td>
                    </tr>
                    <tr>
                        <td style="width: 24px" valign="top">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/selectCV.gif" /></td>
                        <td>
                            Clique neste ícone para selecionar o CV.</td>
                    </tr>
                    <tr>
                        <td style="width: 24px" valign="top">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 24px" valign="top">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/btexcluir.gif" /></td>
                        <td>
                            Clique neste ícone para excluir o CV.
                            <br />
                            <b>Atenção:</b><br />
                            Todos os dados vinculados ao currículo selecionado para exclusão serão apagados.</td>
                    </tr>
                </table>
            </td> 
        </tr>
    </table>     
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbCurriculo] WHERE [idcurriculo] = @idcurriculo"
        InsertCommand="INSERT INTO tbCurriculo(idCadastroUser, dscurriculo, ididioma, publicar) VALUES (@idCadastroUser, @dscurriculo, @ididioma, @publicar)"
        SelectCommand="SELECT tbCurriculo.idcurriculo, tbCurriculo.idCadastroUser, tbCurriculo.dscurriculo, tbCurriculo.ididioma, tbidioma.dsidioma, tbCurriculo.publicar FROM tbCurriculo INNER JOIN tbidioma ON tbCurriculo.ididioma = tbidioma.ididioma WHERE (tbCurriculo.idCadastroUser = @idCadastroUser)"
        UpdateCommand="UPDATE tbCurriculo SET idCadastroUser = @idCadastroUser, dscurriculo = @dscurriculo, ididioma = @ididioma, publicar = @publicar WHERE (idcurriculo = @idcurriculo)">
        <DeleteParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="dscurriculo" Type="String" />
            <asp:Parameter Name="ididioma" Type="Int32" />
            <asp:Parameter Name="publicar" Type="Boolean" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="dscurriculo" Type="String" />
            <asp:Parameter Name="ididioma" Type="Int32" />
            <asp:Parameter Name="publicar" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        InsertCommand="INSERT INTO tbRelEmpresaCandidato(idCadastroEmpresa, idcurriculo) VALUES (@idCadastroEmpresa, @idcurriculo)"
        SelectCommand="SELECT [idRelEmpresaCandidato], [idCadastroEmpresa], [idcurriculo], [nmempresa] FROM [vwrelempresacandidato] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroEmpresa" />
            <asp:Parameter Name="idcurriculo" />
        </InsertParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT [idCadastroUser], [idUser] FROM [tbCadastroUser] WHERE ([idCadastroUser] = @idCadastroUser)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT [ididioma], [dsidioma] FROM [tbidioma]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlFormCV" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    DeleteCommand="DELETE FROM [tbCurriculo] WHERE [idcurriculo] = @idcurriculo"
                    InsertCommand="INSERT INTO [tbCurriculo] ([idCadastroUser], [dscurriculo], [ididioma], [publicar]) VALUES (@idCadastroUser, @dscurriculo, @ididioma, @publicar)"
                    SelectCommand="SELECT idcurriculo, idCadastroUser, dscurriculo, ididioma, publicar FROM tbCurriculo WHERE (idcurriculo = @idcurriculo)"
                    
        UpdateCommand="UPDATE [tbCurriculo] SET [idCadastroUser] = @idCadastroUser, [dscurriculo] = @dscurriculo, [ididioma] = @ididioma, [publicar] = @publicar WHERE [idcurriculo] = @idcurriculo">
                    <DeleteParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter Name="dscurriculo" Type="String" />
                        <asp:Parameter Name="ididioma" Type="Int32" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter Name="dscurriculo" Type="String" />
                        <asp:Parameter Name="ididioma" Type="Int32" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idcurriculo" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </asp:Content>

