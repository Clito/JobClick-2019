<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="true" CodeFile="relatorioDB.aspx.vb" Inherits="_corporativo_relatorio" %>

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
                , backgroundColor: 'transparent', fontSize: '14'
            };

            var chart = new google.visualization.<%=chartModeloLabel.Text%>(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>

    <script type="text/javascript">
        $(function () {
            $("#<%=CHART_INSTITUICAO.ClientID%>").dialog
            ({ autoOpen: true, modal: true, closeText: '', width: '820', title: "<%=protocoloLabel.Text%>", position: "top" });
        });
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
        <table cellpadding="10" cellspacing="10" align="center" 
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
                            <asp:Label ID="protocoloLabel" runat="server"></asp:Label>
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
                                        &nbsp;</td>
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
                                <asp:Label ID="LabeldsRelatorio" runat="server" CssClass="tituloEmpresa"></asp:Label>
                                <asp:Label ID="LabelSQL" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="descritivoLabel" runat="server" CssClass="textoBold"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:Panel ID="REL_FaixaEtaria" runat="server" Visible="False">
                                    <asp:Panel ID="PanelFaixa" runat="server" Visible="False">
                                        <table ID="Faixa" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="De:"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="Até:"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="Base de talentos:"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="TextBoxDE" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="25px">25</asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxATE" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="25px">30</asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListBASE" runat="server" 
                                                        CssClass="DropCadFormCandidatoCV" Width="180px">
                                                        <asp:ListItem Value="">Base Geral e Exclusiva</asp:ListItem>
                                                        <asp:ListItem Value="Geral">Base Geral</asp:ListItem>
                                                        <asp:ListItem Value="Exclusiva">Base Exclusiva</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:LinkButton ID="LinkButtonPesquisar" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="500px"><div ID="chart_div" style="width: 500; height: 400px;"></div></td>
                                            <td>
                                        <asp:GridView ID="GridViewFaixaEtaria" runat="server" AllowPaging="True" 
                                        AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" 
                                        DataSourceID="SqlREL_FaixaEtaria" GridLines="None" PagerStyle-CssClass="pgr">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <Columns>
                                            <asp:BoundField DataField="Idade" HeaderText="Idade" ReadOnly="True" 
                                                SortExpression="Idade" />
                                            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" 
                                                SortExpression="Total" />
                                        </Columns>
                                        <PagerStyle CssClass="pgr" />
                                    </asp:GridView>                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>                                                                                   
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>                                    
                                    <br />
                                    <asp:SqlDataSource ID="SqlREL_FaixaEtaria" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                        SelectCommand="REL_FaixaEtaria" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TextBoxDE" Name="IdadeInicial" 
                                                PropertyName="Text" Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBoxATE" Name="IdadeFinal" 
                                                PropertyName="Text" Type="Int32" />
                                            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                                            <asp:ControlParameter ControlID="DropDownListBASE" Name="Base" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="REL_Trabalhando" runat="server" Visible="False">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="500px"><div ID="chart_div" style="width: 500; height: 400px;"></div></td>
                                            <td>
                                        <asp:GridView ID="GridViewTRABALHANDO" runat="server" AllowPaging="True" 
                                        AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" 
                                        DataSourceID="SqlREL_Trabalhando" GridLines="None" PagerStyle-CssClass="pgr">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <Columns>
                                            <asp:BoundField DataField="Trabalhando" HeaderText="Trabalhando" 
                                                SortExpression="Trabalhando" />
                                            <asp:BoundField DataField="Não Trabalhando" HeaderText="Não Trabalhando" 
                                                SortExpression="Não Trabalhando" />
                                        </Columns>
                                        <PagerStyle CssClass="pgr" />
                                    </asp:GridView>                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>                                                                                   
                                                <asp:SqlDataSource ID="SqlREL_Trabalhando" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_Trabalhando" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>

                                <asp:Panel ID="REL_LocalPreferencia" runat="server" Visible="False">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="500px" valign="top">
                                                <div ID="chart_div" 
                                                    style="width: 500; height: 400px;"></div></td>
                                            <td>
                                        <asp:GridView ID="GridViewREL_LocalPreferencia" runat="server" 
                                        AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" 
                                        DataSourceID="SqlREL_LocalPreferencia" GridLines="None" PagerStyle-CssClass="pgr" 
                                                    AllowPaging="True">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <Columns>
                                            <asp:BoundField DataField="Local de Preferencia" HeaderText="Local de Preferencia" 
                                                SortExpression="Local de Preferencia" />
                                            <asp:BoundField DataField="Total de Cadastrados" HeaderText="Total de Cadastrados" 
                                                SortExpression="Total de Cadastrados" ReadOnly="True" />
                                        </Columns>
                                        <PagerStyle CssClass="pgr" />
                                    </asp:GridView>                                             
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">                                                                                   
                                                <asp:SqlDataSource ID="SqlREL_LocalPreferencia" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_LocalPreferencia" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_InstituicaoProcessoSeletivo" runat="server" 
                                Visible="False">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top">
                                                <asp:panel id="CHART_INSTITUICAO" Visible="false" runat="server">
                                                    <div ID="chart_div" style="width: 800; height: 400px;"></div><br />
                                                    <asp:GridView ID="GridViewREL_LocalPreferencia1" runat="server" 
                                                        AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                        AutoGenerateColumns="False" CssClass="mGrid" 
                                                        DataSourceID="SqlREL_InstituicaoProcessoSeletivoFILTRO" GridLines="None" 
                                                        PagerStyle-CssClass="pgr">
                                                        <AlternatingRowStyle CssClass="alt" />
                                                        <Columns>
                                                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                                                NullDisplayText="-" SortExpression="Protocolo" />
                                                            <asp:BoundField DataField="dsfuncao" HeaderText="PS" NullDisplayText="-" 
                                                                SortExpression="dsfuncao" />
                                                            <asp:BoundField DataField="Instituição de Ensino" 
                                                                HeaderText="Instituição de Ensino" SortExpression="Instituição de Ensino" />
                                                            <asp:BoundField DataField="Total de Cadastrados" 
                                                                HeaderText="Total de Cadastrados" SortExpression="Total de Cadastrados" />
                                                        </Columns>
                                                        <PagerStyle CssClass="pgr" />
                                                    </asp:GridView>
                                                </asp:panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">                                                                                   
                                                <br />
                                                <asp:GridView ID="GridViewREL_LocalPreferencia0" runat="server" 
                                                    AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                    AutoGenerateColumns="False" CssClass="mGrid" 
                                                    DataSourceID="SqlREL_InstituicaoProcessoSeletivo" GridLines="None" 
                                                    PagerStyle-CssClass="pgr" DataKeyNames="Protocolo">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Protocolo" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                    CommandName="Select" Text='<%# Eval("dsfuncao") %>' 
                                                                    ToolTip='<%# Eval("Protocolo") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Instituição de Ensino" 
                                                            HeaderText="Instituição de Ensino" SortExpression="Instituição de Ensino" />
                                                        <asp:BoundField DataField="Total de Cadastrados" 
                                                            HeaderText="Total de Cadastrados" SortExpression="Total de Cadastrados" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>                                                
                                                <asp:SqlDataSource ID="SqlREL_InstituicaoProcessoSeletivo" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_InstituicaoProcessoSeletivo" 
                                                    SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                                            Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlREL_InstituicaoProcessoSeletivoFILTRO" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_InstituicaoProcessoSeletivo" 
                                                    SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                                            Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                                                        <asp:ControlParameter ControlID="protocoloLabel" Name="ProtocoloPesquisa" 
                                                            PropertyName="Text" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>

                                <asp:Panel ID="REL_InstituicaoEnsino" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="500px">
                                                <div ID="chart_div" style="width: 500; height: 400px;">
                                                </div>
                                            </td>
                                            <td>
                                                <asp:GridView ID="GridViewREL_InstituicaoEnsino" runat="server" 
                                                    AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                    AutoGenerateColumns="False" CssClass="mGrid" 
                                                    DataSourceID="SqlREL_InstituicaoEnsino" GridLines="None" 
                                                    PagerStyle-CssClass="pgr">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Instituicao" HeaderText="Instituicao" 
                                                            ReadOnly="True" SortExpression="Instituicao" />
                                                        <asp:BoundField DataField="Total de Cadastrados" 
                                                            HeaderText="Total de Cadastrados" ReadOnly="True" 
                                                            SortExpression="Total de Cadastrados" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:SqlDataSource ID="SqlREL_InstituicaoEnsino" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_InstituicaoEnsino" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_CBOCandidato" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="800px">
                                            <asp:panel id="PanelREL_CBOCandidato" Visible="false" runat="server">
                                                <div ID="chart_div" style="width: 800; height: 400px;"></div>
                                            </asp:panel> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                            <asp:Label ID="LabelNivel" runat="server" Text="2" Visible="False"></asp:Label>
                                                <asp:Label ID="LabelCBO" runat="server" Text=" " Visible="False"></asp:Label>
                                                <asp:Label ID="LabelBase" runat="server" Text=" " Visible="False"></asp:Label>
                                                <asp:HyperLink ID="HyperLinkCBO" runat="server" CssClass="button" 
                                                    NavigateUrl="~/_corporativo/CBO2002_LISTA.PDF" Target="_New">Lista com todos os códigos CBO</asp:HyperLink>
                                                <br />
                                                <br />
                                                <asp:GridView ID="GridViewREL_CBOCandidato" runat="server" AllowPaging="True" 
                                                    AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" 
                                                    DataKeyNames="CodigoCBO" DataSourceID="SqlREL_CBOCandidato" GridLines="None" 
                                                    PagerStyle-CssClass="pgr">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="CBO" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButtonCBO" runat="server" CausesValidation="false" 
                                                                    CommandName="Select" Text='<%# Eval("CBO") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="CodigoCBO" HeaderText="Codigo CBO" 
                                                            SortExpression="CodigoCBO" />
                                                        <asp:BoundField DataField="CBO" HeaderText="CBO" ReadOnly="True" 
                                                            SortExpression="CBO" Visible="False" />
                                                        <asp:BoundField DataField="Total de Curriculos" 
                                                            HeaderText="Total de Curriculos" ReadOnly="True" 
                                                            SortExpression="Total de Curriculos" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="button" 
                                                    onclientclick="JavaScript: window.history.back(1); return false;">Voltar</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonRESET" runat="server" CssClass="button">Reiniciar</asp:LinkButton>
                                                <br />
                                                <br />
                                                <asp:SqlDataSource ID="SqlREL_CBOCandidato" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_CBOCandidato" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="LabelNivel" Name="Nivel" PropertyName="Text" 
                                                            Type="Int32" />
                                                        <asp:ControlParameter ControlID="LabelCBO" Name="CBO" PropertyName="Text" 
                                                            Type="String" />
                                                        <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                                            Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                                                        <asp:ControlParameter ControlID="LabelBase" Name="Base" PropertyName="Text" 
                                                            Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_CBOVaga" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="800px">
                                                <asp:Panel ID="PanelREL_CBOVaga" runat="server" Visible="false">
                                                    <div ID="chart_div" style="width: 800; height: 500px;">
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:Label ID="LabelNivel0" runat="server" Text="1" Visible="False"></asp:Label>
                                                <asp:Label ID="LabelCBO0" runat="server" Text=" " Visible="False"></asp:Label>
                                                <asp:Label ID="LabelBase0" runat="server" Text=" " Visible="False"></asp:Label>
                                                <asp:GridView ID="GridViewREL_CBOCandidato0" runat="server" AllowPaging="True" 
                                                    AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" 
                                                    DataSourceID="SqlREL_CBOVaga" GridLines="None" PagerStyle-CssClass="pgr">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Código CBO" HeaderText="Código CBO" ReadOnly="True" 
                                                            SortExpression="Código CBO" />
                                                        <asp:BoundField DataField="Total de Vagas" HeaderText="Total de Vagas" 
                                                            ReadOnly="True" SortExpression="Total de Vagas" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="button" 
                                                    onclientclick="JavaScript: window.history.back(1); return false;">Voltar</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonRESET0" runat="server" CssClass="button">Reiniciar</asp:LinkButton>
                                                <br />
                                                <br />
                                                <asp:SqlDataSource ID="SqlREL_CBOVaga" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_CBOVaga" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                                            Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                                                        <asp:ControlParameter ControlID="LabelBase0" Name="Base" PropertyName="Text" 
                                                            Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_Disponibilidade" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="100%">
                                                <div ID="chart_div" style="width: 100%; height: 400px;">
                                                </div>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:SqlDataSource ID="SqlREL_Disponibilidade" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_Disponibilidade" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridViewREL_LocalPreferencia3" runat="server" AllowPaging="True" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="SqlREL_Disponibilidade" GridLines="None" PagerStyle-CssClass="pgr" Visible="False">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <Columns>
                                            <asp:BoundField DataField="Disponibilidade" HeaderText="Disponibilidade" SortExpression="Disponibilidade" />
                                            <asp:BoundField DataField="Total de Cadastrados" HeaderText="Total de Cadastrados" ReadOnly="True" SortExpression="Total de Cadastrados" />
                                        </Columns>
                                        <PagerStyle CssClass="pgr" />
                                    </asp:GridView>
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="REL_Sexo" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="500px">
                                                <div ID="chart_div" style="width: 500; height: 400px;">
                                                </div>
                                            </td>
                                            <td>
                                                <asp:GridView ID="GridViewREL_LocalPreferencia4" runat="server" 
                                                    AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                    AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="SqlREL_Sexo" 
                                                    GridLines="None" PagerStyle-CssClass="pgr">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo" />
                                                        <asp:BoundField DataField="Total de Cadastrados" 
                                                            HeaderText="Total de Cadastrados" ReadOnly="True" 
                                                            SortExpression="Total de Cadastrados" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:SqlDataSource ID="SqlREL_Sexo" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="REL_Sexo" 
                                                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_NivelFormacaoAcademica" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="500px">
                                                <div ID="chart_div" style="width: 500; height: 400px;">
                                                </div>
                                            </td>
                                            <td>
                                                <asp:GridView ID="GridViewREL_LocalPreferencia5" runat="server" 
                                                    AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                    AutoGenerateColumns="False" CssClass="mGrid" 
                                                    DataSourceID="SqlREL_NivelFormacaoAcademica" GridLines="None" 
                                                    PagerStyle-CssClass="pgr">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Nível de Formação Academica" 
                                                            HeaderText="Nível de Formação Academica" ReadOnly="True" 
                                                            SortExpression="Nível de Formação Academica" />
                                                        <asp:BoundField DataField="Total de Cadastrados" 
                                                            HeaderText="Total de Cadastrados" ReadOnly="True" 
                                                            SortExpression="Total de Cadastrados" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:SqlDataSource ID="SqlREL_NivelFormacaoAcademica" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_NivelFormacaoAcademica" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_VagaAbertaXFechada" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="500px">
                                                <div ID="chart_div" style="width: 500; height: 400px;">
                                                </div>
                                            </td>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="PanelAno" runat="server">
                                                                <table cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label3" runat="server" Text="Ano:"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;&nbsp;&nbsp;</td>
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
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridViewREL_LocalPreferencia6" runat="server" 
                                                                AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                                AutoGenerateColumns="False" CssClass="mGrid" 
                                                                DataSourceID="SqlREL_VagaAbertaXFechada" GridLines="None" 
                                                                PagerStyle-CssClass="pgr">
                                                                <AlternatingRowStyle CssClass="alt" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="Mês" HeaderText="Mês" ReadOnly="True" 
                                                                        SortExpression="Mês" />
                                                                    <asp:BoundField DataField="Vagas Abertas" HeaderText="Vagas Abertas" 
                                                                        ReadOnly="True" SortExpression="Vagas Abertas" />
                                                                    <asp:BoundField DataField="Vagas Fechadas" HeaderText="Vagas Fechadas" 
                                                                        ReadOnly="True" SortExpression="Vagas Fechadas" />
                                                                </Columns>
                                                                <PagerStyle CssClass="pgr" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:SqlDataSource ID="SqlREL_VagaAbertaXFechada" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_VagaAbertaXFechada" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="TextBoxANO" Name="Ano" PropertyName="Text" 
                                                            Type="Int32" />
                                                        <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                                            Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="REL_Origem_Cadastramento" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="500px">
                                                <div ID="chart_div" style="width: 500; height: 400px;">
                                                </div>
                                            </td>
                                            <td>
                                                <asp:GridView ID="GridViewREL_LocalPreferencia7" runat="server" 
                                                    AllowPaging="True" AlternatingRowStyle-CssClass="alt" 
                                                    AutoGenerateColumns="False" CssClass="mGrid" 
                                                    DataSourceID="SqlREL_Origem_Cadastramento" GridLines="None" 
                                                    PagerStyle-CssClass="pgr">
                                                    <AlternatingRowStyle CssClass="alt" />
                                                    <Columns>
                                                        <asp:BoundField DataField="Origem" HeaderText="Origem" 
                                                            SortExpression="Origem" />
                                                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" 
                                                            SortExpression="Total" />
                                                    </Columns>
                                                    <PagerStyle CssClass="pgr" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:SqlDataSource ID="SqlREL_Origem_Cadastramento" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="REL_Origem_Cadastramento" SelectCommandType="StoredProcedure">
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                                <br />

                                <asp:Label ID="Label5" runat="server" Text="Empurre isso para baixo" 
                                    Visible="False"></asp:Label>
                                <br />
                            </asp:Panel>
                            <br />
                            <br />
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

