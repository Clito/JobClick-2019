<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="agenda_Empresa.aspx.vb" Inherits="_empresa_agenda_Empresa" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_agenda.gif" />
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <br />
                <asp:Label ID="lblidvaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRELcandidato_vaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidcurriculo" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="emailLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="nomeLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idProcessoLabel" runat="server" Visible="False"></asp:Label>
                    <br />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlCV">
                    <ItemTemplate>
                        <asp:Label ID="nomeLabel0" runat="server" CssClass="titulo" 
                            Text='<%# Eval("nome") %>' />
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Eval("idcurriculo") %>' Visible="False" />
                        <br />
                        <asp:Label ID="emailLabel0" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                    <br />
                    <DayPilot:DayPilotCalendar ID="DayPilotCalendar1" runat="server" 
                        BorderColor="Silver" DurationBarColor="#FF9900" EventBorderColor="Silver" 
                        EventClickHandling="PostBack" FreetimeClickHandling="PostBack" />
                    <br />
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

