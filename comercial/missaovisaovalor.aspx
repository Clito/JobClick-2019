<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="missaovisaovalor.aspx.vb" Inherits="comercial_missaovisaovalor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #menu .linkempresa
            {
                color: #fff !important;
            }        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Missão, Visão e Valores</h1>
<div id="ComercialMain">
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="A nossa razão de existir" Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        <asp:Label ID="Label_RostoDetail" runat="server" Text='"Transporte um punhado de terra todos os dias e construirá uma montanha." - Confucio'></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink>
                    </div>
                    <div id="Imagem">
                        <asp:Image ID="Home" runat="server" ImageUrl="~/images/comercial_missaovisaovalor.png" GenerateEmptyAlternateText="True" />
                    </div>
                </div>
                <div id="CorpoMissao">
                    <div class="ColunaMissao">
                        <div>
                            <asp:Label ID="Label_Missao" runat="server" CssClass="titulo" Text="Missão"></asp:Label> <br /><br />
                            <asp:Label ID="Label_Missao2" runat="server" Text="Temos por Missão, contribuir para o desenvolvimento sustentado dos nossos clientes, oferecendo soluções de tecnologia de alto desempenho e suporte, sempre seguindo elevados padrões e qualidade&quot;."></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label_Visao" runat="server" CssClass="titulo" Text="Visão"></asp:Label> <br /><br />
                            <asp:Label ID="Label_Visao2" runat="server" Text="Ser reconhecida como a melhor empresa de fornecimento de software de e-recruitment e gerenciamento de conteúdo para o ambiente WEB, no segmento de recursos humanos diferenciada por desenvolver soluções criativas para recrutamento e seleção."></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label_Valor" runat="server" CssClass="titulo" Text="Valores"></asp:Label> <br /><br />
                            <asp:Label ID="Label_Valor2" runat="server" Text="• Criatividade&lt;br&gt;• Visão/Percepção de negócios&lt;br&gt;• Proatividade&lt;br&gt;• Agilidade&lt;br&gt;• Ética&lt;br&gt;• Espírito de Equipe&lt;br&gt;• Comprometimento&lt;br&gt;• Foco do Cliente"></asp:Label>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </div>
<div id="Footer">
            <div id="LinksRelacionados">
                <div id="Titulo">
                    <asp:Label ID="Label_LinksRelacionados" runat="server" 
                        Text="Links Relacionados" Font-Bold="False" CssClass="TituloBGText"></asp:Label> 
                    <br />
                    <br />
                    <div style="width: 100%">
                        <asp:HyperLink ID="HyperLink_GED" runat="server" 
                            NavigateUrl="~/comercial/ged.aspx" Text="GED da JobClick" 
                            CssClass="LinkComercial"></asp:HyperLink>
                        &nbsp;|
                        <asp:HyperLink ID="HyperLink_QuemSomos" runat="server" 
                            NavigateUrl="~/comercial/quemsomos.aspx" Text="Quem Somos" 
                            CssClass="LinkComercial"></asp:HyperLink>
                        &nbsp;|
                        <asp:HyperLink ID="HyperLink_MissaoVisaoValor" runat="server" 
                            NavigateUrl="~/comercial/missaovisaovalor.aspx" Text="Missão, Visão e Valores" 
                            CssClass="LinkComercial"></asp:HyperLink>
                        &nbsp;|
                        <asp:HyperLink ID="HyperLink_Equipe" runat="server" 
                            NavigateUrl="~/comercial/equipe.aspx" Text="Equipe" CssClass="LinkComercial"></asp:HyperLink>
                        &nbsp;|
                        <asp:HyperLink ID="HyperLink_Tecnologia" runat="server" 
                            NavigateUrl="~/comercial/tecnologia.aspx" Text="Tecnologia e Confiabilidade" 
                            CssClass="LinkComercial"></asp:HyperLink>&nbsp;|
                        <asp:HyperLink ID="HyperLink_Contato" runat="server" 
                            NavigateUrl="~/comercial/contato.aspx" Text="Contato" CssClass="LinkComercial"></asp:HyperLink>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

