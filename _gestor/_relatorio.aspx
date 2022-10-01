<%@ Page Title="" Language="VB" MasterPageFile="~/_gestor/GestorMasterPage.master" AutoEventWireup="true" CodeFile="_relatorio.aspx.vb" Inherits="_gestor_relatorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False">0</asp:Label>
    <asp:Label ID="ApresentaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idCadastroEmpresa_PaiLabel" runat="server" Visible="False"></asp:Label>
                <table id="DropDownTable" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <br />
                            </td>
                        <td align="center" width="50%">
                            &nbsp;</td>
                    </tr>
                </table>
                    <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
        <asp:RadioButtonList ID="RadioButtonListConsultor" runat="server" 
            AutoPostBack="True" DataSourceID="SqlListaConsultor" DataTextField="nome" 
            DataValueField="idRH_Gestor" RepeatColumns="2" RepeatDirection="Horizontal" 
            Width="100%">
        </asp:RadioButtonList>
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
                </td>
            </tr>
        </table>
                    <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
        <br />
        <asp:SqlDataSource ID="SqlChartPS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="JobReport.spRelVagaConsultor" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idEmpresa" SessionField="idCadastroEmpresa_Pai" 
                    Type="Int32" />
                <asp:SessionParameter Name="idEmpresa_filha" 
                    SessionField="idCadastroEmpresaFilha" Type="Int32" />
                <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlListaConsultor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_LISTA_CONSULTOR" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa_Pai" 
                            Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
        <br />
        </asp:Content>

