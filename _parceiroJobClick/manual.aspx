<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="manual.aspx.vb" Inherits="_parceiroJobClick_manual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Informações importantes para iniciar os trabalhos."></asp:Label>

            <br />
            <br />
            <asp:Label ID="LabelAJUDA" runat="server" Text="Segue abaixo, informações sobre o Jobclick e como iniciar os seus trabalhos de publicação de oportunidades (vagas), divulgação, pesquisa na base geral e contato com os candidatos."></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelPrimeiroPasso" runat="server" CssClass="titulo" Text="Primeiro passo (Iniciando o sistema)"></asp:Label>
            <br />
            <asp:Label ID="txtPrimerioPassoLabel" runat="server" Text="Se você está iniciando com o sistema Jobclick, é importante seguir as orientações abaixo:&lt;br&gt;&lt;br&gt;[Seu Cadastro] - É importante manter os dados da empresa sempre atualizado. Para utilizar alguns dos serviços prestados pela Jobclick será necessário a compra de créditos.&lt;br&gt;&lt;br&gt;O que pode ser feito em sua área de trabalho?&lt;br&gt;&lt;br&gt;1. Publicação de oportunidades (vagas) no painel de vagas da Jobclick;&lt;br&gt;2. Analisar as candidaturas feitas no painel da vagas da Jobclick;&lt;br&gt;3. Visualização de Gráficos e Relatórios de Candidatutas;&lt;br&gt;4. Visualização de Gráficos e Relatórios de Oportunidades (vagas);&lt;br&gt;5. Publicação de suas vagas com a logo da sua empresa;&lt;br&gt;6. Pesquisa na base geral de talentos do Jobclick;&lt;br&gt;7. Entrar em contato com os candidatos através de celular, e-mail ou correspondência; (pré-pago) &lt;br&gt;8. Utilizar o sistema de divulgação de vagas &quot;Vagas Patrocinadas&quot;;&lt;br&gt;9. Publicar grande quantidade de vagas de uma só vez, através de arquivo Excel. (pré-pago)&lt;br&gt;&lt;br&gt;"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" CssClass="titulo" Text="Vídeos"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLinkVideo1" runat="server" NavigateUrl="http://www.youtube.com/watch?v=2CD0xPWt8q8" Target="_new" ToolTip="Vídeo tutorial como publicar sua primeira vaga.">Iniciando com o Jobclick - (http://www.youtube.com/watch?v=2CD0xPWt8q8)</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLinkVideo2" runat="server" NavigateUrl="http://www.youtube.com/watch?v=tN2rMNY2xdk" Target="_new" ToolTip="Como enviar sua logo para publicação junto com suas vagas.">Envio de sua logo - (http://www.youtube.com/watch?v=tN2rMNY2xdk)</asp:HyperLink>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LinkButtonAjuda" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/ajuda.aspx" ToolTip="Você ainda tem dúvidas? Clique aqui e envie para nossos consultores, teremos prazer em ajudar.">Ainda estou com dúvidas!</asp:LinkButton>

        </div>
    </div>
</asp:Content>

