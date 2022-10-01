<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiro/ParceiroPage.master" AutoEventWireup="false" CodeFile="infoCliente.aspx.vb" Inherits="_parceiro_infoCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idParceiroLabel" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <br />
                    <asp:GridView ID="GridViewCliente" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                        DataKeyNames="idCadastroEmpresa,idParceiro" DataSourceID="SqlDataCliente" 
                        GridLines="Horizontal" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" 
                                Visible="False" />
                            <asp:ButtonField CommandName="Select" DataTextField="nmempresa" Text="Button" />
                            <asp:BoundField DataField="nmempresa" HeaderText="Cliente" 
                                SortExpression="nmempresa" Visible="False" />
                            <asp:BoundField DataField="cnpj" HeaderText="CNPJ" SortExpression="cnpj" />
                            <asp:BoundField DataField="emailRes" HeaderText="E-mail" 
                                SortExpression="emailRes" />
                            <asp:BoundField DataField="nomeRes" HeaderText="Nome" SortExpression="nomeRes" 
                                Visible="False" />
                            <asp:BoundField DataField="idParceiro" 
                                HeaderText="idParceiro" SortExpression="idParceiro" 
                                Visible="False" />
                            <asp:BoundField DataField="site" HeaderText="Site" SortExpression="site" 
                                Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:ImageButton ID="ImageButtonCNC" runat="server" 
                        ImageUrl="~/images/empresa/_cadastroNovoCliente.png" />
                    <br />
                    <br />
                    <asp:DetailsView ID="DetalheEmpresa" runat="server" AutoGenerateRows="False" 
                        BorderStyle="None" DataKeyNames="idCadastroEmpresa" 
                        DataSourceID="SqlDataClienteRES" GridLines="Horizontal" 
                        HeaderText="Ficha da Empresa" Height="20px" Width="100%">
                        <AlternatingRowStyle BorderColor="#BFCAC9" BorderStyle="Dotted" 
                            BorderWidth="1px" />
                        <Fields>
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" 
                                Visible="False" />
                            <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                Visible="False" />
                            <asp:BoundField DataField="dsPorte" HeaderText="Porte da Empresa:" 
                                SortExpression="dsPorte">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dsAreaAtuacao" 
                                HeaderText="Área de Atuação da Empresa:" SortExpression="dsAreaAtuacao">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nmempresa" HeaderText="Razão Social:" 
                                SortExpression="nmempresa">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cnpj" HeaderText="CNPJ:" SortExpression="cnpj">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ie" HeaderText="IE:" SortExpression="ie">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="emailRes" 
                                HeaderText="E-mail do responsável pela conta:" SortExpression="emailRes">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nomeRes" 
                                HeaderText="Neme do Responsável pela conta:" SortExpression="nomeRes">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="endereco" HeaderText="Endereço:" 
                                SortExpression="endereco">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cep" HeaderText="CEP:" SortExpression="cep">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cidade" HeaderText="Cidade:" SortExpression="cidade">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="uf" HeaderText="UF:" SortExpression="uf">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pais" HeaderText="Pais:" SortExpression="pais">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nomeResposavelCobranca" 
                                HeaderText="nomeResposavelCobranca" SortExpression="nomeResposavelCobranca" 
                                Visible="False" />
                            <asp:BoundField DataField="emailCobranca" HeaderText="emailCobranca" 
                                SortExpression="emailCobranca" Visible="False" />
                            <asp:BoundField DataField="enderecoCobranca" HeaderText="enderecoCobranca" 
                                SortExpression="enderecoCobranca" Visible="False" />
                            <asp:BoundField DataField="cepCobranca" HeaderText="cepCobranca" 
                                SortExpression="cepCobranca" Visible="False" />
                            <asp:BoundField DataField="bairroCobranca" HeaderText="bairroCobranca" 
                                SortExpression="bairroCobranca" Visible="False" />
                            <asp:BoundField DataField="cidadeCobranca" HeaderText="cidadeCobranca" 
                                SortExpression="cidadeCobranca" Visible="False" />
                            <asp:BoundField DataField="ufCobranca" HeaderText="ufCobranca" 
                                SortExpression="ufCobranca" Visible="False" />
                            <asp:BoundField DataField="paisCobranca" HeaderText="paisCobranca" 
                                SortExpression="paisCobranca" Visible="False" />
                            <asp:BoundField DataField="dddCobranca" HeaderText="DDD Cobrança:" 
                                SortExpression="dddCobranca">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="telefoneCobranca" HeaderText="Telefone Cobrança:" 
                                SortExpression="telefoneCobranca">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ddd" HeaderText="DDD:" SortExpression="ddd">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="telefone" HeaderText="Telefone:" 
                                SortExpression="telefone">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="data" HeaderText="Último acesso:" 
                                SortExpression="data" Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dataultimoacess" HeaderText="Cliente desde:" 
                                SortExpression="dataultimoacess">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="privacidade" HeaderText="privacidade" 
                                SortExpression="privacidade" Visible="False" />
                            <asp:BoundField DataField="contador" HeaderText="contador" 
                                SortExpression="contador" Visible="False" />
                            <asp:CheckBoxField DataField="aprovado" HeaderText="aprovado" 
                                SortExpression="aprovado" Visible="False" />
                            <asp:BoundField DataField="nroProcessoSeletivo" 
                                HeaderText="nroProcessoSeletivo" SortExpression="nroProcessoSeletivo" 
                                Visible="False" />
                            <asp:BoundField DataField="nroVagasPub" HeaderText="nroVagasPub" 
                                SortExpression="nroVagasPub" Visible="False" />
                            <asp:BoundField DataField="max_nroVagasPub" HeaderText="max_nroVagasPub" 
                                SortExpression="max_nroVagasPub" Visible="False" />
                            <asp:BoundField DataField="idParceiro" 
                                HeaderText="idParceiro" SortExpression="idParceiro" 
                                Visible="False" />
                            <asp:BoundField DataField="site" HeaderText="Site (URL):" SortExpression="site">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="portalJobclick" HeaderText="portalJobclick" 
                                SortExpression="portalJobclick" Visible="False" />
                            <asp:BoundField DataField="logoVaga" HeaderText="logoVaga" 
                                SortExpression="logoVaga" Visible="False" />
                            <asp:BoundField DataField="tempoexistencia" HeaderText="tempoexistencia" 
                                SortExpression="tempoexistencia" Visible="False" />
                            <asp:CheckBoxField DataField="flgAprovaPerfilAuto" 
                                HeaderText="flgAprovaPerfilAuto" SortExpression="flgAprovaPerfilAuto" 
                                Visible="False" />
                            <asp:BoundField DataField="idClient_SMS" HeaderText="idClient_SMS" 
                                SortExpression="idClient_SMS" Visible="False" />
                            <asp:BoundField DataField="idProject_SMS" HeaderText="idProject_SMS" 
                                SortExpression="idProject_SMS" Visible="False" />
                            <asp:BoundField DataField="codTransacao" 
                                HeaderText="Código da última transação:" SortExpression="codTransacao">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TipoPagamento" 
                                HeaderText="Último Pagamento do tipo:" SortExpression="TipoPagamento">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StatusTransacao" 
                                HeaderText="Status da última Transação" SortExpression="StatusTransacao">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="datapagamento" HeaderText="Data do último pagamento" 
                                SortExpression="datapagamento">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="liberaQtdCad" HeaderText="Créditos:" 
                                SortExpression="liberaQtdCad">
                            <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                    <table id="Nav" cellpadding="2" cellspacing="2" width="100%">
                        <tr>
                            <td align="right">
                                <asp:ImageButton ID="ImageButtonADES" runat="server" 
                                    ImageUrl="~/images/layoutNew/btAlteraDadosdaEmpresa.png" Visible="False" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:SqlDataSource ID="SqlDataCliente" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [cnpj], [emailRes], [nomeRes], [idParceiro], [site] FROM [tbCadastroEmpresa] WHERE ([idParceiro] = @idParceiro)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idParceiro" 
                                SessionField="idCadastroEmpresa" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataClienteRES" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_DADOS_DA_EMPRESA" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table> 
</asp:Content>

