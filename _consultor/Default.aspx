<%@ Page Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_empresa_Default" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
    <asp:Label ID="idRH_gestorLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblStatus" runat="server"></asp:Label>
    <asp:Label ID="msg" runat="server"></asp:Label>
                <asp:Label ID="SetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Panel ID="PanelAvisoCredito" runat="server">
                    <table cellpadding="5" cellspacing="5" ID="Aviso" align="center">
                        <tr>
                            <td align="left" visible="False">
                                <asp:Label ID="LabelAviso" runat="server" CssClass="msn" 
                                    Text="Todos os seus créditos já foram utilizados."></asp:Label>
                            </td>
                            <td align="right" visible="False">
                                <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                    ImageUrl="~/images/close.png" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idUser" DataSourceID="SqlDataSourceDadosAcesso"
                    Width="100%">
                    <ItemTemplate>
                        <span style="color: rgb(80, 80, 80); font-family: Verdana; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(230, 240, 240); display: inline !important; float: none; ">
                        Login em:</span>
                        <asp:Label ID="dataultimoacessLabel" runat="server" Text='<%# Eval("dataultimoacess") %>'></asp:Label>
                        | nº acesso(s):
                        <asp:Label ID="contadorLabel" runat="server" Text='<%# Eval("contador") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:DataList>
    <br />
    <br />
    <table width="720" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/h26.gif" /></td>
                <td width="694">
                <asp:DataList ID="DataListEmpresaFilha" runat="server" DataKeyField="idCadastroEmpresa" 
                    DataSourceID="SqlEmpresaFilha" Width="100%">
                    <ItemTemplate>
                        <asp:Label ID="EmpresaLabel" runat="server" 
                            Text="Você está trabalhando com a empresa: "></asp:Label>
                        <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                            Font-Bold="True" CssClass="msnOK" />
                    </ItemTemplate>
                </asp:DataList>
                    <asp:Label ID="msnLabel" runat="server" CssClass="msn"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonListEmpresaFilha" runat="server" 
                    DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                    DataValueField="idCadastroEmpresa" AutoPostBack="True" RepeatColumns="2" 
                        Width="100%" Visible="False">
                </asp:RadioButtonList>
                    
                    <asp:GridView ID="GridViewAtr" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" DataKeyNames="ID" DataSourceID="SqlAtribuicao" 
                        GridLines="Horizontal" Width="100%" Font-Names="Tahoma" Font-Size="7pt">
                        <AlternatingRowStyle BackColor="#F2F2F2" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                Visible="False" />
                            <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" 
                                SortExpression="idTypeUser" Visible="False" />
                            <asp:BoundField DataField="nome" HeaderText="Consultor" SortExpression="nome" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:TemplateField HeaderText="Protocolo" SortExpression="Protocolo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Protocolo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLinkProtocolo" runat="server" 
                                        NavigateUrl='<%# Eval("URLRedirect") %>' Text='<%# Eval("Protocolo") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                            <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                SortExpression="idRH_Gestor" Visible="False" />
                            <asp:BoundField DataField="VISUALIDO" HeaderText="V" 
                                SortExpression="VISUALIDO" />
                            <asp:TemplateField HeaderText="P" SortExpression="PUBLICADO" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PUBLICADO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelP" runat="server" Text='<%# Bind("PUBLICADO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CANDIDATURAS" HeaderText="CE" 
                                SortExpression="CANDIDATURAS" />
                            <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                                SortExpression="nmempresa" />
                            <asp:TemplateField HeaderText="CORTEXTO" SortExpression="CORTEXTO" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CORTEXTO") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelCORTEXTO" runat="server" Text='<%# Bind("CORTEXTO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <br />
                    <asp:Label ID="LabelLegenda" runat="server" Font-Names="Tahoma" 
                        Text="&lt;b&gt;V&lt;/b&gt;: - Visualizações da vaga pelo JOBCLICK | &lt;b&gt;CE&lt;/b&gt;: - Candidaturas Espontâneas vindas do JOBCLICK"></asp:Label>
                    <br />
                    <table cellpadding="2" cellspacing="2">
                        <tr>
                            <td>
                                <asp:Image ID="ImageST0" runat="server" 
                                    ImageUrl="~/images/empresa/_statusBRANCO.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelSt0" runat="server" Font-Names="Tahoma" 
                                    Text="Processo Seletivo Finalizado."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="ImageST1" runat="server" 
                                    ImageUrl="~/images/empresa/_statusVERMELHO.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelSt1" runat="server" Font-Names="Tahoma" 
                                    Text="Levantamento do Perfil da Vaga preparado, aguardando a publicação da vaga."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="ImageST2" runat="server" 
                                    ImageUrl="~/images/empresa/_statusVERDE.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelSt2" runat="server" Font-Names="Tahoma" 
                                    Text="Processo Seletivo em andamento, captação de Currículos ATIVADO."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="ImageST3" runat="server" 
                                    ImageUrl="~/images/empresa/_statusAMARELO.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelSt3" runat="server" Font-Names="Tahoma" 
                                    Text="Processo Seletivo em andamento, captação de Currículos DESATIVADO."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    
                    <br />
                    <table id="linha" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td bgcolor="Gray">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/empresa/1px.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonAgenda" runat="server" CausesValidation="False" 
                                                ImageUrl="~/images/empresa/btagenda.png" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="Gray">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/empresa/1px.png" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </td>
            </tr>
    </table> 
    <asp:SqlDataSource ID="SqlDataSourceDadosAcesso" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="_USP_LOGIN_DADOS" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idUser" SessionField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
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
    <asp:SqlDataSource ID="SqlAtribuicao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_ATRIBUICAO_CONSULTORES" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                </asp:Content>

