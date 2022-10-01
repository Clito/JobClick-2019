<%@ Page Language="VB" MasterPageFile="../_zoya/zoya.master" AutoEventWireup="false" CodeFile="pesquisaZoya.aspx.vb" Inherits="_candidato_pesquisaZoya" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoyaUser" 
                    Text="Encontre os profissionais no Zoya "></asp:Label>
                    
    <br />
    <asp:Label ID="LabelMensagem" runat="server"></asp:Label>
    <br />
    
    <table runat="server" id="tablemsnOK" visible="false" cellpadding="0" 
        cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msnOK">
        <tr>
            <td align="center">
                Este profissional já faz parte de seu grupo de amigos.
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/pesquisaZoya.aspx">ok</asp:HyperLink>
                                                </td>
        </tr>
    </table>
        
    <table runat="server" id="tablemsn" visible="false" cellpadding="0" cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msn">
        <tr>
            <td align="center">
                O seu convite foi enviado com sucesso, aguarde uma resposta deste profissional.
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/pesquisaZoya.aspx">ok</asp:HyperLink>
                                                </td>
        </tr>
    </table>
    <table runat="server" id="tablemsnerror" visible="false" cellpadding="0" cellspacing="0" style="width: 100%" class="ZoyaPesquisa_msn_error">
        <tr>
            <td align="center">
                O seu convite já foi enviado para este profissional, aguarde por uma resposta.
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Zoya_msn" 
                    NavigateUrl="~/_candidato/pesquisaZoya.aspx">ok</asp:HyperLink>
                                                </td>
        </tr>
    </table>
    <table runat="server" id="tbG" cellpadding="0" cellspacing="0" class="ZoyaPesquisa">
        <tr>
            <td>
                <asp:Label ID="LabelTitPesquisa" runat="server" CssClass="textBold" 
                    Text="Pesquisa por nome ou e-mail"></asp:Label>
                <br />
                <br />
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                Informe o nome do profissional ou parte do nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                    ControlToValidate="nomeTextBox" Display="Dynamic" ErrorMessage="*" 
                                                                    SetFocusOnError="True" ValidationGroup="nome"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCad" ValidationGroup="nome"></asp:TextBox>
                                                            </td>
                                                            <td>
                            <asp:ImageButton ID="IBPesquisaNome" runat="server" 
                                ImageUrl="~/images/zoya/pesquisa.gif" ValidationGroup="nome" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                Informe o e-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="emailTextBox" 
                                                                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                                                    ValidationGroup="email"></asp:RequiredFieldValidator>
                                                            </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 370px">
                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" ValidationGroup="email"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="IBPesquisaEmail" runat="server" 
                                ImageUrl="~/images/zoya/pesquisa.gif" ValidationGroup="email" />
                        </td>
                    </tr>
                </table>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="nomeTextBox"
                                    Display="Dynamic" ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"
                                    SetFocusOnError="True" 
                    ValidationExpression="^[a-zA-Z0-9!¡$%&/\()=?¿*+-_{};:,áéíóú'.\s][^>][^<]{3,50}$" 
                    ValidationGroup="nome"></asp:RegularExpressionValidator>                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="emailTextBox"
                                    Display="Dynamic" ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"
                                    SetFocusOnError="True" 
                    ValidationExpression="^[a-zA-Z0-9!¡$%&/\()=?¿*+-_{};:,áéíóú'.\s][^>][^<]{3,50}$" 
                    ValidationGroup="email"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="publicarLabelRES" runat="server" Visible="False"></asp:Label>
                <asp:DataList ID="DataListPesquisaG" runat="server" DataKeyField="idZoya" 
                    DataSourceID="SqlPesquisaEmail" Width="487px">
                    <ItemTemplate>
                        <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                            Visible="False" />
                        <asp:Label ID="idCadastroUserLabel" runat="server" 
                            Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                        <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                        <br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/pesquisa.gif" />
                        <asp:LinkButton ID="NomeResponsavelLinkButton" runat="server" 
                            CssClass="textBold" Text='<%# Eval("NomeResponsavel") %>'></asp:LinkButton>
                        <asp:Label ID="NomeResponsavelLabel" runat="server" CssClass="textBold" 
                            Text='<%# Eval("NomeResponsavel") %>' Visible="False" />
                        <br />
                        <asp:Label ID="dsGeralLabel" runat="server" Text='<%# Eval("dsGeral") %>' />
                        <br />
                        <asp:Label ID="emailRecadosLabel" runat="server" 
                            Text='<%# Eval("emailRecados") %>' />
                        <br />
                        <br />
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td style="width: 375px">
                                    <asp:Label ID="publicarLabel" runat="server" Text='<%# Eval("publicar") %>' />
                                </td>
                                <td>
                                    <asp:ImageButton ID="IBConvite" runat="server" 
                                        ImageUrl="~/images/zoya/convite.gif" ValidationGroup="myConvite" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    <table runat="server" class="ZoyaPesquisa_msn_error" id="tablePublicado" visible="false" cellpadding="0"  cellspacing="0">
        <tr>
            <td align="center">
                <b>Aviso:</b> 
                <br />
                Para utilizar a pesquisa de profissionais será 
                necessário ter seu profile publicado.<br />
                [
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    PostBackUrl="~/_candidato/zoyaview.aspx">Clique aqui</asp:LinkButton>
                ] e altere o status de seu profile para (Publicar)</td>
        </tr>
    </table>
    
    <table runat="server" id="notFound" visible="True" cellpadding="0" 
        cellspacing="0" class="ZoyaPesquisa_msn_error">
        <tr>
            <td align="center">
                
                                                <asp:Label ID="msnPsqLabel" runat="server"></asp:Label>
                
                                                </td>
        </tr>
    </table>
        
    <asp:SqlDataSource ID="SqlPesquisaNome" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspPesquisaZoya_Nome" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="nomeTextBox" Name="nome" PropertyName="Text" 
                Type="String" />
            <asp:SessionParameter Name="idZoya" SessionField="idZoya" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPesquisaEmail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspPesquisaZoya_Email" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="emailTextBox" Name="email" PropertyName="Text" 
                Type="String" />
            <asp:SessionParameter DefaultValue="" Name="idZoya" SessionField="idZoya" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

