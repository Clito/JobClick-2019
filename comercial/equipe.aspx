<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="equipe.aspx.vb" Inherits="comercial_equipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #menu .linkempresa
            {
                color: #fff !important;
            }        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Equipe</h1>
    <div id="ComercialMain">
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="União" Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        <asp:Label ID="Label_RostoDetail" runat="server" Text="Por trás de um grande sucesso existe sempre uma grande equipe."></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink>
                    </div>
                    <div id="Imagem">
                        <asp:Image ID="Home" runat="server" ImageUrl="~/images/comercial_equipe.png" GenerateEmptyAlternateText="True" />
                    </div>
                </div>
                <div id="Corpo">
                    <asp:Label ID="Label_Equipe" runat="server" CssClass="titulo" Text="Equipe"></asp:Label> <br /><br />
                    <asp:Label ID="Label_Equipe2" runat="server" Text="Nossa equipe é composta por jovens entusiastas por tecnologia e experientes analistas de banco de dados.&lt;br&gt;Esta combinação gerou um sistema ao mesmo tempo arrojado e sólido, capaz de suportar milhões de pageviews/mês de nossos clientes e a diversidade de programas adicionais de nossos parceiros de negócios."></asp:Label>
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

