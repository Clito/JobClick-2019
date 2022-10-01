<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_empresa_Default" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:Label ID="EmpresaFilhaLabel" runat="server" Text="0" 
        Visible="False"></asp:Label>
    <asp:Label ID="SetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
    <br />
        <div class="HOMEPAGE_EMPRESA" align="center">
                <table id="buttonNav" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td id="Nav" align="center">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:ImageButton ID="ImageButtonAviso0" runat="server" 
                                            ImageUrl="~/images/empresa/_bottonAviso.png" />
                                    </td>
                                    <td>
                            <asp:ImageButton ID="ImageButtonCliente" runat="server" 
                                ImageUrl="~/images/empresa/_homeEmpresa.png" 
                                            ToolTip="Atualize ou cadastre um novo cliente." />
                                    </td>
                                    <td valign="top">
                                        <asp:ImageButton ID="ImageButtonAviso1" runat="server" 
                                            ImageUrl="~/images/empresa/_bottonAviso.png" />
                                    </td>
                                    <td>
                            <asp:ImageButton ID="ImageButtonConsultor" runat="server" 
                                ImageUrl="~/images/empresa/_homeConsultor.png" 
                                            ToolTip="Atualize ou cadastre um novo consultor." />
                                    </td>
                                    <td valign="top">
                                        <asp:ImageButton ID="ImageButtonAviso2" runat="server" 
                                            ImageUrl="~/images/empresa/_bottonAviso.png" />
                                    </td>
                                    <td>
                            <asp:ImageButton ID="ImageButtonVG" runat="server" 
                                ImageUrl="~/images/empresa/_homeVaga.png" 
                                            ToolTip="Atualize ou cadastre uma nova vaga." />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
        </div>
                <br />
                <br />
    <br />
                <asp:Panel ID="PanelAvisoCredito" runat="server">
                    <table cellpadding="5" cellspacing="5" ID="Aviso" align="center">
                        <tr>
                            <td align="left" visible="False">
                                <table ID="Optar" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonVSP" runat="server" 
                                                ImageUrl="~/images/layoutNew/btEmpresaPRATA.png" 
                                                
                                                onclientclick="return confirm(&quot;Ao voltar a utilizar o modelo gratuito, você não terá mais acesso aos processos seletivos abertos pela sua empresa.\n\nPorém a qualquer momento você poderá voltar ao modelo e-Recruitment. Todos os seus dados estarão guardados.&quot;)" 
                                                ToolTip="Clique aqui se desejar a ser um usuário gratuito, você pode voltar a utilizar o e-Recruitment a qualquer momento, basta comprar créditos." />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonCCA" runat="server" 
                                                ImageUrl="~/images/layoutNew/btEmpresaOURO.png" 
                                                PostBackUrl="/_empresa/_credito.aspx?autoTit=Compra%20de%20Créditos" 
                                                ToolTip="Clique aqui se desejar comprar créditos." />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonRel" runat="server" 
                                                ImageUrl="~/images/empresa/_relatorio.png" 
                                                ToolTip="Clique aqui para visualizar os relatórios desponíveis." />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" visible="False" valign="top">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="ButtonCliente" runat="server" CssClass="tbAvisoPanel" 
                    Visible="False">
                    <table ID="AvisoClienteTb" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop" align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="AvisoCliente" runat="server" 
                                                
                                                Text="&lt;b&gt;Cadastro de seus clientes:&lt;/b&gt;&lt;br&gt;Existem duas maneiras de se trabalhar com o &lt;b&gt;JobClick&lt;/b&gt;, uma delas é utiliza-lo como uma ferramenta que irá administrar os levantamento(s) de perfil da vaga, vaga(s) e os processos seletivos para várias empresas cliente.&lt;br&gt;&lt;br&gt;Tornando-se uma ferramenta que irá auxiliar na cobrança das vagas preenchidas.&lt;br&gt;&lt;br&gt;Uma outra maneira é utilizar o &lt;b&gt;JobClick&lt;/b&gt; como ferramenta para administrar os levantamentos de perfil da vaga(s), vaga(s) e os processos seletivos apenas da sua empresa."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="ButtonConsultor" runat="server" CssClass="tbAvisoPanel" 
                    Visible="False">
                    <table ID="AvisoClienteTb0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem0" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="AvisoCliente0" runat="server" 
                                                Text="&lt;b&gt;Cadastro de consultores:&lt;/b&gt;&lt;br&gt;Informe quais serão os consultores responsáveis pelas vaga(s), levantamento(s) e a(s) vaga(s) publicadas, você pode cadastrar o quantos consultores desejar, poderá também criar grupos de trabalhos para suas filiais, exemplo: Consultores RJ.&lt;br&gt;&lt;br&gt;O <b>Jobclick</b> permite alterar a responsabilidade de uma vaga para um outro consultor."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="ButtonLevantamento" runat="server" CssClass="tbAvisoPanel" 
                    Visible="False">
                    <table ID="AvisoClienteTb1" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tbAvisoPanelTop">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelText">
                                <table ID="mensagem1" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="AvisoCliente1" runat="server" 
                                                
                                                Text="&lt;b&gt;Cadastro da(s) vaga(s):&lt;/b&gt;&lt;br&gt;O processo de cadastrar uma vaga se inicia preenchendo o &lt;i&gt;levantamento do perfil da vaga&lt;/i&gt; o qual após aprovação dará inicio a criação do anúncio da vaga para publicação.&lt;br&gt;&lt;br&gt;O &lt;b&gt;JobClick&lt;/b&gt; transfere automaticamente todas os dados informados no levantamento para o painel de anúncio de vagas onde o mesmo poderá ser editado. "></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tbAvisoPanelRP">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
       
    </asp:Content>

