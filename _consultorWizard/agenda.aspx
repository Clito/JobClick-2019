<%@ Page Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="agenda.aspx.vb" Inherits="_empresa__processo_agenda" title="Untitled Page" %>

<%@ Register Src="../App_Include/ddgHorario.ascx" TagName="ddgHorario" TagPrefix="uc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_agenda.gif" />
        <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td width="614">
                <asp:Label ID="lblidvaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRELcandidato_vaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidcurriculo" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="emailLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="nomeLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idProcessoLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlCV">
                    <ItemTemplate>
                        <asp:Label ID="nomeLabel" runat="server" CssClass="titulo" 
                            Text='<%# Eval("nome") %>' />
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Eval("idcurriculo") %>' Visible="False" />
                        <br />
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:LinkButton ID="LBVoltar0" runat="server">Voltar ao Processo Seletivo</asp:LinkButton>
                &nbsp;<table>
        <tr>
            <td valign="top">
                <br />
        <asp:Calendar ID="Calendar1" runat="server" FirstDayOfWeek="Sunday" ForeColor="Black" Height="136px" NextPrevFormat="FullMonth" Width="200px" Font-Overline="False" CellSpacing="2" BorderStyle="None" TitleFormat="Month">
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TodayDayStyle BackColor="#CCCCCC" />
            <OtherMonthDayStyle ForeColor="Black" BackColor="Gainsboro" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <TitleStyle BackColor="Transparent" BorderWidth="0px" Font-Bold="True"
                Font-Size="10pt" ForeColor="#333399" />
        </asp:Calendar>
        <uc1:ddgHorario ID="DdgHorario1" runat="server" Visible="true" />
        <asp:FormView ID="FormView1" runat="server" CellPadding="0" DataKeyNames="idagenda"
            DataSourceID="SqlGravaAgenda" Width="200px">
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
                                        <asp:TextBox ID="TBdataStartUpE" runat="server" CssClass="InputCad" Text='<%# Bind("data_start") %>'
                                            Width="87px" Enabled="False"></asp:TextBox>&nbsp;</td>
                                    <td>
                                        Término:<br />
                                        <asp:TextBox ID="TBdataEndUpE" runat="server" CssClass="InputCad" Text='<%# Bind("data_end") %>'
                                            Width="88px" Enabled="False"></asp:TextBox></td>
                                </tr>
                            </table>
                            Compromisso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="InputCad" Height="72px" Text='<%# Bind("dsCompromissoEmp") %>'
                                TextMode="MultiLine" Width="185px"></asp:TextBox><br />
                            Empresa [RH]:<br />
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="InputCad" Enabled="False" Height="64px"
                                Text='<%# Bind("dsRespostaCandidato") %>' TextMode="MultiLine" Width="185px"></asp:TextBox><br />
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
                                Visible="False" Width="8px"></asp:TextBox><asp:TextBox ID="data_endTextBox" runat="server" Text='<%# Bind("data_end") %>'
                                Visible="False" Width="16px"></asp:TextBox>
                            <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" TargetControlID="dataTextBox" PopupButtonID="ImageButton9">
                            </cc1:CalendarExtender><table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="dataTextBox" runat="server" CssClass="msnInput"
                                Text='<%# Bind("data") %>' Width="155px"></asp:TextBox>&nbsp;</td>
                                    <td>
                                        <asp:ImageButton ID="ImageButton9" runat="server" ImageAlign="Bottom" ImageUrl="~/images/btcalendario.gif" CausesValidation="False" /></td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        Início:<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TBdataEndUp"
                                            ControlToValidate="TBdataStartUp" Display="Dynamic" ErrorMessage="*" Operator="LessThanEqual"></asp:CompareValidator><br />
                                        <asp:TextBox ID="TBdataStartUp" runat="server" CssClass="InputCad" Width="87px" Text='<%# Bind("data_start") %>' Enabled="False"></asp:TextBox>&nbsp;</td>
                                    <td>
                                        Término:<br />
                                        <asp:TextBox ID="TBdataEndUp" runat="server" CssClass="InputCad" Width="88px" Text='<%# Bind("data_end") %>' Enabled="False"></asp:TextBox></td>
                                </tr>
                            </table>
                            Compromisso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="dsCompromissoEmpTextBox" Display="Dynamic" ErrorMessage="*"
                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="dsCompromissoEmpTextBox" runat="server" Text='<%# Bind("dsCompromissoEmp") %>' CssClass="InputCad" Height="72px" TextMode="MultiLine" Width="185px"></asp:TextBox><br />
                            Empresa [RH]:<br />
                <asp:TextBox ID="dsRespostaCandidatoTextBox" runat="server" 
                                Text='<%# Bind("dsRespostaCandidato") %>' CssClass="InputCad" Height="64px" 
                                TextMode="MultiLine" Width="185px"></asp:TextBox><br />
                            <br />
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/DGrelogio.gif" /><asp:CheckBox ID="ativoCheckBox" runat="server" Checked='<%# Bind("ativo") %>' /><br />
                            <br />
                            <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Insert"
                                ImageUrl="~/images/buttonSalvarCalendario.gif" />
                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/images/buttonCancCalendario.gif" OnCommand="GetCommand" /></td>
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
                                CssClass="DGCalendarioWidthSite" DataKeyNames="idagenda" DataSourceID="Agenda"
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
                                <AlternatingRowStyle CssClass="DGCalendarioBG" />
                                <RowStyle CssClass="DGCalendarioBGnot" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="HTMLCal" runat="server"></asp:Label></td>
        </tr>
    </table>                
                
                <br />
    <asp:SqlDataSource ID="Agenda" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    SelectCommand="SELECT idagenda, idcurriculo, idVaga, data, data_start, data_end, dsCompromissoEmp, dsRespostaCandidato, ativo FROM tbAgenda WHERE (idcurriculo = @idcurriculo) AND (data = @data) ORDER BY data_start" 
                    DeleteCommand="DELETE FROM [tbAgenda] WHERE [idagenda] = @idagenda" 
                    InsertCommand="INSERT INTO [tbAgenda] ([idcurriculo], [idVaga], [data], [data_start], [data_end], [dsCompromissoEmp], [dsRespostaCandidato], [ativo]) VALUES (@idcurriculo, @idVaga, @data, @data_start, @data_end, @dsCompromissoEmp, @dsRespostaCandidato, @ativo)" 
                    UpdateCommand="UPDATE [tbAgenda] SET [idcurriculo] = @idcurriculo, [idVaga] = @idVaga, [data] = @data, [data_start] = @data_start, [data_end] = @data_end, [dsCompromissoEmp] = @dsCompromissoEmp, [dsRespostaCandidato] = @dsRespostaCandidato, [ativo] = @ativo WHERE [idagenda] = @idagenda">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidcurriculo" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
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
    <asp:SqlDataSource ID="SqlGravaAgenda" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbAgenda] WHERE [idagenda] = @idagenda" 
        InsertCommand="INSERT INTO [tbAgenda] ([idcurriculo], [idVaga], [data], [data_start], [data_end], [dsCompromissoEmp], [dsRespostaCandidato], [ativo]) VALUES (@idcurriculo, @idVaga, @data, @data_start, @data_end, @dsCompromissoEmp, @dsRespostaCandidato, @ativo)"
        SelectCommand="SELECT [idagenda], [idcurriculo], [idVaga], [data], [data_start], [data_end], [dsCompromissoEmp], [dsRespostaCandidato], [ativo] FROM [tbAgenda] WHERE (([idagenda] = @idagenda) AND ([idcurriculo] = @idcurriculo))"
        
                    UpdateCommand="UPDATE tbAgenda SET idcurriculo = @idcurriculo, idVaga = @idVaga, data = @data, data_start = @data_start, data_end = @data_end, dsCompromissoEmp = @dsCompromissoEmp, dsRespostaCandidato = @dsRespostaCandidato, ativo = @ativo WHERE (idagenda = @idagenda)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" DefaultValue="0" Name="idagenda" PropertyName="Text"
                Type="Int32" />
            <asp:ControlParameter ControlID="lblidcurriculo" DefaultValue="0" 
                Name="idcurriculo" PropertyName="Text" Type="Int32" />
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
                <br />
                <br />
                <asp:LinkButton ID="LBVoltar" runat="server">Voltar ao Processo Seletivo</asp:LinkButton>
                <br />
                <asp:SqlDataSource ID="SqlCV" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    SelectCommand="SELECT [idcurriculo], [nome], [email] FROM [vwPS] WHERE ([idRELcandidato_vaga] = @idRELcandidato_vaga)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idRELcandidato_vaga" 
                            Name="idRELcandidato_vaga" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>    
</asp:Content>

