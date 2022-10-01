<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_credito.aspx.vb" Inherits="_empresaJC_credito" %>

<%@ Register assembly="UOL.PagSeguro" namespace="UOL.PagSeguro" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <table id="dsCredito" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top">
                                <asp:Image ID="ImageCredito" runat="server" ImageUrl="~/images/layout/dsCreditoIcone.gif" />
                            </td>
                            <td>
                                <asp:Label ID="LabeldsCredito" runat="server" 
                                    Text="Você paga o que usa, mais economia para sua empresa!"></asp:Label>
                                <br />
                                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <cc1:VendaPagSeguro ID="VendaPagSeguroCredito" runat="server" 
                                    UrlPagSeguro="http://localhost:9090/security/webpagamentos/webpagto.aspx">
                                </cc1:VendaPagSeguro>
                                <table id="CreditoTB" cellpadding="1" cellspacing="1" width="100%">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonCred5" runat="server" 
                                                ImageUrl="~/images/shopping/vaucherJOBCLICK5.png" 
                                                onclientclick="return confirm(&quot;Você será redirecionado para o PagSeguro uma empresa UOL.\nO PagSeguro aceita os seguintes meios de pagamento:\n\nCartões de crédito - parcelamento em até 18 vezes;\nDébito bancário;\nBoleto bancário;\nCarteira eletrônica (saldo disponível na conta PagSeguro).\n&quot;)" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                                ImageUrl="~/images/shopping/vaucherJOBCLICK3.png" 
                                                onclientclick="return confirm(&quot;Você será redirecionado para o PagSeguro uma empresa UOL.\nO PagSeguro aceita os seguintes meios de pagamento:\n\nCartões de crédito - parcelamento em até 18 vezes;\nDébito bancário;\nBoleto bancário;\nCarteira eletrônica (saldo disponível na conta PagSeguro).\n&quot;)" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                                ImageUrl="~/images/shopping/vaucherJOBCLICK1.png" 
                                                onclientclick="return confirm(&quot;Você será redirecionado para o PagSeguro uma empresa UOL.\nO PagSeguro aceita os seguintes meios de pagamento:\n\nCartões de crédito - parcelamento em até 18 vezes;\nDébito bancário;\nBoleto bancário;\nCarteira eletrônica (saldo disponível na conta PagSeguro).\n&quot;)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelCre0" runat="server" 
                                                Text="Pacote para 5 Processos Seletivos completos sem data de vencimento, inclui 500 SMS para comunicação com os candidatos."></asp:Label>
                                            <br />
                                            <br />
                                            <table id="PrecoC0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="Labelde0" runat="server" Font-Overline="False" 
                                                            Font-Strikeout="True" Text="de: R$ 300,00"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="LabelPR0" runat="server" CssClass="tituloEmpresa" 
                                                            Text="por: R$ 160,00"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:ImageButton ID="ImageButtonCredito350" runat="server" 
                                                ImageUrl="~/images/shopping/PagSeguro.png" 
                                                onclientclick="return confirm(&quot;Você será redirecionado para o PagSeguro uma empresa UOL.\nO PagSeguro aceita os seguintes meios de pagamento:\n\nCartões de crédito - parcelamento em até 18 vezes;\nDébito bancário;\nBoleto bancário;\nCarteira eletrônica (saldo disponível na conta PagSeguro).\n&quot;)" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelCre1" runat="server" 
                                                Text="Pacote para 3 Processos Seletivos completos sem data de vencimento, inclui 250 SMS para comunicação com os candidatos."></asp:Label>
                                            <br />
                                            <br />
                                            <table id="PrecoC1" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="Labelde1" runat="server" Font-Overline="False" 
                                                            Font-Strikeout="True" Text="de: R$ 180,00"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="LabelPR1" runat="server" CssClass="tituloEmpresa" 
                                                            Text="por: R$85,00"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:ImageButton ID="ImageButtonCredito180" runat="server" 
                                                ImageUrl="~/images/shopping/PagSeguro.png" 
                                                onclientclick="return confirm(&quot;Você será redirecionado para o PagSeguro uma empresa UOL.\nO PagSeguro aceita os seguintes meios de pagamento:\n\nCartões de crédito - parcelamento em até 18 vezes;\nDébito bancário;\nBoleto bancário;\nCarteira eletrônica (saldo disponível na conta PagSeguro).\n&quot;)" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelCre2" runat="server" 
                                                
                                                Text="Pacote para 1 Processo Seletivo completo sem data de vencimento, inclui 200 SMS para comunicação com os candidatos."></asp:Label>
                                            <br />
                                            <br />
                                            <table id="PrecoC2" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="Labelde2" runat="server" Font-Overline="False" 
                                                            Font-Strikeout="True" Text="de: R$ 60,00"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="LabelPR2" runat="server" CssClass="tituloEmpresa" 
                                                            Text="por: R$ 30,00"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:ImageButton ID="ImageButtonCredito55" runat="server" 
                                                ImageUrl="~/images/shopping/PagSeguro.png" 
                                                onclientclick="return confirm(&quot;Você será redirecionado para o PagSeguro uma empresa UOL.\nO PagSeguro aceita os seguintes meios de pagamento:\n\nCartões de crédito - parcelamento em até 18 vezes;\nDébito bancário;\nBoleto bancário;\nCarteira eletrônica (saldo disponível na conta PagSeguro).\n&quot;)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>

