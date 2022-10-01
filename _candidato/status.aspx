<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPage.master" AutoEventWireup="false" CodeFile="status.aspx.vb" Inherits="_candidato_status" title="Jobclick" %>

<%@ Register Assembly="am.Charts" Namespace="am.Charts" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/candidato/titstatus.gif" /><br />
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td style="width: 350px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
        DataKeyNames="idcurriculo" DataSourceID="SqlDataSource1" GridLines="None"
        Width="360px">
        <Columns>
            <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" InsertVisible="False"
                ReadOnly="True" SortExpression="idcurriculo" Visible="False" />
            <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" SortExpression="idCadastroUser"
                Visible="False" />
            <asp:BoundField DataField="dscurriculo" HeaderText="Curr&#237;culo" SortExpression="dscurriculo" />
            <asp:BoundField DataField="ididioma" HeaderText="ididioma" SortExpression="ididioma"
                Visible="False" />
            <asp:BoundField DataField="dsidioma" HeaderText="Idioma" SortExpression="dsidioma" />
            <asp:CheckBoxField DataField="publicar" HeaderText="Status" SortExpression="publicar" Visible="False" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select"
                        ImageUrl="~/images/candidato/btchart.gif" OnCommand="GetCommand" Text="Select" />
                </ItemTemplate>
                <ItemStyle Width="19px" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
        <AlternatingRowStyle CssClass="DGBGnot" />
    </asp:GridView>
                <asp:TextBox ID="idcurriculoTextBox" runat="server" Width="40px" Visible="False"></asp:TextBox><asp:TextBox ID="TextBoxCommandName" runat="server" Visible="False" Width="40px"></asp:TextBox><br />
                        <table runat="server" border="0" cellpadding="0" cellspacing="0" id="outlookPanel" visible="false">
                            <tr>
                                <td style="height: 16px"><asp:ImageButton ID="outlookbt" runat="server" ImageUrl="~/images/empresa/email.gif" /></td>
                                <td style="height: 16px">
                                    &nbsp;<asp:LinkButton ID="outlooktxt" runat="server">Existe mensagem para este currículo</asp:LinkButton></td>
                            </tr>
                        </table>
                        <br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idcurriculo" DataSourceID="SqlDataSource3"
                    Width="360px">
                    <SeparatorTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/candidato/separador.gif" />
                    </SeparatorTemplate>
                    <HeaderTemplate>
                <asp:Label ID="lbCabec1" runat="server" CssClass="titulo" Text="Status geral de visualização"></asp:Label>
                        <br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/candidato/separador.gif" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="dsfuncaoLabel" runat="server" CssClass="tituloVaga" 
                            Text='<%# Eval("dsfuncao") %>'></asp:Label>
                        <br />
                        <asp:Label ID="codvagaLabel" runat="server" Text='<%# Eval("codvaga") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label8" runat="server" CssClass="cur01st" Text="CV:"></asp:Label>
                        <asp:Label
                            ID="dscurriculoLabel" runat="server" Text='<%# Eval("dscurriculo") %>' 
                            Font-Bold="False"></asp:Label><br />
                        <asp:Label ID="contador_emailLabel" runat="server" Text='<%# Eval("contadorEmail") %>'></asp:Label><br />
                        <asp:Label ID="lblContadorRES" runat="server" Text='<%# Eval("contador") %>'></asp:Label><br />
                        <asp:Label ID="lblContador" runat="server" Text='<%# Eval("contador", "{0:D}") %>'
                                    Visible="False"></asp:Label><asp:Label ID="lblliberaRH" runat="server" Text='<%# Eval("liberarRH") %>'
                                        Visible="False"></asp:Label>
                        <asp:Label
                                ID="lblliberaCandidato" runat="server" Text='<%# Eval("liberarCandidato") %>'
                                Visible="False"></asp:Label>
                        <asp:Label ID="publicarLabel" runat="server" Text='<%# Eval("publicar") %>' Visible="False"></asp:Label><br />
                        <asp:Label ID="Label7" runat="server" CssClass="cur01st" Text="Apresentação pessoal sua: "></asp:Label><br />
                        <asp:Label ID="lblapresentacao" runat="server" Text='<%# Eval("apresentacao") %>'></asp:Label><br />
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/candidato/separador.gif" /><br />
                        <asp:Label ID="Label4" runat="server" CssClass="cur01st" Text="Mensagem do RH: "></asp:Label>
                        <br />
                        <asp:Label ID="msnRHLabel" runat="server" Text='<%# Eval("msnRH") %>'></asp:Label><br />
                        <br />
                        <asp:Label ID="Label5" runat="server" CssClass="cur01st" Text="Status:"></asp:Label><br />
                        <asp:Label ID="GerarProcessoLabel" runat="server" Text='<%# Eval("GerarProcesso") %>'></asp:Label><br />
                        <br />
                        <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Aberta em: "></asp:Label><asp:Label ID="data_iniLabel" runat="server" Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label><br />
                        <asp:Label ID="Label6" runat="server" CssClass="cur01st" Text="Previsão para encerramento: "></asp:Label><asp:Label ID="data_fimLabel" runat="server" Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label><br />
                        <br />
                        <asp:Label ID="idStatusVagaLabel" runat="server" Text='<%# Eval("idstatusvaga") %>'></asp:Label>
                        <br />
                        <asp:Label ID="diffData" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblComentarioSys" runat="server"></asp:Label><br />
                        <asp:Label ID="lblidRelCandidato_vaga" runat="server" Text='<%# Eval("idRELcandidato_vaga") %>'
                            Visible="False"></asp:Label><br />
                        <asp:LinkButton ID="LBLiberaRH" runat="server" CausesValidation="False" Font-Bold="True"
                            PostBackUrl="~/_candidato/status.aspx" Visible="False">Liberar o RH (Apagar histórico deste processo)</asp:LinkButton><br />
                    </ItemTemplate>
                    <FooterTemplate>
                <cc1:PieChart id="PieChart1" runat="server" Colors="" DataSourceID="SqlDataSource2"
                    DataTitleField="dscurriculo" DataValueField="contador" LegendSpacing="5" LegendTextSize="Small"
                    LegendValuesEnabled="True" LegendWidth="200" PieAngle="20" PieHeight="5" PieRadius="50"
                    SliceAlpha="80" SliceOutlineAlpha="10" Width="360px" PieTop="150" 
                            SliceOutlineColor="" NoDataErrorMessage="Sem registro.">
                </cc1:PieChart>
                    </FooterTemplate>
                </asp:DataList></td> 
        </tr>
    </table>     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT tbCurriculo.idcurriculo, tbCurriculo.idCadastroUser, tbCurriculo.dscurriculo, tbCurriculo.ididioma, tbidioma.dsidioma, tbCurriculo.publicar FROM tbCurriculo INNER JOIN tbidioma ON tbCurriculo.ididioma = tbidioma.ididioma WHERE (tbCurriculo.idCadastroUser = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT [idcurriculo], [idCadastroUser], [dscurriculo], [contador] FROM [tbCurriculo] WHERE ([idCadastroUser] = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT dscurriculo, codvaga, dsfuncao, msnRH, GerarProcesso, contador, dsidioma, idcurriculo, idCadastroUser, contadorEmail, publicar, data_ini, data_fim, idstatusvaga, liberarCandidato, liberarRH, apresentacao, idRELcandidato_vaga FROM vwStatusCurriculo WHERE (idcurriculo = @idcurriculo) AND (idCadastroUser = @idCadastroUser)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idcurriculoTextBox" DefaultValue="0" Name="idcurriculo"
                PropertyName="Text" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;
    <br />
</asp:Content>

