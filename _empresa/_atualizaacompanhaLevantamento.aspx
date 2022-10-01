<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_atualizaacompanhaLevantamento.aspx.vb" Inherits="_empresa_perfilVagaAcompanhamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26px"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td>
        <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server"></asp:Label>
        <asp:Label ID="idPerfilVagaLabel" runat="server"></asp:Label>
        <asp:Label ID="idCadastroEmpresaLabel" runat="server"></asp:Label>
                <asp:Label ID="idPublicaPerfilVagaLabel" runat="server" Text="0" 
                    Visible="False"></asp:Label>
                <br />
                <asp:GridView ID="GridViewListaPerfilVaga" runat="server" AutoGenerateColumns="False" 
                    
                    DataKeyNames="idPublicaPerfilVaga,idCadastroEmpresa,idCadastroEmpresaFilha,idRH_Gestor,idRH_Gestor_Filho,idUserEmpresa,Protocolo" 
                    DataSourceID="SqlPerfilVaga" Width="100%" BorderColor="Silver" 
                    BorderStyle="Dotted" BorderWidth="1px" GridLines="Horizontal" 
                    AllowPaging="True" PageSize="5">
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
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Image ID="ImageAviso" runat="server" ImageUrl="~/images/aviso.png" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelAviso" runat="server" 
                                        Text="Não foram enviadas mensagens sobre nenhum Levantamento até o momento."></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idPublicaPerfilVaga" 
                    DataSourceID="SqlPerfilVagaSelect" Width="100%">
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
                    <table ID="FormGestor" cellpadding="10" cellspacing="0" width="100%" runat="server" visible="false">
                        <tr>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" />
                                <br />
                                <asp:Label ID="LabelCabecLevantamento" runat="server" 
                                    Text="Quanto ao Levantamento de Perfil de Vaga:" CssClass="titulo"></asp:Label>
                                &nbsp;<asp:Label ID="ProtocoloLabel" runat="server" CssClass="textoGeral"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="mensagemTextBox" 
                                    ErrorMessage="A sua mensagem é solicitada.">*</asp:RequiredFieldValidator>
                                <asp:Label ID="idLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="LabelResponder" runat="server" 
                                    Text="Responder abaixo seu parecer quanto a aprovação do Levantamento do Perfil da Vaga:"></asp:Label>
                                <br />
                                <asp:TextBox ID="mensagemTextBox" runat="server" CssClass="InputCad" 
                                    Height="200px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Button ID="ButtonAprLevantamento" runat="server" CommandName="Update" 
                                    CssClass="cur01st" onclick="ButtonAprLevantamento_Click" 
                                    Text="Enviar seus comentários, aprovação ou não do Levantamento do Perfil da Vaga" 
                                    Width="540px" />
                    <asp:Button ID="Back" runat="server" CssClass="cur01st" Text="Cancelar" 
                                    CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
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

