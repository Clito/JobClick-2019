<%@ Page Language="VB" MasterPageFile="~/MasterPage/HOME_MasterPage.master" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


.DGVAGAloginPosition
{
	padding-top: 0px;
    padding-right: 0px;
    padding-left: 0px;
    padding-bottom: 0px;
	width: 340px;
    float: inherit;
    z-index: 100;
    position: absolute;
    cursor: move;
    background-color: #FFFFFF;
    filter: alpha(opacity=90);
    opacity: 1;
    top: 260px;
    left: 40%;
}

.CrossButton
{
    cursor: auto;
}
    
.InputCad
{
	border: 1px solid #E0E0E0;
    background-color: #F0F0F0;
	    font-size: 8pt;
	    color: #000000;
	    font-family: Verdana;
	    text-decoration: none;
	    padding-top: 3px;
	    padding-right: 1px;
	    padding-left: 3px;
	    padding-bottom: 1px;
	    cursor: text;
	    font-weight: normal;
	    width: 350px;
	    z-index: 0;
}
.DGBG
{
    font-family: Verdana;
    font-size: 8pt;
    background-color: #FFFFFF;
}
.DGBGnot
{
    font-family: Verdana;
    font-size: 8pt;
    background-color: #F0F0F0;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table cellpadding="10" cellspacing="10" width="960px" align="center">
        <tr>
            <td align="left" valign="top" width="960px">
                <asp:Label ID="idProfileLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="privacidadeLabelOUT" runat="server" Visible="False"></asp:Label>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                <asp:Label ID="LabelCabec" runat="server" CssClass="Titulo" 
                    Text="Profile do profissional no JOBCLICK" 
                    meta:resourcekey="LabelCabecResource1"></asp:Label>
                                                </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            &nbsp;</td>
                        <td>
                                        <asp:ImageButton ID="ImageButtonAdd" runat="server" 
                                            ImageUrl="~/image_site/add.gif" />
                                    </td>
                        <td>
                                        <asp:LinkButton ID="LinkButtonAdicionar" runat="server">Entrar em contato</asp:LinkButton>
                                    </td>
                        <td>
                            &nbsp;</td>
                        <td>
                                        <asp:ImageButton ID="ImageButtonBack" runat="server" 
                                            ImageUrl="~/image_site/psq_new.gif" 
                                            PostBackUrl="~/profissional_jobclick.aspx" />
                                    </td>
                        <td>
                                        <asp:HyperLink ID="HyperLinkPesquisa" runat="server" 
                                            NavigateUrl="~/profissional_jobclick.aspx">Nova Pesquisa</asp:HyperLink>
                                    </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="10" cellspacing="10" width="960">
                    <tr>
                        <td width="600" valign="top">
                            <asp:DataList ID="DataListProfile" runat="server" DataKeyField="idZoya" 
                                DataSourceID="SqlProfile">
                                <ItemTemplate>
                                
                                    <table cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                
                                    <table cellpadding="5" cellspacing="5" width="850px">
                                        <tr>
                                            <td valign="top" width="150">
                                                <asp:Image ID="ImageCandidato" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                                    Width="140px" />
                                            </td>
                                            <td valign="top" width="700">
                                                <asp:Label ID="nomeLabel" runat="server" CssClass="Titulo" 
                                                    Text='<%# Eval("nome") %>' />
                                                <asp:Label ID="privacidadeLabel" runat="server" 
                                                    Text='<%# Eval("privacidade") %>' Visible="False"></asp:Label>
                                                <asp:Label ID="sexoLabel" runat="server" Text='<%# Eval("sexo") %>' 
                                                    Visible="False"></asp:Label>
                                                <br />
                                                <asp:Label ID="dsAreaAtuacaoPLabel" runat="server" CssClass="SubTitulo" 
                                                    Text='<%# Eval("dsAreaAtuacaoP") %>' />
                                                /<asp:Label ID="dsAreaAtuacaoSLabel" runat="server" CssClass="SubTitulo" 
                                                    Text='<%# Eval("dsAreaAtuacaoS") %>' />
                                                <br />
                                                <asp:Label ID="dsfuncaoLabel" runat="server" Text='<%# Eval("dsfuncao") %>' />
                                                <br />
                                                <br />
                                                <asp:Label ID="dsGeralLabel" runat="server" Text='<%# Eval("dsGeral") %>' />
                                                <br />
                                                <br />
                                                <asp:Label ID="dsServicosOferecidosLabel" runat="server" 
                                                    Text='<%# Eval("dsServicosOferecidos") %>' />
                                                <br />
                                                <br />
                                                <asp:Label ID="dsTrabalhosPublicadosLabel" runat="server" 
                                                    Text='<%# Eval("dsTrabalhosPublicados") %>' />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label2" runat="server" Text="Local: "></asp:Label>
                                                <asp:Label ID="localPreferenciaLabel" runat="server" 
                                                    Text='<%# Eval("localPreferencia") %>' style="font-weight: 700" />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <table cellpadding="5" cellspacing="5" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="MultimidiaLabel" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="idZoyaLabel" runat="server" Text='<%# Eval("idZoya") %>' 
                                        Visible="False" />
                                    <asp:Label ID="idCadastroUserLabel" runat="server" 
                                        Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                                    <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                        Visible="False" />
                                    <asp:Label ID="idfuncaoLabel" runat="server" Text='<%# Eval("idfuncao") %>' 
                                        Visible="False" />
                                    <asp:Label ID="idAreaAtuacaoPLabel" runat="server" 
                                        Text='<%# Eval("idAreaAtuacaoP") %>' Visible="False" />
                                    <asp:Label ID="idAreaAtuacaoSLabel" runat="server" 
                                        Text='<%# Eval("idAreaAtuacaoS") %>' Visible="False" />
                                    <asp:Label ID="idcurriculoLabel" runat="server" 
                                        Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                    <asp:Label ID="TipoLabel" runat="server" Text='<%# Eval("Tipo") %>' 
                                        Visible="False" />
                                    <asp:Label ID="apresentarMultimidiaLabel" runat="server" 
                                        Text='<%# Eval("apresentarMultimidia") %>' Visible="False" />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlProfile" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                
                                
                                SelectCommand="SELECT idZoya, idCadastroUser, idUser, idfuncao, idAreaAtuacaoP, idAreaAtuacaoS, idcurriculo, dsGeral, dsServicosOferecidos, dsTrabalhosPublicados, apresentarMultimidia, apresentarCV, apresentarContato, NomeResponsavel, emailRecados, publicar, contadorVisitas, contadorCV, imageZoya, Descricao, Tamanho, Tipo, dsAreaAtuacaoP, dsAreaAtuacaoS, dsfuncao, foto, nome, localPreferencia, privacidade, sexo FROM vwu_profissionais_JOBCLICK_PROFILE WHERE (idZoya = @idZoya)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="idProfileLabel" Name="idZoya" 
                                        PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlMultimidia" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT [idMultimidia], [idCadastroUser], [url], [dsMultimídia] FROM [tbMultimidia] WHERE ([idMultimidia] = @idMultimidia)" 
                        DeleteCommand="DELETE FROM [tbMultimidia] WHERE [idMultimidia] = @idMultimidia" 
                        InsertCommand="INSERT INTO [tbMultimidia] ([idCadastroUser], [url], [dsMultimídia]) VALUES (@idCadastroUser, @url, @dsMultimídia)" 
                        UpdateCommand="UPDATE [tbMultimidia] SET [idCadastroUser] = @idCadastroUser, [url] = @url, [dsMultimídia] = @dsMultimídia WHERE [idMultimidia] = @idMultimidia">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="idMultimidia" QueryStringField="idMultimidia" 
                                Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="idMultimidia" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idCadastroUser" Type="Int32" />
                            <asp:Parameter Name="url" Type="String" />
                            <asp:Parameter Name="dsMultimídia" Type="String" />
                            <asp:Parameter Name="idMultimidia" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idCadastroUser" Type="Int32" />
                            <asp:Parameter Name="url" Type="String" />
                            <asp:Parameter Name="dsMultimídia" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
    
    
    <asp:SqlDataSource ID="SqlUser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT idUser, idcurriculo, dscurriculo, publicar FROM vwuser_pocket WHERE (idUser = @idUser) AND (publicar = @publicar)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidUser" Name="idUser" PropertyName="Text" 
                Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="publicar" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    
    <asp:SqlDataSource ID="SqlVinculo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbRELcandidato_vaga] WHERE [idRELcandidato_vaga] = @idRELcandidato_vaga" 
        InsertCommand="INSERT INTO [tbRELcandidato_vaga] ([idvaga], [idcurriculo], [apresentacao], [msnRH]) VALUES (@idvaga, @idcurriculo, @apresentacao, @msnRH)" 
        SelectCommand="SELECT [idRELcandidato_vaga], [idvaga], [idcurriculo], [apresentacao], [msnRH] FROM [tbRELcandidato_vaga]" 
        UpdateCommand="UPDATE [tbRELcandidato_vaga] SET [idvaga] = @idvaga, [idcurriculo] = @idcurriculo, [apresentacao] = @apresentacao, [msnRH] = @msnRH WHERE [idRELcandidato_vaga] = @idRELcandidato_vaga">
        <DeleteParameters>
            <asp:Parameter Name="idRELcandidato_vaga" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="apresentacao" Type="String" />
            <asp:Parameter Name="msnRH" Type="String" />
            <asp:Parameter Name="idRELcandidato_vaga" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="apresentacao" Type="String" />
            <asp:Parameter Name="msnRH" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDuvida" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbRELduvida_vaga] WHERE [idRELduvida_vaga] = @idRELduvida_vaga" 
        InsertCommand="INSERT INTO [tbRELduvida_vaga] ([idvaga], [idcurriculo], [duvida]) VALUES (@idvaga, @idcurriculo, @duvida)" 
        SelectCommand="SELECT [idRELduvida_vaga], [idvaga], [idcurriculo], [duvida] FROM [tbRELduvida_vaga]" 
        UpdateCommand="UPDATE [tbRELduvida_vaga] SET [idvaga] = @idvaga, [idcurriculo] = @idcurriculo, [duvida] = @duvida WHERE [idRELduvida_vaga] = @idRELduvida_vaga">
        <DeleteParameters>
            <asp:Parameter Name="idRELduvida_vaga" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
            <asp:Parameter Name="idRELduvida_vaga" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idvaga" Type="Int32" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="duvida" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    
    <asp:Panel ID="PanelLogin" runat="server" CssClass="DGVAGAloginPosition" 
        Visible="False" BorderStyle="Groove" BorderWidth="1px" BorderColor="Gray">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td>
                    <asp:Image ID="Image4" runat="server" 
                        ImageUrl="~/images/layout/menuVagas.gif" />
                </td>
                <td>
                    <asp:ImageButton ID="IBClose" runat="server" CausesValidation="False" 
                        ImageUrl="~/images/layout/menuVagasClose.gif" CssClass="CrossButton" />
                </td>
            </tr>
        </table>
        <asp:Image ID="Image2" runat="server" 
            ImageUrl="~/images/layout/bgLoginCompany.gif" />
        <br />

        <table ID="LoginVaga" runat="server" cellpadding="5" cellspacing="5" 
            visible="true" width="340px">
            <tr>
                <td align="left">
                    <br />
                    Usuário (Nickname):<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                        runat="server" ControlToValidate="userTB" Display="Dynamic" ErrorMessage="*" 
                        SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                    
                    <br />
                    
                    <asp:TextBox ID="userTB" runat="server" CssClass="InputCad" 
                        ValidationGroup="login" Width="315px"></asp:TextBox>
                    
                    <br />
                    
                    Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="senhaTB" Display="Dynamic" ErrorMessage="*" 
                        SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                    
                    <br />
                    
                    <asp:TextBox ID="senhaTB" runat="server" CssClass="InputCad" 
                        TextMode="Password" ValidationGroup="login" Width="315px"></asp:TextBox>
                    <br />
                    E-Mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="emailTB" Display="Dynamic" ErrorMessage="*" 
                        SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="emailTB" Display="Dynamic" 
                        ErrorMessage="* Informe um e-mail válido!" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="login"></asp:RegularExpressionValidator>
                    <br />
                    <asp:TextBox ID="emailTB" runat="server" CssClass="InputCad" 
                        ValidationGroup="login" Width="315px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:ImageButton ID="ImageButtonLogin" runat="server" 
                        ImageUrl="~/images/btLoginVaga.gif" ValidationGroup="login" 
                        CssClass="CrossButton" />
                    <br />
                    <asp:Label ID="msn" runat="server" CssClass="msnNOK"></asp:Label>
                </td>
            </tr>
        </table>
        
        <table ID="aprStatus" runat="server" border="0" cellpadding="5" 
            cellspacing="5" visible="false" width="100%">
            <tr>
                <td align="left">
                    <asp:Label ID="lblnome" runat="server" CssClass="mensagem" Font-Bold="True"></asp:Label>
                    <br />
                    por motivo de segurança você&nbsp;<b>não</b> está autenticado no sistema apenas 
                    poderá se candidatar ou solicitar ajuda aos consultores das vagas publicadas.<br />
                    Caso queira manipular seus dados você terá que estar autenticado no sistema.
                    <br />
                    <br />
                    <br />
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" DataKeyNames="idcurriculo,dscurriculo" 
                        DataSourceID="SqlUser" GridLines="None" Width="320px">
                        <Columns>
                            <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" 
                                ReadOnly="True" SortExpression="idUser" Visible="False" />
                            <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" 
                                Visible="False" />
                            <asp:BoundField DataField="dscurriculo" HeaderText="Currículo(s) Cadastrado(s)" 
                                SortExpression="dscurriculo" Visible="False">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Escolha um currículo Cadastrado" 
                                ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Image ID="Image6" runat="server" 
                                        ImageUrl="~/images/layout/selectCurriculo.gif" />
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                        CommandName="Select" Text='<%# Eval("dscurriculo") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle CssClass="DGBGnot" />
                        <RowStyle CssClass="DGBG" />
                        <EmptyDataTemplate>
                            Você ainda não tem nenhum currículo cadastrado no sistema.
                            <br />
                            Para poder candidatar-se a uma vaga é necessário ter 1 (um) ou mais currículos 
                            no sistema.<br />
                            <br />
                            Mãos a obra!
                        </EmptyDataTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table ID="candidatar" runat="server" border="0" cellpadding="5" cellspacing="5" 
            visible="false" width="100%">
            <tr>
                <td>
                    <asp:Label ID="selectCurriculo" runat="server" CssClass="mensagem"></asp:Label>
                    <br />
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idRELcandidato_vaga" 
                        DataSourceID="SqlVinculo" DefaultMode="Insert">
                        <EditItemTemplate>
                            idRELcandidato_vaga:
                            <asp:Label ID="idRELcandidato_vagaLabel1" runat="server" 
                                Text='<%# Eval("idRELcandidato_vaga") %>'> </asp:Label>
                            <br />
                            idvaga:
                            <asp:TextBox ID="idvagaTextBox" runat="server" Text='<%# Bind("idvaga") %>'>
                            </asp:TextBox>
                            <br />
                            idcurriculo:
                            <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                                Text='<%# Bind("idcurriculo") %>'>
                            </asp:TextBox>
                            <br />
                            apresentacao:
                            <asp:TextBox ID="apresentacaoTextBox" runat="server" 
                                Text='<%# Bind("apresentacao") %>'>
                            </asp:TextBox>
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update">
                            </asp:LinkButton>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel">
                            </asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Escreva uma apresentação para o consultor da vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ControlToValidate="apresentacaoTextBox0" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="cdt"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="apresentacaoTextBox0" runat="server" CssClass="InputCad" 
                                Height="120px" Text='<%# Bind("apresentacao") %>' TextMode="MultiLine" 
                                ValidationGroup="cdt" Width="315px"></asp:TextBox>
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Candidatar-se" ValidationGroup="cdt"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" 
                                OnClick="InsertCancelButton_Click" Text="Fechar"></asp:LinkButton>
                            <asp:TextBox ID="idcurriculoTextBox0" runat="server" Text='<%# Bind("idcurriculo") %>' 
                                Visible="False" Width="8px"></asp:TextBox>
                            <asp:TextBox ID="idvagaTextBox0" runat="server" 
                                Text='<%# Bind("idvaga") %>' Visible="False" Width="8px"></asp:TextBox>
                            <asp:TextBox ID="msnRHTextBox" runat="server" Text='<%# Bind("msnRH") %>' 
                                Visible="False" Width="16px"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            idRELcandidato_vaga:
                            <asp:Label ID="idRELcandidato_vagaLabel" runat="server" 
                                Text='<%# Eval("idRELcandidato_vaga") %>'></asp:Label>
                            <br />
                            idvaga:
                            <asp:Label ID="idvagaLabel" runat="server" Text='<%# Bind("idvaga") %>'></asp:Label>
                            <br />
                            idcurriculo:
                            <asp:Label ID="idcurriculoLabel" runat="server" 
                                Text='<%# Bind("idcurriculo") %>'></asp:Label>
                            <br />
                            apresentacao:
                            <asp:Label ID="apresentacaoLabel" runat="server" 
                                Text='<%# Bind("apresentacao") %>'></asp:Label>
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete"></asp:LinkButton>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:Label ID="msnRel" runat="server" CssClass="mensagem"></asp:Label>
                </td>
            </tr>
        </table>
        <table ID="help" runat="server" border="0" cellpadding="5" cellspacing="5" 
            visible="false" width="100%">
            <tr>
                <td>
                    <asp:Label ID="selectCurriculoD" runat="server" CssClass="mensagem"></asp:Label>
                    <br />
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="idRELduvida_vaga" 
                        DataSourceID="SqlDuvida" DefaultMode="Insert">
                        <EditItemTemplate>
                            idRELduvida_vaga:
                            <asp:Label ID="idRELduvida_vagaLabel1" runat="server" 
                                Text='<%# Eval("idRELduvida_vaga") %>'> </asp:Label>
                            <br />
                            idvaga:
                            <asp:TextBox ID="idvagaTextBox1" runat="server" Text='<%# Bind("idvaga") %>'>
                            </asp:TextBox>
                            <br />
                            idcurriculo:
                            <asp:TextBox ID="idcurriculoTextBox1" runat="server" 
                                Text='<%# Bind("idcurriculo") %>'>
                            </asp:TextBox>
                            <br />
                            duvida:
                            <asp:TextBox ID="duvidaTextBox" runat="server" Text='<%# Bind("duvida") %>'>
                            </asp:TextBox>
                            <br />
                            <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update">
                            </asp:LinkButton>
                            <asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel">
                            </asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Informe sua dúvida:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                                runat="server" ControlToValidate="duvidaTextBox0" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="Duvida"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="duvidaTextBox0" runat="server" CssClass="InputCad" 
                                Height="120px" Text='<%# Bind("duvida") %>' TextMode="MultiLine" 
                                ValidationGroup="Duvida" Width="315px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Registrar sua dúvida" ValidationGroup="Duvida"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="InsertCancelButton0" runat="server" 
                                CausesValidation="False" CommandName="Cancel" 
                                OnClick="InsertCancelButton_Click" Text="Fechar"></asp:LinkButton>
                            <asp:TextBox ID="idvagaTextBox2" runat="server" Text='<%# Bind("idvaga") %>' 
                                Visible="False" Width="8px"></asp:TextBox>
                            <asp:TextBox ID="idcurriculoTextBox2" runat="server" 
                                Text='<%# Bind("idcurriculo") %>' Visible="False" Width="8px"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            idRELduvida_vaga:
                            <asp:Label ID="idRELduvida_vagaLabel" runat="server" 
                                Text='<%# Eval("idRELduvida_vaga") %>'></asp:Label>
                            <br />
                            idvaga:
                            <asp:Label ID="idvagaLabel0" runat="server" Text='<%# Bind("idvaga") %>'></asp:Label>
                            <br />
                            idcurriculo:
                            <asp:Label ID="idcurriculoLabel0" runat="server" 
                                Text='<%# Bind("idcurriculo") %>'></asp:Label>
                            <br />
                            duvida:
                            <asp:Label ID="duvidaLabel" runat="server" Text='<%# Bind("duvida") %>'></asp:Label>
                            <br />
                            <asp:LinkButton ID="EditButton0" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton0" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete"></asp:LinkButton>
                            <asp:LinkButton ID="NewButton0" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:Label ID="msnDuv" runat="server" CssClass="mensagem"></asp:Label>
                </td>
            </tr>
        </table>
        <table ID="email" runat="server" border="0" cellpadding="5" cellspacing="5" 
            visible="false" width="100%">
            <tr>
                <td>
                    <asp:Label ID="selectCurriculoE" runat="server" CssClass="mensagem"></asp:Label>
                    <asp:Label ID="lblidCurriculo" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:HyperLink ID="HyperLinkEmpresa" runat="server" Target="_blank">Visite o 
                    site da empresa</asp:HyperLink>
                                <br />
                                Escreva uma apresentação:<asp:TextBox ID="email_info" 
                        runat="server" CssClass="InputCad" Visible="False" Width="26px"></asp:TextBox>
                    <asp:TextBox ID="DsVaga" runat="server" CssClass="InputCad" Visible="False" 
                        Width="24px"></asp:TextBox>
                    <asp:TextBox ID="codigo" runat="server" CssClass="InputCad" Visible="False" 
                        Width="25px"></asp:TextBox>
                    <br />
                                <asp:TextBox ID="aprTextBox" runat="server" CssClass="InputCad" 
                        Height="96px" TextMode="MultiLine" Width="315px"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="aprTextBox"
                                    Display="Dynamic" ErrorMessage="* Escreva uma apresentação para o RH." SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <br />
                    <asp:LinkButton ID="LBsisEmail" runat="server">Enviar CV por e-mail</asp:LinkButton>
                    &nbsp;|
                    <asp:LinkButton ID="FecharLB" runat="server" CausesValidation="False">Fechar</asp:LinkButton>
                    <br />
                                <asp:Label ID="msnEmail" runat="server" CssClass="mensagem"></asp:Label>
                </td>
            </tr>
        </table>
                
        <asp:Label ID="lblemail" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblidUser" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblStatusBotton" runat="server" Visible="False"></asp:Label>
    </asp:Panel>
    
    <cc1:DragPanelExtender ID="PanelLogin_DragPanelExtender" runat="server" 
        DragHandleID="PanelLogin" Enabled="True" TargetControlID="PanelLogin">
    </cc1:DragPanelExtender>
    
    
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>

