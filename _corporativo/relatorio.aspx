<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="true" CodeFile="relatorio.aspx.vb" Inherits="_corporativo_relatorio" %>

<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="Web.Google.Charts" namespace="Web.Google" tagprefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=parametroLabel.Text%>);

            var options = {
                title: '<%=LabeldsRelatorio.Text%>'
                , backgroundColor: 'transparent'
            };

            var chart = new google.visualization.<%=chartModeloLabel.Text%>(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <link href="../scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var idSetup = '<%=Session("idSetup")%>';
            $("#<%=TextBoxPesquisaRELATORIO.ClientID%>").autocomplete("AutoCompleteRelatorio.ashx?idSetup=" + idSetup, { autoFill: false });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
       
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
        <table cellpadding="0" cellspacing="0" align="center" 
            width="100%">
            <tr>
                <td>
                <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" 
                                    align="center">
                    <tr>
                        <td align="left">
                            <br />
                            <br />
                            <br />
                                <asp:Image ID="ImageLinha0" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <asp:Label ID="LabelRelatorio" runat="server" CssClass="h1" 
                                    Text="Pesquisa de Relatórios"></asp:Label>
                            <asp:Label ID="procedureTipoLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="parametroLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="chartModeloLabel" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="parametrotableLabel" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="LabelAviso" runat="server" 
                                
                                Text="Informe o relatório ou parte do nome do relatório.&lt;br&gt;&lt;b&gt;Dica:&lt;/b&gt; Inicie sua pesquisa com a palavra &quot;Relatório&quot;, serão apresentados todos os relatórios liberados para a sua empresa.&lt;br&gt;&lt;br&gt;"></asp:Label>
                            <br />
                            <table cellpadding="0" cellspacing="0" id="FiltroPesquisa">
                                <tr>
                                    <td valign="bottom">
                                    <asp:TextBox ID="TextBoxPesquisaRELATORIO" runat="server" 
                                        CssClass="InputCadFormCandidatoCV" 
                                        ToolTip="Informe o nome ou parte do nome do Relatório" 
                                        ValidationGroup="PESQUISA" Width="500px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxPesquisaRELATORIO" CssClass="msnERROR" 
                                        ErrorMessage="Informe parte do nome ou o número do Relatório" 
                                        SetFocusOnError="True" ValidationGroup="PESQUISA">•</asp:RequiredFieldValidator>
                                    <asp:TextBoxWatermarkExtender ID="TextBoxPesquisaRELATORIO_TextBoxWatermarkExtender" 
                                        runat="server" Enabled="True" TargetControlID="TextBoxPesquisaRELATORIO" 
                                        WatermarkText="Informe parte do nome do Relatório">
                                    </asp:TextBoxWatermarkExtender>
                                    </td>
                                    <td valign="bottom">
                                        <asp:Panel ID="PanelFaixa" runat="server" Visible="False">
                                            <table cellpadding="0" cellspacing="0" ID="Faixa">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="De:"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="Até:"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxDE" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                            Width="25px">25</asp:TextBox>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxATE" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                            Width="25px">30</asp:TextBox>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonPesquisar" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="PanelAno" runat="server" Visible="False">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="Ano:"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxANO" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                            MaxLength="4" Width="68px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonPesquisar0" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                                    <asp:LinkButton ID="LinkButtonPSQ" runat="server" CssClass="button" 
                                        ToolTip="Clique para iniciar a pesquisa" 
                                ValidationGroup="PESQUISA">Pesquisa por Relatórios</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLIMPAR" runat="server" CssClass="button" 
                                        ToolTip="Clique aqui para limpar pesquisa">Limpar</asp:LinkButton>
                            <br />
                            <div id="PanelVAGA">
                            </div>
                            <asp:Panel ID="PanelRELATORIO" runat="server" Visible="False">
                                <br />
                                <br />
                                <asp:Label ID="LabeldsRelatorio" runat="server" CssClass="tituloEmpresa"></asp:Label>
                                <br />
                                <asp:Label ID="descritivoLabel" runat="server" CssClass="textoBold"></asp:Label>
                                <br />
                                <asp:Panel ID="PanelCHATPIE" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%" align="center">
                                        <tr>
                                            <td width="100%">
                                                <div id="chart_div" style="width: 900; height: 300px;"></div>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                                <asp:GridView ID="GridViewRelatorio" runat="server" BorderStyle="None" 
                                    GridLines="Horizontal" Width="100%" BorderColor="#999999">
                                    <AlternatingRowStyle BackColor="#EBEBEB" />
                                    <EmptyDataTemplate>
                                        <asp:Label ID="LabelDados" runat="server" 
                                            Text="Não existe dados para este parâmetro de pesquisa."></asp:Label>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </asp:Panel>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
        </td> 
    </tr> 
</table>
<input id="ActiveAccordeon" type="hidden" runat="server"  value="0" />
</asp:Content>

