<%@ Page Language="VB" AutoEventWireup="false" CodeFile="boleto_print_email.aspx.vb" Inherits="_parceiroJobClick_boleto_print_email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../App_Themes/parceiroJobClick.css" rel="stylesheet" type="text/css" />
    <script>
        function printpage() {
            window.print()
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="conteudo">
        <div id="corpoformulario">

    <asp:Panel ID="panelDados" runat="server">
    <h3>
        Dados do Boleto</h3>
    <table border="0">
        <tr>
            <td>
                Vencimento:
            </td>
            <td>
                <asp:Label ID="txtVencimento" runat="server"></asp:Label>
                <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Valor:
            </td>
            <td>
                <asp:Label ID="txtValorBoleto" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Nosso Número:
            </td>
            <td>
                <asp:Label ID="txtNossoNumeroBoleto" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Número Documento:
            </td>
            <td>
                <asp:Label ID="txtNumeroDocumentoBoleto" runat="server"></asp:Label>
            </td>
        </tr>        
    </table>
    <br />
    <h3>
        Dados do Cendente</h3>
    <table border="0">
        <tr>
            <td>
                CPF/CNPJ:
            </td>
            <td>
                <asp:Label ID="txtCPFCNPJ" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Código:
            </td>
            <td>
                <asp:Label ID="txtCodigoCedente" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Nome:
            </td>
            <td>
                <asp:Label ID="txtNomeCedente" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Agência:
            </td>
            <td>
                <asp:Label ID="txtAgenciaCendente" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Conta:
            </td>
            <td>
                <asp:Label ID="txtContaCedente" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <h3>
        Dados do Sacado</h3>
    <table border="0">
        <tr>
            <td>
                CPF/CNPJ:
            </td>
            <td>
                <asp:Label ID="txtCPFCNPJSacado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Nome:
            </td>
            <td>
                <asp:Label ID="txtNomeSacado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Endereço:
            </td>
            <td>
                <asp:Label ID="txtEnderecoSacado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Bairro:
            </td>
            <td>
                <asp:Label ID="txtBairroSacado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Cidade:
            </td>
            <td>
                <asp:Label ID="txtCidadeSacado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                CEP:
            </td>
            <td>
                <asp:Label ID="txtCEPSacado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                UF:
            </td>
            <td>
                <asp:Label ID="txtUFSacado" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="panelBoleto" runat="server"></asp:Panel>
            <%--    <bol:BoletoBancario id="santander" runat="server" CodigoBanco="33">
    </bol:BoletoBancario>--%>

            <br />
            <asp:LinkButton ID="LinkButtonPrint" runat="server" CssClass="button" OnClientClick="printpage()">Imprimir</asp:LinkButton>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </div>
    </form>
</body>
</html>
