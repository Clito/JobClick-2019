<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="relatorioVaga.aspx.vb" Inherits="_parceiroJobClick_relatorioVaga" %>

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
            <br />
    <asp:GridView ID="GridViewVAGA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceVAGA" AllowPaging="True" CssClass="mGrid" AllowSorting="True" DataKeyNames="idVagaPublica,titVagaPublica" PageSize="3">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/_parceiroJobClick/images/viewDescricao.png" ToolTip='<%# Eval("dsVagaPublica") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vaga" SortExpression="titVagaPublica">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("titVagaPublica") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonVaga" runat="server" CommandName="Select" Text='<%# Eval("titVagaPublica") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="codigo" HeaderText="Código" ReadOnly="True" SortExpression="codigo" />
            <asp:BoundField DataField="cnt" HeaderText="Visualizações" ReadOnly="True" SortExpression="cnt" />
            <asp:BoundField DataField="topAn" HeaderText="topAn" SortExpression="topAn" Visible="False" />
            <asp:BoundField DataField="idVagaPublica" HeaderText="idVagaPublica" SortExpression="idVagaPublica" Visible="False" />
        </Columns>
        <EmptyDataTemplate>
            <asp:Label ID="LabelAVISO" runat="server" Text="&lt;b&gt;&lt;i&gt;Não existem candidaturas para nenhuma vaga publicada por sua empresa.&lt;/i&gt;&lt;/b&gt;&lt;br&gt;&lt;br&gt;Esta mensagem pode representar as seguites situações:&lt;br&gt;&lt;br&gt;&lt;b&gt;1&lt;/b&gt;. Sua empresa não publicou nenhuma vaga até o momento no Jobclick;&lt;br&gt;&lt;b&gt;2&lt;/b&gt;. Sua vaga publicada no painel de vagas Jobclick, ainda não foi visualizada por nenhum candidato;&lt;br&gt;&lt;br&gt;Obs.: Sua empresa pode utilizar as &quot;Vagas Patrocinadas&quot; para auxiliar na divulgação desta e outras vagas.&lt;br&gt;&lt;br&gt;Se deseja utilizar as &quot;Vagas Patrocinadas&quot; &lt;a href='vagaPatrocinada.aspx' title='Conheça as vantagens de utilizar as Vagas Patrocinadas'&gt;clique aqui&lt;/a&gt;."></asp:Label>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
            <div id="chart_div" style="width: 100%; height: 400px;"></div>
        </div>
    <br />
    </div>
    <asp:SqlDataSource ID="SqlDataSourceVAGA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_RELATORIO_JSON_VAGASPUBLICAS_TEXTO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
</asp:Content>

