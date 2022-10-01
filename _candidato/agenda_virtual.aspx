<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="agenda_virtual.aspx.vb" Inherits="_candidato_agenda_candidato" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>

    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Entrevista Virtual" CssClass="TituloBGText"></asp:Label></td>
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
    <table id="Agenda" width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top" align="left">
                <br />
                <asp:Label ID="LabelCabec" runat="server" 
                    
                    
                    
                    Text="Entrevistas virtuais.&lt;br&gt;Você precisa confirmar ou recusar os agendamentos solicitados." 
                    CssClass="textQUIZ"></asp:Label>
                <br />
                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idEntrevistaVirtualLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="vagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelFormCalendario" runat="server" Visible="False">
                    <table ID="NavClose" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label ID="Cabec0" runat="server" CssClass="TituloBGText" 
                                    Text="Confirme sua presença"></asp:Label>
                                <br />
                                <asp:Label ID="OBSAgendaLabel" runat="server" 
                                    
                                    
                                    Text="Você está sendo convidado a participar de uma entrevista virtual de emprego.&lt;br&gt;&lt;i&gt;Lembre-se que é necessário confirmar a sua presença ou eximir-se à responsabilidade com alguns dias de antecedência.&lt;/i&gt;&lt;br&gt;Utilize o formulário abaixo para informar ao responsável da sua disponibilidade."></asp:Label>
                                <br />
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListConfirme" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" RepeatDirection="Horizontal" Width="100%">
                                    <asp:ListItem Selected="True" Value="1">Confirmar sua presença</asp:ListItem>
                                    <asp:ListItem Value="0">Recusar o convite</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="LabelMensagemDB" runat="server"></asp:Label>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="MensagemTextBox" Display="Dynamic" 
                                    ErrorMessage="Escreva uma mensagem ao responsável" ValidationGroup="ENTREVISTA">•</asp:RequiredFieldValidator>
                                <asp:Label ID="Labelmensagem" runat="server" 
                                    Text="Escreva para o responsável  pelo agendamento:"></asp:Label>
                                <br />
                                <asp:TextBox ID="MensagemTextBox" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" Height="100px" TextMode="MultiLine" 
                                    Width="100%"></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <table ID="JAVA" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonJAVA" runat="server" 
                                                ImageUrl="~/images/java.png" 
                                                PostBackUrl="http://www.java.com/pt_BR/download/" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelAVISO" runat="server" 
                                                Text="&lt;b&gt;Atenção:&lt;/b&gt;&lt;br&gt;Para utilizar o Chat será necessário ter instalado em sua máquina a última versão do Java.&lt;br&gt;Para instalar ou atualizar a versão de seu Java &lt;a href=&quot;http://www.java.com/pt_BR/download/&quot;&gt;clique aqui.&lt;/a&gt;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="ENTREVISTA" />
                                <br />
                                <asp:LinkButton ID="LinkButtonEnviar" runat="server" CssClass="button" 
                                    ToolTip="Clique aqui para enviar a sua mensagem" ValidationGroup="ENTREVISTA">Enviar</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                                    CssClass="button" 
                                    ToolTip="Clique aqui para fechar este formulário sem confirmar sua presença">Cancelar</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelAGENDA" runat="server">
                    <table id="FormAgenda" cellpadding="0" cellspacing="0" 
    width="100%">
                        <tr>
                            <td valign="top" width="210px">
                                &nbsp;</td>
                            <td valign="top">
                                <asp:GridView ID="GridViewSALA" runat="server" AutoGenerateColumns="False" 
                                    BorderStyle="None" DataKeyNames="sala,idEntrevistaVirtual" DataSourceID="SqlSALAS" 
                                    GridLines="Horizontal" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                            ReadOnly="True" SortExpression="ID" Visible="False" />
                                        <asp:BoundField DataField="idEntrevistaVirtual" 
                                            HeaderText="idEntrevistaVirtual" SortExpression="idEntrevistaVirtual" 
                                            Visible="False" />
                                        <asp:TemplateField HeaderText="Sala(s) virtual(ais) preparada(s)" 
                                            ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButtonSALA" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text='<%# Eval("sala") %>' 
                                                    ToolTip='<%# Eval("dsProcesso", "Referente à vaga ({0})") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sala" HeaderText="Sala virtual preparada" 
                                            SortExpression="sala" Visible="False">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ProtocoloDoAgendamento" 
                                            HeaderText="ProtocoloDoAgendamento" SortExpression="ProtocoloDoAgendamento" 
                                            Visible="False" />
                                        <asp:BoundField DataField="DataStartField" HeaderText="Inicia em:" 
                                            SortExpression="DataStartField" Visible="False">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DataEndField" HeaderText="DataEndField" 
                                            SortExpression="DataEndField" Visible="False" />
                                        <asp:TemplateField HeaderText="aceito" SortExpression="aceito" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="aceitoLabel" runat="server" Text='<%# Bind("aceito") %>' 
                                                    Visible="False"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("aceito") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                            SortExpression="Protocolo" Visible="False" />
                                        <asp:BoundField DataField="dsProcesso" HeaderText="Vaga" 
                                            SortExpression="dsProcesso" Visible="False">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" 
                                            Visible="False" />
                                        <asp:BoundField DataField="nomeRes" HeaderText="Consultor/Analista" 
                                            SortExpression="nomeRes">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="ImageAVISO" runat="server" 
                                                        ImageUrl="~/images/layout/atencao.png" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="AvisoLabel" runat="server" 
                                                        Text="Você não faz parte de nenhuma entrevista virtual, fique atento aos e-mails recebidos, porque quando você é convocado(a) a fazer parte de uma entrevista é enviado um e-mail para a confirmação de sua disponibilidade."></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="210px">
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
                            <td valign="top">
                                <asp:Label ID="msnEmailCandidato" runat="server"></asp:Label>
                                <br />
                                <DayPilot:DayPilotCalendar ID="DayPilotCalendarCandidato" runat="server" 
                                    BackColor="#FFFFD5" BorderColor="#AAAAAA" BusinessBeginsHour="8" 
                                    DataEndField="DataEndField" DataSourceID="SqlDataAgenda" 
                                    DataStartField="DataStartField" DataTextField="TEXTOAPRESENTA" 
                                    DataValueField="idEntrevistaVirtual" DayFontFamily="Tahoma" DayFontSize="10pt" 
                                    DurationBarColor="#FF9900" EventBackColor="#FFFFFF" EventBorderColor="#000000" 
                                    EventClickHandling="PostBack" 
                                    EventClickJavaScript="UserActionHandling.JavaScript" EventFontFamily="Tahoma" 
                                    EventFontSize="8pt" EventHoverColor="#DCDCDC" FreetimeClickHandling="PostBack" 
                                    FreeTimeClickJavaScript="UserActionHandling.JavaScript" 
                                    HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" 
                                    HourHalfBorderColor="#F3E4B1" HourNameBackColor="#ECE9D8" 
                                    HourNameBorderColor="#ACA899" HoverColor="#FFED95" 
                                    NonBusinessBackColor="#FFF4BC" ShowToolTip="False" StartDate="2011-07-11" 
                                    Width="100%" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="210px">
                                &nbsp;</td>
                            <td align="right" valign="top">
                                <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button" 
                                    PostBackUrl="~/_candidato/Default.aspx" 
                                    ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:SqlDataSource ID="SqlDataAgenda" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_CANDIDATO_RESPONDE" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idEntrevistaVirtual" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="confirmar" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="aceito" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="HistoricoDasMensagens" Type="String" />
                        <asp:Parameter DefaultValue="0" Name="URL" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlSALAS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_SALA_ATIVA_CHAT_CANDIDATO" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idUser" SessionField="idUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

