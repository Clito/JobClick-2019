<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPage.master" AutoEventWireup="false" CodeFile="zoya.aspx.vb" Inherits="_candidato_zoyaGeral" title="Jobclick" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/candidato/zoya.gif" />
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
                <asp:Label ID="lblInst" runat="server"></asp:Label>
                <br />
                <br />
                    <table runat="server" id="formPesquisa" visible="true" border="0" cellpadding="0" cellspacing="0" width="350px">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td><asp:Image ID="Image1" runat="server" ImageUrl="~/images/pesquisa.gif" /></td>
                                        <td>Informe sua especialidade (profile):</td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" MaxLength="255" Width="260px" CssClass="InputCad" 
                                                AutoCompleteType="Department" CausesValidation="True" ValidationGroup="ExpProf"></asp:TextBox><asp:Image
            ID="Image2" runat="server" ImageUrl="~/images/5px.gif" /></td>
                                        <td><asp:ImageButton
            ID="ImageButton1" runat="server" ImageUrl="~/images/candidato/btpesquisar.gif" ValidationGroup="ExpProf" 
                                                CommandName="Select" /></td>
                                    </tr>
                                </table>                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox1"
                                    Display="Dynamic" ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"
                                    SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9!¡$%&/\()=?¿*+-_{};:,áéíóú'.\s][^>][^<]{3,50}$" ValidationGroup="ExpProf"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                                        ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres" ValidationGroup="ExpProf"></asp:RequiredFieldValidator><br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BorderStyle="None" DataKeyNames="idfuncao,dsfuncao" DataSourceID="SqlDataSourcePsq" GridLines="None"
            Width="350px" ShowHeader="False">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="idfuncao" DataNavigateUrlFormatString="teste.aspx?idfuncao={0}"
                    DataTextField="dsfuncao" Visible="False">
                </asp:HyperLinkField>
                <asp:BoundField DataField="dsfuncao" SortExpression="dsfuncao" ReadOnly="True" />
                <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" InsertVisible="False" SortExpression="idfuncao" Visible="False" />
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/images/selectRow.gif" SelectText="">
                    <ItemStyle Width="26px" />
                </asp:CommandField>
            </Columns>
            <AlternatingRowStyle BackColor="WhiteSmoke" />
            <HeaderStyle HorizontalAlign="Left" />
            <EmptyDataTemplate>
                Se você nada encontrou em sua pesquisa, [<a href="faq.aspx">clique aqui</a>]
                e envie-nos os dados para que possamos inclui-la em nosso banco de dados.<br />
                <br />
                <b>Obrigado.</b><br />
                Administração
            </EmptyDataTemplate>
        </asp:GridView>
                                <asp:Label ID="resTxt" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
        <asp:SqlDataSource ID="SqlDataSourcePsq" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
            SelectCommand="spGetFunction" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="buscador" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>                
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idZoya" 
                    DataSourceID="SqlZoya" DefaultMode="Edit">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="idfuncaoTextBox" Display="Dynamic" 
                            ErrorMessage="• Você precisa informar sua especialidade..."></asp:RequiredFieldValidator>
                        <br />
                        <table cellpadding="0" cellspacing="0" 
                            style="width: 84%; background-color: #E6F0F0">
                            <tr>
                                <td>
                                    <b>Como as empresas irão te encontrar?</b><br />
                                    Informe abaixo qual das áreas de atuação que mais se relaciona com o seu perfil 
                                    profissional.<br />
                                    <br />
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/pesquisa.gif" />
                                    Informe a área de atuação principal:<br />
                                    <asp:DropDownList ID="Area1DropDownList" runat="server" CssClass="DropCad" 
                                        DataSourceID="SqlArea" DataTextField="dsAreaAtuacao" 
                                        DataValueField="idAreaAtuacao" SelectedValue='<%# Bind("idAreaAtuacaoP") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/images/pesquisa.gif" />
                                    Informe a área de atuação secundária:<br />
                                    <asp:DropDownList ID="Area2DropDownList" runat="server" CssClass="DropCad" 
                                        DataSourceID="SqlArea" DataTextField="dsAreaAtuacao" 
                                        DataValueField="idAreaAtuacao" SelectedValue='<%# Bind("idAreaAtuacaoS") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />
                        Sua apresentação profissional:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="dsGeralTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsGeralTextBox" runat="server" CssClass="InputCad" 
                            Height="82px" ondatabinding="dsGeralTextBox_DataBinding" 
                            Text='<%# Bind("dsGeral") %>' TextMode="MultiLine" />
                        <br />
                        <br />
                        Serviço(s) que você esta oferecendo:<br />
                        <asp:TextBox ID="dsServicosOferecidosTextBox" runat="server" 
                            CssClass="InputCad" Height="62px" 
                            ondatabinding="dsServicosOferecidosTextBox_DataBinding" 
                            Text='<%# Bind("dsServicosOferecidos") %>' TextMode="MultiLine" />
                        <br />
                        <br />
                        Trabalhos Publicados:<br />
                        (Construções, sites, revistas, músicas, Jingles, Trilhas, etc)<br />
                        <asp:TextBox ID="dsTrabalhosPublicadosTextBox" runat="server" 
                            CssClass="InputCad" Height="62px" 
                            ondatabinding="dsTrabalhosPublicadosTextBox_DataBinding" 
                            Text='<%# Bind("dsTrabalhosPublicados") %>' TextMode="MultiLine" />
                        <br />
                        <br />
                        <asp:CheckBox ID="apresentarMultimidiaCheckBox" runat="server" 
                            Checked='<%# Bind("apresentarMultimidia") %>' 
                            Text="Quero apresentar meus vídeos em meu profile" />
                        <br />
                        <asp:CheckBox ID="apresentarCVCheckBox" runat="server" 
                            Checked='<%# Bind("apresentarCV") %>' 
                            Text="Quero apresentar meu CV em meu profile" />
                        <br />
                        <asp:CheckBox ID="apresentarContatoCheckBox" runat="server" 
                            Checked='<%# Bind("apresentarContato") %>' 
                            Text="Quero apresentar forma de contato em meu profile" />
                        <br />
                        <asp:CheckBox ID="publicaCheckBox" runat="server" 
                            Checked='<%# Bind("publicar") %>' Text="Quero publicar meu profile" />
                        <br />
                        <br />
                        Qual o nome que você irá apresentar em seu profile?<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="NomeResponsavelTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="NomeResponsavelTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("NomeResponsavel") %>' />
                        <br />
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBox1_CheckedChanged" Text="O mesmo do meu cadastro" />
                        <br />
                        <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                            Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="18px" />
                        <asp:TextBox ID="idfuncaoTextBox" runat="server" Text='<%# Bind("idfuncao") %>' 
                            Visible="False" Width="16px" />
                        <asp:TextBox ID="idAreaAtuacaoPTextBox" runat="server" 
                            Text='<%# Bind("idAreaAtuacaoP") %>' Visible="False" Width="16px" />
                        <asp:TextBox ID="idAreaAtuacaoSTextBox" runat="server" 
                            Text='<%# Bind("idAreaAtuacaoS") %>' Visible="False" Width="16px" />
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="18px" />
                        <br />
                        Você quer utilizar outro e-mail para receber seus recados?<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="emailRecadosTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        &nbsp;<asp:TextBox ID="emailRecadosTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("emailRecados") %>' />
                        <br />
                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBox2_CheckedChanged" Text="O mesmo do meu cadastro" />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Salvar atualização" />
                        &nbsp;| <asp:LinkButton ID="DeleteButton" runat="server" 
                            CausesValidation="False" CommandName="Delete" Text="Excluir profile" 
                            onclientclick="return confirm(&quot;Quer realmente excluir seu profile?&quot;)" />
                    
                        &nbsp;|
                        <asp:HyperLink ID="zoyaLink" runat="server" NavigateUrl="zoyaview.aspx">Zoya:)</asp:HyperLink>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="idCadastroUserTextBox" runat="server" 
                            Text='<%# Bind("idCadastroUser") %>' Visible="False" Width="18px" />
                        <asp:TextBox ID="idfuncaoTextBox" runat="server" 
                            Text='<%# Bind("idfuncao") %>' Visible="False" Width="16px" />
                        <asp:TextBox ID="idAreaAtuacaoPTextBox" runat="server" 
                            Text='<%# Bind("idAreaAtuacaoP") %>' Visible="False" Width="16px" />
                        <asp:TextBox ID="idAreaAtuacaoSTextBox" runat="server" 
                            Text='<%# Bind("idAreaAtuacaoS") %>' Visible="False" Width="16px" />
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="18px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="idfuncaoTextBox" Display="Dynamic" 
                            ErrorMessage="• Você precisa informar sua especialidade..."></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <table cellpadding="0" cellspacing="0" 
                            style="width: 84%; background-color: #E6F0F0">
                            <tr>
                                <td>
                                    <b>Como as empresas irão te encontrar?</b><br />
                                    Informe abaixo qual das áreas de atuação que mais se relaciona com o seu perfil 
                                    profissional.<br />
                                    <br />
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/pesquisa.gif" />
                                    Informe a área de atuação principal:<br />
                                    <asp:DropDownList ID="Area1DropDownList" runat="server" CssClass="DropCad" 
                                        DataSourceID="SqlArea" DataTextField="dsAreaAtuacao" 
                                        DataValueField="idAreaAtuacao" SelectedValue='<%# Bind("idAreaAtuacaoP") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/images/pesquisa.gif" />
                                    Informe a área de atuação secundária:<br />
                                    <asp:DropDownList ID="Area2DropDownList" runat="server" CssClass="DropCad" 
                                        DataSourceID="SqlArea" DataTextField="dsAreaAtuacao" 
                                        DataValueField="idAreaAtuacao" SelectedValue='<%# Bind("idAreaAtuacaoS") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />
                        Faça sua apresentação profissional:&nbsp;<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator9" runat="server" ControlToValidate="dsGeralTextBox" 
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsGeralTextBox" runat="server" Text='<%# Bind("dsGeral") %>' 
                            CssClass="InputCad" Height="82px" TextMode="MultiLine" />
                        <br />
                        <br />
                        Descreva o(s) serviço(s) que você esta oferecendo:<br />
                        <asp:TextBox ID="dsServicosOferecidosTextBox" runat="server" 
                            Text='<%# Bind("dsServicosOferecidos") %>' CssClass="InputCad" 
                            Height="62px" TextMode="MultiLine" />
                        <br />
                        <br />
                        Trabalhos Publicados:<br />
                        (Construções, sites, revistas, músicas, Jingles, Trilhas, etc)<br />
                        <asp:TextBox ID="dsTrabalhosPublicadosTextBox" runat="server" 
                            Text='<%# Bind("dsTrabalhosPublicados") %>' CssClass="InputCad" 
                            Height="62px" TextMode="MultiLine" />
                        <br />
                        <br />
                        <asp:CheckBox ID="apresentarMultimidiaCheckBox" runat="server" 
                            Checked='<%# Bind("apresentarMultimidia") %>' 
                            Text="Quero apresentar meus vídeos em meu profile" />
                        <br />
                        <asp:CheckBox ID="apresentarCVCheckBox" runat="server" 
                            Checked='<%# Bind("apresentarCV") %>' 
                            Text="Quero apresentar meu CV em meu profile" />
                        <br />
                        <asp:CheckBox ID="apresentarContatoCheckBox" runat="server" 
                            Checked='<%# Bind("apresentarContato") %>' 
                            Text="Quero apresentar forma de contato em meu profile" />
                        <br />
                        <asp:CheckBox ID="publicaCheckBox" runat="server" 
                            Checked='<%# Bind("publicar") %>' Text="Quero publicar meu profile" />
                        <br />
                        <br />
                        Qual o nome que você irá apresentar em seu profile?<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="NomeResponsavelTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="NomeResponsavelTextBox" runat="server" 
                            Text='<%# Bind("NomeResponsavel") %>' CssClass="InputCad" />
                        <br />
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBox1_CheckedChanged" Text="O mesmo do meu cadastro" />
                        <br />
                        <br />
                        Você quer utilizar outro e-mail para receber seus recados?<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="emailRecadosTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        &nbsp;<asp:TextBox ID="emailRecadosTextBox" runat="server" 
                            Text='<%# Bind("emailRecados") %>' CssClass="InputCad" />
                        <br />
                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBox2_CheckedChanged" Text="O mesmo do meu cadastro" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Publicar o meu profile no Zoya" />
                        &nbsp; | <asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" 
                            Text="Cancelar minha inscrição" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Atualizar profile" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Excluir profile" 
                            onclientclick="return confirm(&quot;Quer realmente excluir seu profile?&quot;)" />
                        &nbsp;|
                        <asp:HyperLink ID="zoyaLink" runat="server" NavigateUrl="zoyaview.aspx">Zoya:)</asp:HyperLink>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" 
                            
                            Text="Crie seu profile para participar do Marketing Pessoal (Zoya) &lt;br&gt;&lt;br&gt;[Clique aqui]" />
                    </EmptyDataTemplate>
                </asp:FormView>
                
                <br />                
                <br />                
                <br />
                
                <asp:SqlDataSource ID="SqlZoya" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbZoya] WHERE [idZoya] = @idZoya" 
                    InsertCommand="INSERT INTO tbZoya(idCadastroUser, idfuncao, idAreaAtuacaoP, idAreaAtuacaoS, idcurriculo, dsGeral, dsServicosOferecidos, dsTrabalhosPublicados, apresentarMultimidia, apresentarCV, apresentarContato, NomeResponsavel, emailRecados, idUser, publicar) VALUES (@idCadastroUser, @idfuncao, @idAreaAtuacaoP, @idAreaAtuacaoS, @idcurriculo, @dsGeral, @dsServicosOferecidos, @dsTrabalhosPublicados, @apresentarMultimidia, @apresentarCV, @apresentarContato, @NomeResponsavel, @emailRecados, @idUser, @publicar)" 
                    SelectCommand="SELECT idZoya, idCadastroUser, idfuncao, idAreaAtuacaoP, idAreaAtuacaoS, idcurriculo, dsGeral, dsServicosOferecidos, dsTrabalhosPublicados, apresentarMultimidia, apresentarCV, apresentarContato, NomeResponsavel, emailRecados, idUser, publicar FROM tbZoya WHERE (idCadastroUser = @idCadastroUser)" 
                    UpdateCommand="UPDATE tbZoya SET idCadastroUser = @idCadastroUser, idfuncao = @idfuncao, idAreaAtuacaoP = @idAreaAtuacaoP, idAreaAtuacaoS = @idAreaAtuacaoS, idcurriculo = @idcurriculo, dsGeral = @dsGeral, dsServicosOferecidos = @dsServicosOferecidos, dsTrabalhosPublicados = @dsTrabalhosPublicados, apresentarMultimidia = @apresentarMultimidia, apresentarCV = @apresentarCV, apresentarContato = @apresentarContato, NomeResponsavel = @NomeResponsavel, emailRecados = @emailRecados, publicar = @publicar WHERE (idZoya = @idZoya)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="idZoya" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter Name="idfuncao" Type="Int32" />
                        <asp:Parameter Name="idAreaAtuacaoP" Type="Int32" />
                        <asp:Parameter Name="idAreaAtuacaoS" Type="Int32" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="dsGeral" Type="String" />
                        <asp:Parameter Name="dsServicosOferecidos" Type="String" />
                        <asp:Parameter Name="dsTrabalhosPublicados" Type="String" />
                        <asp:Parameter Name="apresentarMultimidia" Type="Boolean" />
                        <asp:Parameter Name="apresentarCV" Type="Boolean" />
                        <asp:Parameter Name="apresentarContato" Type="Boolean" />
                        <asp:Parameter Name="NomeResponsavel" Type="String" />
                        <asp:Parameter Name="emailRecados" Type="String" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                        <asp:Parameter Name="idZoya" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter Name="idfuncao" Type="Int32" />
                        <asp:Parameter Name="idAreaAtuacaoP" Type="Int32" />
                        <asp:Parameter Name="idAreaAtuacaoS" Type="Int32" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="dsGeral" Type="String" />
                        <asp:Parameter Name="dsServicosOferecidos" Type="String" />
                        <asp:Parameter Name="dsTrabalhosPublicados" Type="String" />
                        <asp:Parameter Name="apresentarMultimidia" Type="Boolean" />
                        <asp:Parameter Name="apresentarCV" Type="Boolean" />
                        <asp:Parameter Name="apresentarContato" Type="Boolean" />
                        <asp:Parameter Name="NomeResponsavel" Type="String" />
                        <asp:Parameter Name="emailRecados" Type="String" />
                        <asp:Parameter Name="idUser" />
                        <asp:Parameter Name="publicar" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlArea" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
                </asp:SqlDataSource>
            </td> 
        </tr>
    </table>
</asp:Content>

