<%@ Page Title="" Language="VB" MasterPageFile="corporativoPage.master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_gestor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="750" align="center"><tr><td>
    <asp:Label ID="ApresentaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False">0</asp:Label>
                    <asp:DataList ID="DataListEmpresa" runat="server" 
        DataKeyField="idCadastroEmpresa" DataSourceID="SqlEmpresa" Width="100%">
                        <ItemTemplate>
                            <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                                CssClass="titulo" />
                        </ItemTemplate>
    </asp:DataList>
                            <br />
                    <hr size="1px" 
            style="border-width: 1px 0px 0px 0px; border-color: #C0C0C0; border-top-style: dashed;" />
                    <asp:DataList ID="DataListLogin" runat="server" 
                        DataKeyField="contador" DataSourceID="SqlDataSourceACESSO"
                    Width="100%">
                    <ItemTemplate>
                        Login em:
                        <asp:Label ID="dataultimoacessLabel" runat="server" Text='<%# Eval("dataultimoacess") %>'></asp:Label>
                        | nº acesso(s):
                        <asp:Label ID="contadorLabel" runat="server" Text='<%# Eval("contador") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:DataList>
    <br />
                    <asp:GridView ID="GridViewPS" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="idCadastroEmpresa" DataSourceID="SqlRelatorioGeral" 
                        Width="100%" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo" />
                            <asp:BoundField DataField="dataIni" DataFormatString="{0:d}" 
                                HeaderText="Início" SortExpression="dataIni" />
                            <asp:BoundField DataField="dataFim" DataFormatString="{0:d}" 
                                HeaderText="Encerramento" SortExpression="dataFim" />
                            <asp:BoundField DataField="dataCriacao" DataFormatString="{0:d}" 
                                HeaderText="Criado em:" SortExpression="dataCriacao" />
                            <asp:BoundField DataField="dsProcesso" HeaderText="Processo" 
                                SortExpression="dsProcesso" Visible="False" />
                            <asp:BoundField DataField="dsfuncao" HeaderText="Cargo" 
                                SortExpression="dsfuncao" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                Visible="False" />
                            <asp:BoundField DataField="cnt" HeaderText="Visualizações da vaga" 
                                SortExpression="cnt" />
                        </Columns>
                    </asp:GridView>
                <br />
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) AND (idCadastroEmpresa = @idCadastroEmpresa_Filha)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa_Pai" />
            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                SessionField="idCadastroEmpresa_Filha" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlRelatorioGeral" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="_USP_PS_EMPRESA" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa_Pai" 
                    Type="Int32" />
                <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                    SessionField="IdCadastroEmpresa_Filha" Type="Int32" />
                <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                    PropertyName="Text" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceACESSO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="_USP_LOGIN_DADOS" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idUser" SessionField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</td></tr></table><br />
    </asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">


</asp:Content>


