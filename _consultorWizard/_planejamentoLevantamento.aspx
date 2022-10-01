<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="_planejamentoLevantamento.aspx.vb" Inherits="_empresa_agenda_schedule_Empresa" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
    <table id="agendaEmpresa" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td>
                <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idEventoAgendaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idEventoFreeAgendaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idEventoPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:GridView ID="GridViewFolowup" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="inicio" DataSourceID="SqlAgendaTarefa" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idEventoAgenda" HeaderText="idEventoAgenda" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idEventoAgenda" 
                            Visible="False" />
                        <asp:BoundField DataField="idPerfilVaga" HeaderText="idPerfilVaga" 
                            SortExpression="idPerfilVaga" Visible="False" />
                        <asp:BoundField DataField="idEventoPerfilVaga" HeaderText="idEventoPerfilVaga" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idEventoPerfilVaga" 
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="dsEvento" 
                            HeaderText="Tarefa" Text="Tarefa" />
                        <asp:BoundField DataField="dsEvento" HeaderText="Tarefa" 
                            SortExpression="dsEvento" Visible="False" />
                        <asp:BoundField DataField="Evento" HeaderText="Evento" 
                            SortExpression="Evento" />
                        <asp:BoundField DataField="inicio" DataFormatString="{0:d}" HeaderText="Início" 
                            SortExpression="inicio" />
                        <asp:BoundField DataField="final" DataFormatString="{0:d}" 
                            HeaderText="Encerramento" SortExpression="final" />
                        <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" 
                            Visible="False" />
                        <asp:BoundField DataField="dsEvento1" HeaderText="dsEvento1" 
                            SortExpression="dsEvento1" Visible="False" />
                        <asp:BoundField DataField="dsEventoPerfilVaga" HeaderText="dsEventoPerfilVaga" 
                            SortExpression="dsEventoPerfilVaga" Visible="False" />
                        <asp:BoundField DataField="dsEventoPlanejamento" 
                            HeaderText="dsEventoPlanejamento" ReadOnly="True" 
                            SortExpression="dsEventoPlanejamento" Visible="False" />
                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                            SortExpression="idSetup" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <table id="Pesquisa" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td valign="top">
                            <asp:Label ID="ConsultorLabel" runat="server" Text="Consultor:"></asp:Label>
                            <br />
                <asp:DropDownList ID="DropDownListGestor" runat="server" AutoPostBack="True" 
                    CssClass="DropCad" DataSourceID="SqlGestor" DataTextField="nome" 
                    DataValueField="idRH_Gestor">
                </asp:DropDownList>
                            <br />
                            <asp:Label ID="dsProtocoloLabel" runat="server" 
                                Text="Protocolo: (Perfil da Vaga)"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="DropDownListPerfil" ErrorMessage="Informe um Levantamento!" 
                                ValidationGroup="Planejamento">*</asp:RequiredFieldValidator>
                            <br />
                <asp:DropDownList ID="DropDownListPerfil" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlPerfilVaga" DataTextField="Protocolo" 
                    DataValueField="idPerfilVaga" ValidationGroup="Planejamento">
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" CssClass="cur01st" Text="Selecionar" 
                                ValidationGroup="Planejamento" />
                            <br />
                            <br />
                            <asp:Label ID="MSNLabel" runat="server" CssClass="msn"></asp:Label>
                            <br />
                            <table id="FormTarefa" cellpadding="5" cellspacing="5" width="100%">
                                <tr>
                                    <td>
                                        <asp:FormView ID="FormViewTarefa" runat="server" DataKeyNames="idEventoAgenda" 
                                            DataSourceID="SqlAgendaTarefaForm" Visible="False" Width="100%">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="idPerfilVagaTextBox" runat="server" 
                                                    Text='<%# Bind("idPerfilVaga") %>' Visible="False" Width="10px" />
                                                <br />
                                                <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" 
                                                    Text="Editar tarefas atribuídas"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="Fase:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="DropDownListPlanejamento" 
                                                    ErrorMessage="Informe a fase do planejamento.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:DropDownList ID="DropDownListPlanejamento" runat="server" CssClass="DropCad" 
                                                    DataSourceID="SqlDDEventoPerfilVaga" DataTextField="dsEventoPerfilVaga" 
                                                    DataValueField="idEventoPerfilVaga" 
                                                    SelectedValue='<%# Bind("idEventoPerfilVaga") %>'>
                                                </asp:DropDownList>
                                                <br />
                                                <asp:Label ID="Label1" runat="server" Text="Título:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="dsEventoTextBox" ErrorMessage="Título é obrigatório.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="dsEventoTextBox" runat="server" Text='<%# Bind("dsEvento") %>' 
                                                    CssClass="InputCad" />
                                                <br />
                                                <asp:Label ID="Label2" runat="server" Text="Tarefas atribuídas a esta Fase:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="EventoTextBox" 
                                                    ErrorMessage="Descreva a tarefa que será desenvolvida nesta fase.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="EventoTextBox" runat="server" Text='<%# Bind("Evento") %>' 
                                                    CssClass="InputCad" Height="100px" TextMode="MultiLine" />
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="Dia inicial da tarefa:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="inicioTextBox" ErrorMessage="Data inicial é obrigatória!">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="inicioTextBox" runat="server" Text='<%# Bind("inicio") %>' 
                                                    CssClass="InputCad" Width="180px" />
                                                <asp:CalendarExtender ID="inicioTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" PopupButtonID="ImageButtonCalendarioI" 
                                                    TargetControlID="inicioTextBox">
                                                </asp:CalendarExtender>
&nbsp;<asp:ImageButton ID="ImageButtonCalendarioI" runat="server" ImageUrl="~/images/candidato/buttonCalendario.png" 
                                                    CausesValidation="False" />
                                                <br />
                                                <asp:Label ID="Label4" runat="server" Text="Dia final da tarefa:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                    ControlToValidate="finalTextBox" 
                                                    ErrorMessage="Data do fim do planejamento é obrigatória.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="finalTextBox" runat="server" 
                                                    Text='<%# Bind("final") %>' CssClass="InputCad" Width="180px" />
                                                <asp:CalendarExtender ID="finalTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" PopupButtonID="ImageButtonCalendarioF" 
                                                    TargetControlID="finalTextBox">
                                                </asp:CalendarExtender>
                                                &nbsp;<asp:ImageButton ID="ImageButtonCalendarioF" runat="server" 
                                                    ImageUrl="~/images/candidato/buttonCalendario.png" 
                                                    CausesValidation="False" />
                                                <br />
                                                <asp:Label ID="Label5" runat="server" Text="Nível de Prioridade:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                    ControlToValidate="RadioButtonListNivel" 
                                                    ErrorMessage="Informe o nível de prioridade.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RadioButtonList ID="RadioButtonListNivel" runat="server" 
                                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("valor") %>'>
                                                    <asp:ListItem>Alto</asp:ListItem>
                                                    <asp:ListItem>Médio</asp:ListItem>
                                                    <asp:ListItem>Baixo</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    CommandName="Update" Text="Salvar alteração" />
                                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" 
                                                    Text="Criar e controlar tarefas atribuídas"></asp:Label>
                                                <asp:TextBox ID="idPerfilVagaTextBox" runat="server" 
                                                    Text='<%# Bind("idPerfilVaga") %>' Visible="False" Width="10px" />
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="Fase:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="DropDownListPlanejamento" 
                                                    ErrorMessage="Informe a fase do planejamento.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:DropDownList ID="DropDownListPlanejamento" runat="server" 
                                                    CssClass="DropCad" DataSourceID="SqlDDEventoPerfilVaga" 
                                                    DataTextField="dsEventoPerfilVaga" DataValueField="idEventoPerfilVaga" 
                                                    ondatabound="DropDownListPlanejamento_DataBound">
                                                </asp:DropDownList>
                                                <br />
                                                <asp:Label ID="Label1" runat="server" Text="Título:" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="dsEventoTextBox" ErrorMessage="Título é obrigatório.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="dsEventoTextBox" runat="server" 
                                                    Text='<%# Bind("dsEvento") %>' CssClass="InputCad" />
                                                <br />
                                                <asp:Label ID="Label2" runat="server" Text="Tarefas atribuídas a esta Fase:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="EventoTextBox" 
                                                    ErrorMessage="Descreva a tarefa que será desenvolvida nesta fase.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="EventoTextBox" runat="server" Text='<%# Bind("Evento") %>' 
                                                    CssClass="InputCad" Height="100px" TextMode="MultiLine" />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="Dia inicial da tarefa:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="inicioTextBox" ErrorMessage="Data inicial é obrigatória!">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="inicioTextBox" runat="server" Text='<%# Bind("inicio") %>' 
                                                    CssClass="InputCad" Width="180px" />
                                                <asp:CalendarExtender ID="inicioTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" PopupButtonID="ImageButtonCalendarioI" 
                                                    TargetControlID="inicioTextBox">
                                                </asp:CalendarExtender>
                                                &nbsp;<asp:ImageButton ID="ImageButtonCalendarioI" runat="server" 
                                                    ImageUrl="~/images/candidato/buttonCalendario.png" 
                                                    CausesValidation="False" />
                                                <br />
                                                <asp:Label ID="Label4" runat="server" Text="Dia final da tarefa:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                    ControlToValidate="finalTextBox" 
                                                    ErrorMessage="Data do fim do planejamento é obrigatória.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="finalTextBox" runat="server" Text='<%# Bind("final") %>' 
                                                    CssClass="InputCad" Width="180px" />
                                                <asp:CalendarExtender ID="finalTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" PopupButtonID="ImageButtonCalendarioF" 
                                                    TargetControlID="finalTextBox">
                                                </asp:CalendarExtender>
                                                &nbsp;<asp:ImageButton ID="ImageButtonCalendarioF" runat="server" 
                                                    ImageUrl="~/images/candidato/buttonCalendario.png" 
                                                    CausesValidation="False" />
                                                <br />
                                                <asp:Label ID="Label5" runat="server" Text="Nível de Prioridade:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                    ControlToValidate="RadioButtonListNivel" 
                                                    ErrorMessage="Informe o nível de prioridade.">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RadioButtonList ID="RadioButtonListNivel" runat="server" 
                                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("valor") %>'>
                                                    <asp:ListItem>Alto</asp:ListItem>
                                                    <asp:ListItem>Médio</asp:ListItem>
                                                    <asp:ListItem>Baixo</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                    ShowMessageBox="True" ShowSummary="False" />
                                                <br />
                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                    CommandName="Insert" Text="Salvar tarefa" />
                                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                                                    onclick="InsertCancelButton_Click" />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="idEventoPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="dsEventoLabel" runat="server" Font-Bold="True" 
                                                    Text='<%# Bind("dsEvento") %>' />
                                                &nbsp;<asp:Label ID="ValorLabel" runat="server" Text='<%# Eval("valor") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="EventoLabel" runat="server" Text='<%# Bind("Evento") %>' />
                                                <br />
                                                <br />
                                                <asp:Label ID="inicioLabel" runat="server" ForeColor="#006600" 
                                                    Text='<%# Bind("inicio", "{0:d}") %>' Font-Bold="True" />
                                                &nbsp;|
                                                <asp:Label ID="finalLabel" runat="server" ForeColor="#CC3300" 
                                                    Text='<%# Bind("final", "{0:d}") %>' Font-Bold="True" />
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                    CommandName="Edit" Text="Alterar informações" />
                                                &nbsp;&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" 
                                                    onclientclick="return confirm(&quot;Quer excluir esta tarefa?&quot;)" 
                                                    Text="Excluir Tarefa" />
                                                &nbsp;
                                                <asp:LinkButton ID="LinkButtonCancelarEdit" runat="server" CommandName="Cancel" 
                                                    onclick="LinkButtonCancelarEdit_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:FormView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <asp:Panel ID="PanelCalendario" runat="server" 
                                CssClass="DGCalendarioPositionEmpresa">
                                <table ID="AgendaFlow" cellpadding="5" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="right">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Calendar ID="CalendarTarefas" runat="server" BackColor="White" 
                                                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                                Width="200px">
                                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                <NextPrevStyle VerticalAlign="Bottom" />
                                                <OtherMonthDayStyle ForeColor="#808080" />
                                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                <SelectorStyle BackColor="#CCCCCC" />
                                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <WeekendDayStyle BackColor="#FFFFCC" />
                                            </asp:Calendar>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:DragPanelExtender ID="PanelCalendario_DragPanelExtender" runat="server" 
                                DragHandleID="PanelCalendario" Enabled="True" TargetControlID="PanelCalendario">
                            </asp:DragPanelExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
        <DayPilot:DayPilotScheduler ID="DayPilotSchedulerEmpresa" runat="server" 
            BackColor="#FFFFD5" BorderColor="#999999" CellDuration="1900" 
            DataEndField="final" DataResourceField="idEventoPerfilVaga" 
            DataSourceID="SqlAgendaTarefa" DataStartField="inicio" DataTextField="dsEventoPlanejamento" 
            DataValueField="idEventoAgenda" DurationBarColor="#FF9900" 
            EventBackColor="White" EventBorderColor="Silver" 
            EventClickHandling="PostBack" 
            EventClickJavaScript="UserActionHandling.JavaScript" EventHeight="50" 
            FreeTimeClickHandling="PostBack" 
            FreeTimeClickJavaScript="UserActionHandling.JavaScript" 
            HeaderFontColor="Black" HeaderHeight="17" HourBorderColor="#EAD098" 
            HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" HoverColor="#FFED95" 
            NonBusinessBackColor="#FFF4BC" StartDate="2011-07-10"
            HeaderFontSize="8pt" 
            EventFontSize="10px" BorderStyle="Dotted" BorderWidth="1px" CellWidth="18" 
                    RowHeaderWidth="250" Visible="False">
        </DayPilot:DayPilotScheduler>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="ValidationSummaryPlanejamento" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="Planejamento" />
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlAgendaTarefa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_AGENDA_GESTOR" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListPerfil" Name="idPerfilVaga" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlAgendaTarefaForm" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbAgendaCEvento] WHERE [idEventoAgenda] = @idEventoAgenda" 
                    InsertCommand="INSERT INTO [tbAgendaCEvento] ([idPerfilVaga], [idEventoPerfilVaga], [dsEvento], [Evento], [inicio], [final], [valor]) VALUES (@idPerfilVaga, @idEventoPerfilVaga, @dsEvento, @Evento, @inicio, @final, @valor)" 
                    SelectCommand="SELECT [idEventoAgenda], [idPerfilVaga], [idEventoPerfilVaga], [dsEvento], [Evento], [inicio], [final], [valor] FROM [tbAgendaCEvento] WHERE ([idEventoAgenda] = @idEventoAgenda)" 
                    
                    UpdateCommand="UPDATE [tbAgendaCEvento] SET [idPerfilVaga] = @idPerfilVaga, [idEventoPerfilVaga] = @idEventoPerfilVaga, [dsEvento] = @dsEvento, [Evento] = @Evento, [inicio] = @inicio, [final] = @final, [valor] = @valor WHERE [idEventoAgenda] = @idEventoAgenda">
                    <DeleteParameters>
                        <asp:Parameter Name="idEventoAgenda" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="idEventoPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="dsEvento" Type="String" />
                        <asp:Parameter Name="Evento" Type="String" />
                        <asp:Parameter Name="inicio" Type="DateTime" />
                        <asp:Parameter Name="final" Type="DateTime" />
                        <asp:Parameter Name="valor" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idEventoAgendaLabel" Name="idEventoAgenda" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="idEventoPerfilVaga" Type="Int32" />
                        <asp:Parameter Name="dsEvento" Type="String" />
                        <asp:Parameter Name="Evento" Type="String" />
                        <asp:Parameter Name="inicio" Type="DateTime" />
                        <asp:Parameter Name="final" Type="DateTime" />
                        <asp:Parameter Name="valor" Type="String" />
                        <asp:Parameter Name="idEventoAgenda" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlPerfilVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_LEVANTAMENTOPERFILVAGA_STATUS" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownListGestor" Name="idRH_Gestor" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDDEventoPerfilVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PLANEJAMENTO_AGENDA_GESTOR" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlGestor" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idRH_Gestor], [nome], [idCadastroEmpresa] FROM [tbRH_Gestor] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

