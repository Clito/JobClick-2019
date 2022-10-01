<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="indicaCandidatoEmpresa.aspx.vb" Inherits="_candidato_indicaCandidato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Indicações Pessoais" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>

                <asp:Panel ID="PanelAviso" runat="server" Visible="False" CssClass="AVISOMSN">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5" width="100%">
                        <tr>
                            <td align="center"><asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label></td>
                            <td align="right" valign="top" width="100px"><asp:LinkButton ID="LinkButtonFECHARAVISO" runat="server">Fechar</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td align="center"><asp:ImageButton ID="ImageButtonAVISO" runat="server" ImageUrl="~/_candidato/images/buttonOK.png" ToolTip="Clique aqui para fechar este aviso." CausesValidation="False" /></td>
                            <td align="right" valign="top" width="100px">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>

    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:Label ID="Label1" runat="server" 
                    
                    
                    
                    
                    Text="Utilize este formulário para solicitar uma &lt;b&gt;Indicação Pessoal&lt;/b&gt; sobre suas qualificações profissionais.&lt;br&gt;&lt;b&gt;Como utilizar:&lt;/b&gt;&lt;br&gt;E um contato pessoal avise ao seu conhecido, &lt;i&gt;Exemplo seu Chefe em uma empresa que você trabalhou&lt;/i&gt;, que você irá enviar uma solicitação de indicação. Esta solicitação será apresentada em seu Currículo.&lt;br&gt;&lt;i&gt;&lt;b&gt;Aviso:&lt;/b&gt;&lt;br&gt;Será enviado para a pessoa que fez a sua indicação um e-mail de confirmação e comentários.&lt;/i&gt;."></asp:Label>
                <asp:Label ID="idcurriculoSelecionado" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="cpfLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idIndicadoCandidatoRESLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="CVLabelSelect" runat="server" CssClass="msnOK"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" 
                    Text="Confirme abaixo qual CV será apresentado junto com a indicação:"></asp:Label>
                <asp:GridView ID="GridViewCV" runat="server" AutoGenerateColumns="False" 
                    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                    DataKeyNames="idcurriculo,dscurriculo,cpf" DataSourceID="SqlCV" 
                    ShowHeader="False" Width="100%" CssClass="InputCadFormCandidatoCV">
                    <Columns>
                        <asp:ButtonField CommandName="Select" DataTextField="dscurriculo" 
                            Text="Button" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" 
                            SortExpression="idCadastroUser" Visible="False" />
                        <asp:BoundField DataField="dscurriculo" HeaderText="dscurriculo" 
                            SortExpression="dscurriculo" Visible="False" />
                        <asp:BoundField DataField="ididioma" HeaderText="ididioma" 
                            SortExpression="ididioma" Visible="False" />
                        <asp:BoundField DataField="dsidioma" HeaderText="dsidioma" 
                            SortExpression="dsidioma" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="publicar" 
                            SortExpression="publicar" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Nome da pessoa que irá te indicar:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="nomeQuemIndicouTextBox" 
                    ErrorMessage="Nome da pessoa que te indicou é obrigatório.">•</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="nomeQuemIndicouTextBox" runat="server" 
                    CssClass="InputCadFormCandidatoCV" Width="100%"></asp:TextBox>
                <br />
                <asp:Label ID="Label5" runat="server" Text="E-mail desta pessoa:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="emailQuemIndicouTextBox" 
                    ErrorMessage="E-mail da pessoa que te indicou é obrigatório.">•</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="emailQuemIndicouTextBox" runat="server" 
                    CssClass="InputCadFormCandidatoCV" Width="100%"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" 
                    Text="Faça a sua apresentação pessoal:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="apresentacaoTextBox" 
                    ErrorMessage="Faça sua apresentação pessoal, é obrigatório.">•</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="apresentacaoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                    Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                <br />
                <asp:LinkButton ID="LinkButtonConfirma" runat="server" CssClass="button" 
                    ToolTip="Clique aqui para enviar a sua solicitação de indicação">Enviar a sua indicação</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                    CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                    ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                <br />
    <asp:SqlDataSource ID="SqlCV" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbCurriculo] WHERE [idcurriculo] = @idcurriculo"
        InsertCommand="INSERT INTO tbCurriculo(idCadastroUser, dscurriculo, ididioma, publicar) VALUES (@idCadastroUser, @dscurriculo, @ididioma, @publicar)"
        SelectCommand="SELECT tbCurriculo.idcurriculo, tbCurriculo.idCadastroUser, tbCurriculo.dscurriculo, tbCurriculo.ididioma, tbidioma.dsidioma, tbCurriculo.publicar, tbCadastroUser.cpf FROM tbCurriculo INNER JOIN tbidioma ON tbCurriculo.ididioma = tbidioma.ididioma INNER JOIN tbCadastroUser ON tbCurriculo.idCadastroUser = tbCadastroUser.idCadastroUser WHERE (tbCurriculo.idCadastroUser = @idCadastroUser)"
        
                    UpdateCommand="UPDATE tbCurriculo SET idCadastroUser = @idCadastroUser, dscurriculo = @dscurriculo, ididioma = @ididioma, publicar = @publicar WHERE (idcurriculo = @idcurriculo)">
        <DeleteParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="dscurriculo" Type="String" />
            <asp:Parameter Name="ididioma" Type="Int32" />
            <asp:Parameter Name="publicar" Type="Boolean" />
            <asp:Parameter Name="idcurriculo" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="dscurriculo" Type="String" />
            <asp:Parameter Name="ididioma" Type="Int32" />
            <asp:Parameter Name="publicar" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
        </tr>
    </table> 
</asp:Content>

