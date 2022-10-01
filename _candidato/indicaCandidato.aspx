<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="indicaCandidato.aspx.vb" Inherits="_candidato_indicaCandidato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Confirmação das indicações recebidas por e-mail" CssClass="TituloBGText"></asp:Label></td>
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
                    
                    Text="Utilize este formulário para confirmar uma &lt;b&gt;Indicação&lt;/b&gt; recebida por e-mail.&lt;br&gt;&lt;b&gt;Como utilizar:&lt;/b&gt;&lt;br&gt;Informe o Protocolo recebido por e-mail, ele é importarte para vincular seu CV ao Processo Seletivo. Escreva sua apresentação para o consultor que solicitou a sua candidatura e clique em [Confirmar Indicação]&lt;/i&gt;."></asp:Label>
                <br />
                <asp:Label ID="idcurriculoSelecionado" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="cpfLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="CVLabelSelect" runat="server" CssClass="msnOK"></asp:Label>
                <br />
                <br />
                <asp:Label ID="nroProtocoloLabel" runat="server" 
                    Text="Número do protocolo recebido:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ProtocoloTextBox" ErrorMessage="O Protocolo é obrigatório!">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="ProtocoloTextBox" runat="server" 
                    CssClass="InputCadFormCandidatoCV" Width="100%"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" 
                    Text="Confirme abaixo qual CV será enviado:"></asp:Label>
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
                <asp:Label ID="Label3" runat="server" 
                    Text="Escreva uma apresentação para o Consultor:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="apresentacaoTextBox" 
                    ErrorMessage="Escreva uma apresentação pessoal.">*</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="apresentacaoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                    Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                <br />
                <asp:LinkButton ID="LinkButtonRESPONDER" runat="server" CssClass="button" 
                    ToolTip="Clique aqui para enviar sua resposta a esta indicação.">Responder a este indicação</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                    CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                    ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
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

