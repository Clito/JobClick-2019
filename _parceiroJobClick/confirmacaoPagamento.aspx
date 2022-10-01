<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="confirmacaoPagamento.aspx.vb" Inherits="_parceiroJobClick_confirmacaoPagamento" %>

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
                </td>
            </tr>
        </table>
    </asp:Panel>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Confirmação de Pagamento"></asp:Label>

            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Informe o número do documento:"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNumeroDocumentoBoletoTextBox" Display="Dynamic" ErrorMessage="Informe o número do documento." SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="legenda" Text="Impresso no boleto"></asp:Label>
            <br />
            <asp:TextBox ID="txtNumeroDocumentoBoletoTextBox" runat="server" CssClass="simple" Width="250px"></asp:TextBox>
            <asp:LinkButton ID="LinkButtonCONFIRMAR" runat="server" CssClass="button">Confirmar pagamento</asp:LinkButton>
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummaryConfirma" runat="server" ShowMessageBox="True" ShowSummary="False" />

            <br />
            <asp:Label ID="CabecBoletoLabel" runat="server" CssClass="titulo"></asp:Label>
            <asp:GridView ID="GridViewBOLETO" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idBoleto" DataSourceID="SqlDataSourceBOLETOS_CONFIRMADOS" PageSize="5">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                    <asp:BoundField DataField="idBoleto" HeaderText="idBoleto" InsertVisible="False" ReadOnly="True" SortExpression="idBoleto" Visible="False" />
                    <asp:BoundField DataField="txtVencimento" HeaderText="Vencimento" SortExpression="txtVencimento" />
                    <asp:BoundField DataField="txtValorBoleto" DataFormatString="{0:c}" HeaderText="ValorBoleto" SortExpression="txtValorBoleto" />
                    <asp:BoundField DataField="txtNumeroDocumentoBoleto" HeaderText="Número Documento" SortExpression="txtNumeroDocumentoBoleto" />
                </Columns>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceBOLETOS_CONFIRMADOS" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_AD_CONFIRMA_PG_BOLETO" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="txtNumeroDocumentoBoleto" Type="String" />
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="confirma" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>

