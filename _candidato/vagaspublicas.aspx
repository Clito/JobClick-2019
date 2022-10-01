<%@ Page Language="VB" MasterPageFile="~/_candidato/CurriculoPage.master" AutoEventWireup="false" CodeFile="vagaspublicas.aspx.vb" Inherits="_candidato_vagaspublicas" title="Jobclick" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/candidato/titvagaspublicadaWeb.gif" />
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <table width="616" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="590">
                <asp:DataList ID="DataList2" runat="server" BorderStyle="None" BorderWidth="0px"
                    DataKeyField="idVagaPublica" DataSourceID="SqlDataSelect" RepeatColumns="1"
                    RepeatDirection="Horizontal" Width="590px">
                    <SeparatorTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/candidato/linhappV.gif" />
                    </SeparatorTemplate>
                    <ItemTemplate>
                        <table border="0" cellpadding="8" cellspacing="8" style="width: 565px">
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
                </asp:DataList>
                <asp:Label ID="msn" runat="server" CssClass="msnOK"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                    DataKeyNames="idVagaPublica" DataSourceID="SqlDataVagas" GridLines="None" 
                    PageSize="15" Width="590px">
                    <PagerSettings Position="TopAndBottom" />
                    <Columns>
                        <asp:BoundField DataField="idVagaPublica" HeaderText="idVagaPublica" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idVagaPublica" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                            SortExpression="idfuncao" Visible="False" />
                        <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="Select" DataTextField="titVagaPublica" 
                            HeaderText="Vaga" Text="Button" Visible="False" />
                        <asp:BoundField DataField="titVagaPublica" HeaderText="Vaga" 
                            SortExpression="titVagaPublica">
                        </asp:BoundField>
                        <asp:BoundField DataField="localTrabalho" HeaderText="Local" 
                            SortExpression="localTrabalho" />
                        <asp:ButtonField CommandName="Select" Text="Detalhes">
                        </asp:ButtonField>
                        <asp:BoundField DataField="dsVagaPublica" HeaderText="dsVagaPublica" 
                            SortExpression="dsVagaPublica" Visible="False" />
                        <asp:BoundField DataField="nroVaga" HeaderText="nroVaga" 
                            SortExpression="nroVaga" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                            Visible="False" />
                        <asp:BoundField DataField="validade" HeaderText="validade" 
                            SortExpression="validade" Visible="False" />
                        <asp:BoundField DataField="referencia" HeaderText="referencia" 
                            SortExpression="referencia" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="publicar" 
                            SortExpression="publicar" Visible="False" />
                    </Columns>
                    <AlternatingRowStyle BackColor="#EEEEEE" />
                </asp:GridView>
                <asp:Label ID="lblIdVagaAberta" runat="server" Visible="False"></asp:Label>
                <br />
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
                                E-mail será enviado para:<br />
                                <asp:TextBox ID="email_info" runat="server" CssClass="InputCad" Enabled="False"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email_info"
                                    Display="Dynamic" ErrorMessage="* Campo obrigatório!" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_info"
                                        Display="Dynamic" ErrorMessage="* Informe e-mail válido!" SetFocusOnError="True"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                                Informe Código (Anúncio/Vaga):&nbsp;<br />
                                <asp:TextBox ID="codigo" runat="server" CssClass="InputCad" Enabled="False"></asp:TextBox><br />
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
                <cc1:DragPanelExtender ID="Panel1_DragPanelExtender" runat="server" 
                    DragHandleID="Panel1" Enabled="True" TargetControlID="Panel1">
                </cc1:DragPanelExtender>
                <br />
                <asp:SqlDataSource ID="SqlDataVagas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    
                    SelectCommand="SELECT idVagaPublica, idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, nroVaga, localTrabalho, email, data, validade, codigo, referencia, publicar, topAn FROM tbVagaPublica WHERE (publicar = @publicar) ORDER BY topAn DESC">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="publicar" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSelect" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    SelectCommand="SELECT idVagaPublica, idfuncao, titVagaPublica, dsVagaPublica, email, data, publicar, idindex, dsfuncao, dsindex FROM vwvagasabertas WHERE (idVagaPublica = @idVagaPublica)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="idVagaPublica" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
        </tr>
    </table>        
</asp:Content>

