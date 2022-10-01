<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="quemsomos.aspx.vb" Inherits="comercial_quemsomos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        #menu .linkempresa
            {
                color: #fff !important;
            }        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Quem Somos</h1>
    <div id="ComercialMain">
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="É um prazer te conhecer." Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        <asp:Label ID="Label_RostoDetail" runat="server" Text="Procuramos valorizar pessoas, estreitar laços e desvendar talentos."></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink>
                    </div>
                    <div id="Imagem">
                        <asp:Image ID="Home" runat="server" ImageUrl="~/images/comercial_quemsomos.png" GenerateEmptyAlternateText="True" />
                    </div>
                </div>
                <div id="Corpo">
                    <asp:Label ID="Label_QuemSomos" runat="server" CssClass="titulo" Text="Quem Somos"></asp:Label> <br /><br />
                    <asp:Label ID="Label_QuemSomos2" runat="server" 
                        Text="Somos a evolução do trabalho de uma empresa especializada em Desenvolvimento de software de gestão de e-Recruitment.&lt;br&gt;O &lt;strong&gt;Jobclick&lt;/strong&gt; é mais que um sistema de e-Recruitment, é um conceito capaz de administrar por completo a área de recrutamento e seleção, material publicado em websites, intranets e informações corporativas, de forma simples e eficiente, suportando tanto um grande volume de dados, quanto um grande volume de acessos simultâneos.&lt;br&gt;Permitir a nossos clientes, atingir o potencial máximo do seu negócio e dos seus colaboradores, sempre empenhados na excelência, queremos tornarmo-nos um parceiro de longo prazo e em disponibilizar todas as ferramentas necessárias para aperfeiçoar o valor das empresas nossas clientes.&lt;br&gt;&lt;br&gt;Quer saber mais?&lt;br&gt;&lt;a href=&quot;/comercial/contato.aspx&quot;&gt;Entre em contato conosco&lt;/a&gt; para mais informações."></asp:Label>
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

