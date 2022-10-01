<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="perfilVagaAcompanhamento.aspx.vb" Inherits="_empresa_perfilVagaAcompanhamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="LPV" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><asp:Image ID="ImageGestao" runat="server" 
                    ImageUrl="~/images/empresa/acompanhamento.gif" /><br /></td>
        </tr>
    </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26px"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td>
        <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server"></asp:Label>
        <asp:Label ID="idPerfilVagaLabel" runat="server"></asp:Label>
        <asp:Label ID="idCadastroEmpresaLabel" runat="server"></asp:Label>
        <asp:Label ID="ProtocoloLabel" runat="server"></asp:Label>
                <asp:Label ID="idPublicaPerfilVagaLabel" runat="server" Text="0" 
                    Visible="False"></asp:Label>
                <br />
                <asp:GridView ID="GridViewListaPerfilVaga" runat="server" AutoGenerateColumns="False" 
                    
                    DataKeyNames="idPublicaPerfilVaga,idCadastroEmpresa,idCadastroEmpresaFilha,idRH_Gestor,idRH_Gestor_Filho,idUserEmpresa,Protocolo" 
                    DataSourceID="SqlPerfilVaga" Width="100%" BorderColor="Silver" 
                    BorderStyle="Dotted" BorderWidth="1px" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="idPublicaPerfilVaga" 
                            HeaderText="idPublicaPerfilVaga" InsertVisible="False" ReadOnly="True" 
                            SortExpression="idPublicaPerfilVaga" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresaFilha" 
                            HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                            Visible="False" />
                        <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                            SortExpression="idRH_Gestor" Visible="False" />
                        <asp:BoundField DataField="idRH_Gestor_Filho" HeaderText="idRH_Gestor_Filho" 
                            SortExpression="idRH_Gestor_Filho" Visible="False" />
                        <asp:BoundField DataField="idUserEmpresa" HeaderText="idUserEmpresa" 
                            SortExpression="idUserEmpresa" Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="Protocolo" 
                            Text="Protocolo" />
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" Visible="False" />
                        <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" 
                            Visible="False" />
                        <asp:BoundField DataField="dsVaga" HeaderText="Perfil Vaga" 
                            SortExpression="dsVaga" />
                        <asp:BoundField DataField="apresentar" HeaderText="apresentar" 
                            SortExpression="apresentar" Visible="False" />
                        <asp:BoundField DataField="mensagem" HeaderText="Mensagem" 
                            SortExpression="mensagem" Visible="False" />
                        <asp:BoundField DataField="dataEnvio" HeaderText="Enviado em" 
                            SortExpression="dataEnvio" />
                        <asp:BoundField DataField="nome" HeaderText="Consultor" SortExpression="nome" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="idstatusvaga" HeaderText="Situação" 
                            SortExpression="idstatusvaga" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="LabelAviso" runat="server" 
                            Text="Não foram enviados Levantamentos de Perfis de Vagas até o momento."></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idPublicaPerfilVaga" 
                    DataSourceID="SqlPerfilVagaSelect">
                    <ItemTemplate>
                        <asp:Label ID="ProtocoloLabel" runat="server" CssClass="titulo" 
                            Text='<%# Eval("Protocolo") %>' />
                        <br />
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("idstatusvaga") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLinkUrl" runat="server" 
                            NavigateUrl='<%# Eval("url") %>' Target="_new">Ver Levantamento do Perfil da Vaga</asp:HyperLink>
                        <br />
                        <br />
                        <asp:Label ID="dsVagaLabel" runat="server" CssClass="tituloEmp" 
                            Text='<%# Eval("dsVaga") %>' />
                        <br />
                        <br />
                        Mensagem:<br />
                        <asp:Label ID="mensagemLabel" runat="server" Text='<%# Eval("mensagem") %>' />
                        <br />
                        <br />
                        Enviado em:<br />
                        <asp:Label ID="dataEnvioLabel" runat="server" Font-Bold="True" 
                            Text='<%# Eval("dataEnvio") %>' />
                        <br />
                        <br />
                        Consultor:<br />
                        <asp:Label ID="nomeLabel" runat="server" Font-Bold="True" 
                            Text='<%# Eval("nome") %>' />
                        <br />
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                        <br />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlPerfilVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_CONTROLEFLUXO_LEVANTAMENTOPERFILVAGA" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idCadastroEmpresaFilha" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idUserEmpresa" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idPublicaPerfilVaga" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlPerfilVagaSelect" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_CONTROLEFLUXO_LEVANTAMENTOPERFILVAGA_SELECT" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idPublicaPerfilVagaLabel" DefaultValue="0" 
                            Name="idPublicaPerfilVaga" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

