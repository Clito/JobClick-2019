<%@ Page Language="VB" MasterPageFile="~/erroPage.master" AutoEventWireup="false" CodeFile="errobrowser.aspx.vb" Inherits="errobrowser" title="Browser Desatualizado"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table border="0" cellpadding="0" cellspacing="0" height="300" width="100%">
        <tr>
            <td align="center">
                <table id="ErrorTable" cellpadding="5" cellspacing="5" width="100%">
                    <tr>
                        <td>
                <asp:Image ID="ErroImage" runat="server" ImageUrl="~/images/logo.gif" />
                        </td>
                        <td align="left">
                            <br />
                            <b>Ops...</b><br />
                            <br />
                            Seu navegador está desatualizado:<br />
                            <br />
                            O Jobclick utiliza tecnologias não suportadas por navegadores antigos, por favor atualize-o ou utilize um dos gratuitos abaixo listados:
                            <br />
                            <br />
                            <b>Usuários do Internet Explorer 9:</b> Devido às falhas de segurança do Internet Explorer 9 o sistema Jobclick não dará mais suporte à este navegador,
                            pedimos aos nossos usuários que utilizem um dos navegadores gratuitos abaixo.
                            <br />
                            <br />
                            <br />
                            <a href="http://www.google.com.br/chrome?hl=pt-BR" target="_blank"><img src="/images/layoutnew/chrome.png" alt="Chrome Logo" border="0"/></a><br />
                            Google Chrome <br />
                            <a href="http://www.google.com.br/chrome?hl=pt-BR" target="_blank">http://www.google.com.br/chrome?hl=pt-BR</a><br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <a href="http://br.mozdev.org/firefox/download/" target="_blank"><img src="/images/layoutnew/firefox.png" alt="Firefox Logo" border="0"/></a><br />
                            Mozzila Firefox <br />
                            <a href="http://br.mozdev.org/firefox/download/" target="_blank">http://br.mozdev.org/firefox/download/</a><br />
                            <br />
                            <br />
                            <br />
                            Obrigado, <b>
                            <br />
                            Equipe JobClick</b>
							<br /> helpdesk@jobclick.com.br
							</td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
    
</asp:Content>

