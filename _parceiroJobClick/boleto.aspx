<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="boleto.aspx.vb" Inherits="_parceiroJobClick_boleto" %>

<%@ Register assembly="Boleto.Net" namespace="BoletoNet" tagprefix="bn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Promessa de pagamento de boleto"></asp:Label>
            <br />
            <br />

    <asp:Panel ID="panelDados" runat="server">

        <asp:Label ID="LabelContrato" runat="server" Text="EMPRESA, inscrita no Cadastro Nacional da Pessoa Jurídica sob o nº CNPJ, se compromete a efetuar o pagamento deste boleto NUMERO, no valor de VALOR até sua data de vencimento DATA. O Jobclick irá mediante aceite desta promessa de pagamento liberar o valor integral informado pelo USUARIO."></asp:Label>

        <h3>Dados do Boleto</h3>
    <table border="0">
        <tr>
            <td class="auto-style1">
                Vencimento:
            </td>
            <td class="auto-style1">
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
                <asp:Label ID="txtNumeroDocumentoBoleto" runat="server" Text="txtNumeroDocumentoBoleto"></asp:Label>
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
    <asp:Button ID="Button1" runat="server" Text="Confirmo os dados e aceito" OnClick="Button1_Click" CssClass="button" ToolTip="Para gerar o boleto para pagamento, clique aqui." />
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/cadastro.aspx" ToolTip="Para alterar os dados da empresa clique aqui">Mudar os dados do Sacado</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/Default.aspx" ToolTip="Cancelar">Cancelar</asp:LinkButton>
            <br />

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </div>
</asp:Content>

