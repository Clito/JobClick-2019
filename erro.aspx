<%@ Page Language="VB" MasterPageFile="~/erroPage.master" AutoEventWireup="false" CodeFile="erro.aspx.vb" Inherits="erro" title="Untitled Page" %>
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
                            Estamos passando por uma instabilidade tempor�ria, mas j� estamos trabalhando 
                            para resolv�-la.
                            <br />
                            <br />
                            O fato de voc� estar vendo essa mensagem significa que automaticamente fomos 
                            notificados do problema e estamos trabalhando para resolv�-lo.
                            <br />
                            <br />
                            Inclusive, � prov�vel que tudo j� esteja normalizado.
                            <br />
                            <br />
                            Tente uma das seguintes a��es:
                            <br />
                            <br />
                            - Clique no bot�o Atualizar do seu navegador ou
                            <br />
                            - Autentique-se novamente no sistema.
                            <br />
                            <br />
                            Se o problema persistir, por favor aguarde mais um momento para tentar 
                            novamente. Tenha certeza que estamos empenhados em resolver esta situa��o.
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

