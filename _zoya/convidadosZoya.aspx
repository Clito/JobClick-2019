<%@ Page Language="VB" MasterPageFile="~/_zoya/zoya.master" AutoEventWireup="false" CodeFile="convidadosZoya.aspx.vb" Inherits="_candidato_convidadosZoya" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoyaUser" 
                    Text="Profissionais que fazem parte de seu grupo (Zoya)"></asp:Label>
    <br />
    <br />
    <table runat="server" id="tablemsnOK" visible="false" cellpadding="0" 
        cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msnOK">
        <tr>
            <td align="center">
                &nbsp;<asp:Label ID="lblmsn" runat="server" 
                    Text="Sua mensagem foi enviada com sucesso!."></asp:Label>
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/convidadosZoya.aspx">ok</asp:HyperLink>
                                                </td>
        </tr>
    </table>    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idOutlookZoya" 
        DataSourceID="SqlOutlookZoya" DefaultMode="Insert">
        <EditItemTemplate>
            idOutlookZoya:
            <asp:Label ID="idOutlookZoyaLabel1" runat="server" 
                Text='<%# Eval("idOutlookZoya") %>' />
            <br />
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
            msnRES:
            <asp:TextBox ID="msnRESTextBox" runat="server" Text='<%# Bind("msnRES") %>' />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="LabelNomeResponsavel" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="20px" />
            <asp:TextBox ID="idCadastroUserRTextBox" runat="server" 
                Text='<%# Bind("idCadastroUserR") %>' Visible="False" Width="18px" />
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' 
                Visible="False" Width="16px" />
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' 
                Visible="False" Width="17px" />
            <br />
            Escreva sua mensagem:&nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="msnTextBox" 
                Display="Dynamic" ErrorMessage="* Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="msnTextBox" runat="server" CssClass="InputCad" Height="81px" 
                Text='<%# Bind("msn") %>' TextMode="MultiLine" Width="500px" />
            <br />
            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Insert" 
                ImageUrl="~/images/empresa/enviar.gif" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                CommandName="Cancel" ImageUrl="~/images/empresa/fechar.gif" 
                onclick="ImageButton3_Click" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
                
            
                
                <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="idZoyaZoya" 
        DataSourceID="SqlGridZoya" Width="512px" AllowPaging="True" 
        BorderStyle="None" CellPadding="1" GridLines="None" ShowHeader="False">
                    <PagerSettings Position="Top" />
                    <Columns>
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/images/pesquisa.gif" 
                            Text="Button">
                            <ItemStyle Width="9px" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="idZoya" HeaderText="idZoya" SortExpression="idZoya" 
                            Visible="False" />
                        <asp:BoundField DataField="idZoyaZoya" HeaderText="idZoyaZoya" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idZoyaZoya" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" 
                            SortExpression="idCadastroUser" Visible="False" />
                        <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                            Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                            SortExpression="idcurriculo" Visible="False" />
                        <asp:BoundField DataField="dsGeral" HeaderText="dsGeral" 
                            SortExpression="dsGeral" Visible="False" />
                        <asp:BoundField DataField="emailRecados" HeaderText="emailRecados" 
                            SortExpression="emailRecados" Visible="False" />
                        <asp:BoundField DataField="NomeResponsavel" HeaderText="NomeResponsavel" 
                            SortExpression="NomeResponsavel" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="publicar" 
                            SortExpression="publicar" Visible="False" />
                        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True">
                            <ItemStyle Width="80px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
    <table runat="server" id="tablemsnerror" visible="true" cellpadding="0" cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msn_error">
        <tr>
            <td align="center">
                Ainda não foi adicionado nenhum profissional em sua lista de relacionamentos.
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/pesquisaZoya.aspx">ok</asp:HyperLink>
                                                </td>
        </tr>
    </table>                        
                    </EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="#F4F4F4" />
    </asp:GridView>
    <br />
                <asp:DataList ID="DataListPesquisaG" runat="server" DataKeyField="idCadastroUser" 
                    DataSourceID="SqlAmigosZoya" Width="520px" 
        BorderColor="#CCCCCC" BorderStyle="Dashed" BorderWidth="1px">
                    <ItemTemplate>
                        <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                            Visible="False" />
                        <asp:Label ID="idCadastroUserLabel" runat="server" 
                            Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                        <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="idZoyaZoyaLabel" runat="server" Text='<%# Eval("idZoyaZoya") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                        <asp:Label ID="NomeResponsavelLabel" runat="server" CssClass="textBold" 
                            Text='<%# Eval("NomeResponsavel") %>' Visible="False" />
                        <asp:Label ID="idZoyaRelLabel" runat="server" Text='<%# Eval("idZoyaRel") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="idCadastroUserRLabel" runat="server" 
                            Text='<%# Eval("idCadastroUserR") %>' Visible="False"></asp:Label>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/pesquisa.gif" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="NomeResponsavelLinkButton" runat="server" 
                                        CssClass="textBold" Text='<%# Eval("NomeResponsavel") %>'></asp:LinkButton>
                                    <br />
                                    <asp:Label ID="dsGeralLabel" runat="server" Text='<%# Eval("dsGeral") %>' />
                                    <br />
                                    <asp:Label ID="emailRecadosLabel" runat="server" 
                                        Text='<%# Eval("emailRecados") %>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="publicarLabel" runat="server" Text='<%# Eval("publicar") %>' />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="2" cellspacing="2" align="right">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButtonDp" runat="server" 
                                        ImageUrl="~/images/zoya/depoimento.gif" CommandName="D" 
                                        oncommand="myCommand" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" ImageUrl="~/images/zoya/recado.gif" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonDEL" runat="server" 
                                        ImageUrl="~/images/zoya/excluirAz.gif" 
                                        onclientclick="return confirm(&quot;Quer realmente excluir este profissional de sua lista de convidados?&quot;)" 
                                        oncommand="myCommand" CommandName="E" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                
            
                
    <asp:FormView ID="FormViewDEP" runat="server" DataKeyNames="idDepoimentosZoya" 
        DataSourceID="SqlDepoimento" DefaultMode="Insert" Visible="False" Width="518px">
        <EditItemTemplate>
            idDepoimentosZoya:
            <asp:Label ID="idDepoimentosZoyaLabel1" runat="server" 
                Text='<%# Eval("idDepoimentosZoya") %>' />
            <br />
            idCadastroUser:
            <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                Text='<%# Bind("idCadastroUser") %>' />
            <br />
            idCadastroUserD:
            <asp:TextBox ID="idCadastroUserDTextBox" runat="server" 
                Text='<%# Bind("idCadastroUserD") %>' />
            <br />
            idCadastroEmpresa:
            <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresa") %>' />
            <br />
            txdepoimento:
            <asp:TextBox ID="txdepoimentoTextBox" runat="server" 
                Text='<%# Bind("txdepoimento") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="17px" />
            <asp:TextBox ID="idCadastroUserDTextBox" runat="server" 
                Text='<%# Bind("idCadastroUserD") %>' Visible="False" Width="21px" />
            <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="24px" />
            <br />
            Seu depoimento:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                runat="server" ControlToValidate="txdepoimentoTextBox" Display="Dynamic" 
                ErrorMessage=" * Obrigatório o preenchimento deste campo"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txdepoimentoTextBox" runat="server" CssClass="InputCad" 
                Height="100px" Text='<%# Bind("txdepoimento") %>' TextMode="MultiLine" 
                Width="512px" />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Enviar depoimento" />
            &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" 
                onclick="InsertCancelButton_Click" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            idDepoimentosZoya:
            <asp:Label ID="idDepoimentosZoyaLabel" runat="server" 
                Text='<%# Eval("idDepoimentosZoya") %>' />
            <br />
            idCadastroUser:
            <asp:Label ID="idCadastroUserLabel" runat="server" 
                Text='<%# Bind("idCadastroUser") %>' />
            <br />
            idCadastroUserD:
            <asp:Label ID="idCadastroUserDLabel" runat="server" 
                Text='<%# Bind("idCadastroUserD") %>' />
            <br />
            idCadastroEmpresa:
            <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                Text='<%# Bind("idCadastroEmpresa") %>' />
            <br />
            txdepoimento:
            <asp:Label ID="txdepoimentoLabel" runat="server" 
                Text='<%# Bind("txdepoimento") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
                
            
                
    <br />
                
            
                
                <asp:Label ID="publicarLabelRES" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idZoyaConvLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idGeralLabel" runat="server" Visible="False"></asp:Label>
                <br />
    <asp:SqlDataSource ID="SqlAmigosZoya" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspAmigosZoya" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="idZoyaZoya" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:SessionParameter Name="idZoya" SessionField="idZoya" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlOutlookZoya" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbOutlookZoya] WHERE [idOutlookZoya] = @idOutlookZoya" 
        InsertCommand="INSERT INTO tbOutlookZoya(idCadastroUser, idCadastroUserR, nome, email, msn) VALUES (@idCadastroUser, @idCadastroUserR, @nome, @email, @msn)" 
        SelectCommand="SELECT idOutlookZoya, idCadastroUser, idCadastroUserR, nome, email, msn, msnRES FROM tbOutlookZoya WHERE (idCadastroUser = @idCadastroUser)" 
        
        UpdateCommand="UPDATE tbOutlookZoya SET idCadastroUser = @idCadastroUser, idCadastroUserR = @idCadastroUserR, nome = @nome, email = @email, msn = @msn, msnRES = @msnRES WHERE (idOutlookZoya = @idOutlookZoya)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idZoyaConvLabel" Name="idCadastroUser" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idOutlookZoya" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="idCadastroUserR" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="msn" Type="String" />
            <asp:Parameter Name="msnRES" Type="String" />
            <asp:Parameter Name="idOutlookZoya" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="idCadastroUserR" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="msn" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlGridZoya" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idZoyaRel], [idZoya], [idZoyaZoya], [emailRecados], [NomeResponsavel], [idCadastroUser] FROM [vw_amigosZoya] WHERE ([idZoya] = @idZoya)">
        <SelectParameters>
            <asp:SessionParameter Name="idZoya" SessionField="idZoya" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDepoimento" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbDepoimentosZoya] WHERE [idDepoimentosZoya] = @idDepoimentosZoya" 
        InsertCommand="INSERT INTO [tbDepoimentosZoya] ([idCadastroUser], [idCadastroUserD], [idCadastroEmpresa], [txdepoimento]) VALUES (@idCadastroUser, @idCadastroUserD, @idCadastroEmpresa, @txdepoimento)" 
        SelectCommand="SELECT [idDepoimentosZoya], [idCadastroUser], [idCadastroUserD], [idCadastroEmpresa], [txdepoimento] FROM [tbDepoimentosZoya] WHERE (([idCadastroUserD] = @idCadastroUserD) AND ([idCadastroUser] = @idCadastroUser))" 
        UpdateCommand="UPDATE [tbDepoimentosZoya] SET [idCadastroUser] = @idCadastroUser, [idCadastroUserD] = @idCadastroUserD, [idCadastroEmpresa] = @idCadastroEmpresa, [txdepoimento] = @txdepoimento WHERE [idDepoimentosZoya] = @idDepoimentosZoya">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroUserD" SessionField="idCadastroUser" 
                Type="Int32" />
            <asp:ControlParameter ControlID="idGeralLabel" Name="idCadastroUser" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idDepoimentosZoya" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="idCadastroUserD" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="txdepoimento" Type="String" />
            <asp:Parameter Name="idDepoimentosZoya" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="idCadastroUserD" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="txdepoimento" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

