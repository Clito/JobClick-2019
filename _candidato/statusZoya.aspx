<%@ Page Language="VB" MasterPageFile="~/_candidato/zoya.master" AutoEventWireup="false" CodeFile="statusZoya.aspx.vb" Inherits="_candidato_statusZoya" title="Jobclick" %>

<%@ Register assembly="am.Charts" namespace="am.Charts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" BorderStyle="None" 
        DataSourceID="SqlChart" GridLines="Horizontal" ShowHeader="False" 
        Width="219px" BorderWidth="0px" CellPadding="0">
        <AlternatingRowStyle BackColor="#F2F2F2" />
    </asp:GridView>
    <br />
    <cc1:PieChart ID="PieChart1" runat="server" 
        BalloonTextFormatString="{title}&lt;br&gt;{value}" BalloonTextSize="Smaller" 
        Colors="" DataLabelFormatString="{percents}%" DataSourceID="SqlChart" 
        DataTitleField="DS" DataValueField="CT" Height="295px" 
        LegendBorderColor="#EEEEEE" LegendMargins="0" LegendSpacing="5" 
        PullOutEffect="Strong" Width="544px">
    </cc1:PieChart>
    
    <br />
    
    <table class="ZoyaPesquisa_msnOK" runat="server" id="tbOK" visible="false" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">Este profissional foi adicionado em seu grupo de amigos. Veja em 
                (
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/_candidato/convidadosZoya.aspx">Convidados</asp:HyperLink>
                )</td>
        </tr>
    </table>
        
    <br />
        
    <asp:DataList ID="DataList1" runat="server" DataKeyField="idZoyaConvite" 
        DataSourceID="SqlConvite" Width="541px">
        <ItemTemplate>
            <asp:Label ID="idZoyaConviteLabel" runat="server" 
                Text='<%# Eval("idZoyaConvite") %>' Visible="False" />
            <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                Visible="False" />
            <asp:Label ID="idCadastroUserLabel" runat="server" 
                Text='<%# Eval("idCadastroUser") %>' Visible="False" />
            <asp:Label ID="idCadastroUserRLabel" runat="server" 
                Text='<%# Eval("idCadastroUserR") %>' Visible="False" />
            <br />
            <asp:Label ID="NomeResponsavelLabel" runat="server" CssClass="textBold" 
                Text='<%# Eval("NomeResponsavel") %>' />
            <br />
            <asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
            <br />
            <br />
            <asp:Label ID="dsGeralLabel" runat="server" Text='<%# Eval("dsGeral") %>' />
            <br />
            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td style="width: 293px">
                        <asp:Label ID="msnLabel" runat="server" Text='<%# Eval("msn") %>' />
                    </td>
                    <td>
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="idZoyaConvite" 
                            DataSourceID="SqlConviteEdit">
                            <EditItemTemplate>
                                &nbsp;<asp:Label ID="idZoyaConviteLabel1" runat="server" 
                                    Text='<%# Eval("idZoyaConvite") %>' Visible="False" />
                                &nbsp;<asp:TextBox ID="idZoyaTextBox" runat="server" Text='<%# Bind("idZoya") %>' 
                                    Visible="False" Width="17px" />
                                <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="21px" />
                                <asp:TextBox ID="idCadastroUserRTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUserR") %>' Visible="False" Width="18px" />
                                <asp:TextBox ID="msnTextBox" runat="server" Text='<%# Bind("msn") %>' 
                                    Visible="False" Width="16px" />
                                <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                                    Visible="False" Width="16px" />
                                <br />
                                <table cellpadding="0" cellspacing="0" class="Zoya_msn" style="width: 89%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelAviso" runat="server" 
                                                Text="Você irá adicionar este usuário em sua lista de profissionais convidados.&lt;br&gt;&lt;br&gt; &lt;b&gt;Você confirma?&lt;/b&gt;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Update" 
                                    ImageUrl="~/images/zoya/confirmar.gif" />
                                &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandName="Cancel" 
                                    ImageUrl="~/images/zoya/cancelar.gif" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                idZoya:
                                <asp:TextBox ID="idZoyaTextBox" runat="server" Text='<%# Bind("idZoya") %>' />
                                <br />
                                idCadastroUser:
                                <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUser") %>' />
                                <br />
                                idCadastroUserR:
                                <asp:TextBox ID="idCadastroUserRTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUserR") %>' />
                                <br />
                                msn:
                                <asp:TextBox ID="msnTextBox" runat="server" Text='<%# Bind("msn") %>' />
                                <br />
                                data:
                                <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Edit" 
                                    ImageUrl="~/images/zoya/aceitar.gif" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" 
                                    ImageUrl="~/images/zoya/rejeitar.gif" 
                                    
                                    onclientclick="return confirm(&quot;Você está certo de que quer excluir este convite?&quot;)" />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlConviteEdit" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                DeleteCommand="DELETE FROM [tbZoyaConvite] WHERE [idZoyaConvite] = @idZoyaConvite" 
                InsertCommand="INSERT INTO [tbZoyaConvite] ([idZoya], [idCadastroUser], [idCadastroUserR], [msn], [data]) VALUES (@idZoya, @idCadastroUser, @idCadastroUserR, @msn, @data)" 
                ondeleted="SqlConviteEdit_Deleted" onupdated="SqlConviteEdit_Updated" 
                SelectCommand="SELECT [idZoyaConvite], [idZoya], [idCadastroUser], [idCadastroUserR], [msn], [data] FROM [tbZoyaConvite] WHERE ([idZoyaConvite] = @idZoyaConvite)" 
                UpdateCommand="UPDATE [tbZoyaConvite] SET [idZoya] = @idZoya, [idCadastroUser] = @idCadastroUser, [idCadastroUserR] = @idCadastroUserR, [msn] = @msn, [data] = @data WHERE [idZoyaConvite] = @idZoyaConvite">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idZoyaConviteLabel" Name="idZoyaConvite" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="idZoyaConvite" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idZoya" Type="Int32" />
                    <asp:Parameter Name="idCadastroUser" Type="Int32" />
                    <asp:Parameter Name="idCadastroUserR" Type="Int32" />
                    <asp:Parameter Name="msn" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                    <asp:Parameter Name="idZoyaConvite" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="idZoya" Type="Int32" />
                    <asp:Parameter Name="idCadastroUser" Type="Int32" />
                    <asp:Parameter Name="idCadastroUserR" Type="Int32" />
                    <asp:Parameter Name="msn" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </ItemTemplate>
        <HeaderTemplate>
            <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoyaUser" 
                Text="Solicitações pendentes (Zoya)"></asp:Label>
        </HeaderTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlChart" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspChartZoya" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" 
                SessionField="idCadastroUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConvite" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT tbZoyaConvite.idZoyaConvite, tbZoyaConvite.idZoya, tbZoyaConvite.idCadastroUser, tbZoyaConvite.idCadastroUserR, tbZoyaConvite.msn, tbZoyaConvite.data, tbZoya.NomeResponsavel, tbZoya.dsGeral FROM tbZoyaConvite INNER JOIN tbZoya ON tbZoyaConvite.idCadastroUserR = tbZoya.idCadastroUser WHERE (tbZoyaConvite.idCadastroUser = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" 
                SessionField="idCadastroUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

