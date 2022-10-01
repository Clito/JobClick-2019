<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="contratoOnline.aspx.vb" Inherits="_parceiroJobClick_contratoOnline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Contrato online para alteração de plano - "></asp:Label>

            <br />
            <br />
            <asp:Label ID="ContratoLabel" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LinkButtonACEITE" runat="server" CssClass="button" OnClientClick="return confirm(&quot;Ao confirmar esta ação você estará contratando este serviço, você esta de acordo com as cláusulas deste contrato?&quot;)" ValidationGroup="ACEITE">Aceite deste contrato</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonNO" runat="server" CausesValidation="False" CssClass="button" PostBackUrl="~/_parceiroJobClick/Default.aspx">Não aceito</asp:LinkButton>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonListACEITE" runat="server" ValidationGroup="ACEITE">
                <asp:ListItem Value="1">Li e aceito os termos e condições do contrato acima citado.</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonListACEITE" Display="Dynamic" ErrorMessage="Para contratar este seviço é necessário você ler e aceitar os termos e condições deste contrato." ValidationGroup="ACEITE"> </asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummaryCONTRATO" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="ACEITE" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </div>
</asp:Content>

