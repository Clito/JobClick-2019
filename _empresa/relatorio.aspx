<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="true" CodeFile="relatorio.aspx.vb" Inherits="_empresa_Default" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:Label ID="EmpresaFilhaLabel" runat="server" Text="0" 
        Visible="False"></asp:Label>
    <asp:Label ID="SetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
    <br />
<table width="720" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="694">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="left">
    <asp:Label ID="LabelCabec0" runat="server" CssClass="tituloEmpresa">Candidaturas ativas vindas pelo site</asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="DropDownListEmpresa" runat="server" AutoPostBack="True" 
                                CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                                DataValueField="idCadastroEmpresa" Width="250px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                    <cc11:LineChart ID="LineChart" runat="server" BackgroundTransparent="True" 
                    DataSeriesIDField="Protocolo" DataSeriesValueField="dsfuncao" 
                    DataSourceID="SqlDataRelatorioCandidatura" Width="679px">
                        <Graphs>
                            <cc11:LineChartGraph runat="server" BulletSize="6" 
                                DataSeriesItemIDField="Protocolo" DataSourceID="SqlDataRelatorioCandidatura" 
                                DataValueField="CNTVISISTA" FillGradientColors="" Title="Visualizações">
                            </cc11:LineChartGraph>
                            <cc11:LineChartGraph runat="server" BulletSize="6" 
                                DataSeriesItemIDField="Protocolo" DataSourceID="SqlDataRelatorioCandidatura" 
                                DataValueField="CNTCANDIDATURA" FillGradientColors="" Title="Candidaturas">
                            </cc11:LineChartGraph>
                            <cc11:LineChartGraph runat="server" BulletSize="6" 
                                DataSeriesItemIDField="Protocolo" DataSourceID="SqlDataRelatorioCandidatura" 
                                DataValueField="CNTFASE" FillGradientColors="" Title="Fases">
                            </cc11:LineChartGraph>
                            <cc11:LineChartGraph runat="server" BulletSize="6" 
                                DataSeriesItemIDField="Protocolo" DataSourceID="SqlDataRelatorioCandidatura" 
                                DataValueField="CNTPSELETIVO" FillGradientColors="" Title="Em Processo">
                            </cc11:LineChartGraph>
                        </Graphs>
                </cc11:LineChart>

                <br />
                <table id="BGNULL" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="center">
                            <asp:Image ID="ImageChartNULL" runat="server" 
                                ImageUrl="~/images/layoutNew/bgChartNull.png" />
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PanelAvisoCredito" runat="server">
                    <table cellpadding="5" cellspacing="5" ID="Aviso" align="center">
                        <tr>
                            <td align="left" visible="False">
                                <table ID="Optar" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonVSP" runat="server" 
                                                ImageUrl="~/images/layoutNew/btEmpresaPRATA.png" 
                                                onclientclick="return confirm(&quot;Ao voltar a utilizar o modelo gratuito, você não terá mais acesso aos processos seletivos abertos pela sua empresa.\n\nPorém a qualquer momento você poderá voltar ao modelo e-Recruitment. Todos os seus dados estarão guardados.&quot;)" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonCCA" runat="server" 
                                                ImageUrl="~/images/layoutNew/btEmpresaOURO.png" 
                                                PostBackUrl="/_empresa/_credito.aspx?autoTit=Compra%20de%20Créditos" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" visible="False" valign="top">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:GridView ID="GridViewCNT" runat="server" AutoGenerateColumns="False" 
                    BorderColor="#A6CACA" BorderStyle="Dotted" BorderWidth="1px" DataKeyNames="ID" 
                    DataSourceID="SqlDataRelatorioCandidatura" GridLines="Horizontal" Width="100%">
                    <AlternatingRowStyle BackColor="#D8E7E7" BorderStyle="None" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="idvaga" HeaderText="idvaga" SortExpression="idvaga" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                            HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                            Visible="False" />
                        <asp:BoundField DataField="dsfuncao" HeaderText="dsfuncao" 
                            SortExpression="dsfuncao" Visible="False" />
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" />
                        <asp:BoundField DataField="CNTVISISTA" HeaderText="Visita(s)" 
                            SortExpression="CNTVISISTA" />
                        <asp:BoundField DataField="CNTCANDIDATURA" HeaderText="Cadidatura(s)" 
                            SortExpression="CNTCANDIDATURA" />
                        <asp:BoundField DataField="CNTFASE" HeaderText="Fase(s)" 
                            SortExpression="CNTFASE" />
                        <asp:BoundField DataField="CNTPSELETIVO" HeaderText="Trabalhada(s)" 
                            SortExpression="CNTPSELETIVO" />
                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                            SortExpression="idSetup" Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="AvisoLabel" runat="server" 
                            Text="Veja os vídeos treinamento no link:"></asp:Label>
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="http://hotsite.jobclick.com.br" Target="_new">Treinamento</asp:HyperLink>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idUser" DataSourceID="SqlDataSourceDadosAcesso"
                    Width="400px">
                    <ItemTemplate>
                        Login em:
                        <asp:Label ID="dataultimoacessLabel" runat="server" Text='<%# Eval("dataultimoacess") %>'></asp:Label>
                        | nº acesso(s):
                        <asp:Label ID="contadorLabel" runat="server" Text='<%# Eval("contador") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:DataList><br />
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceDadosCV" 
                    Width="400px">
                    <ItemTemplate>
                        Currículos publicados em
                        <asp:Label ID="dsidiomaLabel" runat="server" Text='<%# Eval("dsidioma") %>'></asp:Label>:
                        <asp:Label ID="cntLabel" runat="server" Text='<%# Eval("cnt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList></td> 
        </tr>
        <tr>
            <td width="26" valign="bottom">
                <br />
                <br />
            </td>
            <td width="350" valign="bottom">
                &nbsp;</td> 
        </tr>
        <tr>
            <td width="26" align="center">
                &nbsp;</td>
            <td width="350">
                &nbsp;</td> 
        </tr>
    </table>     
    <asp:Label ID="lblStatus" runat="server"></asp:Label>
    <asp:Label ID="idRH_gestorLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <table width="720" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/h26.gif" /></td>
                <td width="694">
                    <asp:Label ID="msnLabel" runat="server" CssClass="msn" Visible="False"></asp:Label>
                    <br />
                <asp:DataList ID="DataListEmpresaFilha" runat="server" DataKeyField="idCadastroEmpresa" 
                    DataSourceID="SqlEmpresaFilha" Width="100%" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmpresaLabel" runat="server" 
                            Text="Você está trabalhando com a empresa: "></asp:Label>
                        <br />
                        <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                            Font-Bold="True" CssClass="msnOK" />
                    </ItemTemplate>
                </asp:DataList>
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
    </table> 
                <br />
    <asp:SqlDataSource ID="SqlDataSourceDadosAcesso" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="_USP_LOGIN_DADOS" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idUser" SessionField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDadosCV" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [dsidioma], [cnt] FROM [vwcurriculo_publicado]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [idCadastroEmpresa_Pai] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresaFilha" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) AND (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataRelatorioCandidatura" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_RELATORIO_CANDIDATURA_HOME_EMPRESA" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                SessionField="idCadastroEmpresaFilha" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVisualizador" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_RELATORIO_VISUALIZACAO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:ControlParameter ControlID="EmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTrabalhado" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_RELATORIO_TRABALHO_CONSULTOR" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:ControlParameter ControlID="EmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   
    </asp:Content>

