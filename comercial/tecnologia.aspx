<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="tecnologia.aspx.vb" Inherits="comercial_tecnologia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #menu .linkempresa
            {
                color: #fff !important;
            }        
    </style>
    <script type="text/javascript" src="../scripts/slides.min.jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Imagem").slides({
                play: 5000,
                effect: 'fade',
                fadeSpeed: 800,
                generateNextPrev: false,
                pagination: false,
                generatePagination: false,
                crossfade: true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Tecnologias e Confiabilidade</h1>
    <div id="ComercialMain"> 
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="Tecnologia" Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        <asp:Label ID="Label_RostoDetail" runat="server" Text="Programadores são ferramentas para converter cafeína em código."></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink>
                    </div>
                    <div id="Imagem">
                        <div class="slides_container">
                            <div>
                                <asp:Image ID="Home" runat="server" ImageUrl="~/images/comercial_tecnologia001.png" GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/comercial_tecnologia002.png" GenerateEmptyAlternateText="True"  />
                            </div>
                            <div>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/comercial_tecnologia003.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/comercial_tecnologia004.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/comercial_tecnologia005.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/images/comercial_tecnologia006.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/images/comercial_tecnologia007.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image7" runat="server" ImageUrl="~/images/comercial_tecnologia008.png"  GenerateEmptyAlternateText="True" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="Corpo">
                    <asp:Label ID="Label_Tecnologia" runat="server" CssClass="titulo" Text="Tecnologias e Confiabilidade"></asp:Label> <br /><br />
                    Tecnologia para nós é um assunto à parte. Nossa solução é totalmente desenvolvida com o que existe de mais avançado em termos de WEB. <br />
                    Utilizamos as tecnologias de ponta que resulta em um sistema que não exige do usuário a necessidade de conhecimento, normalmente exigida por produtos similares. <br />
                    A performance é garantida pelo uso de softwares fornecidos pela MICROSOFT, empresa da qual a <strong>Jobclick</strong> faz parte do programa de Parcerias Estratégicas.
                    <br />
                    Podemos dizer que nossa estrutura acompanha o nosso crescimento, por este motivo nossos preços são competitivos. 
                    <div style="float: right">
                        <asp:Image ID="ImageMS" runat="server" 
                            ImageUrl="~/images/partnerMicrosoft.png"  GenerateEmptyAlternateText="True" />
                    </div>
                    <br />
                    <br />
                    O Jobclick tem as seguintes características técnicas:<br />
                    • Microsoft .Net Framework 4.5;<br />
                    • Plataforma em ASP.NET;<br />
                    • JQuery;<br />
                    • Banco de dados MS SQL 2008 Microsoft(TM);<br />
                    • Plataforma SMS própria;<br />
                    • Sistema Chat próprio;<br />
                    • HelpDesk - Customer Care próprio.<br />
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

