<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="sair.aspx.vb" Inherits="_parceiroJobClick_sair" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Você está para encerrar esta sessão, quer realmente encerrar?"></asp:Label>
                <table border="0" cellpadding="0" cellspacing="0" height="300" width="100%">
                    <tr>
                        <td align="center">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            [<asp:LinkButton ID="LinkButtonSAIR" runat="server" class="texto" PostBackUrl="#">Sim</asp:LinkButton><span style="color: #505050; text-decoration: none">]
                                    | [</span><a class="texto" href="javascript:history.go(-1)" onmouseover="self.status=document.referrer;return true">Não</a>]</td>
                    </tr>
                </table>
        </div>
    </div>
</asp:Content>

