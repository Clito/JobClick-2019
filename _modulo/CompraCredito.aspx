<%@ Page Language="VB" MasterPageFile="~/_user/user_MasterPage.master" AutoEventWireup="false" CodeFile="CompraCredito.aspx.vb" Inherits="_modulo_CompraCredito" title="Untitled Page" %>

<%@ Register src="../_app/saldoSMS.ascx" tagname="saldoSMS" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Credito" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="CabecLabel" runat="server" CssClass="textoPadraoAzul" 
                    Font-Bold="True" Text="Compra de Créditos"></asp:Label>
                <br />
                <br />
                <uc1:saldoSMS ID="saldoSMS1" runat="server" />
                <br />
                <br />
                <asp:DropDownList ID="DropDownListCompra" runat="server" 
                    CssClass="DropCadFormulario">
                    <asp:ListItem Value="200">Pacote com 200 SMS - R$ 60</asp:ListItem>
                    <asp:ListItem Value="500">Pacote com 500 SMS - R$ 150,00</asp:ListItem>
                    <asp:ListItem Value="1000">Pacote com 1000 SMS - R$ 280,00</asp:ListItem>
                    <asp:ListItem Value="2000">Pacote com 2000 SMS - R$ 540,00</asp:ListItem>
                    <asp:ListItem Value="5000">Pacote com 5000 SMS - R$ 1.250,00</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" CssClass="textbox" Text="Comprar" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlCredito" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionString %>" 
                    SelectCommand="SMSAssist.spQuota_Insert" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idClient" SessionField="idClient" Type="Int32" />
                        <asp:Parameter Name="numCredit" Type="Int32" DefaultValue="500" />
                        <asp:SessionParameter DefaultValue="" Name="idUserCreate" SessionField="idUser" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

