<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="relatorioCandidato.aspx.vb" Inherits="_parceiroJobClick_relatorioCandidato" %>

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
                , backgroundColor: 'transparent', fontSize: '10'
            };

            var chart = new google.visualization.<%=chartModeloLabel.Text%>(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="parametroLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="LabeldsRelatorio" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="chartModeloLabel" runat="server" Visible="False"></asp:Label>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Relatórios e Gráficos"></asp:Label>
            <asp:GridView ID="GridViewCANDIDATURA" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idVagaPublica,titVagaPublica" DataSourceID="SqlDataSourceCANDIDATURA" PageSize="3">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" ImageUrl="~/_parceiroJobClick/images/viewDescricao.png" ToolTip='<%# Eval("dsVagaPublica") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="titVagaPublica" HeaderText="Vaga" ReadOnly="True" SortExpression="titVagaPublica" />
                    <asp:BoundField DataField="cnt" HeaderText="Visualização" SortExpression="cnt" />
                    <asp:BoundField DataField="cnd" HeaderText="Candidaturas" ReadOnly="True" SortExpression="cnd" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="LabelAVISO" runat="server" Text="&lt;b&gt;&lt;i&gt;Não existem candidaturas para nenhuma vaga publicada por sua empresa.&lt;/i&gt;&lt;/b&gt;&lt;br&gt;&lt;br&gt;Esta mensagem pode representar as seguites situações:&lt;br&gt;&lt;br&gt;&lt;b&gt;1&lt;/b&gt;. Sua empresa não publicou nenhuma vaga até o momento no Jobclick;&lt;br&gt;&lt;b&gt;2&lt;/b&gt;. Sua vaga publicada no painel de vagas Jobclick, ainda não foi visualizada por nenhum candidato;&lt;br&gt;&lt;br&gt;Obs.: Sua empresa pode utilizar as &quot;Vagas Patrocinadas&quot; para auxiliar na divulgação desta e outras vagas.&lt;br&gt;&lt;br&gt;Se deseja utilizar as &quot;Vagas Patrocinadas&quot; &lt;a href='vagaPatrocinada.aspx' title='Conheça as vantagens de utilizar as Vagas Patrocinadas'&gt;clique aqui&lt;/a&gt;."></asp:Label>
                </EmptyDataTemplate>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <div id="chart_div" style="width: 100%; height: 400px;"></div>
        </div>
    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceCANDIDATURA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_RELATORIO_JSON_VAGASPUBLICASXCANDIDATURA_TEXTO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
    <br />
</asp:Content>

