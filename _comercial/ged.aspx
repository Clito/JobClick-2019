<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="ged.aspx.vb" Inherits="comercial_ged" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" Runat="Server">
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
    <h1 style="display:none">GED</h1>
    <div id="ComercialMain">
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="GED da JobClick" Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        <asp:Label ID="Label_RostoDetail" runat="server" Text="<b>O que é GED?</b><br>O conceito de GED é uma espécie de leque em constante abertura.<br>Isso devido às muitas tecnologias a ele relacionadas que dele fazem parte.<br>A evolução do GED confirma sua importância. No princípio, a tecnologia de GED enfatizava basicamente a digitalização de um documento gerado em papel através de um escaner. Assim, ele poderia ser visualizado na tela do computador, inclusive em rede.<br><br>Os sistemas de <b>Gerenciamento Eletrônico de Documentos</b> não são simplesmente sistemas de gerenciamento de arquivos. O GED é mais, pois ele implementa categorização de documentos, tabelas de temporalidade, ações de disposição e controla níveis de segurança.<br>É vital para a manutenção das bases de informação e conhecimento das empresas."></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />                        
                    </div>
                    <div id="Imagem">
                        <div class="slides_container">
                            <div>
                                <asp:Image ID="Home" runat="server" ImageUrl="~/images/comercial_ged001.png" GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/comercial_ged002.png" GenerateEmptyAlternateText="True"  />
                            </div>
                            <div>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/comercial_ged003.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/comercial_ged004.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/comercial_ged005.png"  GenerateEmptyAlternateText="True" />
                            </div>
                            <div>
                                <asp:Image ID="Image7" runat="server" ImageUrl="~/images/comercial_ged006.png"  GenerateEmptyAlternateText="True" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="Corpo">
                    <asp:Label ID="Label_Equipe" runat="server" CssClass="titulo" Text="Vantagens GED/ECM da Jobclick"></asp:Label> <br /><br />
                    <asp:Label ID="Label_Equipe2" runat="server" Text="A Gestão Eletrônica de Documentos (GED) constitui um processo tecnológico de digitalizar, armazenar, localizar e recuperar as informações existentes em papel ou meio eletrônico.<br><br><br><b>10 Benefícios dos projetos de GED na sua instituição:</b><br><br>01. Precisão na localização dos documentos;<br>02. Automação dos processos;<br>03. Redução em média de 35% de custos com papel, caixa box, office-boy, transporte, sedex, correios e cópias;<br>04. Redução com espaço físico (aluguel de salas, galpões; luz, IPTU, condomínio, entre outos);<br>05. Disponibilização de documentos em rede;<br>06. Facilitar a busca com precisão dos colaboradores da instituição;<br>07. Evita o extravio ou falsificação de documentos;<br>08. Dinamismo em transações entre as instituições;<br>09. Preservação do documento original;<br>10. Minimiza recursos humanos e aumenta a produtividade."></asp:Label>
                    <br /><br /><br />
                    <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink><br /><br />
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

