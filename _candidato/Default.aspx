<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_candidato_Default" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Menu Principal" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td style="width: 30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                &nbsp;<br />
                <table border="0" cellpadding="0" cellspacing="0" width="690px">
                    <tr>
                        <td>
                            <strong>Olá <%=Session("nome")%>,<br />
                                <br />
                            </strong>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idcurriculo" DataSourceID="SqlDataSource2"
                                GridLines="None" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" InsertVisible="False"
                                        ReadOnly="True" SortExpression="idcurriculo" Visible="False" />
                                    <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" SortExpression="idCadastroUser"
                                        Visible="False" />
                                    <asp:BoundField DataField="dscurriculo" HeaderText="CV" SortExpression="dscurriculo" />
                                    <asp:BoundField DataField="ididioma" HeaderText="ididioma" SortExpression="ididioma"
                                        Visible="False" />
                                    <asp:BoundField DataField="dsidioma" HeaderText="Idioma" SortExpression="dsidioma" />
                                    <asp:TemplateField HeaderText="Disponibilizar para Recrutadores" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandName="Select"
                                                ImageUrl="~/images/ckPublica_off.gif" Text="Button" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="publicar" SortExpression="publicar" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idcurriculo" DataSourceID="SqlFormCV"
                                        DefaultMode="Insert">
                                        <EditItemTemplate>
                                            idcurriculo:
                                            <asp:Label ID="idcurriculoLabel1" runat="server" Text='<%# Eval("idcurriculo") %>'>
                                            </asp:Label><br />
                                            idCadastroUser:
                                            <asp:TextBox ID="idCadastroUserTextBox" runat="server" Text='<%# Bind("idCadastroUser") %>'>
                                            </asp:TextBox><br />
                                            dscurriculo:
                                            <asp:TextBox ID="dscurriculoTextBox" runat="server" Text='<%# Bind("dscurriculo") %>'>
                                            </asp:TextBox><br />
                                            ididioma:
                                            <asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>'>
                                            </asp:TextBox><br />
                                            publicar:
                                            <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' /><br />
                                            contador:
                                            <asp:TextBox ID="contadorTextBox" runat="server" Text='<%# Bind("contador") %>'>
                                            </asp:TextBox><br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                Text="Update">
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancel">
                                            </asp:LinkButton>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <b><span style="font-size: medium">Inicie aqui o seu Currículo.</span></b><br />
                                            <br />
                                            <asp:Label ID="lblCV" runat="server" Font-Bold="True" Text="Observação:"></asp:Label><br />
                                            No sistema <b>JobClick®</b> existe a possibilidade de se ter vários currículos 
                                            em uma única conta. Isso ajuda aos candidatos que possuem muita experiência 
                                            profissional e que quer &quot;direcionar&quot; os seus esforços para uma determinada 
                                            posição.<br />
                                            <br />
                                            Para dar inicio informe o título que será utilizado na identificação do deu CV.&nbsp;<br />
                                            <br />
                                            <b>Atenção:</b> este título será apresentado para as empresas.&nbsp;<br />
                                            <asp:TextBox ID="idCadastroUserTextBox" runat="server" Text='<%# Bind("idCadastroUser") %>'
                                                Visible="False" Width="8px"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server"
                                                    DataSourceID="SqlDataSource3" DataTextField="idCadastroUser" DataValueField="idCadastroUser"
                                                    SelectedValue='<%# Bind("idCadastroUser") %>' Visible="False">
                                                </asp:DropDownList>
                                            <asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>' Visible="False"
                                                Width="16px"></asp:TextBox>
                                            <asp:TextBox ID="contadorTextBox" runat="server" Text='<%# Bind("contador") %>' Visible="False"
                                                Width="8px"></asp:TextBox><br />
                                            (Título):<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="dscurriculoTextBox" Display="Dynamic" ErrorMessage="* Campo obrigatório."
                                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                            <asp:TextBox ID="dscurriculoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("dscurriculo") %>'></asp:TextBox><br />
                                            Em qual idioma será escrito este CV:<br />
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource4"
                                                DataTextField="dsidioma" DataValueField="ididioma" SelectedValue='<%# Bind("ididioma") %>'>
                                            </asp:DropDownList><br />
                                            <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>'
                                                Text="Liberar para visualização" /><br />
                                            &nbsp;<br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                Text="Salvar CV"></asp:LinkButton>
                                            |
                                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancelar"></asp:LinkButton>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            idcurriculo:
                                            <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Eval("idcurriculo") %>'></asp:Label><br />
                                            idCadastroUser:
                                            <asp:Label ID="idCadastroUserLabel" runat="server" Text='<%# Bind("idCadastroUser") %>'></asp:Label><br />
                                            dscurriculo:
                                            <asp:Label ID="dscurriculoLabel" runat="server" Text='<%# Bind("dscurriculo") %>'></asp:Label><br />
                                            ididioma:
                                            <asp:Label ID="ididiomaLabel" runat="server" Text='<%# Bind("ididioma") %>'></asp:Label><br />
                                            publicar:
                                            <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>'
                                                Enabled="false" /><br />
                                            contador:
                                            <asp:Label ID="contadorLabel" runat="server" Text='<%# Bind("contador") %>'></asp:Label><br />
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit"></asp:LinkButton>
                                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                                Text="Delete"></asp:LinkButton>
                                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                                Text="New"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:FormView>
                                </EmptyDataTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="DGBGnot" />
                            </asp:GridView>
                            <asp:Label ID="TokenLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="emailLabel" runat="server" Visible="False"></asp:Label>
                            <br />
                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="idcurriculo" DataSourceID="SqlFormCV"
                                Width="344px">
                                <EditItemTemplate>
                                    Lembre-se de usar um título diferente para identificar o CV.<br />
                                    <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                                        Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="8px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource3" DataTextField="idCadastroUser" 
                                        DataValueField="idCadastroUser" SelectedValue='<%# Bind("idCadastroUser") %>' 
                                        Visible="False">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>' 
                                        Visible="False" Width="16px"></asp:TextBox>
                                    <asp:TextBox ID="contadorTextBox" runat="server" Text='<%# Bind("contador") %>' 
                                        Visible="False" Width="8px"></asp:TextBox>
                                    <br />
                                    Descrição (Título):<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
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
                                        Checked='<%# Bind("publicar") %>' Text="Liberar para visualização" />
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
                                    <asp:TextBox ID="idCadastroUserTextBox" runat="server" Text='<%# Bind("idCadastroUser") %>'
                                        Visible="False" Width="8px"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server"
                                                    DataSourceID="SqlDataSource3" DataTextField="idCadastroUser" DataValueField="idCadastroUser"
                                                    SelectedValue='<%# Bind("idCadastroUser") %>' Visible="False">
                                        </asp:DropDownList>
                                    <asp:TextBox ID="ididiomaTextBox" runat="server" Text='<%# Bind("ididioma") %>' Visible="False"
                                        Width="16px"></asp:TextBox>
                                    <asp:TextBox ID="contadorTextBox" runat="server" Text='<%# Bind("contador") %>' Visible="False"
                                        Width="8px"></asp:TextBox><br />
                                    Descrição (Título):<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="dscurriculoTextBox" Display="Dynamic" ErrorMessage="* Campo obrigatório."
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    <asp:TextBox ID="dscurriculoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("dscurriculo") %>'></asp:TextBox><br />
                                    Idioma em que será escrito o CV:<br />
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" DataSourceID="SqlDataSource4"
                                                DataTextField="dsidioma" DataValueField="ididioma" SelectedValue='<%# Bind("ididioma") %>'>
                                    </asp:DropDownList><br />
                                    <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>'
                                                Text="Liberar para visualização" /><br />
                                    &nbsp;<br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Salvar CV"></asp:LinkButton>
                                    |
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancelar"></asp:LinkButton>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="Incluir novo currículo"></asp:LinkButton>
                                    |
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/_candidato/cv.aspx">Selecionar 
                                    Currículo</asp:HyperLink>
                                </ItemTemplate>
                            </asp:FormView>
                            <br />
                            <asp:LinkButton ID="LinkButtonHistorico" runat="server" CssClass="button">Seu Extrato</asp:LinkButton>
                            <br />
                            <br />
                            <asp:Label ID="AvisoLabel" runat="server" 
                                Text="O &lt;b&gt;JobClick&lt;/b&gt;, procura encontrar as oportunidades que mais se aproximam com o seu perfil profissional.&lt;br&gt;As informações solicitadas nos formulários, é uma maneira de criar filtros inteligentes, que irão aproximar você de seu próximo emprego.&lt;br&gt;&lt;i&gt;É importante, mas não obrigatório, o preenchimento de todas as informações solicitadas neste portal.&lt;br&gt;&lt;b&gt;A eficiência do sistema depende 100% de você!&lt;/b&gt;&lt;/i&gt;"></asp:Label>
                            <br />
                            <br />
                                <asp:DataList ID="Status" runat="server" DataKeyField="ID" 
                                DataSourceID="SqlStatusCV" Width="100%">
                                    <ItemTemplate>
                                        <table ID="STATUS2" cellpadding="5" cellspacing="5" width="100%">
                                            <tr>
                                                <td bgcolor="#EFEFEF" width="70%">
                                                    <asp:HyperLink ID="HyperLink0" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/administraCV.aspx">Dados Pessoais</asp:HyperLink>
                                                </td>
                                                <td valign="baseline" width="30%" align="center" bgcolor="#EFEFEF">
                                                    <asp:Panel ID="PanelDADOSPESSOAIS" runat="server" CssClass="STATUSNOK" 
                                                        Height="25px">
                                                        <asp:Label ID="DADOSPESSOAISLabel" runat="server" 
                                                            Text='<%# Eval("DADOSPESSOAIS") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#FAFAFA">
                                                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/formacaoAcademica.aspx">Formação Acadêmica</asp:HyperLink>
                                                </td>
                                                <td valign="baseline" width="30%" align="center" bgcolor="#FAFAFA">
                                                    <asp:Panel ID="PanelFORMACAO" runat="server" CssClass="STATUSNOK" Height="25px">
                                                        <asp:Label ID="FORMACAOLabel" runat="server" Text='<%# Eval("FORMACAO") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EFEFEF" width="70%">
                                                    <asp:HyperLink ID="HyperLink6" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/experiencia.aspx">Experiência Profissional</asp:HyperLink>
                                                </td>
                                                <td valign="baseline" width="30%" align="center" bgcolor="#EFEFEF">
                                                    <asp:Panel ID="PanelEXPERIENCIA" runat="server" CssClass="STATUSNOK" 
                                                        Height="25px">
                                                        <asp:Label ID="EXPERIENCIALabel" runat="server" 
                                                            Text='<%# Eval("EXPERIENCIA") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#FAFAFA">
                                                    <asp:HyperLink ID="HyperLink5" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/conhecimento.aspx">Conhecimentos em Informática</asp:HyperLink>
                                                </td>
                                                <td width="30%" align="center" bgcolor="#FAFAFA">
                                                    <asp:Panel ID="PanelINFORMATICA" runat="server" CssClass="STATUSNOK" 
                                                        Height="25px">
                                                        <asp:Label ID="INFORMATICALabel" runat="server" 
                                                            Text='<%# Eval("INFORMATICA") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#EFEFEF">
                                                    <asp:HyperLink ID="HyperLink7" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/idiomas.aspx">Idiomas</asp:HyperLink>
                                                </td>
                                                <td width="30%" align="center" bgcolor="#EFEFEF">
                                                    <asp:Panel ID="PanelIDIOMA" runat="server" CssClass="STATUSNOK" Height="25px">
                                                        <asp:Label ID="IDIOMALabel" runat="server" Text='<%# Eval("IDIOMA") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#FAFAFA">
                                                    <asp:HyperLink ID="HyperLink8" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/contato.aspx">Telefones para contato</asp:HyperLink>
                                                </td>
                                                <td width="30%" align="center" bgcolor="#FAFAFA">
                                                    <asp:Panel ID="PanelTELEFONE" runat="server" CssClass="STATUSNOK" Height="25px">
                                                        <asp:Label ID="TELEFONELabel" runat="server" Text='<%# Eval("TELEFONE") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#EFEFEF">
                                                    <asp:HyperLink ID="HyperLink12" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/objetivo.aspx">Apresentação Pessoal e Auto-Avaliação Profissional</asp:HyperLink>
                                                </td>
                                                <td width="30%" align="center" bgcolor="#EFEFEF">
                                                    <asp:Panel ID="PanelSUMARIO" runat="server" CssClass="STATUSNOK" Height="25px">
                                                        <asp:Label ID="SUMARIOLabel" runat="server" Text='<%# Eval("SUMARIO") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#FAFAFA">
                                                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/competenciaProfissional.aspx">Competência Profissional</asp:HyperLink>
                                                </td>
                                                <td width="30%" align="center" bgcolor="#FAFAFA">
                                                    <asp:Panel ID="PanelCOMPETENCIA" runat="server" CssClass="STATUSNOK" 
                                                        Height="25px">
                                                        <asp:Label ID="COMPETENCIALabel" runat="server" Text='<%# Eval("COR") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" bgcolor="#EFEFEF">
                                                    <asp:HyperLink ID="HyperLink4" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/cursos.aspx">Cursos Complementares</asp:HyperLink>
                                                </td>
                                                <td width="30%" align="center" bgcolor="#EFEFEF">
                                                    <asp:Panel ID="PanelCURSO" runat="server" CssClass="STATUSNOK" Height="25px">
                                                        <asp:Label ID="CURSOLabel" runat="server" Text='<%# Eval("CURSO") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#FAFAFA" width="70%">
                                                    <asp:HyperLink ID="HyperLink13" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/quiz.aspx">Avaliação Profissional e Comportamental</asp:HyperLink>
                                                </td>
                                                <td align="center" bgcolor="#FAFAFA" width="30%">
                                                    <asp:Panel ID="PanelAVALIACAO" runat="server" CssClass="STATUSOK" Height="25px">
                                                        <asp:Label ID="AVALIACAOLabel" runat="server" Text='<%# Eval("AVALIACAO") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EFEFEF" width="70%">
                                                    <asp:HyperLink ID="HyperLink11" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/helpdesk.aspx">Help Desk - Atendimento JobClick</asp:HyperLink>
                                                </td>
                                                <td align="center" bgcolor="#EFEFEF" width="30%">
                                                    <asp:Panel ID="PanelHELPDESK" runat="server" CssClass="STATUSOK" Height="25px">
                                                        <asp:Label ID="HELPDESK" runat="server" Text="Novidade JobClick!" />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#FAFAFA" width="70%">
                                                    <asp:HyperLink ID="HyperLink14" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/agenda_candidato.aspx">Entrevista Presencial</asp:HyperLink>
                                                </td>
                                                <td align="center" bgcolor="#FAFAFA" width="30%">
                                                    <asp:Panel ID="PanelENTREVISTA" runat="server" CssClass="STATUSNOK" 
                                                        Height="25px">
                                                        <asp:Label ID="ENTREVISTALabel" runat="server" 
                                                            Text='<%# Eval("PRESENCIAL") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EFEFEF" width="70%">
                                                    <asp:HyperLink ID="HyperLink15" runat="server" CssClass="tituloEmp" 
                                                        NavigateUrl="~/_candidato/agenda_virtual.aspx">Entrevista Virtual</asp:HyperLink>
                                                </td>
                                                <td align="center" bgcolor="#EFEFEF" width="30%">
                                                    <asp:Panel ID="PanelVIRTUAL" runat="server" CssClass="STATUSNOK" Height="25px">
                                                        <asp:Label ID="VIRTUALLabel" runat="server" Text='<%# Eval("VIRTUAL") %>' />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                            </asp:DataList>
                                <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlFormCV" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    DeleteCommand="DELETE FROM [tbCurriculo] WHERE [idcurriculo] = @idcurriculo"
                    InsertCommand="INSERT INTO [tbCurriculo] ([idCadastroUser], [dscurriculo], [ididioma], [publicar]) VALUES (@idCadastroUser, @dscurriculo, @ididioma, @publicar)"
                    SelectCommand="SELECT [idcurriculo], [idCadastroUser], [dscurriculo], [ididioma], [publicar] FROM [tbCurriculo] WHERE ([idCadastroUser] = @idCadastroUser)"
                    
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
                        <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT tbCurriculo.idcurriculo, tbCurriculo.idCadastroUser, tbCurriculo.dscurriculo, tbCurriculo.ididioma, tbidioma.dsidioma, tbCurriculo.publicar FROM tbCurriculo INNER JOIN tbidioma ON tbCurriculo.ididioma = tbidioma.ididioma WHERE (tbCurriculo.idCadastroUser = @idCadastroUser)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser" />
                    </SelectParameters>
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
                <asp:SqlDataSource ID="SqlStatusCV" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_STATUS_PREENCHIMENTO" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idcurriculo" 
                            Type="Int32" />
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> 
        </tr>
    </table>     

</asp:Content>

