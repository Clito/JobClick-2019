<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="analytics.aspx.vb" Inherits="_parceiroJobClick_analytics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable(<%=parametroLabel.Text%>);

            var options = {
                title: '<%=LabeldsRelatorio.Text%>'
                , backgroundColor: 'transparent', fontSize: '10'
            };

            var chart = new google.visualization.<%=chartModeloLabel.Text%>(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Analytics - Gráficos e Relatórios"></asp:Label>

            <br />
            <asp:Label ID="parametroLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="LabeldsRelatorio" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="chartModeloLabel" runat="server" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="SqlDataSourceRELATORIO" PageSize="4">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                    <asp:BoundField DataField="nomeAD" HeaderText="Vaga" />
                    <asp:BoundField DataField="lance" DataFormatString="{0:c}" HeaderText="CPC" />
                    <asp:BoundField DataField="orcamento" DataFormatString="{0:c}" HeaderText="Orçamento" />
                    <asp:BoundField DataField="cntClick" HeaderText="Clique(s)" />
                    <asp:BoundField DataField="cntImpressao" HeaderText="Impressão(ões)" />
                    <asp:BoundField DataField="cntMergulho" HeaderText="Mergulho" />
                    <asp:BoundField DataField="qtdImpressao" HeaderText="Impressões" />
                </Columns>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <br />
            <div id="chart_div" style="width: 100%; height: 400px;"></div>
            <br />
            <br />
            <asp:LinkButton ID="LinkButtonBack" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/vagaPatrocinada.aspx" ToolTip="Para voltar para Vagas Patrocinadas, clique aqui.">Vagas Patrocinadas</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonSAIR" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/Default.aspx" ToolTip="Para voltar para a página principal, clique aqui.">Sair</asp:LinkButton>
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceRELATORIO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_RELATORIO_JSON_ANALYTICS_TEXTO" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />

        </div>
    </div>
</asp:Content>

