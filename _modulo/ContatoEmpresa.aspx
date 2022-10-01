<%@ Page Language="VB" MasterPageFile="~/_user/user_MasterPage.master" AutoEventWireup="false" CodeFile="ContatoEmpresa.aspx.vb" Inherits="_modulo_ContatoEmpresa" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="ContatoEmpresa" cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlContatoEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionString %>" 
                    SelectCommand="GetParams_Aggregations" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="idUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

