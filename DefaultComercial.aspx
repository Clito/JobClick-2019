<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="DefaultComercial.aspx.vb" Inherits="comercial_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #menu .linkempresa
            {
                color: #fff !important;
            }        
    </style> 
    <script type="text/javascript">
        if ((typeof parent.jobclick_config) != "undefined") {
            window.location = "_anonimo/vagas.aspx";
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="display:none">Comercial</h1>
    <div id="ComercialMain">
        <div id="Main">
            <div id="Header">
                <div id="Rosto">
                    <div id="Texto">
                        <asp:Label ID="Label_Rosto" runat="server" Text="Soluções de E-Recruitment" Font-Bold="True" Font-Size="X-Large"></asp:Label><br />
                        <br />
                        <br />
                        O foco da <strong>JobClick</strong> é desenvolver soluções tecnológicas WEB que garantam alta produtividade na atividade de Recrutamento & Seleção 
                        de sua empresa. <br />
                        &nbsp;<br />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink_solucao" runat="server" CssClass="button" NavigateUrl="~/comercial/contato.aspx">Conheça mais sobre nossa solução</asp:HyperLink>
                    </div>
                    <div id="Imagem">
                        <asp:Image ID="Home" runat="server" ImageUrl="~/images/comercial_Default.png" GenerateEmptyAlternateText="True" />
                    </div>
                </div>
                <div id="Corpo">
                    <asp:Label ID="LabelAviso" runat="server"
                        
                        Text="O &lt;b&gt;e-Recruitment JobClick&lt;/b&gt; foi produzido para acelerar e otimizar o processo seletivo, melhorar ainda mais a comunicação entre as empresas, consultorias, gestores e os candidatos. Forme a “sua” própria base exclusiva de talentos e ainda tenha a liberdade de pesquisar na base geral de talentos do &lt;b&gt;JobClick&lt;/b&gt;."></asp:Label>
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



