<%@ Page Language="VB" MasterPageFile="~/_candidato/zoya.master" AutoEventWireup="false" CodeFile="recadoZoya.aspx.vb" Inherits="_candidato_recadoZoya" title="Jobclick" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <br />

                <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoyaUser" 
                    Text="Recados (Zoya)"></asp:Label>

    <br />
    <table runat="server" id="tablemsnOK" visible="false" cellpadding="0" 
        cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msnOK">
        <tr>
            <td align="center">
                <asp:Label ID="msnLabel" runat="server"></asp:Label>
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/recadoZoya.aspx">ok</asp:HyperLink>
                                                </td>
        </tr>
    </table>     

    <table runat="server" id="tableNULL" visible="true" cellpadding="0" 
        cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msnOK">
        <tr>
            <td align="center">
                <asp:Label ID="LabelNULL" runat="server"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/recadoZoya.aspx">Atualizar</asp:HyperLink>
                                                </td>
        </tr>
    </table> 
    
    <asp:DataList ID="DataList1" runat="server" DataKeyField="idOutlookZoya" 
        DataSourceID="SqlOutlookZoyaView" Width="500px">
        <ItemTemplate>
            &nbsp;<asp:Label ID="idOutlookZoyaLabel" runat="server" 
                Text='<%# Eval("idOutlookZoya") %>' Visible="False" />
            <asp:Label ID="idCadastroUserLabel" runat="server" 
                Text='<%# Eval("idCadastroUser") %>' Visible="False" />
            <asp:Label ID="idCadastroUserRLabel" runat="server" 
                Text='<%# Eval("idCadastroUserR") %>' Visible="False" />
            <br />
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("excluir") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nomeLabel" runat="server" CssClass="textBold" 
                            Text='<%# Eval("nome") %>' />
                        &nbsp;(<asp:Label ID="dataLabel" runat="server" Text='<%# Eval("data") %>' />
                        )<asp:Label ID="respondidoLabel" runat="server" 
                            Text='<%# Eval("respondido") %>' Visible="False" />
                        <asp:Label ID="excluirLabel" runat="server" Text='<%# Eval("excluir") %>' 
                            Visible="False" />
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' 
                            Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="msnLabel" runat="server" Text='<%# Eval("msn") %>' />
                    </td>
                </tr> 
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="idOutlookZoya" 
                            DataSourceID="SqlOutlookForm">
                            <EditItemTemplate>
                                <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="24px" />
                                <asp:TextBox ID="idCadastroUserRTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUserR") %>' Visible="False" Width="24px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="msnAlternativo" Display="Dynamic" 
                                    ErrorMessage=" * Campo obrigatório." SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="msnAlternativo" runat="server" CssClass="InputCad" 
                                    Height="100px" Text='<%# Bind("msnRES") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                                <br />
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Update" 
                                    ImageUrl="~/images/empresa/enviar.gif" />
                                &nbsp;&nbsp;
                                <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Cancel" 
                                    ImageUrl="~/images/empresa/fechar.gif" CausesValidation="False" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                idCadastroUser:
                                <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUser") %>' />
                                <br />
                                idCadastroUserR:
                                <asp:TextBox ID="idCadastroUserRTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroUserR") %>' />
                                <br />
                                nome:
                                <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                                <br />
                                email:
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                <br />
                                msn:
                                <asp:TextBox ID="msnTextBox" runat="server" Text='<%# Bind("msn") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                &nbsp;<br />
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Edit" 
                                    ImageUrl="~/images/empresa/responder.gif" />
                                &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" 
                                    ImageUrl="~/images/empresa/excluir.gif" 
                                    onclientclick="return confirm(&quot;Quer excluir este recado de sua lista?&quot;)" />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>                
            </table>
            <asp:SqlDataSource ID="SqlOutlookForm" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                DeleteCommand="DELETE FROM [tbOutlookZoya] WHERE [idOutlookZoya] = @idOutlookZoya" 
                SelectCommand="SELECT idOutlookZoya, idCadastroUser, idCadastroUserR, nome, email, msn, msnRES FROM tbOutlookZoya WHERE (idOutlookZoya = @idOutlookZoya)" 
                UpdateCommand="uspOutlookZoya" UpdateCommandType="StoredProcedure" 
                onupdated="SqlOutlookForm_Updated" ondeleted="SqlOutlookForm_Deleted">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idOutlookZoyaLabel" Name="idOutlookZoya" 
                        PropertyName="Text" Type="Int32" DefaultValue="0" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="idOutlookZoya" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idOutlookZoya" Type="Int32" />
                    <asp:Parameter Name="idCadastroUser" Type="Int32" />
                    <asp:Parameter Name="idCadastroUserR" Type="Int32" />
                    <asp:SessionParameter Name="nome" SessionField="nome" Type="String" />
                    <asp:SessionParameter Name="email" SessionField="emailUser" Type="String" />
                    <asp:Parameter Name="msnRES" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="ImageRecado" runat="server" 
                ImageUrl="~/images/candidato/linhaZoya.gif" />
        </SeparatorTemplate>
    </asp:DataList>
    <br />
    <asp:Label ID="idCadastroUserOUT" runat="server"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlOutlookZoyaView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idOutlookZoya], [idCadastroUser], [idCadastroUserR], [nome], [email], [msn], [respondido], [data], [excluir] FROM [tbOutlookZoya] WHERE ([idCadastroUser] = @idCadastroUser)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>

