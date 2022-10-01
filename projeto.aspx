<%@ Page Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="projeto.aspx.vb" Inherits="projeto" title="Projetos e Aplicações especiais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Projetos e Aplicações especiais" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table align="center" id="Aviso" width="740">
        <tr>
            <td width="40" valign="top">&nbsp;<asp:Image ID="lateral" runat="server" ImageUrl="~/images/space.gif" Height="47px" Width="35px" /></td>
            <td align="left" width="700" valign="top">
                <b><span style="text-decoration: underline">
                <br />
                JobClick (Teste Online) - 100% configurável. (Opcional)<br />
                </span> 
                </b>O Teste Online é uma ferramenta para ser aplicada junto ao processo 
                seletivo.
                <br />
                O gestor da vaga convoca os candidatos pré-aprovados utilizando os filtros do 
                processo seletivo.
                <br />
                O sistema enviará automaticamente os e-mail para todos candidatos selecionados.
                <br />
                A confirmação da participação do teste online é feita no próprio e-mail.<br />
                <br />
                <b>Configurações:</b><br />
                • Nota de corte 50 à 90 pontos.<br />
                • Quantidade de questões (multipla escolha) que a empresa poderá formular: 10, 
                20, 50 e 100 questões.<br />
                • Tempo do teste Online (10, 20, 50 e 90 minutos).<br />
                • O candidato poderá fazer o teste Online apenas 1 vez.<br />
                • O Gestor em casos de pane - comprovada - poderá liberar um novo teste.<br />
                <span style="text-decoration: underline">
                <b>
                <br />
                JobClick (MAP)</b></span><b> - Mapeamento de Aptidão Profissional. (Opcional)<br />
                </b>Aplicação MAP para auxílio na triagem aplicadas em seus processos seletivos.</td> 
         </tr> 
     </table>            
</asp:Content>

