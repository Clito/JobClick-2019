<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="tabela.aspx.vb" Inherits="_parceiroJobClick_tabela" %>

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
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Conheça nossos planos"></asp:Label>
            <br />
            <br />
            <asp:Panel ID="PanelPLANOS" runat="server" HorizontalAlign="Center">
                <table id="PLANO">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButtonP1" runat="server" CssClass="imagePlano" Enabled="False" ImageUrl="~/_parceiroJobClick/images/Plano1.png" ToolTip="No plano gratuito você e sua empresa publica quantas vagas quiser, as candidaturas vindas pelo site Jobclick serão registradas e você recebe os CVs por e-mail, faz publicação em lote para grande quantidade de vagas. E ainda conta com nosso serviço exclusivo de divulgação de vagas em área de destaque, faz pesquisa de candidatos em nossa base geral e acompanha tudo isso pelo nosso painel Analytics Jobclick." />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonP2" runat="server" CssClass="imagePlano" ImageUrl="~/_parceiroJobClick/images/Plano2.png" ToolTip="Neste plano você terá todas as características da versão gratuita e ainda muito mais, sua empresa terá o seu próprio Painel de vagas, podendo ser publicado em quantos sites desejar. A instalação é muito fácil e a gestão do layout é intuitiva, suas vagas passará a apresentar a logamarca da sua empresa. " />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonP3" runat="server" CssClass="imagePlano" ImageUrl="~/_parceiroJobClick/images/Plano3.png" ToolTip="Neste plano você terá todas as características do plano &quot;Painel de vagas&quot; e ainda muito mais, sua empresa terá o seu próprio &quot;Trabalhe conosco&quot; e seu &quot;Painel de vagas&quot;, todas os cadastros de novos candidatos e candidaturas estarão vinculadas em sua base de talentos exclusiva. A instalação é muito fácil e a gestão do layout é intuitiva, suas vagas passará a apresentar a logamarca da sua empresa. " />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonP4" runat="server" CssClass="imagePlano" ImageUrl="~/_parceiroJobClick/images/Plano4.png" PostBackUrl="~/_parceiroJobClick/ajuda.aspx" ToolTip="Gestão completa para consultorias e empresas. Citamos apenas algumas das principais características deste plano: Sistema multiusuários com atribuição de processo seletivos transferíveis, base de talentos exclusiva, gestão dos processos seletivos por fases, sistema de aderência candidato vaga parametrizado, filtros para pesquisa na base de talentos, entrevista virtual, laudo técnico automático no final do processo seletivo e muito mais..." />
                        </td>
                    </tr>
                    <tr>
                        <td class="imagePlano">
                            <asp:Label ID="LabelP1" runat="server" Text="&lt;b&gt;Você está aqui!&lt;/b&gt;&lt;br&gt;No plano gratuito você e sua empresa publica quantas vagas quiser, as candidaturas vindas pelo site Jobclick serão registradas e você recebe os CVs por e-mail, faz publicação em lote para grande quantidade de vagas. E ainda conta com nosso serviço exclusivo de divulgação de vagas em área de destaque, faz pesquisa de candidatos em nossa base geral e acompanha tudo isso pelo nosso painel Analytics Jobclick."></asp:Label>
                        </td>
                        <td class="imagePlano">
                            <asp:Label ID="LabelP2" runat="server">Neste plano você terá todas as características da versão gratuita e ainda muito mais, sua empresa terá o seu próprio &quot;Painel de vagas&quot;, podendo ser publicado em quantos sites desejar. A instalação é muito fácil e a gestão do layout é intuitiva, suas vagas passará a apresentar a logamarca da sua empresa. </asp:Label>
                        </td>
                        <td class="imagePlano">
                            <asp:Label ID="LabelP3" runat="server">Neste plano você terá todas as características do plano &quot;Painel de vagas&quot; e ainda muito mais, sua empresa terá o seu próprio &quot;Trabalhe conosco&quot; e seu &quot;Painel de vagas&quot;, todas os cadastros de novos candidatos e candidaturas estarão vinculadas em sua base de talentos exclusiva. A instalação é muito fácil e a gestão do layout é intuitiva, suas vagas passará a apresentar a logamarca da sua empresa. </asp:Label>
                        </td>
                        <td class="imagePlano">
                            <asp:Label ID="LabelP4" runat="server">Gestão completa para consultorias e empresas. Citamos apenas algumas das principais características deste plano: Sistema multiusuários com atribuição de processo seletivos transferíveis, base de talentos exclusiva, gestão dos processos seletivos por fases, sistema de aderência candidato vaga parametrizado, filtros para pesquisa na base de talentos, entrevista virtual, laudo técnico automático no final do processo seletivo e muito mais...</asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>

