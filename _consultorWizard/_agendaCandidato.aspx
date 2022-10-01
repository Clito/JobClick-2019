<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_agendaCandidato.aspx.vb" Inherits="_consultorWizard_agendaCandidato" %>
<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="700" cellpadding="0" cellspacing="0">
            <tr>
                <td width="30">&nbsp;</td>
                <td width="670">
                    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
            <tr>
                <td width="30">&nbsp;</td>
                <td width="670">
                    <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Text="0" 
                        Visible="False"></asp:Label>
                    <asp:Label ID="idCalendarioLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                    <br />
                    <table id="Agenda" cellpadding="5" cellspacing="2" width="100%">
                        <tr>
                            <td valign="top">
                            <asp:Calendar ID="CalendarCandidato" runat="server" BackColor="Transparent" 
                                BorderStyle="None" CellSpacing="2" FirstDayOfWeek="Sunday" 
                                Font-Overline="False" ForeColor="Black" Height="136px" 
                                NextPrevFormat="FullMonth" TitleFormat="Month" Width="200px">
                                <SelectedDayStyle BackColor="DarkSlateGray" ForeColor="White" />
                                <TodayDayStyle BackColor="#C0C0C0" />
                                <OtherMonthDayStyle BackColor="Transparent" BorderColor="WhiteSmoke" 
                                    ForeColor="DarkGray" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                    VerticalAlign="Bottom" />
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <TitleStyle BackColor="Transparent" BorderWidth="0px" Font-Bold="True" 
                                    Font-Size="10pt" ForeColor="Black" />
                            </asp:Calendar>
                            </td>
                            <td>
                            <DayPilot:DayPilotCalendar ID="DayPilotCalendarCandidato" runat="server" 
                                BackColor="#FFFFD5" BorderColor="#AAAAAA" BusinessBeginsHour="8" 
                                DataEndField="DataEndField" DataSourceID="SqlAgenda" 
                                    DataStartField="DataStartField" DataTextField="DataTextField" 
                                DataValueField="idCalendario" DayFontFamily="Tahoma" DayFontSize="10pt" 
                                DurationBarColor="#FF9900" EventBackColor="White" EventBorderColor="Black" 
                                EventClickHandling="PostBack" 
                                EventClickJavaScript="UserActionHandling.JavaScript" EventFontFamily="Tahoma" 
                                EventFontSize="8pt" EventHoverColor="Gainsboro" FreetimeClickHandling="PostBack" 
                                FreeTimeClickJavaScript="UserActionHandling.JavaScript" 
                                HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" 
                                HourHalfBorderColor="#F3E4B1" HourNameBackColor="#ECE9D8" 
                                HourNameBorderColor="#ACA899" HoverColor="#FFED95" 
                                NonBusinessBackColor="#FFF4BC" StartDate="2011-09-24" Width="420px" 
                                    ShowToolTip="False" />
                            </td>
                        </tr>
                    </table>
                    <br />
                <asp:Panel ID="PanelFormCalendario" runat="server" Visible="False" 
                    CssClass="DGFormAgendaPosition">
                    <br />
                    <table ID="NavClose" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right">
                                <asp:ImageButton ID="ImageButtonClose" runat="server" CausesValidation="False" 
                                    ImageUrl="~/images/close.png" />
                            </td>
                        </tr>
                    </table>
                    <asp:FormView ID="FormViewCalendario" runat="server" 
    DataKeyNames="idCalendario" DataSourceID="SqlDataAgendaForm" DefaultMode="Edit">
                        <EditItemTemplate>
                            <asp:Label ID="LabelCompromissoCabec" runat="server" 
                                Text="Informações sobre o agendamento:"></asp:Label>
                            <br />
                            <asp:Label ID="DataLabel" runat="server" CssClass="titulo" 
                                Text='<%# Eval("DataStartField", "{0:d}") %>'></asp:Label>
                            <br />
                            <asp:Label ID="IniLabel" runat="server" 
                                Text='<%# Eval("DataStartField", "{0:t}") %>'></asp:Label>
                            -
                            <asp:Label ID="FimLabel" runat="server" 
                                Text='<%# Eval("DataEndField", "{0:t}") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:TextBox ID="DataStartFieldTextBox" runat="server" Enabled="False" 
                                Text='<%# Bind("DataStartField", "{0:T}") %>' Visible="False" Width="1px" />
                            <asp:TextBox ID="DataEndFieldTextBox" runat="server" Enabled="False" 
                                Text='<%# Bind("DataEndField", "{0:T}") %>' Visible="False" Width="1px" />
                            <asp:TextBox ID="dsEventoAceiteTextBox" runat="server" 
                                Text='<%# Bind("dsEventoAceite") %>' Visible="False" Width="1px"></asp:TextBox>
                            <asp:TextBox ID="DataTextFieldTextBox" runat="server" Enabled="False" 
                                Text='<%# Bind("DataTextField") %>' Visible="False" Width="1px" />
                            <br />
                            <asp:Label ID="DataStartFieldLabel" runat="server" 
                                Text='<%# Eval("DataStartField") %>' Visible="False"></asp:Label>
                            <asp:Label ID="DataEndFieldLabel" runat="server" 
                                Text='<%# Eval("DataEndField") %>' Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="DataTextFieldCabecLabel" runat="server" Text="Sobre:"></asp:Label>
                            <br />
                            <asp:Label ID="DataTextFieldLabel" runat="server" Font-Bold="True" 
                                Text='<%# Eval("DataTextField") %>'></asp:Label>
                            <br />
                            <br />
                            <hr size="1" width="100%" />
                            <br />
                            <asp:Label ID="LabelCandidatoRes" runat="server" Text="Mensagem do candidato:"></asp:Label>
                            <br />
                            <asp:Label ID="LabelResCandidato" runat="server" Font-Italic="True" 
                                Text='<%# Eval("dsEventoAceite") %>'></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="LabelCandidato" runat="server" 
                                Text="Mensagem para o Candidato: (Compromisso)"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="DataTextFieldNEWTextBox" 
                                ErrorMessage="Mensagem é obrigatória!">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="DataTextFieldNEWTextBox" runat="server" CssClass="InputCad" 
                                Height="50px" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                SelectedValue='<%# Bind("aceito") %>'>
                                <asp:ListItem Value="0">Aguardando uma resposta</asp:ListItem>
                                <asp:ListItem Value="1">Aceitar o compromisso pelo candidato</asp:ListItem>
                                <asp:ListItem Value="2">Agendamento cancelado</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" 
            CausesValidation="True" CommandName="Update" Text="Enviar sua resposta" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" 
                                onclick="UpdateCancelButton_Click" Text="Cancelar" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            idUser:
                            <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' />
                            <br />
                            DataStartField:
                            <asp:TextBox ID="DataStartFieldTextBox0" runat="server" 
            Text='<%# Bind("DataStartField") %>' />
                            <br />
                            DataEndField:
                            <asp:TextBox ID="DataEndFieldTextBox0" runat="server" 
            Text='<%# Bind("DataEndField") %>' />
                            <br />
                            DataTextField:
                            <asp:TextBox ID="DataTextFieldTextBox0" runat="server" 
            Text='<%# Bind("DataTextField") %>' />
                            <br />
                            DataValueField:
                            <asp:TextBox ID="DataValueFieldTextBox" runat="server" 
            Text='<%# Bind("DataValueField") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="DataStartFieldLabel0" runat="server" 
            Text='<%# Bind("DataStartField") %>' />
                            -
                            <asp:Label ID="DataEndFieldLabel0" runat="server" 
            Text='<%# Bind("DataEndField") %>' />
                            <br />
                            <br />
                            <asp:Label ID="DataTextFieldLabel" runat="server" 
            Text='<%# Bind("DataTextField") %>' />
                            <br />
                            <asp:Label ID="dsEventoAceiteLabel" runat="server" Text='<%# Eval("dsEventoAceite") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Responder" />
                        </ItemTemplate>
                    </asp:FormView>
                </asp:Panel>
                <asp:DragPanelExtender ID="PanelFormCalendario_DragPanelExtender" 
                    runat="server" DragHandleID="PanelFormCalendario" Enabled="True" 
                    TargetControlID="PanelFormCalendario">
                </asp:DragPanelExtender>
                    <br />
                    <asp:SqlDataSource ID="SqlAgenda" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_AGENDA_CONSULTOR_X_CANDIDATO" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                Type="Int32" />
                            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataAgendaForm" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbAgendaC] WHERE [idCalendario] = @idCalendario" 
        InsertCommand="INSERT INTO [tbAgendaC] ([idUser], [idEventoAgenda], [DataStartField], [DataEndField], [DataTextField], [DataValueField], [Evento], [dsEventoAceite], [aceito]) VALUES (@idUser, @idEventoAgenda, @DataStartField, @DataEndField, @DataTextField, @DataValueField, @Evento, @dsEventoAceite, @aceito)"
        SelectCommand="SELECT [idCalendario], [idUser], [idEventoAgenda], [DataStartField], [DataEndField], [DataTextField], [DataValueField], [Evento], [dsEventoAceite], [aceito] FROM [tbAgendaC] WHERE (([idCalendario] = @idCalendario) AND ([idUser] = @idUser))"
        UpdateCommand="UPDATE [tbAgendaC] SET [idUser] = @idUser, [DataStartField] = @DataStartField, [DataEndField] = @DataEndField, [DataTextField] = @DataTextField, [dsEventoAceite] = @dsEventoAceite, [aceito] = @aceito WHERE [idCalendario] = @idCalendario">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCalendarioLabel" Name="idCalendario" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="idUserLabel" Name="idUser" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idCalendario" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="DataStartField" Type="DateTime" />
            <asp:Parameter Name="DataEndField" Type="DateTime" />
            <asp:Parameter Name="DataTextField" Type="String" />
            <asp:Parameter Name="dsEventoAceite" Type="String" />
            <asp:Parameter Name="aceito" Type="Int32" />
            <asp:Parameter Name="idCalendario" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idEventoAgenda" Type="Int32" />
            <asp:Parameter Name="DataStartField" Type="DateTime" />
            <asp:Parameter Name="DataEndField" Type="DateTime" />
            <asp:Parameter Name="DataTextField" Type="String" />
            <asp:Parameter Name="DataValueField" Type="String" />
            <asp:Parameter Name="Evento" Type="String" />
            <asp:Parameter Name="dsEventoAceite" Type="String" />
            <asp:Parameter Name="aceito" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

