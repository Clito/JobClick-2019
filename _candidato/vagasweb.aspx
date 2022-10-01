<%@ Page Language="VB" MasterPageFile="~/_candidato/CurriculoPage.master" AutoEventWireup="false" CodeFile="vagasweb.aspx.vb" Inherits="_candidato_vagasweb" title="Jobclick" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/candidato/titvagaspublicadaWeb.gif" />
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <table width="616" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="590">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idindex" DataSourceID="SqlDataSource1"
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("dsindex") %>' OnClick="TrocaDBconn"></asp:LinkButton><br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="idVagaWeblbl" runat="server" Visible="False"></asp:Label>&nbsp;<table border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td style="height: 13px">
                            Pesquisa de vagas publicadas na Web:&nbsp;</td>
                        <td style="height: 13px">
                            &nbsp;</td>
                        <td style="height: 13px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TBPesquisa" runat="server" CssClass="InputCad" Width="288px"></asp:TextBox></td>
                        <td>
                            <asp:ImageButton ID="IBPesquisa" runat="server" ImageUrl="~/images/layout/pesquisa.gif" />
                        </td>
                        <td>
                            <asp:ImageButton ID="btTodas" runat="server" ImageUrl="~/images/layout/pesquisatodas.gif" /></td>
                    </tr>
                </table>
                <asp:DataList ID="DataList2" runat="server" BorderStyle="None" BorderWidth="0px"
                    DataKeyField="idVagaPublica" DataSourceID="SqlDataSource2" RepeatColumns="2"
                    RepeatDirection="Horizontal" Width="590px">
                    <SeparatorTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/candidato/linhappV.gif" />
                    </SeparatorTemplate>
                    <ItemTemplate>
                        <table border="0" cellpadding="8" cellspacing="8" style="width: 279px">
                            <tr>
                                <td>
                                    <asp:Label ID="titVagaPublicaLabel" runat="server" CssClass="titulo" Text='<%# Eval("titVagaPublica") %>'></asp:Label><br />
                                    <asp:Label ID="dsfuncaoLabel" runat="server" Text='<%# Eval("dsfuncao") %>'></asp:Label><br />
                                    <br />
                                    <asp:Label ID="dsVagaPublicaLabel" runat="server" Text='<%# Eval("dsVagaPublica") %>'></asp:Label><br />
                                    <br />
                                    E-Mail:
                                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>'></asp:Label><br />
                                    Publicada em:
                                    <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>'></asp:Label><br />
                                    <br />
                                    Status:
                                    <asp:Label ID="publicarLabel" runat="server" Text='<%# Eval("publicar") %>'></asp:Label><br />
                                    <asp:Label ID="dsindexLabel" runat="server" Text='<%# Eval("dsindex") %>' Visible="False"></asp:Label><asp:Label
                                        ID="idindexLabel" runat="server" Text='<%# Eval("idindex") %>' Visible="False"></asp:Label>
                                    <br />
                                    <asp:ImageButton ID="ImageWEB" runat="server" ImageUrl="~/images/candidato/bnrEnviarCurriculoWEB.gif" ImageAlign="Right" OnCommand="myCommand" /><br />
                                    <asp:Label ID="idVagaPublicaLabel" runat="server" Text='<%# Eval("idVagaPublica") %>'
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="idfuncaoLabel" runat="server" Text='<%# Eval("idfuncao") %>' Visible="False"></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" />
                </asp:DataList><br />
                <asp:Panel ID="Panel1" runat="server" CssClass="DGVAGAWEBPosition" Visible="False">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/menupq.gif" />
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/candidato/close.gif" CausesValidation="False" ToolTip="Fechar" />
                            </td>
                        </tr>
                    </table>
                    &nbsp;
                    <table id="email" runat="server" border="0" cellpadding="0" cellspacing="0"
                        visible="true">
                        <tr>
                            <td style="width: 100%">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/candidato/titenviaemail.gif" /><br />
                                <asp:Label ID="html" runat="server"></asp:Label><br />
                                <br />
                                Informe o e-mail para envio:<br />
                                <asp:TextBox ID="email_info" runat="server" CssClass="InputCad"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email_info"
                                    Display="Dynamic" ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_info"
                                        Display="Dynamic" ErrorMessage="* Informe e-mail válido!" SetFocusOnError="True"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                                Informe como ficou sabendo da vaga: (Jornal, WebSite ...)<br />
                                <asp:TextBox ID="DsVaga" runat="server" CssClass="InputCad"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DsVaga"
                                    Display="Dynamic" ErrorMessage="* Como você ficou sabendo desta vaga?"></asp:RequiredFieldValidator><br />
                                Informe Código (Anúncio/Vaga):&nbsp;<br />
                                <asp:TextBox ID="codigo" runat="server" CssClass="InputCad"></asp:TextBox><br />
                                <br />
                                Escreva uma apresentação: (Venho por meio desta ... etc.)<br />
                                <asp:TextBox ID="aprTextBox" runat="server" CssClass="InputCad" Height="96px" TextMode="MultiLine"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="aprTextBox"
                                    Display="Dynamic" ErrorMessage="* Escreva uma apresentação para o RH." SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                <br />
                                <asp:ImageButton ID="sisEmail" runat="server" ImageUrl="~/images/candidato/btenviar.gif" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </td> 
        </tr>
    </table> 
    <asp:Label ID="lblIdVagaAberta" runat="server" Visible="False"></asp:Label><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idindex], [dsindex] FROM [tbFuncaoIndex]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idVagaPublica], [idfuncao], [titVagaPublica], [dsVagaPublica], [email], [data], [publicar], [idindex], [dsfuncao], [dsindex] FROM [vwvagasabertas] WHERE ([dsindex] = @dsindex)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idVagaWeblbl" DefaultValue="0" Name="dsindex" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="spPesquisaVaga" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBPesquisa" Name="buscador" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTodas" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT idVagaPublica, idfuncao, titVagaPublica, dsVagaPublica, email, data, publicar, idindex, dsfuncao, dsindex FROM vwvagasabertas">
    </asp:SqlDataSource>
    <br />
    <cc1:DragPanelExtender id="DragPanelExtender1" runat="server" TargetControlID="Panel1">
    </cc1:DragPanelExtender>
    <br />
        
</asp:Content>

