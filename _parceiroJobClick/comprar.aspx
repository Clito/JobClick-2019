<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="comprar.aspx.vb" Inherits="_parceiroJobClick_comprar" %>

<%@ Register assembly="UOL.PagSeguro" namespace="UOL.PagSeguro" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
                                                   <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                                                        <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Image ID="ImageAviso" runat="server" 
                                                                        ImageUrl="~/_parceiroJobClick/images/ok.jpg" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <asp:LinkButton ID="LinkButtonCOMPRACREDITO" runat="server" CssClass="buttonAtivo" ToolTip="Para adicionar em sua lista de contatos este profissional, será necessário ter saldo mínimo de 2 créditos em sua conta." Visible="False">Comprar créditos</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
<div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Compra de créditos"></asp:Label>
            <br />
            <br />

    <asp:Panel ID="panelDados" runat="server">

        <asp:Label ID="LabelContrato" runat="server" Text="EMPRESA, inscrita no Cadastro Nacional da Pessoa Jurídica sob o nº CNPJ, deseja adquirir créditos no valor (mínimo) de VALOR, o número deste pedido é NUMERO gerado na data de DATA. O Jobclick irá liberar o valor integral informado pelo USUARIO no momento da comprovação de pagamento enviado pelo sistema PagSeguro da UOL."></asp:Label>

        <h3>Dados do Boleto</h3>
    <table border="0">
        <tr>
            <td class="auto-style1">
                Vencimento:
            </td>
            <td class="auto-style1">
                <asp:Label ID="txtVencimentoDOC" runat="server"></asp:Label>
                <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="txtVencimento" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Valor:
                <br />
                <asp:Label ID="Label1" runat="server" Text="Mínimo (20) créditos."></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LabelNovoValor" runat="server" Text="Informe o valor em créditos:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxValor" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="TextBoxValor" runat="server" onkeyup="formataValor(this,event);" style="text-align:left" CssClass="simple" Width="180px"></asp:TextBox></td>
                    </tr>
                </table>            

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
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Telefone:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txtdddSacado" runat="server"></asp:Label>
                <asp:Label ID="txttelefoneSacado" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="panelBoleto" runat="server">
        <asp:Image ID="ImagePAGSEGURO" runat="server" ImageUrl="~/_parceiroJobClick/images/pagseguro.png" ToolTip="O PagSeguro é aceito por milhares de lojas virtuais e pessoas físicas. Você compra e paga com rapidez e segurança." />
            </asp:Panel>
            <%--    <bol:BoletoBancario id="santander" runat="server" CodigoBanco="33">
    </bol:BoletoBancario>--%>
            <br />
    <asp:Button ID="ButtonPagamentoPS" runat="server" Text="Confirmo os dados e aceito" CssClass="button" ToolTip="Para gerar o boleto para pagamento, clique aqui." />
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

            <cc1:VendaPagSeguro ID="VendaPagSeguroCredito" runat="server">
            </cc1:VendaPagSeguro>

        </div>
    </div>
</asp:Content>

