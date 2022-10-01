<%@ Page Language="VB" MasterPageFile="~/MasterPage/HOME_MasterPage.master" AutoEventWireup="false" CodeFile="profissional_jobclick.aspx.vb" Inherits="profissional_jobclick" title="Untitled Page" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 512px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="10" cellspacing="10" width="960px" align="center">
        <tr>
            <td align="left" valign="top" width="960px">
                <asp:Label ID="IniLabel" runat="server" CssClass="Titulo" 
                    Text="Classificados de Profissionais Zoya:)"></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelPublicidade" runat="server"></asp:Label>
                <br />
                <br />
                <table cellpadding="10" cellspacing="10" width="960">
                    <tr>
                        <td class="style1">
                <asp:Label ID="index" runat="server" meta:resourcekey="indexResource1" 
                    Visible="False"></asp:Label>
                <asp:Label ID="LabelCabec" runat="server" CssClass="Titulo" 
                    Text="Índice de profissionais" 
                    meta:resourcekey="LabelCabecResource1"></asp:Label>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idindex" 
                    DataSourceID="Sqlindice" RepeatColumns="30" 
                    meta:resourcekey="DataList1Resource1">
                    <ItemTemplate>
                        <asp:LinkButton ID="LBProfissionais" runat="server" CausesValidation="False" 
                            CommandName="Select" Text='<%# Eval("dsindex") %>' 
                            meta:resourcekey="LinkButton15Resource1"></asp:LinkButton>
                        &nbsp;
                    </ItemTemplate>
                </asp:DataList>
                        </td>
                        <td align="left" width="400">
                                <table cellpadding="4" cellspacing="4" class="BgBUTTOM" __designer:mapid="ad">
                                    <tr __designer:mapid="ae">
                                        <td __designer:mapid="af">
                                            <asp:LinkButton ID="LinkButton10" runat="server" CausesValidation="False" 
                                                CssClass="button" meta:resourcekey="LinkButton10Resource1" 
                                                PostBackUrl="~/_anonimo/cadastroCandidato.aspx">Cadastre-se agora 
                                            gratuitamente!</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="idFuncao" runat="server" Visible="False"></asp:Label>
                <asp:Image ID="Image11" runat="server" ImageUrl="~/image_site/linha960.png" />
                <br />
                <asp:Label ID="idProfileLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="ApresentaLabel" runat="server"></asp:Label>
                <br />
                <asp:Label ID="dsfuncaoLabel" runat="server" CssClass="TituloG"></asp:Label>
                <table cellpadding="5" cellspacing="5" width="960">
                    <tr>
                        <td valign="top" width="560">
                            <asp:Panel ID="PanelPreview" runat="server">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image13" runat="server" 
                                                ImageUrl="~/image_site/classificados.gif" />
                                        </td>
                                        <td valign="top" align="left">
                                            <asp:Label ID="LabelClassificados" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlProfissional" 
                                DataKeyField="idZoya">
                    <ItemTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="68">
                                    <asp:ImageButton ID="IBProfile" runat="server" 
                                        ImageUrl="~/_candidato/foto/profile.gif" CommandName="Select" 
                                        ToolTip="Não possui profile." />
                                </td>
                                <td width="68">
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        ImageUrl="~/_candidato/foto/preview.png" />
                                    <cc1:ModalPopupExtender ID="ImageButton1_ModalPopupExtender" runat="server" 
                                        BackgroundCssClass="backgroundFirstContent" CancelControlID="IBClose" 
                                        DynamicServicePath="" Enabled="True" PopupControlID="PanelProfile" 
                                        TargetControlID="ImageButton1">
                                    </cc1:ModalPopupExtender>
                                </td>
                                <td width="35">
                                    <asp:Image ID="ImageMembro" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                        Width="30px" />
                                </td>
                                <td>
                                    <asp:Label ID="nomeLabel" runat="server" CssClass="textBold" 
                                        Text='<%# Eval("nome") %>' />
                                    <asp:Label ID="privacidade" runat="server" Text='<%# Eval("privacidade") %>' 
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="PanelProfile" runat="server" HorizontalAlign="Left" 
                            Width="500px" BorderStyle="None">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image12" runat="server" ImageUrl="~/image_site/top.gif" />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="IBClose" runat="server" 
                                            ImageUrl="~/image_site/topClose.gif" />
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="10" cellspacing="10" width="100%" bgcolor="White">
                                <tr>
                                    <td bgcolor="White">
                                        <asp:Image ID="ImageDetalhe" runat="server" Height="150px" 
                                            ImageUrl='<%# Eval("foto") %>' />
                                        <br />
                                        <asp:Label ID="nomeLabel0" runat="server" CssClass="Titulo" 
                                            Text='<%# Eval("nome") %>' />
                                        <br />
                                        <asp:Label ID="dsfuncaoLabel" runat="server" CssClass="SubTitulo" 
                                            Text='<%# Eval("dsfuncao") %>' />
                                        <br />
                                        <br />
                                        <asp:Label ID="resumoLabelPainel" runat="server" Text='<%# Eval("resumo") %>' 
                                            Font-Bold="False" Font-Italic="False"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <cc1:DragPanelExtender ID="PanelProfile_DragPanelExtender" runat="server" 
                            DragHandleID="PanelProfile" Enabled="True" TargetControlID="PanelProfile">
                        </cc1:DragPanelExtender>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/image_site/10px.png" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/image_site/linha500.png" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/image_site/10px.png" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                            Visible="False" />
                        <asp:Label ID="resumoLabel" runat="server" Text='<%# Eval("resumo") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="privacidadeLabel" runat="server" 
                            Text='<%# Eval("privacidade") %>' Visible="False" />
                        <asp:Label ID="sexoLabel" runat="server" Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
                        </td>
                        <td valign="top" width="400" align="left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BorderColor="#CCCCCC" BorderStyle="None" DataKeyNames="idfuncao,dsfuncao" 
                    DataSourceID="SqllistaProfissoes" meta:resourcekey="GridView1Resource1" Width="400px" 
                                BorderWidth="1px" GridLines="None" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="Contador" 
                            meta:resourceKey="BoundFieldResource1" SortExpression="Contador" 
                            Visible="False">
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="Select" DataTextField="dsfuncao" Text="Button" 
                            HeaderText="Profissionais selecionados">
                            <HeaderStyle CssClass="TituloG" HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="dsfuncao" HeaderText="dsfuncao" 
                            meta:resourceKey="BoundFieldResource2" SortExpression="dsfuncao" 
                            Visible="False">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dsindex" HeaderText="dsindex" 
                            meta:resourceKey="BoundFieldResource3" SortExpression="dsindex" 
                            Visible="False" />
                        <asp:BoundField DataField="idindex" HeaderText="idindex" 
                            meta:resourceKey="BoundFieldResource4" SortExpression="idindex" 
                            Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <table ID="Classificados" cellpadding="2" cellspacing="2">
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="ImageButtonNull" runat="server" 
                                        ImageUrl="~/image_site/psqNULL.png" />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" CssClass="SubTitulo" 
                                        Text="Procure no índice de profissões e encontre &lt;br&gt;os profissionais que estão com seus profile publicados!"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="#EBEBEB" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="Sqlindice" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idindex], [dsindex] FROM [tbFuncaoIndex]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqllistaProfissoes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    SelectCommand="SELECT [dsfuncao], [dsindex], [Contador], [idindex], [idfuncao] FROM [vwu_profissionais_JOBCLICK] WHERE ([idindex] = @idindex)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="index" Name="idindex" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlProfissional" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    
                    SelectCommand="SELECT dsfuncao, dsindex, privacidade, nome, idindex, idfuncao, idZoya, foto, idUser, localPreferencia, disponibilidade, portadorDef, apresentar, resumo, sexo FROM vwu_profissionais_JOBCLICK_FILTROFULL WHERE (idfuncao = @idfuncao) ORDER BY nome">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idFuncao" Name="idfuncao" PropertyName="Text" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>  
    
    <table cellpadding="10" cellspacing="10" width="960px" align="center">
        <tr>
            <td align="left" valign="top" width="960px">&nbsp;<br />
            </td>
        </tr>
    </table>   
</asp:Content>

