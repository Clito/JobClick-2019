<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="cliente.aspx.vb" Inherits="comercial_cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Clientes</h1>
    <div id="ComercialMain">
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="Alguns de nossos Clientes" Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        <asp:Label ID="Label_RostoDetail" runat="server" Text="É sempre uma grande satisfação tê-los ao nosso lado."></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink>
                    </div>
                    <div id="Imagem">
                       <div id="carrossel">
                            <ul>
			                    <li><span><a href="http://www.fenixeditora.com.br/" target="_blank"><asp:Image ID="cliente1" runat="server" ImageAlign="NotSet"  ImageUrl="~/images/logo/fenixeditora.png" /></a></span></li>
			                    <li><span><a href="http://www.calzoon.com.br/" target="_blank"><asp:Image ID="Image1" runat="server" ImageAlign="NotSet"  ImageUrl="~/images/logo/calzoon.png" /></a></span></li>
			                    <li><span><a href="http://sinteserh.com.br/" target="_blank"><asp:Image ID="Image2" runat="server" ImageAlign="NotSet"  ImageUrl="~/images/logo/sintese.png" /></a></span></li>
			                    <li><span><a href="http://www.enetronic.com.br/" target="_blank"><asp:Image ID="Image3" runat="server" ImageAlign="NotSet"  ImageUrl="~/images/logo/enetronic.png" /></a></span></li>
			                    <li><span><a href="http://www.wiabiliza.com.br/" target="_blank"><asp:Image ID="Image4" runat="server" ImageAlign="NotSet"  ImageUrl="~/images/logo/wiabiliza.png" /></a></span></li>
		                    </ul>
	                    </div> 	
		                    <script src="../js/jquery.roundabout2.js"></script>
		                    <script>
		                        $(document).ready(function () {
		                            $('#carrossel ul').roundabout({
		                                  autoplay: true
                                        , autoplayDuration: 2000
                                        , autoplayPauseOnHover: true
		                            });
		                        });
		                    </script>
                    </div>
                </div>
                <div id="Corpo">
                    <asp:Label ID="Label_Equipe" runat="server" CssClass="titulo" Text="Clientes"></asp:Label> <br /><br />
                    <asp:Label ID="Label_Equipe2" runat="server" Text="A qualidade é a nossa melhor garantia da fidelidade do cliente, a nossa mais forte defesa contra a competição e o único caminho para o crescimento."></asp:Label>
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
                        <asp:HyperLink ID="HyperLink_TermoseCondicoes0" runat="server" 
                            NavigateUrl="~/comercial/termosecondicoes.aspx" Text="Termos e Condições Gerais" 
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

