<%@ Page Title="" Language="VB" MasterPageFile="~/erroPage.master" AutoEventWireup="false" CodeFile="errojs.aspx.vb" Inherits="errojs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" width="600px">
        <tr>
            <td valign="top">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.gif" />
            </td>
            <td align="left">
                <b>
                <br />
                <br />
                <br />
                <asp:Label ID="AvisoLabel" runat="server" CssClass="titulo" 
                    Text="Aviso sobre seu navegador"></asp:Label>
                <br />
                <br />
                JavaScript não habilitado</b><br />
                <br />
                Identificamos 
                que seu navegador está com o JavaScript desabilitado.
                <br />
                <br />
                Siga as instruções abaixo de acordo com seu navegador.
                <br />
                <br />
                <b>Internet Explorer</b>
                <br />
                Vá no menu Ferramentas -&gt; Opções de Internet
                <br />
                Clique na aba Segurança Selecione a zona Internet Clique no botão Nível 
                Personalizado
                <br />
                Procure Script ativo logo abaixo de Script
                <br />
                Marque a opção Ativo Clique em Sim quando aparecer o aviso
                <br />
                Clique em OK para fechar a janela
                <br />
                <br />
                <b>Mozilla Firefox</b>
                <br />
                Vá no menu Editar -&gt; Preferências
                <br />
                Clique na aba Conteúdo Marque a opção Habilitar JavaScript
                <br />
                Clique em Fechar para fechar a janela
                <br />
                <br />
                <b>Opera</b>
                <br />
                Vá no menu Ferramentas -&gt; Preferências
                <br />
                Clique na aba Avançado
                <br />
                Clique no menu Conteúdo
                <br />
                Marque a opção Habilitar JavaScript
                <br />
                Clique em OK para fechar a janela
                <br />
                <br />
                <br />
                Obrigado, Equipe <b>JobClick<br />
                <br />
                <br />
                <br />
                </b><br />
                <span style="color: #000030">&nbsp;</span></td>
        </tr>
    </table>
</asp:Content>

