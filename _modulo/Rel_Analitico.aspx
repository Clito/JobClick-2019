<%@ Page Language="VB" MasterPageFile="~/_user/relatorio_MasterPage.master" AutoEventWireup="false" CodeFile="Rel_Analitico.aspx.vb" Inherits="_modulo_Rel_Analitico" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Relatorio" cellpadding="5" cellspacing="2" width="100%">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <br />
                <asp:Label ID="dataILabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dataFLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="contadorRegLabel" runat="server"></asp:Label>
                <br />
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Data Inicial:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="dtITextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="dtITextBox" runat="server" CssClass="textbox"></asp:TextBox>
                            &nbsp;
                            <cc1:CalendarExtender ID="dtITextBox_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="dtITextBox">
                            </cc1:CalendarExtender>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Data Final:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="dtFTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="dtFTextBox" runat="server" CssClass="textbox"></asp:TextBox>
                            <cc1:CalendarExtender ID="dtFTextBox_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="dtFTextBox">
                            </cc1:CalendarExtender>
                        </td>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ButtonGerarRelatorio" runat="server" CssClass="textbox" 
                                Text="Gerar Relatório" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlRelatorioAnalitico" AllowPaging="True" 
                    BorderColor="#CCCCCC" BorderStyle="Dotted" 
                    BorderWidth="1px" PageSize="100" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idMessageToQueue" HeaderText="idMessageToQueue" 
                            SortExpression="idMessageToQueue" Visible="False" />
                        <asp:BoundField DataField="telefone" HeaderText="Celular" 
                            SortExpression="telefone" />
                        <asp:BoundField DataField="Data" HeaderText="Data do envio" ReadOnly="True" 
                            SortExpression="Data" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora do envio" ReadOnly="True" 
                            SortExpression="Hora" />
                        <asp:BoundField DataField="statusMsg" HeaderText="Status da mensagem" ReadOnly="True" 
                            SortExpression="statusMsg" />
                        <asp:BoundField DataField="statusOper" HeaderText="statusOper" ReadOnly="True" 
                            SortExpression="statusOper" Visible="False" />
                        <asp:BoundField DataField="mensagem" HeaderText="Mensagem" 
                            SortExpression="mensagem" />
                        <asp:BoundField DataField="strOperator" HeaderText="strOperator" 
                            SortExpression="strOperator" Visible="False" />
                        <asp:BoundField DataField="strLA" HeaderText="strLA" SortExpression="strLA" 
                            Visible="False" />
                    </Columns>
                    <AlternatingRowStyle BackColor="#EAEAEA" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlRelatorioAnalitico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionStringMaster %>" 
                    SelectCommand="SMSReport.Rel_Ana" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="idAggregationType" Type="Int32" DefaultValue="2" />
                        <asp:SessionParameter Name="idUser" SessionField="idUser_SMS" Type="Int32" />
                        <asp:ControlParameter ControlID="dataILabel" DefaultValue="" Name="strDateStart" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="dataFLabel" Name="strDateFinish" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="strGroups" Type="String" />
                        <asp:Parameter Name="strProjects" Type="String" />
                        <asp:Parameter Name="strUsers" Type="String" />
                        <asp:Parameter Name="strOperators" Type="String" />
                        <asp:Parameter Name="strLargeAccounts" Type="String" />
                        <asp:Parameter Name="idAggregation" Type="Int32" DefaultValue="-1" />
                        <asp:Parameter Name="strSpecificDate" Type="String" DefaultValue="Todos" />
                        <asp:Parameter Name="strSpecificHour" Type="String" DefaultValue="Todos" />
                        <asp:Parameter Name="strPhoneNumber" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

