<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="agenda.aspx.vb" Inherits="_candidato_agenda" EnableEventValidation="true" title="Jobclick" %>

<%@ Register Src="../App_Include/ddgHorario.ascx" TagName="ddgHorario" TagPrefix="uc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Sua agenda pessoal" CssClass="TituloBGText"></asp:Label><br />
             <br /><br /><asp:Label ID="LabelCabec" runat="server" Text="Esta é sua agenda para uso pessoal.&lt;br&gt;Seus compromissos serão avisados com 1 hora de antecedência por e-mail. Caso você queira ser avisado por “torpedo” você deverá informar o número de seu celular e liberar este número para receber mensagens de texto. &lt;br&gt;&lt;br&gt;&lt;b&gt;Obs.: &lt;/b&gt;&lt;i&gt;Como o serviço de SMS não é garantido pelas operadoras, não podemos nos responsabilizar pelo não aviso em tempo.&lt;/i&gt;"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="left" valign="top">           
                <asp:Label ID="HorainiLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
        <asp:Calendar ID="Calendar1" runat="server" FirstDayOfWeek="Sunday" ForeColor="Black" Height="136px" NextPrevFormat="FullMonth" Width="200px" Font-Overline="False" CellSpacing="2" BorderStyle="None" TitleFormat="Month" BackColor="Transparent">
            <SelectedDayStyle BackColor="DarkSlateGray" ForeColor="White" />
            <TodayDayStyle BackColor="#C0C0C0" />
            <OtherMonthDayStyle ForeColor="DarkGray" BackColor="Transparent" BorderColor="WhiteSmoke" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <TitleStyle BackColor="Transparent" BorderWidth="0px" Font-Bold="True"
                Font-Size="10pt" ForeColor="Black" />
        </asp:Calendar>
        <asp:FormView ID="FormView1" runat="server" CellPadding="0" DataKeyNames="idagenda"
            DataSourceID="SqlDataSource4" Width="200px" DefaultMode="Insert" Visible="False">
            <EditItemTemplate>
                <table cellpadding="3" cellspacing="3" style="width: 100%">
                    <tr>
                        <td>
                            Data:<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("idVaga") %>' Visible="False"
                                Width="8px"></asp:TextBox><asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("idcurriculo") %>'
                                    Visible="False" Width="8px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6"
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="data_endTextBox" runat="server" Text='<%# Bind("data_end") %>'
                                Visible="False" Width="16px"></asp:TextBox>
                            <asp:TextBox ID="data_startTextBox" runat="server" Text='<%# Bind("data_start") %>'
                                Visible="False" Width="8px"></asp:TextBox>
                            <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" TargetControlID="TextBox6" PopupButtonID="ImageButton10">
                            </cc1:CalendarExtender><table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="msnInput"
                                Text='<%# Bind("data", "{0:d}") %>' Width="155px"></asp:TextBox>&nbsp;</td>
                                    <td>
                                        <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/images/btcalendario.gif" CausesValidation="False" /></td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%" bgcolor="infobackground">
                                <tr>
                                    <td>
                                        Início:<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TBdataEndUpE"
                                            ControlToValidate="TBdataStartUpE" Display="Dynamic" ErrorMessage="*" Operator="LessThanEqual"></asp:CompareValidator><br />
                                        <asp:TextBox ID="TBdataStartUpE" runat="server" CssClass="InputCadFormCandidatoCV" Text='<%# Bind("data_start") %>'
                                            Width="87px" Enabled="False"></asp:TextBox>&nbsp;</td>
                                    <td>
                                        Término:<br />
                                        <asp:TextBox ID="TBdataEndUpE" runat="server" CssClass="InputCadFormCandidatoCV" Text='<%# Bind("data_end") %>'
                                            Width="88px" Enabled="False"></asp:TextBox></td>
                                </tr>
                            </table>
                            Compromisso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="InputCadFormCandidatoCV" Height="72px" Text='<%# Bind("dsCompromissoEmp") %>'
                                TextMode="MultiLine" Width="185px"></asp:TextBox><br />
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="InputCadFormCandidatoCV" Enabled="False" Height="64px"
                                Text='<%# Bind("dsRespostaCandidato") %>' TextMode="MultiLine" 
                                Width="185px" Visible="False"></asp:TextBox><br />
                            <br />
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/DGrelogio.gif" /><asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ativo") %>' /><br />
                            <br />
                            <asp:ImageButton ID="ImageButton7" runat="server" CommandName="Update"
                                ImageUrl="~/images/buttonSalvarUpCalendario.gif" />&nbsp;
                            <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/images/buttonCancCalendario.gif" OnCommand="GetCommand" /></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table cellpadding="3" cellspacing="3" style="width: 100%">
                    <tr>
                        <td>
                            Confirme a data:<asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>' Visible="False" Width="8px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dataTextBox"
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="data_startTextBox" runat="server" Text='<%# Bind("data_start") %>'
                                Visible="False" Width="8px"></asp:TextBox>
                <asp:TextBox ID="dsRespostaCandidatoTextBox" runat="server" 
                                Text='<%# Bind("dsRespostaCandidato") %>' Enabled="False" Width="5px" 
                                Visible="False"></asp:TextBox><asp:TextBox ID="data_endTextBox" runat="server" Text='<%# Bind("data_end") %>'
                                Visible="False" Width="16px"></asp:TextBox>
                            <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" TargetControlID="dataTextBox" PopupButtonID="ImageButton9">
                            </cc1:CalendarExtender><table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="dataTextBox" runat="server" CssClass="InputCadFormCandidatoCV"
                                Text='<%# Bind("data") %>' Width="140px"></asp:TextBox>&nbsp;</td>
                                    <td>
                                        <asp:ImageButton ID="ImageButton9" runat="server" ImageAlign="Bottom" ImageUrl="~/images/btcalendario.gif" CausesValidation="False" /></td>
                                </tr>
                            </table>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="DropDownListFim" 
                                ErrorMessage="Horário (final) é obrigatório."></asp:RequiredFieldValidator>
                            <br />
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="DropDownListIni" runat="server" AutoPostBack="True" 
                                            CssClass="DropCad" DataSourceID="SqlHoraIni" DataTextField="data_start" 
                                            DataValueField="idAgendaHoraInicio" 
                                            onselectedindexchanged="DropDownListIni_SelectedIndexChanged" Width="95px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListFim" runat="server" CssClass="DropCad" 
                                            DataSourceID="SqlHoraFim" DataTextField="data_end" 
                                            DataValueField="idAgendaHoraTermino" Width="95px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            Compromisso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="dsCompromissoEmpTextBox" Display="Dynamic" ErrorMessage="*"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="dsCompromissoEmpTextBox" runat="server" 
                                Text='<%# Bind("dsCompromissoEmp") %>' CssClass="InputCadFormCandidatoCV" Height="100px" 
                                TextMode="MultiLine" Width="185px"></asp:TextBox><br />
                            <br />
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/DGrelogio.gif" />
                            <asp:CheckBox ID="ativoCheckBox" runat="server" Checked='<%# Bind("ativo") %>' 
                                Text="Avisar por e-mail." /><br />
                            <br />
                            <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Insert"
                                ImageUrl="~/images/buttonSalvarCalendario.gif" />
                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                                CommandName="Cancel" ImageUrl="~/images/buttonCancCalendario.gif" 
                                OnCommand="GetCommand" onclick="ImageButton4_Click" /></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                idagenda:
                <asp:Label ID="idagendaLabel" runat="server" Text='<%# Eval("idagenda") %>'></asp:Label><br />
                idcurriculo:
                <asp:Label ID="idcurriculoLabel" runat="server" Text='<%# Bind("idcurriculo") %>'>
                </asp:Label><br />
                idVaga:
                <asp:Label ID="idVagaLabel" runat="server" Text='<%# Bind("idVaga") %>'></asp:Label><br />
                data:
                <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>'></asp:Label><br />
                data_start:
                <asp:Label ID="data_startLabel" runat="server" Text='<%# Bind("data_start") %>'>
                </asp:Label><br />
                data_end:
                <asp:Label ID="data_endLabel" runat="server" Text='<%# Bind("data_end") %>'></asp:Label><br />
                dsCompromissoEmp:
                <asp:Label ID="dsCompromissoEmpLabel" runat="server" Text='<%# Bind("dsCompromissoEmp") %>'>
                </asp:Label><br />
                dsRespostaCandidato:
                <asp:Label ID="dsRespostaCandidatoLabel" runat="server" Text='<%# Bind("dsRespostaCandidato") %>'>
                </asp:Label><br />
                ativo:
                <asp:CheckBox ID="ativoCheckBox" runat="server" Checked='<%# Bind("ativo") %>' Enabled="false" /><br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit">
                </asp:LinkButton>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete">
                </asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:FormView>
    </td>
              <td valign="top">
                <table style="width: 100%">
                    <tr>
                        <td valign="top">
                            <table class="DGCalendarioWidthSite">
                                <tr>
                                    <td></td>
                                    <td><asp:ImageButton ID="ImageButton8" runat="server" CausesValidation="False" CommandArgument="I" CommandName="Incluir" ImageAlign="Right" ImageUrl="~/images/incluircompromisso.gif" /></td>
                                </tr>
                            </table>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                                CssClass="DGCalendarioWidthSite" DataKeyNames="idagenda" DataSourceID="SqlDataSource1"
                                GridLines="Horizontal" ShowHeader="False" BorderWidth="0px">
                                <Columns>
                                    <asp:BoundField DataField="idagenda" HeaderText="idagenda" InsertVisible="False"
                                        ReadOnly="True" SortExpression="idagenda" Visible="False" />
                                    <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                                        Visible="False" />
                                    <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" Visible="False" />
                                    <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" Visible="False" />
                                    <asp:BoundField DataField="data_start" HeaderText="data_start" SortExpression="data_start" Visible="False" >
                                        <ItemStyle Width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="data_end" HeaderText="data_end" SortExpression="data_end" Visible="False" >
                                        <ItemStyle Width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dsCompromissoEmp" HeaderText="dsCompromissoEmp" SortExpression="dsCompromissoEmp" />
                                    <asp:BoundField DataField="dsRespostaCandidato" HeaderText="dsRespostaCandidato"
                                        SortExpression="dsRespostaCandidato" Visible="False" />
                                    <asp:CheckBoxField DataField="ativo" HeaderText="ativo" SortExpression="ativo" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandArgument="S"
                                                CommandName="Select" ImageUrl="~/images/editAgenda.gif" OnCommand="GetCommand"
                                                Text="Button" />
                                        </ItemTemplate>
                                        <ItemStyle Width="18px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/images/excluiAgenda.gif" OnClientClick='return confirm("Você quer excluir este compromisso?")'
                                                Text="Delete" />
                                        </ItemTemplate>
                                        <ItemStyle Width="18px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False" SortExpression="relogio">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="false" CommandName=""
                                                ImageUrl="~/images/relogio.gif" Text="Button" />
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" />
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle CssClass="DGCalendarioBGnot" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="HTMLCal" runat="server"></asp:Label></td>
        </tr>
    </table>
                            <asp:SqlDataSource ID="SqlHoraIni" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAgendaHoraInicio], [data_start] FROM [tbAgendaHora]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlHoraFim" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT idAgendaHoraTermino, data_end FROM tbAgendaHoraTermino WHERE (idAgendaHoraTermino &gt; @idAgendaHoraTermino)">
        <SelectParameters>
            <asp:ControlParameter ControlID="HorainiLabel" Name="idAgendaHoraTermino" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
                            &nbsp; &nbsp; &nbsp;
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT idagenda, idcurriculo, idVaga, data, data_start, data_end, dsCompromissoEmp, dsRespostaCandidato, ativo FROM tbAgenda WHERE (idcurriculo = @idcurriculo) AND (data = @data) ORDER BY data_start" DeleteCommand="DELETE FROM [tbAgenda] WHERE [idagenda] = @idagenda" InsertCommand="INSERT INTO [tbAgenda] ([idcurriculo], [idVaga], [data], [data_start], [data_end], [dsCompromissoEmp], [dsRespostaCandidato], [ativo]) VALUES (@idcurriculo, @idVaga, @data, @data_start, @data_end, @dsCompromissoEmp, @dsRespostaCandidato, @ativo)" UpdateCommand="UPDATE [tbAgenda] SET [idcurriculo] = @idcurriculo, [idVaga] = @idVaga, [data] = @data, [data_start] = @data_start, [data_end] = @data_end, [dsCompromissoEmp] = @dsCompromissoEmp, [dsRespostaCandidato] = @dsRespostaCandidato, [ativo] = @ativo WHERE [idagenda] = @idagenda">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
            <asp:ControlParameter ControlID="TextBox1" Name="data" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idagenda" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idVaga" Type="Int32" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="data_start" Type="String" />
            <asp:Parameter Name="data_end" Type="String" />
            <asp:Parameter Name="dsCompromissoEmp" Type="String" />
            <asp:Parameter Name="dsRespostaCandidato" Type="String" />
            <asp:Parameter Name="ativo" Type="Boolean" />
            <asp:Parameter Name="idagenda" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idVaga" Type="Int32" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="data_start" Type="String" />
            <asp:Parameter Name="data_end" Type="String" />
            <asp:Parameter Name="dsCompromissoEmp" Type="String" />
            <asp:Parameter Name="dsRespostaCandidato" Type="String" />
            <asp:Parameter Name="ativo" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbAgenda] WHERE [idagenda] = @idagenda" 
        InsertCommand="INSERT INTO [tbAgenda] ([idcurriculo], [idVaga], [data], [data_start], [data_end], [dsCompromissoEmp], [dsRespostaCandidato], [ativo]) VALUES (@idcurriculo, @idVaga, @data, @data_start, @data_end, @dsCompromissoEmp, @dsRespostaCandidato, @ativo)"
        SelectCommand="SELECT [idagenda], [idcurriculo], [idVaga], [data], [data_start], [data_end], [dsCompromissoEmp], [dsRespostaCandidato], [ativo] FROM [tbAgenda] WHERE (([idagenda] = @idagenda) AND ([idcurriculo] = @idcurriculo))"
        UpdateCommand="UPDATE tbAgenda SET idcurriculo = @idcurriculo, idVaga = @idVaga, data = @data, data_start = @data_start, data_end = @data_end, dsCompromissoEmp = @dsCompromissoEmp, dsRespostaCandidato = @dsRespostaCandidato, ativo = @ativo WHERE (idagenda = @idagenda)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="0" Name="idagenda" PropertyName="Text"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idagenda" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idVaga" Type="Int32" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="data_start" Type="String" />
            <asp:Parameter Name="data_end" Type="String" />
            <asp:Parameter Name="dsCompromissoEmp" Type="String" />
            <asp:Parameter Name="dsRespostaCandidato" Type="String" />
            <asp:Parameter Name="ativo" Type="Boolean" />
            <asp:Parameter Name="idagenda" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idVaga" Type="Int32" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="data_start" Type="String" />
            <asp:Parameter Name="data_end" Type="String" />
            <asp:Parameter Name="dsCompromissoEmp" Type="String" />
            <asp:Parameter Name="dsRespostaCandidato" Type="String" />
            <asp:Parameter Name="ativo" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="TextBox3" runat="server" Width="24px" Visible="False"></asp:TextBox>
    <asp:TextBox
        ID="TextBox2" runat="server" Width="24px" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox1" runat="server" Width="24px" Visible="False"></asp:TextBox>
</asp:Content>

