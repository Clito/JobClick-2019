<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="pagseguro.aspx.vb" Inherits="_admin_pagseguro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>


        <asp:Label ID="codeNotificacaoLabel" runat="server" Visible="False">0</asp:Label>
        <asp:Label ID="idBoletoLabel" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:Label ID="liberaCreditoLabel" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:FormView ID="FormViewEXTRATO" runat="server" DataKeyNames="idExtrato" DataSourceID="SqlDataSourceEXTRATO">
            <EditItemTemplate>
                idExtrato:
                <asp:Label ID="idExtratoLabel1" runat="server" Text='<%# Eval("idExtrato") %>' />
                <br />
                idSetup:
                <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' />
                <br />
                idUsuario:
                <asp:TextBox ID="idUsuarioTextBox" runat="server" Text='<%# Bind("idUsuario") %>' />
                <br />
                idPedido:
                <asp:TextBox ID="idPedidoTextBox" runat="server" Text='<%# Bind("idPedido") %>' />
                <br />
                txtNumeroDocumentoBoleto:
                <asp:TextBox ID="txtNumeroDocumentoBoletoTextBox" runat="server" Text='<%# Bind("txtNumeroDocumentoBoleto") %>' />
                <br />
                tipoMovimentacao:
                <asp:TextBox ID="tipoMovimentacaoTextBox" runat="server" Text='<%# Bind("tipoMovimentacao") %>' />
                <br />
                dataMovimentacao:
                <asp:TextBox ID="dataMovimentacaoTextBox" runat="server" Text='<%# Bind("dataMovimentacao") %>' />
                <br />
                valor:
                <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("valor") %>' />
                <br />
                dsMovimentacao:
                <asp:TextBox ID="dsMovimentacaoTextBox" runat="server" Text='<%# Bind("dsMovimentacao") %>' />
                <br />
                saldo:
                <asp:TextBox ID="saldoTextBox" runat="server" Text='<%# Bind("saldo") %>' />
                <br />
                pagamentoConfirmado:
                <asp:TextBox ID="pagamentoConfirmadoTextBox" runat="server" Text='<%# Bind("pagamentoConfirmado") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EmptyDataTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Incluir Crédito" />
            </EmptyDataTemplate>
            <InsertItemTemplate>
                &nbsp;<asp:Label ID="Label1" runat="server" Text="Empresa:"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" DataSourceID="SqlDataSourceSETUP" DataTextField="empresa" DataValueField="idsetup" SelectedValue='<%# Bind("idSetup") %>'>
                </asp:DropDownList>
                <br />
                <asp:Label ID="Label2" runat="server" Text="(ID) do Responsável pela compra:"></asp:Label>
                <br />
                <asp:TextBox ID="idUsuarioTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("idUsuario") %>' />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Código do pedido:"></asp:Label>
                <br />
                <asp:TextBox ID="idPedidoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("idPedido") %>' />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Número do documento:"></asp:Label>
                <br />
                <asp:TextBox ID="txtNumeroDocumentoBoletoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("txtNumeroDocumentoBoleto") %>' />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Código da movimentação:"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListTIPO" runat="server" CssClass="DropCad" SelectedValue='<%# Bind("tipoMovimentacao") %>'>
                    <asp:ListItem Value="B">Bônus (B)</asp:ListItem>
                    <asp:ListItem Value="C">Crédito (C)</asp:ListItem>
                    <asp:ListItem Value="D">Débito (D)</asp:ListItem>
                    <asp:ListItem Value="E">Estorno (E)</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Data da movimentação:"></asp:Label>
                <br />
                <asp:TextBox ID="dataMovimentacaoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("dataMovimentacao") %>' />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Valor da transação: (Decimal duas casas decimais)"></asp:Label>
                <br />
                <asp:TextBox ID="valorTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("valor") %>' />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Descrição:"></asp:Label>
                <br />
                <asp:TextBox ID="dsMovimentacaoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("dsMovimentacao") %>' />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Saldo:  (Decimal duas casas decimais)"></asp:Label>
                <br />
                <asp:TextBox ID="saldoTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("saldo") %>' />
                <br />
                <br />
                <asp:DropDownList ID="DropDownListCONFIRMADO" runat="server" CssClass="DropCad" SelectedValue='<%# Bind("pagamentoConfirmado") %>'>
                    <asp:ListItem Value="1">Confirmado</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button" Text="Registrar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Incluir Crédito" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:GridView ID="GridViewRETORNO" runat="server" AutoGenerateColumns="False" DataKeyNames="codeNotificacao" DataSourceID="SqlDataSourceNOTIFICACAOLISTA" Width="100%" AllowPaging="True">
            <Columns>
                <asp:ButtonField CommandName="Select" DataTextField="codeNotificacao" HeaderText="Código" Text="Button" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="LabelAvisoRetorno" runat="server" Text="Não existem retornos até o momento."></asp:Label>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridViewNOTIFICACAO" runat="server" AutoGenerateColumns="False" DataKeyNames="Referencia_RES" DataSourceID="SqlDataSourceNOTIFICACAO" Width="100%">
            <Columns>
                <asp:BoundField DataField="DataTransacao_RES" HeaderText="Data" ReadOnly="True" SortExpression="DataTransacao_RES" />
                <asp:BoundField DataField="TransacaoID_RES" HeaderText="TransacaoID_RES" SortExpression="TransacaoID_RES" ReadOnly="True" Visible="False">
                </asp:BoundField>
                <asp:BoundField DataField="Referencia_RES" HeaderText="Setup" SortExpression="Referencia_RES" ReadOnly="True" />
                <asp:BoundField DataField="idUser_RES" HeaderText="Usuário" SortExpression="idUser_RES" />
                <asp:BoundField DataField="nome_RES" HeaderText="Responsável" ReadOnly="True" SortExpression="nome_RES" />
                <asp:BoundField DataField="ClienteEmail_RES" HeaderText="Email" ReadOnly="True" SortExpression="ClienteEmail_RES" />
                <asp:BoundField DataField="FormaPagamentoDS" HeaderText="Pagamento" ReadOnly="True" SortExpression="FormaPagamentoDS" />
                <asp:BoundField DataField="StatusRETORNO" HeaderText="Status" ReadOnly="True" SortExpression="StatusRETORNO" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="LabelAvisoRetorno" runat="server" Text="Caso exista notificações acima, selecione para ver o status da compra"></asp:Label>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridViewBOLETO" runat="server" AutoGenerateColumns="False" DataKeyNames="idBoleto,txtNumeroDocumentoBoleto,idPedido,txtValorBoleto,idSetup,idUsuario,orcamento,idCadastroEmpresa" DataSourceID="SqlDataSourceBOLETO" Width="100%" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="idBoleto" HeaderText="idBoleto" InsertVisible="False" ReadOnly="True" SortExpression="idBoleto" Visible="False" />
                <asp:BoundField DataField="nmempresa" HeaderText="Empresa" SortExpression="nmempresa" />
                <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa" Visible="False" />
                <asp:BoundField DataField="txtVencimento" HeaderText="Vencimento" SortExpression="txtVencimento" />
                <asp:BoundField DataField="txtValorBoleto" HeaderText="Valor" SortExpression="txtValorBoleto" DataFormatString="{0:c}" />
                <asp:BoundField DataField="txtNumeroDocumentoBoleto" HeaderText="Doc" SortExpression="txtNumeroDocumentoBoleto" />
                <asp:BoundField DataField="txtCodigoCedente" HeaderText="txtCodigoCedente" SortExpression="txtCodigoCedente" Visible="False" />
                <asp:BoundField DataField="txtNossoNumeroBoleto" HeaderText="txtNossoNumeroBoleto" SortExpression="txtNossoNumeroBoleto" Visible="False" />
                <asp:BoundField DataField="txtCPFCNPJ" HeaderText="txtCPFCNPJ" SortExpression="txtCPFCNPJ" Visible="False" />
                <asp:BoundField DataField="txtNomeCedente" HeaderText="Nome" SortExpression="txtNomeCedente" Visible="False" />
                <asp:BoundField DataField="txtAgenciaCendente" HeaderText="txtAgenciaCendente" SortExpression="txtAgenciaCendente" Visible="False" />
                <asp:BoundField DataField="txtContaCedente" HeaderText="txtContaCedente" SortExpression="txtContaCedente" Visible="False" />
                <asp:BoundField DataField="txtCPFCNPJSacado" HeaderText="txtCPFCNPJSacado" SortExpression="txtCPFCNPJSacado" Visible="False" />
                <asp:BoundField DataField="txtNomeSacado" HeaderText="Nome responsável" SortExpression="txtNomeSacado" Visible="False" />
                <asp:BoundField DataField="txtEnderecoSacado" HeaderText="txtEnderecoSacado" SortExpression="txtEnderecoSacado" Visible="False" />
                <asp:BoundField DataField="txtBairroSacado" HeaderText="txtBairroSacado" SortExpression="txtBairroSacado" Visible="False" />
                <asp:BoundField DataField="txtCidadeSacado" HeaderText="txtCidadeSacado" SortExpression="txtCidadeSacado" Visible="False" />
                <asp:BoundField DataField="txtCEPSacado" HeaderText="txtCEPSacado" SortExpression="txtCEPSacado" Visible="False" />
                <asp:BoundField DataField="txtUFSacado" HeaderText="txtUFSacado" SortExpression="txtUFSacado" Visible="False" />
                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                <asp:BoundField DataField="txtValorBoleto" DataFormatString="{0:c}" HeaderText="Valor Boleto" SortExpression="txtValorBoleto" />
                <asp:BoundField DataField="orcamento" DataFormatString="{0:c}" HeaderText="Orçamento" SortExpression="orcamento" />
                <asp:BoundField DataField="confirmaCliente" HeaderText="Confirmado?" SortExpression="confirmaCliente" />
                <asp:BoundField DataField="confirmaAdmin" HeaderText="Liberado?" SortExpression="confirmaAdmin" />
                <asp:BoundField DataField="idPedido" HeaderText="idPedido" SortExpression="idPedido" Visible="False" />
                <asp:BoundField DataField="idSetup" HeaderText="idSetup" SortExpression="idSetup" Visible="False" />
                <asp:BoundField DataField="idUsuario" HeaderText="idUsuario" SortExpression="idUsuario" Visible="False" />
                <asp:BoundField DataField="txtValorBoleto" HeaderText="txtValorBoleto" SortExpression="txtValorBoleto" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select" OnClientClick="return confirm(&quot;Deseja liberar o saldo/serviço para este cliente?&quot;)" Text="Liberar"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceNOTIFICACAOLISTA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_ADMINISTRACAO_PAGSEGURO_NOTIFICACAO" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="codeNotificacao" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNOTIFICACAO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_ADMINISTRACAO_PAGSEGURO_NOTIFICACAO_TABELA" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="codeNotificacaoLabel" Name="codeNotificacao" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSourceENTRADA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [idXMLPagSeguro], [code], [xmlcode] FROM [tbPagSeguroXML]"></asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSourceBOLETO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_ADMINISTRACAO_BOLETO" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="idBoletoLabel" DefaultValue="0" Name="idBoleto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="liberaCreditoLabel" DefaultValue="0" Name="liberaCredito" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSourceEXTRATO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [tbExtrato] WHERE [idExtrato] = @idExtrato" InsertCommand="INSERT INTO [tbExtrato] ([idSetup], [idUsuario], [idPedido], [txtNumeroDocumentoBoleto], [tipoMovimentacao], [dataMovimentacao], [valor], [dsMovimentacao], [saldo], [pagamentoConfirmado]) VALUES (@idSetup, @idUsuario, @idPedido, @txtNumeroDocumentoBoleto, @tipoMovimentacao, @dataMovimentacao, @valor, @dsMovimentacao, @saldo, @pagamentoConfirmado)" SelectCommand="SELECT [idExtrato], [idSetup], [idUsuario], [idPedido], [txtNumeroDocumentoBoleto], [tipoMovimentacao], [dataMovimentacao], [valor], [dsMovimentacao], [saldo], [pagamentoConfirmado] FROM [tbExtrato] WHERE ([idSetup] = @idSetup)" UpdateCommand="UPDATE [tbExtrato] SET [idSetup] = @idSetup, [idUsuario] = @idUsuario, [idPedido] = @idPedido, [txtNumeroDocumentoBoleto] = @txtNumeroDocumentoBoleto, [tipoMovimentacao] = @tipoMovimentacao, [dataMovimentacao] = @dataMovimentacao, [valor] = @valor, [dsMovimentacao] = @dsMovimentacao, [saldo] = @saldo, [pagamentoConfirmado] = @pagamentoConfirmado WHERE [idExtrato] = @idExtrato">
            <DeleteParameters>
                <asp:Parameter Name="idExtrato" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idSetup" Type="Int32" />
                <asp:Parameter Name="idUsuario" Type="Int32" />
                <asp:Parameter Name="idPedido" Type="Int32" />
                <asp:Parameter Name="txtNumeroDocumentoBoleto" Type="String" />
                <asp:Parameter Name="tipoMovimentacao" Type="String" />
                <asp:Parameter Name="dataMovimentacao" Type="DateTime" />
                <asp:Parameter Name="valor" Type="Decimal" />
                <asp:Parameter Name="dsMovimentacao" Type="String" />
                <asp:Parameter Name="saldo" Type="Decimal" />
                <asp:Parameter Name="pagamentoConfirmado" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idSetup" SessionField="idsetup" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idSetup" Type="Int32" />
                <asp:Parameter Name="idUsuario" Type="Int32" />
                <asp:Parameter Name="idPedido" Type="Int32" />
                <asp:Parameter Name="txtNumeroDocumentoBoleto" Type="String" />
                <asp:Parameter Name="tipoMovimentacao" Type="String" />
                <asp:Parameter Name="dataMovimentacao" Type="DateTime" />
                <asp:Parameter Name="valor" Type="Decimal" />
                <asp:Parameter Name="dsMovimentacao" Type="String" />
                <asp:Parameter Name="saldo" Type="Decimal" />
                <asp:Parameter Name="pagamentoConfirmado" Type="Int32" />
                <asp:Parameter Name="idExtrato" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceSETUP" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT UPPER(empresa) AS empresa, idsetup FROM tbsetup ORDER BY empresa"></asp:SqlDataSource>


    </div>
</asp:Content>

