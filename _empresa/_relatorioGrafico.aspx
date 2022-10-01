<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_relatorioGrafico.aspx.vb" Inherits="_empresa_relatorioGrafico" %>

<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                <table id="DropDownTable" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" valign="top" width="50%">
                            <asp:Label ID="Passo1Label" runat="server" CssClass="tituloEmp" 
                                Text="Passo 1 (um) - Selecionar uma Vaga:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListSelectEmpresa" runat="server" 
                                CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                                DataValueField="idCadastroEmpresa" ValidationGroup="SelectEmpresa" 
                                AutoPostBack="True">
                            </asp:DropDownList></td>
                        <td align="center" width="50%">
                            <asp:GridView ID="GridViewVAGA" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" BorderStyle="None" 
                                DataKeyNames="idProcessoSeletivo,idVaga,idRH_Gestor" DataSourceID="SqlVaga" 
                                GridLines="None" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" Visible="False" />
                                    <asp:TemplateField HeaderText="Protocolo (Vaga)" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text='<%# Eval("Protocolo") %>' 
                                                ToolTip='<%# Eval("dsCargo") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Protocolo" HeaderText="Protocolo (Vaga)" 
                                        SortExpression="Protocolo" Visible="False" />
                                    <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                        SortExpression="idProcessoSeletivo" Visible="False" />
                                    <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" 
                                        Visible="False" />
                                    <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                        SortExpression="idRH_Gestor" Visible="False" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                    </td>
            </tr>
        </table>
        <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="LabelCabec0" runat="server" CssClass="tituloEmpresa">Time de Consultores</asp:Label>
                    <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
        <asp:RadioButtonList ID="RadioButtonListConsultor" runat="server" 
            AutoPostBack="True" DataSourceID="SqlListaConsultor" DataTextField="nome" 
            DataValueField="idRH_Gestor" RepeatColumns="2" RepeatDirection="Horizontal" 
            Width="100%">
        </asp:RadioButtonList>
        <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
        <br />
        <asp:GridView ID="GridViewPS" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlChartPS" BorderColor="#CCCCCC" BorderStyle="Dotted" 
            BorderWidth="1px" GridLines="Horizontal" Width="100%">
            <Columns>
                <asp:BoundField DataField="nome_gestor" HeaderText="Consultor" 
                    SortExpression="nome_gestor" ReadOnly="True" />
                <asp:BoundField DataField="Total_publicada" HeaderText="Publicadas" 
                    ReadOnly="True" SortExpression="Total_publicada" />
                <asp:BoundField DataField="Total_nao_publicada" 
                    HeaderText="Não Publicadas" ReadOnly="True" 
                    SortExpression="Total_nao_publicada" />
                <asp:BoundField DataField="Total_em_processo_seletivo" 
                    HeaderText="Em Processo Seletivo" ReadOnly="True" 
                    SortExpression="Total_em_processo_seletivo" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" 
                    SortExpression="Total" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
            DataSourceID="SqlChartPS2" GridLines="Horizontal" Width="100%">
            <Columns>
                <asp:BoundField DataField="Total_Nao_Aprovado" 
                    HeaderText="Levantamentos Não Aprovados" ReadOnly="True" 
                    SortExpression="Total_Nao_Aprovado" />
                <asp:BoundField DataField="Total_Aprovado" HeaderText="Levantamentos Aprovados" 
                    ReadOnly="True" SortExpression="Total_Aprovado" />
                <asp:BoundField DataField="Total_Em_Analise" 
                    HeaderText="Levantamentos em Análise" ReadOnly="True" 
                    SortExpression="Total_Em_Analise" />
                <asp:BoundField DataField="Total_Encerrado" 
                    HeaderText="Levantamentos Encerrados" ReadOnly="True" 
                    SortExpression="Total_Encerrado" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" 
                    SortExpression="Total" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Panel ID="PanelChart" runat="server" Visible="False" 
            CssClass="ChartPosition">
            <table ID="Chart" cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td align="right" style="height: 70px">
                        <asp:ImageButton ID="ImageButtonClose" runat="server" 
                            ImageUrl="~/images/close.png" />
                    </td>
                </tr>
            </table>
            <cc1:PieChart ID="PieChartCVs" runat="server" 
    BackgroundGradientColors="" BackgroundTransparent="True" 
    CollectingDataMessageLeft="0px" CollectingDataMessageTop="" Colors="" 
    DataLabelRadius="30px" DataSourceID="SqlChartPS4CVs" 
    DataTitleField="dsflgAprovado" DataValueField="CNT" 
    ErrorMessagesBackgroundGradientColors="" ErrorMessagesLeft="" 
    ErrorMessagesTop="" Height="380px" LegendGradientColors="" LegendLeft="" 
    LegendTop="" LegendWidth="" PieInnerRadius="0px" Width="600px" LegendAlign="Center" 
                LegendSpacing="5">
            </cc1:PieChart>
        </asp:Panel>
        <asp:DragPanelExtender ID="PanelChart_DragPanelExtender" runat="server" 
            DragHandleID="PanelChart" Enabled="True" TargetControlID="PanelChart">
        </asp:DragPanelExtender>
        <br />
        <cc1:LineChart ID="LineChartPS" runat="server" BackgroundTransparent="True" 
            DataSeriesIDField="CNT" DataSeriesValueField="Protocolo" 
            DataSourceID="SqlChartPS3" Height="318px" Width="720px" 
            ErrorMessagesEnabled="False">
            <Graphs>
                <cc1:LineChartGraph runat="server" BulletSize="6" 
                    DataDescriptionField="dsProcesso" DataSeriesItemIDField="CNT" 
                    DataSourceID="SqlChartPS3" DataUrlField="URL" DataValueField="CNT" 
                    FillGradientColors="" Title="Distribuição de Currículos por Processo Seletivo">
                </cc1:LineChartGraph>
            </Graphs>
        </cc1:LineChart>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlChartPS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="JobReport.spRelVagaConsultor" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idEmpresa" SessionField="idCadastroEmpresa" 
                    Type="Int32" />
                <asp:SessionParameter Name="idEmpresa_filha" 
                    SessionField="idCadastroEmpresaFilha" Type="Int32" />
                <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) OR (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlChartPS2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="JobReport.spRelLevantamento" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                            SessionField="idCadastroEmpresaFilha" Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlChartPS3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_RELATORIO_PS_CV" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlChartPS4CVs" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_RELATORIO_PS_CV_STATUS" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ProtocoloLabel" Name="Protocolo" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlListaConsultor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_LISTA_CONSULTOR" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
                </asp:Content>

