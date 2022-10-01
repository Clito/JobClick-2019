<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="publicarVagaMass.aspx.vb" Inherits="_parceiroJobClick_publicarVagaMass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
            setTimeout(function () {
                $("#<%=PanelAviso.ClientID%>").dialog('close')
            }, 5000);
        });
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_parceiroJobClick/images/ok.jpg" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Publicação de vagas em massa."></asp:Label>

            <br />
            <br />

<br />
            <asp:Label ID="LabelAvisoCabec" runat="server" Text="Selecione o arquivo a ser enviado"></asp:Label>
            <br />
    <asp:FileUpload ID="XLS_BulkVaga" runat="server" CssClass="button" ToolTip="Clique aqui para selecionar o arquivo que será enviado" />    
    <asp:LinkButton ID="LinkButton_btEnviarArquivo" runat="server" class="button">Enviar o arquivo selecionado</asp:LinkButton>
    <asp:Label ID="lbl_ArquivoXLS" runat="server" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lbl_ResultUpload" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Panel ID="PanelVagas" runat="server" Visible="False">
        Você está trabalhando com o arquivo: &quot;<asp:Label ID="lbl_FileName" runat="server"></asp:Label>&quot;
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView_Vagas" runat="server" style="text-align: center" 
            AllowSorting="False" CssClass="mGrid" >
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:TemplateField HeaderText="Selecionar">
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBox_SelecionarTudo" runat="server" Text="Publicar" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox_Selecionar" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:LinkButton ID="LinkButton_InsertVaga" runat="server" CssClass="button">Salvar e Publicar Vagas</asp:LinkButton>
    </asp:Panel>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

