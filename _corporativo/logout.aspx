<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="false" CodeFile="logout.aspx.vb" Inherits="_corporativo_logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <table cellpadding="0" cellspacing="0" align="center" 
            width="100%">
            <tr>
                <td>
                    <br />
                    <br />
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" 
                        align="center">
                        <tr>
                            <td align="left">
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <table id="LOGOUT" cellpadding="10" cellspacing="10" width="100%">
        <tr>
            <td align="center">
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="LabelAVISO" runat="server" 
                    Text="Você está para encerrar esta sessão, quer realmente encerrar?" 
                    CssClass="tituloMensagemDB"></asp:Label>
                <br />
                <br />
                <br />
                <asp:LinkButton ID="LinkButtonLOGOUT" runat="server" 
                    class="texto" OnClick="btnLogout_OnClick"
                    PostBackUrl="#" CssClass="button">Sim</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButtonN" runat="server" CssClass="button" 
                    PostBackUrl="javascript:history.go(-1)">Não</asp:LinkButton>
                <br />
            </td>
        </tr>
    </table>
    </div>

</asp:Content>

